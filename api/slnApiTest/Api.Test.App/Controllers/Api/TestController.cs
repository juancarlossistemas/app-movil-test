using Api.Test.Entidad;
using Api.Test.Logica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Api.Test.App.Controllers.Api
{
    [RoutePrefix("api/test")]
    public class TestController : ApiController
    {
        TG_TEST_LOGICA _L;

        [HttpGet]
        [Route("obtenertest")]
        public List<TG_TEST> ObtenerTest(TG_TEST _E)
        {
            _L = new TG_TEST_LOGICA();
            return _L.ListarTest(_E);
        }
    }
}
