using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Services
{
    public  interface ICRUDServices<T, TSearch, TInsert, TUpdate> : IService<T,TSearch> where T : class where TSearch : class 
    {
        Task<T> Insert(TInsert insert);
        Task<T> Update(int id, TUpdate update);
    }
}
