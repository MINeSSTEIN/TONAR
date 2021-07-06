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
using TONAR.Res.Pages;

namespace TONAR
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            LogMeIn();
        }

        private void LogMeIn()
        {
            Login l = new Login();
            l.ShowDialog();
            if (l.DialogResult == false)
            {
                InitializeComponent();
                Close();
            }
            if (l.DialogResult == true)
            {
                InitializeComponent();
                LeftFrame.Navigate(new Hierarchy());

                Res.Code.StaticVisibility.f = RightFrame;
                Res.Code.StaticVisibility.fi = LeftFrame;
            }
        }
    }
}
