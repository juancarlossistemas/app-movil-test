using Acr.UserDialogs;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Test.Movil.Responses;

namespace Test.Movil.Services
{
    public class ApiService : IApiService
    {
        public async Task<Response> GetListAsync<T>(
            string urlBase,
            string servicePrefix,
            string controller,
            string metodo)
        {
            UserDialogs.Instance.ShowLoading(title: "Cargando");
            try
            {
                //HttpClient client = new HttpClient
                //{
                //    BaseAddress = new Uri(urlBase),
                //};
                HttpClient client = new HttpClient();

                string url = $"{urlBase}{servicePrefix}{controller}{metodo}";
                HttpResponseMessage response = await client.GetAsync(url);
                string result = await response.Content.ReadAsStringAsync();

                if (!response.IsSuccessStatusCode)
                {
                    return new Response
                    {
                        IsSuccess = false,
                        Message = result,
                    };
                }

                List<T> list = JsonConvert.DeserializeObject<List<T>>(result);
                return new Response
                {
                    IsSuccess = true,
                    Result = list
                };
            }
            catch (Exception ex)
            {
                return new Response
                {
                    IsSuccess = false,
                    Message = ex.Message
                };
            }
            finally
            {
                UserDialogs.Instance.HideLoading();
            }
            
        }
    }
}
