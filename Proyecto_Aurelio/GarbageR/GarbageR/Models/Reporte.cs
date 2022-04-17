using System;
using System.Collections.Generic;

namespace GarbageR.Models
{
    public partial class Reporte
    {
        public int IdReporte { get; set; }
        public string NombreReporte { get; set; }
        public string Descripcion { get; set; }
        public string EstadoReporte { get; set; } = "Su reporte esta Pendiente";
        public int? IdUsuario { get; set; }
        public string FechaReporte { get; set; }
        public string Direccion { get; set; }

        public virtual Usuario IdUsuarioNavigation { get; set; }
    }
}
