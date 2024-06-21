using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace PamagitMenzPoxitiliIDerjatVZalojnikax
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Autorisation_Click(object sender, RoutedEventArgs e)
        {
            var login = Login.Text;
            var password = passwordBox.Password;
            var user = Helper.GetContext().Users.Where(p=>p.Password == password && p.Login == login).FirstOrDefault();

            if(login == "" || password == "")
            {
                MessageBox.Show("Заполните необходимые поля");
                return;
            }    

            if(user != null)
            {
                var dataWindow = new DataDaseWindow(user);
                dataWindow.Show();
            }
            else
            {
                MessageBox.Show("Неверный логин или пароль");
            }
        }
    }
}
