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

namespace TONAR.Res.Windows.Hardware.Drives
{
    /// <summary>
    /// Логика взаимодействия для ROMsAdding.xaml
    /// </summary>
    public partial class ROMsAdding : Window
    {
        public ROMsAdding()
        {
            InitializeComponent();

            LoadData();
        }

        private void LoadData()
        {
            Code.StaticVisibility.e.DrivesTypes.Load();
            Code.StaticVisibility.e.HardwareManufacturers.Load();

            for(int i = 0; i < Code.StaticVisibility.e.DrivesTypes.Local.Count; i++)
                cbTypeChosing.Items.Add(Code.StaticVisibility.e.DrivesTypes.Local[i].Type);

            for (int i = 0; i < Code.StaticVisibility.e.HardwareManufacturers.Local.Count; i++)
                cbManufacturerChosing.Items.Add(Code.StaticVisibility.e.HardwareManufacturers.Local[i].Name);
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            if(tbName.Text == "" ||
                tbVolume.Text == "" ||
                cbManufacturerChosing.SelectedItem.ToString() == "" ||
                cbTypeChosing.SelectedItem.ToString() == "")
            {
                MessageBox.Show("Важное поле пусто");
            }
            else
            {
                Entities.Drives d = new Entities.Drives();

                d.Model = tbName.Text;
                d.Volume = Convert.ToInt32(tbVolume.Text);

                d.idManufacturer = Code.StaticVisibility.e.Database.SqlQuery<int>($"select dbo.ReturnManufacturerID('{cbManufacturerChosing.SelectedItem}')").SingleAsync().Result;
                d.idType = Code.StaticVisibility.e.Database.SqlQuery<int>($"select dbo.ReturnDriveTypeID('{cbTypeChosing.SelectedItem}')").SingleAsync().Result;

                Code.StaticVisibility.e.Drives.Add(d);
                Code.StaticVisibility.e.SaveChanges();

                DialogResult = true;
            }
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = false;
        }
    }
}
