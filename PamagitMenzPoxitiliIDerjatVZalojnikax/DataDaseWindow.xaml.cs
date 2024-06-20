using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace PamagitMenzPoxitiliIDerjatVZalojnikax
{
    /// <summary>
    /// Логика взаимодействия для DataDaseWindow.xaml
    /// </summary>
    public partial class DataDaseWindow : Window
    {
        public static DataDaseWindow Instance { private set; get; }
        private Request _request;

        public DataDaseWindow()
        {
            InitializeComponent();
            UpdateGrid();
            Instance = this;
        }

        public void UpdateGrid()
        {
            Reqst.ItemsSource = Helper.GetContext().Request.ToList();
        }

        private void ClientDataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (Reqst.SelectedItem != null)
            {
                if (Reqst.SelectedItem is Request selectedClient)
                {
                    _request = selectedClient;
                }
            }
        }

        private void agentGrid_MouseDown(object sender, MouseButtonEventArgs e)
        {
        }

        private void CreateButton_Click(object sender, RoutedEventArgs e)
        {
            var chooseRequest = new RequestWIndow();
            chooseRequest.Show();
        }

        private void Update_Click(object sender, RoutedEventArgs e)
        {
            if(_request != null)
            {
                var chooseRequest = new RequestWIndow(_request);
                chooseRequest.Show();
                UpdateGrid();
            }
            else
            {
                MessageBox.Show("Null request");
            }
        }

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            if (_request != null)
            {
                Helper.GetContext().Request.Remove(_request);
                Helper.GetContext().SaveChanges();
                _request = null;
                UpdateGrid();
            }
            else
            {
                MessageBox.Show("Null request");
            }
        }

        private void Exti_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
