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
                StaticVisibility.f.Navigate(new Pages.Hardware.Processors.Processors());
            }
        }


        public static void AddSocket()
        {
            SocketAdding sa = new SocketAdding();
            sa.ShowInTaskbar = false;
            sa.ShowDialog();

            if (sa.DialogResult == true)
            {
                StaticVisibility.f.Navigate(new Pages.Hardware.Processors.Sockets());
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
            Windows.Hardware.Drives.ROMsTypeAdding rta = new Windows.Hardware.Drives.ROMsTypeAdding();
            rta.ShowInTaskbar = false;
            rta.ShowDialog();

            if(rta.DialogResult == true)
            {
                StaticVisibility.f.Navigate(new Pages.Hardware.Drives.ROMsType());
            }
        }

        public static void AddManufacturer()
        {
            Windows.Hardware.ManufacturerAdding ma = new Windows.Hardware.ManufacturerAdding();
            ma.ShowInTaskbar = false;
            ma.ShowDialog();

            if (ma.DialogResult == true)
            {
                StaticVisibility.f.Navigate(new Pages.Hardware.Manufacturers());
            }
        }

        public static void AddROM()
        {
            Windows.Hardware.Drives.ROMsAdding ra = new Windows.Hardware.Drives.ROMsAdding();
            ra.ShowInTaskbar = false;
            ra.ShowDialog();

            if(ra.DialogResult == true)
            {
                StaticVisibility.f.Navigate(new Pages.Hardware.Drives.ROMs());
            }
        }

        public static void AddRAMType()
        {
            Windows.Hardware.RAM.RAMTypeAdding rta = new Windows.Hardware.RAM.RAMTypeAdding();
            rta.ShowInTaskbar = true;
            rta.ShowDialog();

            if(rta.DialogResult == true)
            {
                StaticVisibility.f.Navigate(new Pages.Hardware.RAM.RAMTypes());
            }
        }
    }
}
