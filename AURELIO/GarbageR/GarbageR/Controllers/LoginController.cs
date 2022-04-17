using GarbageRcomplete3._1.Models;
using GarbageRcomplete3._1.Models.Request;
using GarbageRcomplete3._1.Models.Response;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GarbageRcomplete3._1.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
       [HttpPut]
        public IActionResult Login(Usuario usuario)
        {
            Respuesta<string> oRespuesta = new Respuesta<string>();
            using (FoodCompleteContext db = new FoodCompleteContext())

            {
                try
                {
                    {
                        TokenClass token = new TokenClass();

                        var obj = db.Usuario.FirstOrDefault(x => x.Correo == usuario.Correo);
                        if (obj == null)
                        {
                            
                            token.TokenOrMessage = "Correo electronico incorrecto";
                            oRespuesta.mensaje = token.TokenOrMessage;
                            return Ok(oRespuesta);
                        }

                        bool credentials = obj.Password.Equals(usuario.Password);
                        if (!credentials)
                        {
                            token.TokenOrMessage = "Passoword Incorrecto";
                            oRespuesta.mensaje = token.TokenOrMessage;
                            return Ok(oRespuesta);
                        }
                        
                            
                        
                        obj.Token = TokenManager.GenerateToken(usuario.Correo);
                        token.TokenOrMessage = obj.Token;
                        //Indica que se modifico
                        db.Entry(obj).State = Microsoft.EntityFrameworkCore.EntityState.Modified;
                        
                        db.SaveChanges();
                        oRespuesta.Exito = 1;
                        token.Success = 1;
                        token.idUser = obj.IdUser;
                        token.TypoUser = obj.TypoUsuer;
                        oRespuesta.Data = obj.Token;
                        return Ok(oRespuesta);
                        
                        
                       


                        //
                        //oRespuesta.Data = lst;
                    }
                }
                catch (Exception ex)
                {
                    oRespuesta.mensaje = ex.Message;

                }
                return Ok(oRespuesta);
            }
        }
        [HttpGet("Verificar")]
        //Con este metodo vamos a eliminar cualquiera que querramos
        public IActionResult Verify( string key)
        {
           
            Respuesta<Usuario> oRespuesta = new Respuesta<Usuario>();

            try
            {
                using (FoodCompleteContext db = new FoodCompleteContext())
                {
                    //Usuario usuario = new Usuario();
                    //usuario.Token = key;
                   
                    TokenManager token = new TokenManager();
                    Usuario user = new Usuario();
                    user.Token = key;
                    var obj = db.Usuario.Where(x=>x.Token== user.Token).FirstOrDefault();
                    if (obj != null)
                    {
                        oRespuesta.Exito = 1;
                        oRespuesta.Data = obj;
                    }
                    else
                    {
                        oRespuesta.mensaje = "No se encontro el Usuario";
                    }
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
