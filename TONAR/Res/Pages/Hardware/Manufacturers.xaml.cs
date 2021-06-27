using System;
using System.Collections.Generic;
using System.Data.Entity;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace TONAR.Res.Pages.Hardware
{
    /// <summary>
    /// Логика взаимодействия для Manufacturers.xaml
    /// </summary>
    public partial class Manufacturers : Page
    {
        private List<Customs.Hardware.ManufacturersView> mfs = new List<Customs.Hardware.ManufacturersView>();
        public Manufacturers()
        {
            InitializeComponent();

            LoadData();
        }

        private void LoadData()
        {
            Code.StaticVisibility.e.HardwareManufacturers.Load();
            for(int i = 0; i < Code.StaticVisibility.e.HardwareManufacturers.Local.Count; i++)
            {
                mfs.Add(new Customs.Hardware.ManufacturersView());
                mfs[i].lName.Content = Code.StaticVisibility.e.HardwareManufacturers.Local[i].Name;
                spMain.Children.Add(mfs[i]);
            }
        }
    }
}
