using System.Collections.Generic;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace GameStatistic
{
    public partial class SalesAnalys : System.Windows.Controls.Page
    {
        public SalesAnalys()
        {
            InitializeComponent();
            Loaded += SalesAnalys_Loaded;
        }

        private void SalesAnalys_Loaded(object sender, RoutedEventArgs e)
        {
            LoadChartData();
        }

        private void SortComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            LoadChartData();
        }

        private void LoadChartData()
        {
            var selectedIndex = sortComboBox.SelectedIndex;

            switch (selectedIndex)
            {
                case 0:
                    LoadTotalSalesData();
                    break;
                case 1:
                    LoadPlatformData();
                    break;
                case 2:
                    LoadProductTypeData();
                    break;
            }
        }

        private void LoadTotalSalesData()
        {
            var query = from sale in DB.db.Sales
                        join product in DB.db.Products on sale.Product_ID equals product.ID
                        group new { sale, product } by new { Year = sale.Sale_date.Year, Month = sale.Sale_date.Month } into grouped
                        orderby grouped.Key.Year, grouped.Key.Month
                        select new ChartData { Label = grouped.Key.Month.ToString(), Value = grouped.Sum(s => s.product.Price) };

            UpdateChart(query, "Сумма продаж по месяцам", "Месяц", "Сумма продаж");
        }



        private void LoadPlatformData()
        {
            var query = from sale in DB.db.Sales
                        join product in DB.db.Products on sale.Product_ID equals product.ID
                        join platform in DB.db.Platform_type on product.Platform equals platform.ID
                        group new { sale, product, platform } by new { Platform = platform.PlatformName } into grouped
                        orderby grouped.Key.Platform
                        select new ChartData { Label = grouped.Key.Platform, Value = grouped.Sum(s => s.product.Price) };

            UpdateChart(query, "Сумма продаж по платформам", "Платформа", "Сумма продаж");
        }

        private void LoadProductTypeData()
        {
            var query = from sale in DB.db.Sales
                        join product in DB.db.Products on sale.Product_ID equals product.ID
                        join productType in DB.db.Product_type on product.Type equals productType.ID
                        group new { sale, product, productType } by new { ProductType = productType.TypeName } into grouped
                        orderby grouped.Key.ProductType
                        select new ChartData { Label = grouped.Key.ProductType, Value = grouped.Sum(s => s.product.Price) };

            UpdateChart(query, "Сумма продаж по типам товаров", "Тип товара", "Сумма продаж");
        }

        private void UpdateChart(IEnumerable<ChartData> query, string title, string xTitle, string yTitle)
        {
            // Очистка предыдущих данных
            chart.Series["TotalSales"].Points.Clear();

            // Преобразование данных для использования в диаграмме
            var chartData = query.ToList();
            var series = chart.Series["TotalSales"];

            foreach (var dataPoint in chartData)
            {
                series.Points.AddXY(dataPoint.Label, dataPoint.Value);
            }

            // Настройка осей и заголовков
            chart.ChartAreas[0].AxisX.Interval = 1;
            chart.ChartAreas[0].AxisX.MajorGrid.Enabled = false;
            chart.ChartAreas[0].AxisX.Title = xTitle;
            chart.ChartAreas[0].AxisY.Title = yTitle;

            // Отображение легенды
            chart.Legends[0].Enabled = true;

            // Заголовок диаграммы
            chart.Titles.Clear();
            chart.Titles.Add(title);
        }

        public class ChartData
        {
            public string Label { get; set; }
            public decimal Value { get; set; }
        }


    }
}
