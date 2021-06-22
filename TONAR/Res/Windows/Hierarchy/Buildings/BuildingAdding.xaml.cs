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

namespace TONAR.Res.Windows.Hierarchy.Buildings
{
    /// <summary>
    /// Логика взаимодействия для BuildingAdding.xaml
    /// </summary>
    public partial class BuildingAdding : Window
    {
        public BuildingAdding()
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
                try
                {
                    Entities.Buildings building = new Entities.Buildings();
                    building.Name = tbName.Text;
                    Code.StaticVisibility.e.Buildings.Add(building);
                    Code.StaticVisibility.e.SaveChanges();
                }
                catch { MessageBox.Show("Ошибка при добавлении данных", "Ошибка"); }
                DialogResult = true;
            }
        }
    }
}
