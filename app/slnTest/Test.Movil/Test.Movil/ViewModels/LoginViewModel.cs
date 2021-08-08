using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Windows.Input;
using Test.Movil.Views;
using Xamarin.Essentials;
using Xamarin.Forms;

namespace Test.Movil.ViewModels
{
    public class LoginViewModel : BaseViewModel
    {
        public ICommand RegistrarCommand => new Command(OnRegistrar);

        public LoginViewModel()
        {
            LoadProductsAsync();
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

            //string url = App.Current.Resources["UrlAPI"].ToString();
            //Response response = await _apiService.GetListAsync<EtapaBE>(
            //    url,
            //    "/api",
            //    "/etapa",
            //    "/obteneralletapa");

            //if (!response.IsSuccess)
            //{
            //    await App.Current.MainPage.DisplayAlert(
            //        "Error",
            //        response.Message,
            //        "Accept");
            //    return;
            //}
            try
            {
                using (HttpClient client = new HttpClient())
                {


                    //string apiUrl = "htp://192.168.1.90/Tarpuy/api/categorias/obtenercategorias";
                    string apiUrl = "http://192.168.1.100/SRES/api/etapa/obteneralletapa";
                    //string apiUrl = "http://tarpuy4pp-001-site1.mysitepanel.net/api/categorias/obtenercategorias";

                    // var token = await SecureStorage.GetAsync("token");
                    client.BaseAddress = new Uri(apiUrl);
                    //client.DefaultRequestHeaders.Accept.Clear();
                    //client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
                    //client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", token);
                    //client.Timeout = TimeSpan.FromMinutes(10);
                    //Al infinito
                    // client.Timeout = new TimeSpan(0, 0, 0, 0, -1);
                    HttpResponseMessage response = await client.GetAsync(apiUrl);
                    string result = await response.Content.ReadAsStringAsync();


                    if (response.IsSuccessStatusCode)
                    {
                        //List<Categorias> result;

                        var jsonPuro = await response.Content.ReadAsStringAsync();
                        /*var singleResult = JsonConvert.DeserializeObject<List<Categorias>>(jsonPuro);

                        result = new List<Categorias>();
                        result = singleResult;

                        CollectCategorias = new ObservableCollection<Categorias>(result);

                        UserDialogs.Instance.HideLoading();*/
                    }
                    else
                    {
                        /* string error = response.ToString();
                         UserDialogs.Instance.HideLoading();
                         await Application.Current.MainPage.DisplayAlert(
                              "Error",
                              error,
                              "Accept");*/
                    }

                }
            }
            catch (Exception ex)
            {
                string a = ex.ToString();
            }


            /*List<EtapaBE> myProducts = (List<EtapaBE>)response.Result;
            Products = new ObservableCollection<EtapaBE>(myProducts);*/
        }
    }
}
