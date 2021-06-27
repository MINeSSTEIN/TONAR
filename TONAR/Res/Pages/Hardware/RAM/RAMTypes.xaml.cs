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
    /// Логика взаимодействия для RAMTypes.xaml
    /// </summary>
    public partial class RAMTypes : Page
    {
        private List<Customs.Hardware.RAM.RAMTypesView> rts = new List<Customs.Hardware.RAM.RAMTypesView>();
        public RAMTypes()
        {
            InitializeComponent();

            LoadData();
        }

        private void LoadData()
        {
            Code.StaticVisibility.e.RAMTypes.Load();
            for(int i = 0; i < Code.StaticVisibility.e.RAMTypes.Local.Count; i++)
            {
                rts.Add(new Customs.Hardware.RAM.RAMTypesView());

                rts[i].lName.Content = Code.StaticVisibility.e.RAMTypes.Local[i].Type;

                spMain.Children.Add(rts[i]);
            }
        }
    }
}
