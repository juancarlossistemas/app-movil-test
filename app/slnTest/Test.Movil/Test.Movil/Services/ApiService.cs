using Acr.UserDialogs;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Test.Movil.Models;
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

        public async Task<Response> PostAsync<T>(
            string urlBase,
            string servicePrefix,
            string controller,
            string metodo,
            object objeto)
        {
            UserDialogs.Instance.ShowLoading(title: "Cargando");
            try
            {
                //RequetimientoBE entidad = (RequetimientoBE)objeto;
                /*RequetimientoBE entidad = new RequetimientoBE()
                {

                    ID_REQUERIMIENTO = -1,
                    NOMBRE = "DeClaracion Jurada",
                    USUARIO_GUARDAR = 1
                };*/

                HttpClient client = new HttpClient();
                //string apiUrl = "htp://192.168.1.90/Tarpuy/api/login/authenticate";
                //string apiUrl = "http://tarpuy4pp-001-site1.mysitepanel.net/api/login/authenticate";

                var informacionAMandar = Newtonsoft.Json.JsonConvert.SerializeObject(objeto,
                                Newtonsoft.Json.Formatting.None,
                                new JsonSerializerSettings
                                {
                                    NullValueHandling = NullValueHandling.Ignore
                                });

                string url = $"{urlBase}{servicePrefix}{controller}{metodo}";
                client.BaseAddress = new Uri(url);
                client.DefaultRequestHeaders.Accept.Clear();
                client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
                //client.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", "");
                client.Timeout = TimeSpan.FromMinutes(10);


                HttpRequestMessage request = new HttpRequestMessage(HttpMethod.Post, "");
                request.Content = new StringContent(informacionAMandar, Encoding.UTF8, "application/json");//CONTENT-TYPE header
                HttpResponseMessage response = await client.SendAsync(request);



                /*HttpClient client = new HttpClient();

                var informacionAMandar = Newtonsoft.Json.JsonConvert.SerializeObject(entidad,
                                Newtonsoft.Json.Formatting.None,
                                new JsonSerializerSettings
                                {
                                    NullValueHandling = NullValueHandling.Ignore
                                });

                string url = $"{urlBase}{servicePrefix}{controller}{metodo}";
                HttpResponseMessage response = await client.GetAsync(url);*/
                string result = await response.Content.ReadAsStringAsync();

                if (!response.IsSuccessStatusCode)
                {
                    return new Response
                    {
                        IsSuccess = false,
                        Message = result,
                    };
                }

                T list = JsonConvert.DeserializeObject<T>(result);
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
