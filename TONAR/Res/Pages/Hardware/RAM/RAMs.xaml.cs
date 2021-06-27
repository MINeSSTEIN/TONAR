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

namespace TONAR.Res.Pages.Hardware.RAM
{
    /// <summary>
    /// Логика взаимодействия для RAMs.xaml
    /// </summary>
    public partial class RAMs : Page
    {
        private List<Customs.Hardware.RAM.RAMsView> rs = new List<Customs.Hardware.RAM.RAMsView>();
        public RAMs()
        {
            InitializeComponent();
            LoadData();
        }

        private void LoadData()
        {
            Code.StaticVisibility.e.v_ramstandart.Load();
            for(int i = 0; i < Code.StaticVisibility.e.v_ramstandart.Local.Count; i++)
            {
                rs.Add(new Customs.Hardware.RAM.RAMsView());

                rs[i].lMfr.Content = Code.StaticVisibility.e.v_ramstandart.Local[i].Name;
                rs[i].lName.Content = Code.StaticVisibility.e.v_ramstandart.Local[i].model;
                rs[i].lSpeed.Content = Code.StaticVisibility.e.v_ramstandart.Local[i].TickSpeed;
                rs[i].lType.Content = Code.StaticVisibility.e.v_ramstandart.Local[i].Type;
                rs[i].lVolume.Content = Code.StaticVisibility.e.v_ramstandart.Local[i].Volume;

                sp.Children.Add(rs[i]);
            }
        }
    }
}
