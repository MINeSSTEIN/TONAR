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
    /// Логика взаимодействия для ROMsType.xaml
    /// </summary>
    public partial class ROMsType : Page
    {
        List<Customs.Hardware.ROMs.ROMsTypesView> ROMs = new List<Customs.Hardware.ROMs.ROMsTypesView>();
        public ROMsType()
        {
            InitializeComponent();
            LoadData();
        }

        private void LoadData()
        {
            Code.StaticVisibility.e.DrivesTypes.Load();

            for(int i = 0; i < Code.StaticVisibility.e.DrivesTypes.Local.Count; i++)
            {
                ROMs.Add(new Customs.Hardware.ROMs.ROMsTypesView());
                ROMs[i].thisID = Code.StaticVisibility.e.DrivesTypes.Local[i].id;
                ROMs[i].lName.Content = Code.StaticVisibility.e.DrivesTypes.Local[i].Type;

                spMain.Children.Add(ROMs[i]);
            }
        }
    }
}
