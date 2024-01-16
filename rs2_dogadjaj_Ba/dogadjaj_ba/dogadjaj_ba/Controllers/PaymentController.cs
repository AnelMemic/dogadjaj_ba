using dogadjaj_ba.Model;
using dogadjaj_ba.Model.Requests;
using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services;
using Microsoft.AspNetCore.Mvc;

namespace dogadjaj_ba.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class PaymentController : BaseCRUDController<Model.Payment, PaymentSearchObject, PaymentInsertRequest, Model.Requests.PaymentUpdateRequest>
    {
        public PaymentController(ILogger<BaseController<Payment, PaymentSearchObject>> logger, IPaymentService service) : base(logger, service)
        {
        }
    }
}
