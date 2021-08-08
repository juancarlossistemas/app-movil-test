using System;
using System.Collections.Generic;
using System.Text;

namespace Test.Movil.Models
{
    public class EtapaBE
    {
        public int ID_ETAPA { get; set; }
        public string NOMBRE { get; set; }
        public string ETAPA { get; set; }
        public int ID_PROCESO { get; set; }
        public DateTime FECHA_ETAPA { get; set; }
        public string FLAG_ESTADO { get; set; }
    }
}
