using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Test.Movil.Responses;

namespace Test.Movil.Services
{
    public interface IApiService
    {
        Task<Response> GetListAsync<T>(string urlBase, string servicePrefix, string controller, string metodo);
    }
}
