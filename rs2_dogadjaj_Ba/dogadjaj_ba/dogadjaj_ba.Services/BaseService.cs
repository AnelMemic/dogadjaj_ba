using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services.Database;
using Microsoft.EntityFrameworkCore;

namespace dogadjaj_ba.Services
{
    public class BaseService<T, TDb, TSearch> : IService<T, TSearch> where T : class where TDb : class where TSearch : BaseSearchObject
    {
        protected Ib190074DogadjaBaContext _context;

        public IMapper _mapper { get; set; }
        public BaseService(Ib190074DogadjaBaContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public virtual async Task<List<T>> Get(TSearch? search =null)
        {
            var query = _context.Set<TDb>().AsQueryable();

            query = AddFilter(query, search);

            query = AddInclude(query, search);

            if(search?.Page.HasValue == true && search?.PageSize.HasValue == true)
            {
                query = query.Take(search.PageSize.Value).Skip(search.Page.Value * search.PageSize.Value);
            }

            var list=await query.ToListAsync();

            return _mapper.Map<List<T>>(list);
        }


        public virtual IQueryable<TDb> AddInclude(IQueryable<TDb> query, TSearch? search =null)
        {
            return query;
        }


        public virtual IQueryable<TDb> AddFilter(IQueryable<TDb>query, TSearch? search =null)
        {
            return query;
        }

        public async Task<T> GetById(int id)
        {
            var query = await _context.Set<TDb>().FindAsync(id);

            return _mapper.Map<T>(query);
            
        }
    }
}
