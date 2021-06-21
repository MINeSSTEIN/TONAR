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
using System.Windows.Shapes;

namespace TONAR.Res.Windows.Hardware.Processors
{
    /// <summary>
    /// Логика взаимодействия для SocketAdding.xaml
    /// </summary>
    public partial class SocketAdding : Window
    {
        public SocketAdding()
        {
            InitializeComponent();

            FillCB();
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            if(tbName.Text == "" || cbVendorChosing.SelectedItem.ToString() == "")
            {
                MessageBox.Show("Важное поле пусто");
            }
            else
            {
                Entities.Sockets socket = new Entities.Sockets();
                Entities.SocketsAndVendors socketVendor = new Entities.SocketsAndVendors();

                socket.Socket = tbName.Text;

                try
                {
                    Code.StaticVisibility.e.Sockets.Add(socket);
                    Code.StaticVisibility.e.SaveChanges();
                }
                catch
                { MessageBox.Show("Ошибка при добавлении данных", "Ошибка"); }

                try
                {
                    socketVendor.idSocket = Code.StaticVisibility.e.Database.SqlQuery<int>($"select dbo.ReturnSocketID('{tbName.Text}')").SingleAsync().Result;
                    socketVendor.idVendor = Code.StaticVisibility.e.Database.SqlQuery<int>($"select dbo.ReturnProcessorVendorID('{cbVendorChosing.SelectedItem}')").SingleAsync().Result;

                    Code.StaticVisibility.e.SocketsAndVendors.Add(socketVendor);
                    Code.StaticVisibility.e.SaveChanges();
                }
                catch
                { MessageBox.Show("Ошибка при добавлении данных", "Ошибка"); }
                DialogResult = true;
            }
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = false;
        }

        private void FillCB()
        {
            cbVendorChosing.Items.Clear();
            Code.StaticVisibility.e.ProcessorsVendors.Load();
            foreach (Entities.ProcessorsVendors a in Code.StaticVisibility.e.ProcessorsVendors.Local)
            {
                cbVendorChosing.Items.Add(a.Name);
            }
        }
    }
}
