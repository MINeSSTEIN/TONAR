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

namespace TONAR.Res.Windows.Hierarchy.Buildings.Departments.PCs
{
    /// <summary>
    /// Логика взаимодействия для PCAdding.xaml
    /// </summary>
    public partial class PCAdding : Window
    {
        public PCAdding()
        {
            InitializeComponent();
            LoadData();
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = false;
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            if (tbPCName.Text == "" ||
                tbRAMCount.Text == "" ||
                cbBoard.SelectedItem == "" ||
                cbCPU.SelectedItem == "" ||
                cbDrives.SelectedItem == "" ||
                cbRAM.SelectedItem == "" ||
                cbVideo.SelectedItem == "")
            {
                MessageBox.Show("Важное поле пусто");
            }
            else
            {
                Entities.Computers pc = new Entities.Computers();
                pc.idDriveSet = Convert.ToInt32(cbDrives.SelectedItem);
                pc.idMotherBoard = Code.StaticVisibility.e.Motherboards.Local[cbBoard.SelectedIndex].id;
                pc.idProcessor = Code.StaticVisibility.e.Processors.Local[cbCPU.SelectedIndex].id;
                pc.idRam = Code.StaticVisibility.e.RAM.Local[cbRAM.SelectedIndex].id;
                pc.idVideoAdapter = Code.StaticVisibility.e.VideoAdapts.Local[cbRAM.SelectedIndex].id;
                pc.Username = tbPCName.Text;
                pc.RamPlatesCount = Convert.ToInt32(tbRAMCount.Text);

                Code.StaticVisibility.e.Computers.Add(pc);
                Code.StaticVisibility.e.SaveChanges();

                Entities.DepartmentsAndComputers dac = new Entities.DepartmentsAndComputers();
                dac.idComputer = Code.StaticVisibility.e.Database.SqlQuery<int>($"select dbo.returnpcid('{tbPCName.Text}')").SingleAsync().Result;
                dac.idDepartment = Code.StaticVisibility.e.Database.SqlQuery<int>($"Select dbo.ReturnDepartmentID('{Code.StaticVisibility.mi2}')").SingleAsync().Result;

                DialogResult = true;
            }
        }

        private void LoadData()
        {
            Code.StaticVisibility.e.V_ProcessorsStandart.Load();

            Code.StaticVisibility.e.Processors.Load();
            Code.StaticVisibility.e.RAM.Load();
            Code.StaticVisibility.e.Motherboards.Load();
            Code.StaticVisibility.e.VideoAdapts.Load();
            Code.StaticVisibility.e.DriveSets.Load();

            for (int i = 0; i < Code.StaticVisibility.e.Motherboards.Local.Count; i++)
            {
                cbBoard.Items.Add(Code.StaticVisibility.e.Motherboards.Local[i].Model);
            }
            for (int i = 0; i < Code.StaticVisibility.e.RAM.Local.Count; i++)
            {
                cbRAM.Items.Add(Code.StaticVisibility.e.RAM.Local[i].Model);
            }
            for (int i = 0; i < Code.StaticVisibility.e.Processors.Local.Count; i++)
            {
                cbCPU.Items.Add(Code.StaticVisibility.e.V_ProcessorsStandart.Local[i].vName + " " +
                    Code.StaticVisibility.e.V_ProcessorsStandart.Local[i].Name + " " +
                    Code.StaticVisibility.e.V_ProcessorsStandart.Local[i].Mark);
            }
            for (int i = 0; i < Code.StaticVisibility.e.VideoAdapts.Local.Count; i++)
            {
                cbVideo.Items.Add(Code.StaticVisibility.e.VideoAdapts.Local[i].Model);
            }
            for (int i = 0; i < Code.StaticVisibility.e.DriveSets.Local.Count; i++)
            {
                cbDrives.Items.Add(Code.StaticVisibility.e.DriveSets.Local[i].id);
            }
        }
    }
}
