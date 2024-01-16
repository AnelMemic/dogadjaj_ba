using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dogadjaj_ba.Services
{
    public interface  IService<T, TSearch>  where T :class where TSearch : class 
    {
        Task<List<T>> Get(TSearch search = null);
        Task<T> GetById(int id);

    }
}
