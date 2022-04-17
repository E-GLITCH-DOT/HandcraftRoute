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
    public class ReporteController : ControllerBase
    {
        [HttpGet]
        public IActionResult Get()
        {
            Respuesta<List<Reporte>> oRespuesta = new Respuesta<List<Reporte>>();

            try
            {
                using (BaseENContext db = new BaseENContext())
                {
                    var lst = db.Reporte.ToList();
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
            Respuesta<Reporte> oRespuesta = new Respuesta<Reporte>();

            try
            {
                using (BaseENContext db = new BaseENContext())
                {
                    var lst = db.Reporte.Find(Id);
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
        [HttpGet(("Verificar"))]
        public IActionResult Getsta(string status)
        {
            Respuesta<List<Reporte>> oRespuesta = new Respuesta<List<Reporte>>();

            try
            {
                using (BaseENContext db = new BaseENContext())
                {
                    Reporte user = new Reporte();
                    user.EstadoReporte = status;
                    var lst = db.Reporte.Where(x => x.EstadoReporte == user.EstadoReporte).ToList();
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
        [HttpGet(("Uuser"))]
        public IActionResult GetiduSER(int id)
        {
            Respuesta<List<Reporte>> oRespuesta = new Respuesta<List<Reporte>>();

            try
            {
                using (BaseENContext db = new BaseENContext())
                {
                    Reporte user = new Reporte();
                    user.IdUsuario = id;
                    var lst = db.Reporte.Where(x => x.IdUsuario == user.IdUsuario).ToList();
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
        public IActionResult Add(ReporteRequest Models)
        {
            Respuesta<object> oRespuesta = new Respuesta<object>();

            try
            {
                using (BaseENContext db = new BaseENContext())
                {
                    Donativo donativo = new Donativo();
                    donativo.Arroz = Models.Arroz;
                    donativo.Frijol = Models.Frijol;
                    donativo.Atun = Models.Atun;
                    donativo.GranosElote = Models.GranosElote;
                    donativo.SopaEnlatada = Models.SopaEnlatada;
                    donativo.Champiniones = Models.Champiniones;
                    donativo.LechePolvo = Models.LechePolvo;
                    donativo.Sardina = Models.Sardina;
                    donativo.Otro = Models.Otro;
                    donativo.IdUser = Models.IdUser;
                    donativo.FechaAcuerdo = Models.FechaAcuerdo;
                    donativo.Status=Models.Status;
                    db.Donativo.Add(donativo);
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
        public IActionResult Editar(ReporteRequest Models)
        {
            Respuesta<object> oRespuesta = new Respuesta<object>();
            try
            {
                using (BaseENContext db = new BaseENContext())
                {

                    //ID para modificar los datos
                    Donativo donativo = db.Donativo.Find(Models.IdDonativo);
                    donativo.Arroz = Models.Arroz;
                    donativo.Frijol = Models.Frijol;
                    donativo.Atun = Models.Atun;
                    donativo.GranosElote = Models.GranosElote;
                    donativo.SopaEnlatada = Models.SopaEnlatada;
                    donativo.Champiniones = Models.Champiniones;
                    donativo.LechePolvo = Models.LechePolvo;
                    donativo.Sardina = Models.Sardina;
                    donativo.Otro = Models.Otro;
                    donativo.IdUser = Models.IdUser;
                    donativo.Status = Models.Status;
                    donativo.FechaAcuerdo = Models.FechaAcuerdo;
                    //Indica que se modifico
                    db.Entry(donativo).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
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
        [HttpDelete("{IdReporte}")]
        public IActionResult Eliminar(int IdDonativo)
        {
            Respuesta<object> oRespuesta = new Respuesta<object>();
            try
            {
                using (BaseENContext db = new BaseENContext())
                {

                    //para eliminar una pelicula con el ID
                    Reporte donativo = db.Reporte.Find(IdDonativo);

                    //
                    //elimina los datos en el Registro
                    db.Remove(donativo);
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

