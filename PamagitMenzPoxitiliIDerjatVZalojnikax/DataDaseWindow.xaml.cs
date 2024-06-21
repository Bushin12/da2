using System.Data;
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
        private Users _user;

        public DataDaseWindow(Users users)
        {
            _user = users;
            Init();
        }

        private void Init() 
        {
            InitializeComponent();

            var role = _user.RoleID;

            if (role == 1)
            {
                ButtonVisivility(Visibility.Visible, Visibility.Visible, Visibility.Visible);
            }
            else if (role == 2)
            {
                ButtonVisivility(Visibility.Visible, Visibility.Visible, Visibility.Visible);
            }
            else if (role == 3)
            {
                ButtonVisivility(Visibility.Hidden, Visibility.Hidden, Visibility.Hidden);
            }
            else
            {
                ButtonVisivility (Visibility.Hidden, Visibility.Hidden, Visibility.Hidden);
            }
            UpdateGrid();
            Instance = this;
        }

        private void ButtonVisivility(Visibility createButton, Visibility updateButton, Visibility deleteButton)
        {
            CreateButton.Visibility = createButton;
            Update.Visibility = updateButton;
            Delete.Visibility = deleteButton;
        }

        public void UpdateGrid()
        {
            var role = _user.RoleID;
            Request[] requests;

            if (role == 1)
            {
                requests = Helper.GetContext().Request.ToArray();
            }
            else if (role == 2)
            {
                requests = Helper.GetContext().Request.Where(x => x.ClientID == _user.ID).ToArray();
            }
            else if (role == 3)
            {
                requests = Helper.GetContext().Request.ToArray();
            }
            else
            {
                requests = Helper.GetContext().Request.Where(x => x.ClientID == _user.ID).ToArray();
            }
            Reqst.ItemsSource = requests;
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
            }
            else
            {
                MessageBox.Show("Данные не выбраны!");
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
                MessageBox.Show("Данные удалены!");
            }
            else
            {
                MessageBox.Show("Данные не выбраны!");
            }
        }

        private void Exti_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
