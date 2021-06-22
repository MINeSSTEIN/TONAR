using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Windows;
using System.Windows.Controls;
using TONAR.Res.Code.Functional.Processors;

namespace TONAR.Res.Pages
{
    /// <summary>
    /// Логика взаимодействия для Hierarchy.xaml
    /// </summary>
    public partial class Hierarchy : Page
    {
        List<TreeViewItem> buildings = new List<TreeViewItem>();
        List<TreeViewItem> departments = new List<TreeViewItem>();
        List<TreeViewItem> Computers = new List<TreeViewItem>();

        public Hierarchy()
        {
            InitializeComponent();
            LoadBuildingsToList();
            LoadBuildingsToHierarchy();
        }

        private void LoadBuildingsToList()
        {
            Code.StaticVisibility.e.Buildings.Load();
            for(int i = 0; i < Code.StaticVisibility.e.Buildings.Local.Count; i++)
            {
                try
                {
                    MenuItem mi = new MenuItem();
                    ContextMenu cm = new ContextMenu();
                    TreeViewItem _b = new TreeViewItem();

                    mi.Header = "Добавить отдел";
                    mi.Click += BuildingsMenuAddClick;

                    cm.Items.Add(mi);

                    _b.Header = Code.StaticVisibility.e.Buildings.Local[i].Name;
                    _b.ContextMenu = cm;
                    _b.Selected += BuildingSelected;
                    buildings.Add(_b);
                }
                catch { MessageBox.Show("Ошибка при загрузке данных", "Ошибка"); }
            }
        }

        private void LoadBuildingsToHierarchy()
        {
            for(int i = 0; i <buildings.Count; i++)
            {
                tvMainHierarchy.Items.Add(buildings[i]);
            }
        }

        private void BuildingSelected(object sender, RoutedEventArgs e)
        {
            Code.StaticVisibility.mi = (TreeViewItem)sender;
        }

        private void BuildingsMenuAddClick(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Успешно!");
        }


        private void MenuItem_Click(object sender, RoutedEventArgs e) //Производители процессоров
        {
            Adding.AddProcessorManufacturer();
        }

        private void TreeViewItem_Selected(object sender, RoutedEventArgs e) //Производители процессоров
        {
            Code.StaticVisibility.f.Navigate(new Pages.Hardware.Processors.Manufacturers());
        }

        private void MenuItem_Click_1(object sender, RoutedEventArgs e) //Модели процессоров
        {
            Adding.AddProcessorModel();
        }

        private void TreeViewItem_Selected_1(object sender, RoutedEventArgs e) //Модели процессоров
        {
            Code.StaticVisibility.f.Navigate(new Hardware.Processors.Models());
        }

        private void MenuItem_Click_2(object sender, RoutedEventArgs e) //Номера процессоров
        {
            Adding.AddProcessorNumber();
        }

        private void TreeViewItem_Selected_2(object sender, RoutedEventArgs e) //Номера процессоров
        {
            Code.StaticVisibility.f.Navigate(new Hardware.Processors.Numbers());
        }

        private void MenuItem_Click_3(object sender, RoutedEventArgs e) //Сокеты
        {
            Adding.AddSocket();
        }

        private void MenuItem_Click_4(object sender, RoutedEventArgs e) //Процессоры
        {
            Adding.AddProcessor();
        }

        private void TreeViewItem_Selected_3(object sender, RoutedEventArgs e) //Сокеты
        {
            Code.StaticVisibility.f.Navigate(new Hardware.Processors.Sockets());
        }

        private void MenuItem_Click_5(object sender, RoutedEventArgs e) //Иерархия с компьютерами
        {
            Adding.AddBuilding();
        }
    }
}
