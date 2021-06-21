using System.Windows.Controls;
using System.Windows.Media.Imaging;
using System.Data.Entity;
using System.Collections.Generic;

namespace TONAR.Res.Pages.Hardware.Processors
{
    /// <summary>
    /// Логика взаимодействия для Models.xaml
    /// </summary>
    public partial class Models : Page
    {
        private DataGrid tmpGrid = new DataGrid();
        private List<Customs.Hardware.Processors.ProcessorsModelsView> modelsView = new List<Customs.Hardware.Processors.ProcessorsModelsView>();

        public Models()
        {
            InitializeComponent();

            LoadData();
        }

        private void LoadData()
        {
            Code.StaticVisibility.e.ProcessorsModels.Load();
            tmpGrid.ItemsSource = Code.StaticVisibility.e.ProcessorsModels.Local.ToBindingList();

            try
            {
                for (int i = 0; i < tmpGrid.Items.Count - 1; i++)
                {
                    modelsView.Add(new Customs.Hardware.Processors.ProcessorsModelsView());

                    modelsView[i].lModel.Content = Code.StaticVisibility.e.ProcessorsModels.Local[i].Name;

                    spMs.Children.Add(modelsView[i]);
                }
            }
            catch { }
        }

    }
}
