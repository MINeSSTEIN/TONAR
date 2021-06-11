using Microsoft.Win32;
using System.IO;
using System.Windows;


namespace TONAR.Res.Windows.Hardware.Processors
{
    /// <summary>
    /// Логика взаимодействия для ManufacturerAdding.xaml
    /// </summary>
    public partial class ManufacturerAdding : Window
    {
        string _file;
        string _newfile;
        public ManufacturerAdding()
        {
            InitializeComponent();
        }

        private void btnPMAdd_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = true;
            Entities.ProcessorsVendors vendor = new Entities.ProcessorsVendors();
            CopyFile(_file, _newfile);

            vendor.Name = tbPMName.Text;
            vendor.Picture = "\\Pictures\\Processors\\Vendors\\" + tbPMName.Text + ".png";
            vendor.Description = tbPMDesc.Text;
            try
            {
                Code.StaticVisibility.e.ProcessorsVendors.Add(vendor);
                Code.StaticVisibility.e.SaveChanges();
            }
            catch
            {
                MessageBox.Show("Ошибка при добавлении запис", "Ошибка");
            }
        }

        private void btnPMCancel_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = false;
        }

        private void CopyFile(string path, string newPath)
        {
            if(!Directory.Exists(Directory.GetCurrentDirectory() + "\\Pictures\\Processors\\Vendors"))
            {
                Directory.CreateDirectory(Directory.GetCurrentDirectory() + "\\Pictures\\Processors\\Vendors");
            }
            try
            {
                File.Copy(path, newPath);
            }
            catch
            {
                File.Delete(newPath);
                File.Copy(path, newPath);
            }
        }

        private void btnPictureAdd_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog();
            ofd.Filter = "JPEG-файл (*.jpg)|*.jpg|PNG-файл (*.png)|*.png";
            ofd.ShowDialog();
            
            _file = ofd.FileName;
            _newfile = Directory.GetCurrentDirectory() + "\\Pictures\\Processors\\Vendors\\" + tbPMName.Text + ".png";
            tbPMPicturePath.Text = ofd.FileName;
        }
    }
}
