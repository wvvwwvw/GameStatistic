using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace GameStatistic
{
    public partial class ManagerSearchClnt : Page
    {
        public ManagerSearchClnt()
        {
            InitializeComponent();

            comboBox.SelectionChanged += СomboBox_SelectionChanged;
            searchtextbox.TextChanged += SearchTextBox_TextChanged;

            LoadData();
        }

        private void LoadData()
        {
            search_datagrid.ItemsSource = DB.db.Clients.ToList();
        }

        private void SearchTextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            string selectedCharacteristic = (comboBox.SelectedItem as ComboBoxItem)?.Content?.ToString();
            string query = searchtextbox.Text;

            if (!string.IsNullOrEmpty(selectedCharacteristic) && !string.IsNullOrEmpty(query))
            {
                List<Clients> searchResults = PerformSearch(selectedCharacteristic, query);
                search_datagrid.ItemsSource = searchResults;
            }
            else
            {
                LoadData();
            }
        }

        private List<Clients> PerformSearch(string characteristic, string query)
        {
            switch (characteristic)
            {
                case "ID" when int.TryParse(query, out int idQuery):
                    return DB.db.Clients.Where(p => p.ID == idQuery).ToList();
                case "имени":
                    return DB.db.Clients.Where(p => p.First_name.Contains(query)).ToList();
                case "фамилии":
                    return DB.db.Clients.Where(p => p.Last_name.Contains(query)).ToList();
                case "почте":
                    return DB.db.Clients.Where(p => p.Email.Contains(query)).ToList();
                case "номеру телефона":
                    return DB.db.Clients.Where(p => p.Phone.Contains(query)).ToList();
                default:
                    break;
            }

            return new List<Clients>();
        }

        private void СomboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            searchtextbox.Clear();
            searchtextbox.Focus();
        }

        private void DeleteSelectedClient()
        {
            // Получаем выбранного клиента из DataGrid
            Clients selectedClient = search_datagrid.SelectedItem as Clients;

            if (selectedClient != null)
            {
                // Удаляем клиента из базы данных
                DB.db.Clients.Remove(selectedClient);
                DB.db.SaveChanges();

                // Удаляем клиента из коллекции для отображения
                search_datagrid.ItemsSource = DB.db.Clients.ToList();

                MessageBox.Show("Клиент удален успешно.");
            }
            else
            {
                MessageBox.Show("Выберите клиента для удаления.");
            }
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            DeleteSelectedClient();
        }
    }
}
