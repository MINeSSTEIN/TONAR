﻿#pragma checksum "..\..\..\..\..\..\Res\Windows\Hardware\Processors\ManufacturerAdding.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "9A4DCDDF9905DAE43CF3F7BE638B3BC60F2A162A5A0785456D83332CCB2237C4"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;
using TONAR.Res.Windows.Hardware.Processors;


namespace TONAR.Res.Windows.Hardware.Processors {
    
    
    /// <summary>
    /// ManufacturerAdding
    /// </summary>
    public partial class ManufacturerAdding : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 14 "..\..\..\..\..\..\Res\Windows\Hardware\Processors\ManufacturerAdding.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox tbPMName;
        
        #line default
        #line hidden
        
        
        #line 16 "..\..\..\..\..\..\Res\Windows\Hardware\Processors\ManufacturerAdding.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox tbPMPicturePath;
        
        #line default
        #line hidden
        
        
        #line 17 "..\..\..\..\..\..\Res\Windows\Hardware\Processors\ManufacturerAdding.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnPictureAdd;
        
        #line default
        #line hidden
        
        
        #line 19 "..\..\..\..\..\..\Res\Windows\Hardware\Processors\ManufacturerAdding.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox tbPMDesc;
        
        #line default
        #line hidden
        
        
        #line 20 "..\..\..\..\..\..\Res\Windows\Hardware\Processors\ManufacturerAdding.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnPMAdd;
        
        #line default
        #line hidden
        
        
        #line 21 "..\..\..\..\..\..\Res\Windows\Hardware\Processors\ManufacturerAdding.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button btnPMCancel;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/TONAR;component/res/windows/hardware/processors/manufactureradding.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\..\..\..\Res\Windows\Hardware\Processors\ManufacturerAdding.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.tbPMName = ((System.Windows.Controls.TextBox)(target));
            return;
            case 2:
            this.tbPMPicturePath = ((System.Windows.Controls.TextBox)(target));
            return;
            case 3:
            this.btnPictureAdd = ((System.Windows.Controls.Button)(target));
            
            #line 17 "..\..\..\..\..\..\Res\Windows\Hardware\Processors\ManufacturerAdding.xaml"
            this.btnPictureAdd.Click += new System.Windows.RoutedEventHandler(this.btnPictureAdd_Click);
            
            #line default
            #line hidden
            return;
            case 4:
            this.tbPMDesc = ((System.Windows.Controls.TextBox)(target));
            return;
            case 5:
            this.btnPMAdd = ((System.Windows.Controls.Button)(target));
            
            #line 20 "..\..\..\..\..\..\Res\Windows\Hardware\Processors\ManufacturerAdding.xaml"
            this.btnPMAdd.Click += new System.Windows.RoutedEventHandler(this.btnPMAdd_Click);
            
            #line default
            #line hidden
            return;
            case 6:
            this.btnPMCancel = ((System.Windows.Controls.Button)(target));
            
            #line 21 "..\..\..\..\..\..\Res\Windows\Hardware\Processors\ManufacturerAdding.xaml"
            this.btnPMCancel.Click += new System.Windows.RoutedEventHandler(this.btnPMCancel_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

