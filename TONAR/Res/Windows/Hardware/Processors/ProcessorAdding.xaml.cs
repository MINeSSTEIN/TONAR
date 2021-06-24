using System;
using System.Data.Entity;
using System.Windows;

namespace TONAR.Res.Windows.Hardware.Processors
{
    /// <summary>
    /// Логика взаимодействия для ProcessorAdding.xaml
    /// </summary>
    public partial class ProcessorAdding : Window
    {
        public ProcessorAdding()
        {
            InitializeComponent();
            FillData();
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = false;
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            if(tbL1.Text == ""||
                tbL2.Text == ""||
                tbTick.Text == ""||
                cbModels.SelectedItem.ToString() == ""||
                cbNumbers.SelectedItem.ToString() == ""||
                cbSockets.SelectedItem.ToString() == ""||
                cbVendors.SelectedItem.ToString()=="")
            {
                MessageBox.Show("Важное поле пусто", "Ошибка");
            }
            try
            {
                Entities.Processors proc = new Entities.Processors();
                proc.CacheL1 = Convert.ToInt32(tbL1.Text);
                proc.CacheL2 = Convert.ToInt32(tbL2.Text);
                proc.CacheL3 = Convert.ToInt32(tbL3.Text);
                proc.Tickspeed = tbTick.Text;
                proc.idMark = Code.StaticVisibility.e.Database.SqlQuery<int>($"select dbo.ReturnProcessorMarkID('{cbNumbers.SelectedItem}')").SingleAsync().Result;
                proc.idModel = Code.StaticVisibility.e.Database.SqlQuery<int>($"select dbo.ReturnProcessorModelID('{cbModels.SelectedItem}')").SingleAsync().Result;
                proc.idSocket = Code.StaticVisibility.e.Database.SqlQuery<int>($"select dbo.ReturnSocketID('{cbSockets.SelectedItem}')").SingleAsync().Result;
                proc.idVendor = Code.StaticVisibility.e.Database.SqlQuery<int>($"select dbo.ReturnProcessorVendorID('{cbVendors.SelectedItem}')").SingleAsync().Result;

                Code.StaticVisibility.e.Processors.Add(proc);
                Code.StaticVisibility.e.SaveChanges();

                DialogResult = true;
            }
            catch { MessageBox.Show("Ошибка при добавлении данных"); }
        }

        private void FillData()
        {
            Code.StaticVisibility.e.ProcessorsVendors.Load();
            foreach (Entities.ProcessorsVendors a in Code.StaticVisibility.e.ProcessorsVendors.Local)
            {
                cbVendors.Items.Add(a.Name);
            }

            Code.StaticVisibility.e.ProcessorsMarks.Load();
            foreach(Entities.ProcessorsMarks a in Code.StaticVisibility.e.ProcessorsMarks.Local)
            {
                cbNumbers.Items.Add(a.Mark);
            }

            Code.StaticVisibility.e.ProcessorsModels.Load();
            foreach (Entities.ProcessorsModels a in Code.StaticVisibility.e.ProcessorsModels.Local)
            {
                cbModels.Items.Add(a.Name);
            }

            Code.StaticVisibility.e.Sockets.Load();
            foreach (Entities.Sockets a in Code.StaticVisibility.e.Sockets.Local)
            {
                cbSockets.Items.Add(a.Socket);
            }
        }
    }
}
