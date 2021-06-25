using System.Collections.Generic;
using System.Data.Entity;
using System.Windows;
using System.Windows.Controls;

namespace TONAR.Res.Pages.Hardware.Processors
{
    /// <summary>
    /// Логика взаимодействия для Sockets.xaml
    /// </summary>
    public partial class Sockets : Page
    {
        private List<Customs.Hardware.Processors.SocketView> socketsViews = new List<Customs.Hardware.Processors.SocketView>();

        public Sockets()
        {
            InitializeComponent();
            LoadData();
        }

        public void LoadData()
        {
            Code.StaticVisibility.e.Sockets.Load();
            try
            {
                for (int i = 0; i < Code.StaticVisibility.e.Sockets.Local.Count; i++)
                {
                    socketsViews.Add(new Customs.Hardware.Processors.SocketView());
                    socketsViews[i].lMain.Content = Code.StaticVisibility.e.Sockets.Local[i].Socket;
                    spMain.Children.Add(socketsViews[i]);
                }
            }
            catch { }
        }
    }
}
