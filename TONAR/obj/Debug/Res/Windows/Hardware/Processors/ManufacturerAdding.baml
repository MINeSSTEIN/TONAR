   M S B A M L   `   `   `  ����@  <TONAR, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null]3clr-namespace:TONAR.Res.Windows.Hardware.Processors%TONAR.Res.Windows.Hardware.Processors  5   	   >    8TONAR.Res.Windows.Hardware.Processors.ManufacturerAdding   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Elocal3clr-namespace:TONAR.Res.Windows.Hardware.Processors     5   	     � Title$1  +Добавить производителя��5   	   $	��250��6(   $	��400��65    � 
ResizeMode$ NoResize=�5	   	    � ShowInTaskbar .  .��5      � .+�5   
   �� $1��+Название производителя��6   63   �� 5   
   -   5         ��Name$ tbPMName��5      $��5, 25, 5, 5q�6$   $��20��69   $	��Top=�6E   $	��374��6]   6k   �� 5   
   $+��%Выбрать изображение��6   $��0, 50, 0, 0q�6.   6E   �� 5   
   -   5        $ tbPMPicturePath��5      {�.  $��5,75,5,5q�6=   $
��Left=�6O   $	��340��6j   6x   �� 5   
   -   5         ��Name$ btnPictureAdd��5      $��20��6(   $	��...��63   $��
353,75,5,5q�6A   6s   �� 5   
   $B��<Краткое описание (необязательно)��6   $��	0,100,0,0q�6;   6P   �� 5   
   -   5        $ tbPMDesc��5   &    �� TextWrapping$
 Wrap=�6   $��	5,125,5,5q�68   $	��374��6K   $��55��6W   6e   �� 5   
   -   5        $ btnPMAdd��5      $��Добавить��6#   $��	5,185,5,5q�66   6b   �� 5   
   -   5        $ btnPMCancel��5      $��Отмена��6&   $��110,185,5,5q�67   6h   5      5      