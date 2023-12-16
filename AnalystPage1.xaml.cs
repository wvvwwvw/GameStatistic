using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;

namespace GameStatistic
{
    /// <summary>
    /// Логика взаимодействия для AnalystPage1.xaml
    /// </summary>
    public partial class AnalystPage1 : Page
    {
        public AnalystPage1()
        {
            InitializeComponent();
        }

        private void rec_button_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new Recommendation());
        }

        private void analys_sales_button_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new SalesAnalys());
        }

    }
}
