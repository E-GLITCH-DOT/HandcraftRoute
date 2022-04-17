using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GarbageRcomplete3._1.Models
{
    public class TokenClass
    {
        public string TokenOrMessage { get; set; } = "";
        public int Success { get; set; } = 0;
        public int idUser { get; set; }
        public int TypoUser { get; set; }
    }
}
