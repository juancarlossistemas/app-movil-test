using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Input;
using Test.Movil.Models;
using Test.Movil.Responses;
using Test.Movil.Services;
using Xamarin.Essentials;
using Xamarin.Forms;

namespace Test.Movil.ViewModels
{
    public class RegistroViewModel : BaseViewModel
    {
        private readonly IApiService _apiService;
        public ICommand RegisterCommand => new Command(OnRegistrar);

        public string correo;
        public string nombre;
        public string contrasena;
        public string confirmarcontrasena;
        public int genero;
        public DateTime fechanacimiento;

        public RegistroViewModel()
        {
            _apiService = new ApiService();
        }
                
        public string CorreoTxt
        {
            get => correo;
            set => SetValue(ref correo, value);
        }

        public string NombreTxt
        {
            get => nombre;
            set => SetValue(ref nombre, value);
        }

        public string ContrasenaTxt
        {
            get => contrasena;
            set => SetValue(ref contrasena, value);
        }

        public string ConfirmarContrasenaTxt
        {
            get => confirmarcontrasena;
            set => SetValue(ref confirmarcontrasena, value);
        }

        public int GeneroRdb
        {
            get => genero;
            set => SetValue(ref genero, value);
        }

        public DateTime FechaNacimientoDtp
        {
            get => fechanacimiento;
            set => SetValue(ref fechanacimiento, value);
        }

        private async void OnRegistrar()
        {
            if (Connectivity.NetworkAccess != NetworkAccess.Internet)
            {
                await App.Current.MainPage.DisplayAlert("Error", "Check the internet connection.", "Accept");
                return;
            }

            TG_USUARIO _E = new TG_USUARIO()
            {
                USUARI_T_CORREO = correo,
                USUARI_T_CONTRA = contrasena,
                USUARI_T_NOMBRE = nombre,
                USUARI_N_GENERO = genero,
                USUARI_T_FECNAC = fechanacimiento.ToString("yyyyMMdd")
            };

            string url = App.Current.Resources["UrlAPI"].ToString();
            //UserDialogs.Instance.ShowLoading(title: "Cargando");
            Response response = await _apiService.PostAsync<bool>(
                url,
                "/api",
                "/login",
                "/registrarUsuario",
                _E);

            if (!response.IsSuccess)
            {
                //UserDialogs.Instance.HideLoading();
                await App.Current.MainPage.DisplayAlert(
                    "Error",
                    response.Message,
                    "Accept");
                return;
            }

            //UserDialogs.Instance.HideLoading();
            //List<EtapaBE> myProducts = (List<EtapaBE>)response.Result;
            //Products = new ObservableCollection<EtapaBE>(myProducts);
        }
    }
}
