using System.Windows;
using System.Data.Entity;

namespace TONAR.Res.Windows.Hardware.Processors
{
    /// <summary>
    /// Логика взаимодействия для NumberAdding.xaml
    /// </summary>
    public partial class NumberAdding : Window
    {
        public NumberAdding()
        {
            InitializeComponent();
        }

        private void AddProcNumber()
        {
            if (tbName.Text != "")
            {
                Entities.ProcessorsMarks pm = new Entities.ProcessorsMarks();

                pm.Mark = tbName.Text;
                Code.StaticVisibility.e.ProcessorsMarks.Add(pm);
                Code.StaticVisibility.e.SaveChanges();
                DialogResult = true;
            }
            else MessageBox.Show("Важное поле пусто", "Ошибка");
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            AddProcNumber();
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = false;
        }
    }
}
