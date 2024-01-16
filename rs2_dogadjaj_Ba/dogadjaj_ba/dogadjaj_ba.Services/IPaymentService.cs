using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Services
{
    public interface IPaymentService : ICRUDServices<Model.Payment, Model.SearchObjects.PaymentSearchObject, Model.Requests.PaymentInsertRequest, Model.Requests.PaymentUpdateRequest>
    {

    }
}
