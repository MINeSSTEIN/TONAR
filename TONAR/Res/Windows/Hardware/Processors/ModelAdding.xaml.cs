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

namespace TONAR.Res.Windows.Hardware.Processors
{
    /// <summary>
    /// Логика взаимодействия для ModelAdding.xaml
    /// </summary>
    public partial class ModelAdding : Window
    {
        public ModelAdding()
        {
            InitializeComponent();
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            if(tbName.Text == "")
            {
                MessageBox.Show("Важное поле пусто", "Ошибка");
            }
            else
            {
                DialogResult = true;
                Entities.ProcessorsModels model = new Entities.ProcessorsModels();
                model.Name = tbName.Text;
                try
                {
                    Code.StaticVisibility.e.ProcessorsModels.Add(model);
                    Code.StaticVisibility.e.SaveChanges();
                }
                catch
                {
                    MessageBox.Show("Ошибка при добавлении данных");
                }
            }
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = false;
        }
    }
}
