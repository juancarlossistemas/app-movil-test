using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;
using System.Windows.Input;
using Test.Movil.Models;
using Test.Movil.Responses;
using Test.Movil.Services;
using Test.Movil.Views;
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

            string mensaje = "";
            if (string.IsNullOrEmpty(correo)) mensaje += "correo electrónico";
            if (string.IsNullOrEmpty(nombre)) mensaje += string.IsNullOrEmpty(mensaje) ? "nombre" : ", nombre";
            if (string.IsNullOrEmpty(contrasena)) mensaje += string.IsNullOrEmpty(mensaje) ? "contraseña" : ", contraseña";            
            if (string.IsNullOrEmpty(confirmarcontrasena)) mensaje += string.IsNullOrEmpty(mensaje) ? "confirmar contraseña" : ", confirmar contraseña";
            if (genero == 0) mensaje += string.IsNullOrEmpty(mensaje) ? "género" : ", género";
            if (!string.IsNullOrEmpty(mensaje))
            {
                await App.Current.MainPage.DisplayAlert("Error", "Debe seleccionar y/o ingresar " + mensaje + " para continuar con el registro.", "Accept");
                return;
            }

            bool isEmail = Regex.IsMatch(this.correo, @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z", RegexOptions.IgnoreCase);
            if (!isEmail)
            {
                await Application.Current.MainPage.DisplayAlert(
                    "Error",
                    "El formato del correo electrónico es incorrecto, revíselo e inténtelo de nuevamente.",
                    "Accept");
                return;
            }

            if (!string.Equals(contrasena, confirmarcontrasena))
            {
                await Application.Current.MainPage.DisplayAlert(
                    "Error",
                    "Las contraseñas deben de coincidir,revíselo e inténtelo de nuevamente.",
                    "Accept");
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
            Response response = await _apiService.PostAsync<bool>(
                url,
                "/api",
                "/login",
                "/registrarUsuario",
                _E);

            if (!response.IsSuccess)
            {
                await App.Current.MainPage.DisplayAlert(
                    "Error",
                    response.Message,
                    "Accept");
                return;
            }

            await Application.Current.MainPage.Navigation.PushAsync(new LoginView());
            await Application.Current.MainPage.DisplayAlert(
                    "Éxito",
                    nombre + ", su cuenta ha sido registrado con éxito.",
                    "Accept");
            return;
        }

        //private bool validar()
        //{
        //    if ()
        //    return true;
        //}
    }
}
