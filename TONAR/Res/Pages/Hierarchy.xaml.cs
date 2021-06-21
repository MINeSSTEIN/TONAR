using System;
using System.Collections.Generic;
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
        public Hierarchy()
        {
            InitializeComponent();
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
    }
}
