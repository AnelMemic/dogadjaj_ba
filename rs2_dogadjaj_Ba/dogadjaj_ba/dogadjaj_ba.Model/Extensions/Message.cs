using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Model.Extensions
{
    public class Message
    {
        public virtual string Info { get; set; }
        public virtual object Data { get; set; }
        public virtual bool IsValid { get; set; }

        public Message()
        {
        }

        public Message(bool isValid, string info, object data = null)
        {
            IsValid = isValid;
            Info = info;
            Data = data;
        }
    }
}
