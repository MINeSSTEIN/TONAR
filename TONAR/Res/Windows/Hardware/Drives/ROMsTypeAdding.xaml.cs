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

namespace TONAR.Res.Windows.Hardware.Drives
{
    /// <summary>
    /// Логика взаимодействия для ROMsTypeAdding.xaml
    /// </summary>
    public partial class ROMsTypeAdding : Window
    {
        public ROMsTypeAdding()
        {
            InitializeComponent();
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = false;
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            if(tbName.Text == "")
            {
                MessageBox.Show("Важное поле пусто");
            }
            else
            {
                Entities.DrivesTypes dt = new Entities.DrivesTypes();
                dt.Type = tbName.Text;
                Code.StaticVisibility.e.DrivesTypes.Add(dt);
                Code.StaticVisibility.e.SaveChanges();
                DialogResult = true;
            }
        }
    }
}
