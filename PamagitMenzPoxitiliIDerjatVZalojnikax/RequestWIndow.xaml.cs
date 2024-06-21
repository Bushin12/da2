using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace PamagitMenzPoxitiliIDerjatVZalojnikax
{
    /// <summary>
    /// Логика взаимодействия для RequestWIndow.xaml
    /// </summary>
    public partial class RequestWIndow : Window
    {
        private bool _createRequest = true;
        private Request _reques;

        public RequestWIndow()
        {
            InitializeComponent();
            datePicker.SelectedDate = DateTime.Now;
            TechType.ItemsSource = Helper.GetContext().TechType.ToList();
            _reques = new Request();
            Helper.GetContext(true);
        }

        public RequestWIndow(Request request)
        {
            InitializeComponent();
            TechType.ItemsSource = Helper.GetContext().TechType.ToList();
            _reques = request;
            _createRequest = false;

            datePicker.SelectedDate = request.StartDate;
            TechType.SelectedIndex = request.TechType.ID-1;
            Description.Text = request.Description;
        }

        private void SaveData()
        {
            //if (_reques.TechTypeID)
            _reques.StartDate = (DateTime)datePicker.SelectedDate;
            _reques.TechTypeID = TechType.SelectedIndex+1;
            _reques.Description = Description.Text;

            MessageBox.Show(_reques.TechTypeID.ToString());
            
            
            if (_createRequest)
            {
                MessageBox.Show("Запись добавлена!");
                Helper.GetContext().Request.Add(_reques);
            }
            else
            {
                MessageBox.Show("Данные обновлены!");
            }

            Helper.GetContext().SaveChanges();
            DataDaseWindow.Instance.UpdateGrid();
        }

        private void button_Click(object sender, RoutedEventArgs e)
        {
            CreateOrUpdateRewuest();
        }

        private void CLosedButton_Click(object sender, RoutedEventArgs e)
        {
            CreateOrUpdateRewuest();
        }

        private void CreateOrUpdateRewuest()
        {
            SaveData();
            this.Close();
        }
    }
}
