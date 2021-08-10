using Acr.UserDialogs;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Net.Http;
using System.Text;
using System.Windows.Input;
using Test.Movil.Models;
using Test.Movil.Responses;
using Test.Movil.Services;
using Test.Movil.Views;
using Xamarin.Essentials;
using Xamarin.Forms;

namespace Test.Movil.ViewModels
{
    public class LoginViewModel : BaseViewModel
    {
        private readonly IApiService _apiService;
        private ObservableCollection<EtapaBE> _products;
        public ICommand RegistrarCommand => new Command(OnRegistrar);

        public LoginViewModel()
        {
            _apiService = new ApiService();
            //LoadProductsAsync();
            LoadPostsAsync();
        }

        private void OnRegistrar()
        {
            Application.Current.MainPage.Navigation.PushAsync(new RegistroView());
        }

        private async void LoadProductsAsync()
        {
            if (Connectivity.NetworkAccess != NetworkAccess.Internet)
            {
                await App.Current.MainPage.DisplayAlert("Error", "Check the internet connection.", "Accept");
                return;
            }

            string url = App.Current.Resources["UrlAPI"].ToString();
            //UserDialogs.Instance.ShowLoading(title: "Cargando");
            Response response = await _apiService.GetListAsync<EtapaBE>(
                url,
                "/api",
                "/etapa",
                "/obteneralletapa");

            if (!response.IsSuccess)
            {
                //UserDialogs.Instance.HideLoading();
                await App.Current.MainPage.DisplayAlert(
                    "Error",
                    response.Message,
                    "Accept");
                return;
            }

            UserDialogs.Instance.HideLoading();
            //List<EtapaBE> myProducts = (List<EtapaBE>)response.Result;
            //Products = new ObservableCollection<EtapaBE>(myProducts);
        }

        private async void LoadPostsAsync()
        {
            if (Connectivity.NetworkAccess != NetworkAccess.Internet)
            {
                await App.Current.MainPage.DisplayAlert("Error", "Check the internet connection.", "Accept");
                return;
            }

            RequetimientoBE r = new RequetimientoBE()
            {
                ID_REQUERIMIENTO = -1,
                NOMBRE = "Declaracion Jurada",
                USUARIO_GUARDAR = 1
            };

            string url = App.Current.Resources["UrlAPI"].ToString();
            //UserDialogs.Instance.ShowLoading(title: "Cargando");
            Response response = await _apiService.PostAsync<bool>(
                url,
                "/api",
                "/requerimiento",
                "/guardarobjeto",
                r);

            if (!response.IsSuccess)
            {
                //UserDialogs.Instance.HideLoading();
                await App.Current.MainPage.DisplayAlert(
                    "Error",
                    response.Message,
                    "Accept");
                return;
            }

            UserDialogs.Instance.HideLoading();
            //List<EtapaBE> myProducts = (List<EtapaBE>)response.Result;
            //Products = new ObservableCollection<EtapaBE>(myProducts);
        }
    }
}
