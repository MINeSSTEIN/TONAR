using System.Windows.Controls;
using System.Collections.Generic;
using System.Data.Entity;

namespace TONAR.Res.Pages.Hardware.Processors
{
    /// <summary>
    /// Логика взаимодействия для Numbers.xaml
    /// </summary>

    public partial class Numbers : Page
    {
        private DataGrid dg = new DataGrid();
        private List<Customs.Hardware.Processors.ProcessorsNumbersView> nvs = new List<Customs.Hardware.Processors.ProcessorsNumbersView>();

        public Numbers()
        {
            InitializeComponent();

            LoadData();
        }

        private void LoadData()
        {
            Code.StaticVisibility.e.ProcessorsMarks.Load();
            dg.ItemsSource = Code.StaticVisibility.e.ProcessorsMarks.Local.ToBindingList();

            try
            {
                for(int i = 0; i <dg.Items.Count - 1; i++)
                {
                    nvs.Add(new Customs.Hardware.Processors.ProcessorsNumbersView());
                    nvs[i].l.Content = Code.StaticVisibility.e.ProcessorsMarks.Local[i].Mark;
                    spMain.Children.Add(nvs[i]);
                }
            }
            catch { }
        }
    }
}
