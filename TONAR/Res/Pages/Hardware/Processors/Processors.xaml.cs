using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
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

namespace TONAR.Res.Pages.Hardware.Processors
{
    /// <summary>
    /// Логика взаимодействия для Processors.xaml
    /// </summary>
    public partial class Processors : Page
    {
        private List<Customs.Hardware.Processors.ProcessorsView> procs = new List<Customs.Hardware.Processors.ProcessorsView>();
        public Processors()
        {
            InitializeComponent();
            LoadData();
        }

        private void LoadData()
        {
            Code.StaticVisibility.e.V_ProcessorsStandart.Load();
            for(int i = 0; i < Code.StaticVisibility.e.V_ProcessorsStandart.Local.Count; i++)
            {
                BitmapImage bmi = new BitmapImage();
                bmi.BeginInit();
                bmi.UriSource = new Uri(Directory.GetCurrentDirectory() + Code.StaticVisibility.e.V_ProcessorsStandart.Local[i].Picture);
                bmi.EndInit();

                procs.Add(new Customs.Hardware.Processors.ProcessorsView());
                procs[i].iPic.Source = bmi;
                procs[i].thisID = Code.StaticVisibility.e.V_ProcessorsStandart.Local[i].id;
                procs[i].lFullName.Content = Code.StaticVisibility.e.V_ProcessorsStandart.Local[i].vName + " " +
                    Code.StaticVisibility.e.V_ProcessorsStandart.Local[i].Name + " " +
                    Code.StaticVisibility.e.V_ProcessorsStandart.Local[i].Mark;
                procs[i].lFreq.Content = "Тактовая частота: " + Code.StaticVisibility.e.V_ProcessorsStandart.Local[i].Tickspeed;
                procs[i].lL1.Content = "Кеш 1 уровня: " + Code.StaticVisibility.e.V_ProcessorsStandart.Local[i].CacheL1;
                procs[i].lL2.Content = "Кеш 2 уровня: " + Code.StaticVisibility.e.V_ProcessorsStandart.Local[i].CacheL2;
                procs[i].lL3.Content = "Кеш 3 уровня: " + Code.StaticVisibility.e.V_ProcessorsStandart.Local[i].CacheL3;
                procs[i].lSocket.Content = "Сокет: " + Code.StaticVisibility.e.V_ProcessorsStandart.Local[i].Socket;

                sp.Children.Add(procs[i]);
            }
        }
    }
}
