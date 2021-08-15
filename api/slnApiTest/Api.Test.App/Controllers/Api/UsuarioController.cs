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
    [RoutePrefix("api/usuario")]
    public class UsuarioController : ApiController
    {
        TG_USUARIO_LOGICA _L;

        [HttpPost]
        [Route("registrarUsuario")]
        public bool Registrar(TG_USUARIO _E)
        {
            _L = new TG_USUARIO_LOGICA();
            return _L.GuardarUsuario(_E);
        }
    }
}
