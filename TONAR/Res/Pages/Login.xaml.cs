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
using System.Windows.Shapes;

namespace TONAR.Res.Pages
{
    /// <summary>
    /// Логика взаимодействия для Login.xaml
    /// </summary>
    public partial class Login : Window
    {
        public Login()
        {
            InitializeComponent();
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = false;
        }

        private void btnLogin_Click(object sender, RoutedEventArgs e)
        {
            string log = tbLogin.Text;
            string pas = pbPassword.Password;

            var usr = Code.StaticVisibility.e.Users.FirstOrDefault(x => x.Login == log && x.Password == pas);

            if(usr == null)
            {
                MessageBox.Show("Такого пользователя не существует");
            }
            else
            {
                DialogResult = true;
            }

            
        }
    }
}
