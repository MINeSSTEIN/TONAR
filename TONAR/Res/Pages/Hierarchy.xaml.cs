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
            LoadDepartnemtsToList();

            LoadDepartmentsToBuildings();

            LoadBuildingsToHierarchy();
        }

        /// <summary>
        /// Загружает здания из базы в коллекцию buildings
        /// </summary>
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
                    _b.MouseRightButtonDown += (sender, MouseRightButtonDown) => { _b_MouseRightButtonDown(sender, MouseRightButtonDown, _b.Header.ToString()); };
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

        private void LoadDepartnemtsToList()
        {
            try
            {
                Code.StaticVisibility.e.Departments.Load();
                for (int i = 0; i < Code.StaticVisibility.e.Departments.Local.Count; i++)
                {
                    MenuItem mi = new MenuItem();
                    ContextMenu cm = new ContextMenu();
                    TreeViewItem _b = new TreeViewItem();

                    mi.Header = "Добавить компьютер";
                    mi.Click += DepartmentMenuAddClick;

                    cm.Items.Add(mi);


                    _b.Header = Code.StaticVisibility.e.Departments.Local[i].Name;
                    _b.ContextMenu = cm;
                    departments.Add(_b);
                }
            }
            catch { MessageBox.Show("Ошибка при загрузке данных", "Ошибка"); }
        }

        private void _b_MouseRightButtonDown(object sender, RoutedEventArgs e, string a)
        {
            Code.StaticVisibility.mi = a;
        }

        private void LoadDepartmentsToBuildings()
        {
            Code.StaticVisibility.e.BuildingsAndDepartments.Load();
            for(int i = 0; i < buildings.Count; i++)
            {
                for(int j =0; j < departments.Count; j++)
                {
                    if( Code.StaticVisibility.e.BuildingsAndDepartments.Local[j].idBuilding
                        ==
                        Code.StaticVisibility.e.Buildings.Local[i].id 

                        &&

                        Code.StaticVisibility.e.BuildingsAndDepartments.Local[j].idDepartment
                        ==
                        Code.StaticVisibility.e.Departments.Local[j].id)
                    {
                        buildings[i].Items.Add(departments[j]);
                    }
                }
            }
        }

        private void BuildingsMenuAddClick(object sender, RoutedEventArgs e)
        {
            Adding.AddDepartment();
        }

        private void DepartmentMenuAddClick(object sender, RoutedEventArgs e)
        {
            //Code.StaticVisibility.mi = 
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

        private void TreeViewItem_Selected_4(object sender, RoutedEventArgs e) //Типы ПЗУ
        {

        }

        private void MenuItem_Click_6(object sender, RoutedEventArgs e) //Типы ПЗУ
        {
            Adding.AddDriveType();
        }
    }
}
