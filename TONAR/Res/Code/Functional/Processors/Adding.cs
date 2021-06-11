using System.Data.Entity;
using System.Windows.Controls;
using System.Collections.Generic;
using TONAR.Res.Windows.Hardware.Processors;

namespace TONAR.Res.Code.Functional.Processors
{
    class Adding
    {
        public static void AddProcessorManufacturer()
        {
            ManufacturerAdding ma = new ManufacturerAdding();
            ma.ShowDialog();
        }
    }
}
