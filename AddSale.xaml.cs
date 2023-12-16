using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace GameStatistic
{
    public partial class AddSale : Page
    {
        public AddSale()
        {
            InitializeComponent();

            // Заполните выпадающие списки клиентов и продуктов
            clientComboBox.ItemsSource = DB.db.Clients.ToList();
            productComboBox.ItemsSource = DB.db.Products.ToList();
        }

        private void AddSale_Click(object sender, RoutedEventArgs e)
        {
            // Получите выбранных клиента, продукт и дату продажи
            var selectedClient = clientComboBox.SelectedItem as Clients;
            if (selectedClient != null)
            {
                // Access the first and last names separately
                string firstName = selectedClient.First_name;
                string lastName = selectedClient.Last_name;

                // Use the concatenated full name if needed
                string fullName = $"{lastName} {firstName}";
            }

            var selectedProduct = productComboBox.SelectedItem as Products;
            var saleDate = saleDatePicker.SelectedDate;

            if (selectedClient != null && selectedProduct != null && saleDate.HasValue)
            {

                var sale = new Sales
                {
                    Product_ID = selectedProduct.ID,
                    Client_ID = selectedClient.ID,
                    Sale_date = saleDate.Value
                };

                DB.db.Sales.Add(sale);
                DB.db.SaveChanges();

                MessageBox.Show("Продажа успешно офромлена!");

                saleDatePicker.SelectedDate = null;
                clientComboBox.SelectedItem = null;
                productComboBox.SelectedItem = null;
            }
            else
            {
                MessageBox.Show("Пожалуйста, выберите клиента, продукт и дату продажи.");
            }
        }
    }
}
