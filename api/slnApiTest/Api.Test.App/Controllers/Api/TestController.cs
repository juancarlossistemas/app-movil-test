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
        public List<TG_TEST> ObtenerTest(int codigotestre)
        {
            _L = new TG_TEST_LOGICA();
            return _L.ListarTest(new TG_TEST() { TEST_N_CODIGO = codigotestre });
        }

        [HttpPost]
        [Route("guardarpuntajetest")]
        public TG_DIAGNOSTICO GuardarPuntajeTest(TG_TEST _E)
        {
            _L = new TG_TEST_LOGICA();
            return _L.GuardarPuntajeTest(_E);
        }

        [HttpGet]
        [Route("obtenertratamiento")]
        public List<TG_TRATAMIENTO> ObtenerTratamiento(int idUsuario)
        {
            _L = new TG_TEST_LOGICA();
            return _L.ListarTratamiento(new TG_USUARIO() { USUARI_N_CODIGO = idUsuario });
        }

        [HttpGet]
        [Route("obtenertecnica")]
        public List<TG_TECNICA_DETALLE> ObtenerTecnica(int idUsuario, int idTratamiento)
        {
            _L = new TG_TEST_LOGICA();
            return _L.ListarTecnica(new TG_TRATAMIENTO() { USUARI_N_CODIGO = idUsuario, TRATAM_N_CODIGO = idTratamiento });
        }
    }
}
