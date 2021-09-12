using Api.Test.Entidad;
using Api.Test.Logica;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Api.Test.App.Controllers
{
    [RoutePrefix("api/login")]
    public class LoginController : ApiController
    {
        TG_LOGIN_LOGICA _L;

        [HttpGet]
        [Route("loginUsuario")]
        public TG_USUARIO Login(TG_USUARIO _E)
        {
            _L = new TG_LOGIN_LOGICA();
            return _L.loginUsuario(_E);
        }
    }
}
