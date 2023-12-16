using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;

namespace GameStatistic
{
    /// <summary>
    /// Логика взаимодействия для LoginPage.xaml
    /// </summary>
    public partial class LoginPage : Page
    {
        public LoginPage()
        {
            InitializeComponent();
        }

        private void enter_button_Click(object sender, RoutedEventArgs e)
        {
            string login = login_text.Text;
            string password = password_text.Password;

            if (login == "manager" && password == "mpass" || login == "admin" && password == "ampass")
            {
                NavigationService.Navigate(new ManagerPage1());
            }
            else if (login == "analyst" && password == "apass" || login == "admin" && password == "aapass")
            {
                NavigationService.Navigate(new AnalystPage1());
            }
            else
            {
                MessageBox.Show("Неверный логин или пароль.\nПопробуйте снова.");
                login_text.Focus();
            }

            login_text.Clear();
            password_text.Clear();
        }
    }
}
