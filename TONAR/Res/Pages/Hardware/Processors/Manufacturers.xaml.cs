using System.Data.Entity;
using System.Collections.Generic;
using System.Windows.Controls;
using System.Windows.Media.Imaging;

namespace TONAR.Res.Pages.Hardware.Processors
{
    /// <summary>
    /// Логика взаимодействия для Manufacturers.xaml
    /// </summary>
    public partial class Manufacturers : Page
    {
        private DataGrid tmpGrid = new DataGrid();
        private List<Customs.Hardware.Processors.ProcessorsManufacturersView> vendorsViews = new List<Customs.Hardware.Processors.ProcessorsManufacturersView>();

        public Manufacturers()
        {
            InitializeComponent();

            LoadData();
        }

        private void LoadData()
        {
            Code.StaticVisibility.e.ProcessorsVendors.Load();
            tmpGrid.ItemsSource = Code.StaticVisibility.e.ProcessorsVendors.Local.ToBindingList();

            try
            {
                for (int i = 0; i < tmpGrid.Items.Count - 1; i++)
                {
                    BitmapImage bm = new BitmapImage();

                    bm.BeginInit();
                    bm.UriSource = new System.Uri(System.IO.Directory.GetCurrentDirectory() + Code.StaticVisibility.e.ProcessorsVendors.Local[i].Picture);
                    bm.EndInit();

                    vendorsViews.Add(new Customs.Hardware.Processors.ProcessorsManufacturersView());

                    vendorsViews[i].iPic.Source = bm;
                    vendorsViews[i].lName.Content = Code.StaticVisibility.e.ProcessorsVendors.Local[i].Name;
                    vendorsViews[i].tblDesc.Text = Code.StaticVisibility.e.ProcessorsVendors.Local[i].Description;

                    spVs.Children.Add(vendorsViews[i]);
                }
            }
            catch { }
        }
    }
}
