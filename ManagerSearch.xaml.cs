using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace GameStatistic
{
    public class ProductViewModel
    {
        public int ProductID { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string Description { get; set; }
        public string TypeName { get; set; }
        public string PlatformName { get; set; }
    }

    public partial class ManagerSearch : Page
    {
        public ObservableCollection<ProductViewModel> YourProductsCollection { get; set; } = new ObservableCollection<ProductViewModel>();

        public ManagerSearch()
        {
            InitializeComponent();
            comboBox.SelectionChanged += СomboBox_SelectionChanged;
            searchtextbox.TextChanged += SearchTextBox_TextChanged;

            LoadData();
        }

        private void LoadData()
        {
            var query = from product in DB.db.Products
                        join productType in DB.db.Product_type on product.Type equals productType.ID
                        join platformType in DB.db.Platform_type on product.Platform equals platformType.ID
                        select new ProductViewModel
                        {
                            ProductID = product.ID,
                            Name = product.Name,
                            Price = product.Price,
                            Description = product.Description,
                            TypeName = productType.TypeName,
                            PlatformName = platformType.PlatformName
                        };

            YourProductsCollection = new ObservableCollection<ProductViewModel>(query.ToList());
            search_datagrid.ItemsSource = YourProductsCollection;
        }

        private List<Products> PerformSearch(string characteristic, string query, string typeQuery, string platformQuery)
        {
            switch (characteristic)
            {
                case "названию":
                    return DB.db.Products.Where(p => p.Name.Contains(query)).ToList();
                case "ID" when int.TryParse(query, out int idQuery):
                    return DB.db.Products.Where(p => p.ID == idQuery).ToList();
                case "цене" when decimal.TryParse(query, out decimal price):
                    return DB.db.Products.Where(p => p.Price < price).ToList();
                case "описанию":
                    return DB.db.Products.Where(p => p.Description.Contains(query)).ToList();
                case "типу":
                    return DB.db.Products
                        .Where(p => (string.IsNullOrEmpty(typeQuery) || DB.db.Product_type.Any(pt => pt.ID == p.Type && pt.TypeName.Contains(typeQuery))) &&
                                    (string.IsNullOrEmpty(platformQuery) || DB.db.Platform_type.Any(pt => pt.ID == p.Platform && pt.PlatformName.Contains(platformQuery))))
                        .ToList();
                case "платформе":
                    return DB.db.Products
                        .Where(p => (string.IsNullOrEmpty(platformQuery) || DB.db.Platform_type.Any(pt => pt.ID == p.Platform && pt.PlatformName.Contains(platformQuery))) &&
                                    (string.IsNullOrEmpty(typeQuery) || DB.db.Product_type.Any(pt => pt.ID == p.Type && pt.TypeName.Contains(typeQuery))))
                        .ToList();
                default:
                    return new List<Products>();
            }
        }

        private void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            string selectedCharacteristic = (comboBox.SelectedItem as ComboBoxItem)?.Content?.ToString();
            string query = searchtextbox.Text;
            string typeQuery = (selectedCharacteristic == "типу") ? searchtextbox.Text : null;
            string platformQuery = (selectedCharacteristic == "платформе") ? searchtextbox.Text : null;

            if (!string.IsNullOrEmpty(selectedCharacteristic) && !string.IsNullOrEmpty(query))
            {
                List<Products> searchResults = PerformSearch(selectedCharacteristic, query, typeQuery, platformQuery);

                YourProductsCollection.Clear();
                foreach (var searchResult in searchResults)
                {
                    YourProductsCollection.Add(new ProductViewModel
                    {
                        ProductID = searchResult.ID,
                        Name = searchResult.Name,
                        Price = searchResult.Price,
                        Description = searchResult.Description,
                        TypeName = DB.db.Product_type.FirstOrDefault(pt => pt.ID == searchResult.Type)?.TypeName,
                        PlatformName = DB.db.Platform_type.FirstOrDefault(pt => pt.ID == searchResult.Platform)?.PlatformName
                    });
                }

                search_datagrid.ItemsSource = YourProductsCollection;
            }
        }

        private void СomboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            searchtextbox.Clear();
            searchtextbox.Focus();
        }

        private void DeleteSelectedProduct()
        {
            // Получаем выбранный элемент из DataGrid
            ProductViewModel selectedProduct = search_datagrid.SelectedItem as ProductViewModel;

            if (selectedProduct != null)
            {
                // Получаем соответствующий объект Products из базы данных
                Products productToDelete = DB.db.Products.FirstOrDefault(p => p.ID == selectedProduct.ProductID);

                if (productToDelete != null)
                {
                    // Удаляем объект из базы данных
                    DB.db.Products.Remove(productToDelete);
                    DB.db.SaveChanges();

                    // Удалите объект из коллекции для отображения
                    YourProductsCollection.Remove(selectedProduct);

                    MessageBox.Show("Продукт удален успешно.");
                }
            }
            else
            {
                MessageBox.Show("Выберите продукт для удаления.");
            }
        }

        private void btnDelete_Click(object sender, System.Windows.RoutedEventArgs e)
        {
            DeleteSelectedProduct();
        }
    }
}
