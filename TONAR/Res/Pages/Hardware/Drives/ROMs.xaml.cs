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

namespace TONAR.Res.Pages.Hardware.Drives
{
    /// <summary>
    /// Логика взаимодействия для ROMs.xaml
    /// </summary>
    public partial class ROMs : Page
    {
        private List<Customs.Hardware.ROMs.ROMsView> rs = new List<Customs.Hardware.ROMs.ROMsView>();
        public ROMs()
        {
            InitializeComponent();
            LoadData();
        }

        private void LoadData()
        {
            Code.StaticVisibility.e.v_DrivesStandart.Load();

            for (int i = 0; i < Code.StaticVisibility.e.v_DrivesStandart.Local.Count; i++) {
                rs.Add(new Customs.Hardware.ROMs.ROMsView());
                rs[i].lName.Content = Code.StaticVisibility.e.v_DrivesStandart.Local[i].Model;
                rs[i].lMfr.Content = Code.StaticVisibility.e.v_DrivesStandart.Local[i].Name;
                rs[i].lType.Content = Code.StaticVisibility.e.v_DrivesStandart.Local[i].Type;
                rs[i].lVolume.Content = Code.StaticVisibility.e.v_DrivesStandart.Local[i].Volume + " ГБ";

                sp.Children.Add(rs[i]);
            }
        }
    }
}
