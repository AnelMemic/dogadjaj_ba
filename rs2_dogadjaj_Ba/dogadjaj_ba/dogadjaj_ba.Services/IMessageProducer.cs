using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Services
{
    public interface IMessageProducer
    {
        public void SenndingMessage<T>(T message);

    }
}
