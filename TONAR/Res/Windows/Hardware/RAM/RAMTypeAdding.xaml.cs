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

namespace TONAR.Res.Windows.Hardware.RAM
{
    /// <summary>
    /// Логика взаимодействия для RAMTypeAdding.xaml
    /// </summary>
    public partial class RAMTypeAdding : Window
    {
        public RAMTypeAdding()
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
                Entities.RAMTypes r = new Entities.RAMTypes();
                r.Type = tbName.Text;

                Code.StaticVisibility.e.RAMTypes.Add(r);
                Code.StaticVisibility.e.SaveChanges();

                DialogResult = true;
            }
        }
    }
}
