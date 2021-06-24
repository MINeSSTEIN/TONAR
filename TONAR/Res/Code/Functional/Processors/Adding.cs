using System.Data.Entity;
using System.Windows.Controls;
using System.Collections.Generic;
using TONAR.Res.Windows.Hardware.Processors;
using TONAR.Res.Windows.Hierarchy.Buildings;

namespace TONAR.Res.Code.Functional.Processors
{
    class Adding
    {
        public static void AddProcessorManufacturer()
        {
            ManufacturerAdding ma = new ManufacturerAdding();
            ma.ShowDialog();
        }

        public static void AddProcessorModel()
        {
            ModelAdding ma = new ModelAdding();
            ma.ShowDialog();
            if (ma.DialogResult == true)
            {
                StaticVisibility.f.Navigate(new Pages.Hardware.Processors.Models());
            }
        }

        public static void AddProcessorNumber()
        {
            NumberAdding na = new NumberAdding();
            na.ShowDialog();

            if (na.DialogResult == true)
            {
                StaticVisibility.f.Navigate(new Pages.Hardware.Processors.Numbers());
            }
        }

        public static void AddProcessor()
        {
            ProcessorAdding pa = new ProcessorAdding();
            pa.ShowInTaskbar = false;
            pa.ShowDialog();

            if(pa.DialogResult == true)
            {
                
            }
        }


        public static void AddSocket()
        {
            SocketAdding sa = new SocketAdding();
            sa.ShowInTaskbar = false;
            sa.ShowDialog();

            if (sa.DialogResult == true)
            {

            }
        }

        public static void AddBuilding()
        {
            BuildingAdding ba = new BuildingAdding();
            ba.ShowInTaskbar = false;
            ba.ShowDialog();

            if(ba.DialogResult == true)
            {
                StaticVisibility.fi.Navigate(new Pages.Hierarchy());
            }
        }

        public static void AddDepartment()
        {
            Windows.Hierarchy.Buildings.Departments.DepartmentAdding da = new Windows.Hierarchy.Buildings.Departments.DepartmentAdding();
            da.ShowInTaskbar = false;
            da.ShowDialog();

            if(da.DialogResult == true)
            {
                StaticVisibility.fi.Navigate(new Pages.Hierarchy());
            }
        }

        public static void AddDriveType()
        {

        }
    }
}
