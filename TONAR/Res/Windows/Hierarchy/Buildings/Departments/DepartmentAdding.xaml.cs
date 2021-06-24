using System;
using System.Collections.Generic;
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

namespace TONAR.Res.Windows.Hierarchy.Buildings.Departments
{
    /// <summary>
    /// Логика взаимодействия для DepartmentAdding.xaml
    /// </summary>
    public partial class DepartmentAdding : Window
    {
        public DepartmentAdding()
        {
            InitializeComponent();
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            if (tbName.Text == "")
            {
                MessageBox.Show("Важное поле пусто", "Ошибка");
            }
            else
            {
                
                Entities.Departments dep = new Entities.Departments();
                dep.Name = tbName.Text;
                Code.StaticVisibility.e.Departments.Add(dep);
                Code.StaticVisibility.e.SaveChanges();

                int bID = Code.StaticVisibility.e.Database.SqlQuery<int>($"Select dbo.ReturnBuildingID('{Code.StaticVisibility.mi }')").SingleAsync().Result;
                int dID = Code.StaticVisibility.e.Database.SqlQuery<int>($"Select dbo.ReturnDepartmentID('{tbName.Text}')").SingleAsync().Result;

                Entities.BuildingsAndDepartments bad = new Entities.BuildingsAndDepartments();
                bad.idBuilding = bID;
                bad.idDepartment = dID;

                Code.StaticVisibility.e.BuildingsAndDepartments.Add(bad);
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
