using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace GameStatistic
{
    public partial class Recommendation : System.Windows.Controls.Page
    {
        public Recommendation()
        {
            InitializeComponent();

            // Загрузка прошлых рекомендаций из базы данных
            LoadPreviousRecommendations();
        }

        private void SaveToDatabase_Click(object sender, RoutedEventArgs e)
        {
            string recommendation = rec_textbox.Text;

            if (!string.IsNullOrEmpty(recommendation))
            {
                // Сохранение в базу данных
                DB.db.AnalystRec.Add(new AnalystRec
                {
                    Recommendations = recommendation,
                    Date = DateTime.Now
                });

                DB.db.SaveChanges();

                // Обновление списка прошлых рекомендаций
                LoadPreviousRecommendations();
            }
        }

        private dynamic selectedRecommendation; 

        private void Oldrec_datadrid_SelectedCellsChanged(object sender, SelectedCellsChangedEventArgs e)
        {
            // Получаем выбранную строку
            selectedRecommendation = oldrec_datadrid.SelectedItem as dynamic;

            // Обновляем TextBox выбранной рекомендацией
            if (selectedRecommendation != null)
            {
                rec_textbox.Text = $"{selectedRecommendation.Recommendations}";
            }
        }

        private void SaveToWord_Click(object sender, RoutedEventArgs e)
        {
            // Проверяем, выбрана ли рекомендация
            if (selectedRecommendation != null)
            {
                string recommendation = selectedRecommendation.Recommendations;
                DateTime date = selectedRecommendation.Date;

                if (!string.IsNullOrEmpty(recommendation))
                {
                    // Сохранение в Word с использованием даты добавления
                    SaveToWordDocument(date, recommendation);
                }
            }
            else
            {
                MessageBox.Show("Выберите рекомендацию для сохранения.", "Предупреждение");
            }
        }

        private void SaveToWordDocument(DateTime date, string recommendation)
        {
            // Имя файла Word
            string fileName = $"Recommendation_{date.ToString("dd.MM.yy")}.docx";

            try
            {
                // Создание объекта Word
                var wordApp = new Microsoft.Office.Interop.Word.Application();
                var doc = wordApp.Documents.Add();

                // Добавление текста в документ
                doc.Content.Text = $"{date} - {recommendation}";

                // Сохранение документа
                doc.SaveAs2(fileName);

                // Закрытие Word
                doc.Close();
                wordApp.Quit();

                MessageBox.Show($"Рекомендации сохранены в файле {fileName}", "Сохранено");
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при сохранении в Word: {ex.Message}", "Ошибка");
            }
        }



        private void LoadPreviousRecommendations()
        {
            // Загрузка прошлых рекомендаций из базы данных
            var previousRecommendations = DB.db.AnalystRec.Select(rec => new { rec.ID, rec.Date, rec.Recommendations }).ToList();

            // Отображение в DataGrid
            oldrec_datadrid.ItemsSource = previousRecommendations;
        }

    }
}
