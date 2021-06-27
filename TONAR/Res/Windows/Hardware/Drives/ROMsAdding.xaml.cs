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
    /// Логика взаимодействия для ROMsAdding.xaml
    /// </summary>
    public partial class ROMsAdding : Window
    {
        public ROMsAdding()
        {
            InitializeComponent();
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            if(tbName.Text == "" ||
                tbVolume.Text == "" ||
                cbManufacturerChosing.SelectedItem.ToString() == "" ||
                cbTypeChosing.SelectedItem.ToString() == "")
            {
                MessageBox.Show("Важное поле пусто");
            }
            else
            {
                Entities.Drives d = new Entities.Drives();
                d.
            }
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = false;
        }
    }
}
