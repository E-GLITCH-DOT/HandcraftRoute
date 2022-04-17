using System;
using System.Collections.Generic;

namespace GarbageR.Models
{
    public partial class Usuario
    {
        public Usuario()
        {
            Reporte = new HashSet<Reporte>();
        }

        public int IdUsuario { get; set; }
        public string Nombre { get; set; }
        public string Apellidos { get; set; }
        public string Correo { get; set; }
        public string Password { get; set; }
        public string Direccion { get; set; }
        public string Telefono { get; set; }
        public string Token { get; set; }
        public int TipoUsuario { get; set; } = 0;
        public string Genero { get; set; }
        public int Edad { get; set; }

        public virtual ICollection<Reporte> Reporte { get; set; }
    }
}
