using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Test.Movil.ViewModels;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Test.Movil.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class RegistroView : ContentPage
    {
        public RegistroView()
        {
            InitializeComponent();
            this.BindingContext = new RegistroViewModel();
        }

        //void OnDateSelected(object sender, DateChangedEventArgs args)
        //{
        //    FechaNacDatePicker.Format = DateTimePickerFormat.Custom;
        //    FechaNacDatePicker.CustomFormat = "MMMM dd, yyyy - dddd";
        //}
    }
}