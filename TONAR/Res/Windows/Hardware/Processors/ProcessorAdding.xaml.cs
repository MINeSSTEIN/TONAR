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
