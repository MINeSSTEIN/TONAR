using System.Windows;
using System.Data.Entity;
using System.Data.SqlClient;

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

            FillCB();
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            if(tbName.Text == "")
            {
                MessageBox.Show("Важное поле пусто", "Ошибка");
            }
            else
            {
                Entities.ProcessorsModels model = new Entities.ProcessorsModels();
                Entities.ProcessorsVendorsAndModels conn = new Entities.ProcessorsVendorsAndModels();

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


                try
                {
                    conn.idModel = Code.StaticVisibility.e.Database.SqlQuery<int>($"select dbo.ReturnProcessorModelID('{tbName.Text}')").SingleAsync().Result;
                    conn.idVendor = Code.StaticVisibility.e.Database.SqlQuery<int>($"select dbo.ReturnProcessorVendorID('{cbVendorChosing.SelectedItem}')").SingleAsync().Result;

                    Code.StaticVisibility.e.ProcessorsVendorsAndModels.Add(conn);
                    Code.StaticVisibility.e.SaveChanges();
                }
                catch
                {
                    MessageBox.Show("Ошибка при добавлении данных");
                }
                DialogResult = true;
            }
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = false;
        }

        private void FillCB()
        {
            cbVendorChosing.Items.Clear(); 
            Code.StaticVisibility.e.ProcessorsVendors.Load();
            foreach(Entities.ProcessorsVendors a in Code.StaticVisibility.e.ProcessorsVendors.Local)
            {
                cbVendorChosing.Items.Add(a.Name);
            }
        }
    }
}
