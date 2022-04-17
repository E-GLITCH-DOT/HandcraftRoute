using GarbageR.Models;
using GarbageR.Models.Request;
using GarbageR.Models.Response;
using GarbageRcomplete3._1.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GarbageRcomplete3._1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {

        [HttpGet]
        public IActionResult Get()
        {
            Respuesta<List<Usuario>> oRespuesta = new Respuesta<List<Usuario>>();

            try
            {
                using (BaseENContext db = new BaseENContext())
                {
                    var lst = db.Usuario.ToList();
                    oRespuesta.Exito = 1;
                    oRespuesta.Data = lst;
                }
            }
            catch (Exception ex)
            {
                oRespuesta.mensaje = ex.Message;

            }
            return Ok(oRespuesta);
        }

        [HttpGet("{Id}")]
        public IActionResult Get(int Id)
        {
            Respuesta<Usuario> oRespuesta = new Respuesta<Usuario>();

            try
            {
                using (BaseENContext db = new BaseENContext())
                {
                    var lst = db.Usuario.Find(Id);
                    oRespuesta.Exito = 1;
                    oRespuesta.Data = lst;
                }
            }
            catch (Exception ex)
            {
                oRespuesta.mensaje = ex.Message;

            }
            return Ok(oRespuesta);
        }
        [HttpPost]
        public IActionResult Add(UsuarioRequest Models)
        {
            Respuesta<object> oRespuesta = new Respuesta<object>();
            try
            {
                using (BaseENContext db = new BaseENContext())
                {
                    Usuario usuario = new Usuario();
                    usuario.Nombre = Models.Nombre;
                    usuario.Apellidos = Models.Apellidos;
                    usuario.Genero = Models.Genero;
                    usuario.Edad = Models.Edad;
                    usuario.Direccion = Models.Direccion;
                    usuario.Telefono = Models.Telefono;
                    usuario.Correo = Models.Correo;
                    usuario.Password = Models.Password;
                    usuario.TipoUsuario = Models.TipoUsuario;
                    usuario.Token = Models.Token;
                    db.Usuario.Add(usuario);
                    db.SaveChanges();
                    oRespuesta.Exito = 1;


                }
            }

            catch (Exception ex)
            {
                oRespuesta.mensaje = ex.Message;
            }
            return Ok(oRespuesta);
        }

        //METODO PARA EDITAR
        [HttpPut]
        public IActionResult Editar(UsuarioRequest Models)
        {
            Respuesta<object> oRespuesta = new Respuesta<object>();
            try
            {
                using (BaseENContext db = new BaseENContext())
                {

                    //ID para modificar los datos
                    Usuario usuario = db.Usuario.Find(Models.IdUsuario);
                    usuario.Nombre = Models.Nombre;
                    usuario.Apellidos = Models.Apellidos;
                    usuario.Genero = Models.Genero;
                    usuario.Edad = Models.Edad;
                    usuario.Direccion = Models.Direccion;
                    usuario.Telefono = Models.Telefono;
                    usuario.Correo = Models.Correo;
                    usuario.Password = Models.Password;
                    usuario.Token = Models.Token;
                    //Indica que se modifico
                    db.Entry(usuario).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                    db.SaveChanges();
                    oRespuesta.Exito = 1;
                }
            }
            catch (Exception ex)
            {
                oRespuesta.mensaje = ex.Message;
            }
            return Ok(oRespuesta);
        }

        //METODO PARA ELIMINAR EL ID
        [HttpDelete("{Id}")]
        public IActionResult Eliminar(int Id)
        {
            Respuesta<object> oRespuesta = new Respuesta<object>();
            try
            {
                using (BaseENContext db = new BaseENContext())
                {

                    //para eliminar una pelicula con el ID
                    Usuario Usuario = db.Usuario.Find(Id);

                    //
                    //elimina los datos en el Registro
                    db.Remove(Usuario);
                    db.SaveChanges();
                    oRespuesta.Exito = 1;
                }
            }
            catch (Exception ex)
            {
                oRespuesta.mensaje = ex.Message;
            }
            return Ok(oRespuesta);
        }
        
    }
}

       

