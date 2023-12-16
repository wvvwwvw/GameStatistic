using System.Data.Entity.Infrastructure;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;
using MessageBox = System.Windows.Forms.MessageBox;

namespace GameStatistic
{
    /// <summary>
    /// Логика взаимодействия для ManagerPage1.xaml
    /// </summary>
    public partial class ManagerPage1 : Page
    {
        public ManagerPage1()
        {
            InitializeComponent();
        }

        private void combobox_choice_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

            first_name_text.Visibility = Visibility.Collapsed;
            last_name_text.Visibility = Visibility.Collapsed;
            phone_text.Visibility = Visibility.Collapsed;
            email_text.Visibility = Visibility.Collapsed;
            game_name_text.Visibility = Visibility.Collapsed;
            platform_type.Visibility = Visibility.Collapsed;
            product_type.Visibility = Visibility.Collapsed;
            type_label.Visibility = Visibility.Collapsed;
            price_text.Visibility = Visibility.Collapsed;
            description_text.Visibility = Visibility.Collapsed;
            firstname_label.Visibility = Visibility.Collapsed;
            lastname_label.Visibility = Visibility.Collapsed;
            phone_label.Visibility = Visibility.Collapsed;
            email_label.Visibility = Visibility.Collapsed;
            game_name_label.Visibility = Visibility.Collapsed;
            platform_label.Visibility = Visibility.Collapsed;
            price_label.Visibility = Visibility.Collapsed;
            description_label.Visibility = Visibility.Collapsed;
            add_clnt_button.Visibility = Visibility.Collapsed;
            add_tov_button.Visibility = Visibility.Collapsed;
            cencel_button.Visibility = Visibility.Collapsed;


            if (combobox_choice.SelectedIndex == 0)
            {
                first_name_text.Visibility = Visibility.Visible;
                last_name_text.Visibility = Visibility.Visible;
                phone_text.Visibility = Visibility.Visible;
                email_text.Visibility = Visibility.Visible;
                firstname_label.Visibility = Visibility.Visible;
                lastname_label.Visibility = Visibility.Visible;
                phone_label.Visibility = Visibility.Visible;
                email_label.Visibility = Visibility.Visible;
                add_clnt_button.Visibility = Visibility.Visible;
                cencel_button.Visibility = Visibility.Visible;
            }
            else if (combobox_choice.SelectedIndex == 1)
            {
                game_name_text.Visibility = Visibility.Visible;
                platform_type.Visibility = Visibility.Visible;
                price_text.Visibility = Visibility.Visible;
                description_text.Visibility = Visibility.Visible;
                game_name_label.Visibility = Visibility.Visible;
                platform_label.Visibility = Visibility.Visible;
                price_label.Visibility = Visibility.Visible;
                description_label.Visibility = Visibility.Visible;
                product_type.Visibility = Visibility.Visible;
                type_label.Visibility = Visibility.Visible;
                add_tov_button.Visibility = Visibility.Visible;
                cencel_button.Visibility = Visibility.Visible;
            }
            else if (combobox_choice.SelectedIndex == 2)
            {
                NavigationService.Navigate(new ManagerSearch());
            }
            else if (combobox_choice.SelectedIndex == 3)
            {
                NavigationService.Navigate(new ManagerSearchClnt());
            }
            else if (combobox_choice.SelectedIndex == 4)
            {
                NavigationService.Navigate(new AddSale());
            }

        }

        private void add_tov_button_Click(object sender, RoutedEventArgs e)
        {
            if (platform_type.SelectedIndex < 0)
            {
                MessageBox.Show("Выберите платформу.");
                return;
            }
            if (string.IsNullOrWhiteSpace(game_name_text.Text))
            {
                MessageBox.Show("Введите название товара.");
                game_name_text.Focus();
                return;
            }
            if (product_type.SelectedIndex < 0)
            {
                MessageBox.Show("Выберите тип товара.");
                return;
            }
            if (string.IsNullOrWhiteSpace(price_text.Text))
            {
                MessageBox.Show("Введите цену товара.");
                price_text.Focus();
                return;
            }
            if (!decimal.TryParse(price_text.Text, out decimal price) || price < 0)
            {
                MessageBox.Show("Введите положительное число в поле цены.");
                price_text.Clear();
                price_text.Focus();
                return;
            }
            if (string.IsNullOrWhiteSpace(description_text.Text) || description_text.Text.Length > 255)
            {
                MessageBox.Show("Введите описание товара. Не более 255 символов.");
                description_text.Focus();
                return;
            }

            Products products = new Products();
            products.Name = game_name_text.Text;
            products.Platform = platform_type.SelectedIndex + 1;
            products.Price = price;
            products.Description = description_text.Text;
            products.Type = product_type.SelectedIndex + 1;

            try
            {
                DB.db.Products.Add(products);
                DB.db.SaveChanges();
            }
            catch (DbUpdateException ex)
            {
                MessageBox.Show($"Произошла ошибка при добавлении товара: {ex.Message}");
            }
            finally
            {
                MessageBox.Show("Товар успешно добавлен!");
                game_name_text.Clear();
                platform_type.SelectedIndex = -1;
                price_text.Clear();
                description_text.Clear();
                product_type.SelectedIndex = -1;
            }


        }

        private void add_clnt_button_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrWhiteSpace(first_name_text.Text))
            {
                MessageBox.Show("Введите имя клиента.");
                first_name_text.Focus();
                return;
            }
            if (string.IsNullOrWhiteSpace(last_name_text.Text))
            {
                MessageBox.Show("Введите фамилию клиента.");
                last_name_text.Focus();
                return;
            }
            if (string.IsNullOrWhiteSpace(phone_text.Text) || phone_text.Text.Length <= 2)
            {
                MessageBox.Show("Введите номер телефона клиента.");
                phone_text.Focus();
                return;
            }
            if (string.IsNullOrWhiteSpace(email_text.Text) || email_text.Text.Length <= 5)
            {
                MessageBox.Show("Введите почту клиента.");
                email_text.Focus();
                return;
            }

            Clients clients = new Clients();
            clients.First_name = first_name_text.Text;
            clients.Last_name = last_name_text.Text;
            clients.Email = email_text.Text;
            clients.Phone = phone_text.Text;

            try
            {
                DB.db.Clients.Add(clients);
                DB.db.SaveChanges();
            }
            catch
            {
                MessageBox.Show("Произошла ошибка при добавлении клиента.");
            }
            finally
            {
                MessageBox.Show("Клиент успешно добавлен!");
                first_name_text.Clear();
                last_name_text.Clear();
                phone_text.Clear();
                email_text.Clear();
            }

        }

        private void cencel_button_Click(object sender, RoutedEventArgs e)
        {

            if (combobox_choice.SelectedIndex == 0)
            {
                first_name_text.Clear();
                last_name_text.Clear();
                phone_text.Clear();
                email_text.Clear();
            }
            else if (combobox_choice.SelectedIndex == 1)
            {
                game_name_text.Clear();
                platform_type.SelectedIndex = -1;
                price_text.Clear();
                description_text.Clear();
                product_type.SelectedIndex = -1;
            }

        }
    }

}
