using AutoMapper;
using dogadjaj_ba.Model.Requests;
using dogadjaj_ba.Model.SearchObjects;
using dogadjaj_ba.Services.Database;
using Microsoft.EntityFrameworkCore;


namespace dogadjaj_ba.Services
{
    public class PostService : BaseCRUDService<Model.Post, Database.Post, BaseSearchObject, PostInsertRequest, PostUpdateRequest>, IPostService
    {
        private readonly Ib190074DogadjaBaContext _context;
        public PostService(Ib190074DogadjaBaContext context, IMapper mapper) : base(context, mapper)
        {
            _context = context;
        }
        public override async Task<Model.Post> Update(int id, PostUpdateRequest request)
        {
            var entity = await _context.Posts.FindAsync(id);
            if (entity == null)
            {
                throw new Exception("Post not found");
            }

            
            if (request.eventId == null || request.eventId == 0)
            {
                request.eventId = 1;
            }

            bool eventExists = await _context.Events.AnyAsync(e => e.EventId == request.eventId);
            if (!eventExists)
            {
                throw new Exception($"Event s ID {request.eventId} ne postoji!");
            }

            entity.title = request.title;
            entity.content = request.content;
            entity.PublishDate = request.PublishDate;
            entity.eventId = request.eventId.Value;

            await _context.SaveChangesAsync();
            return _mapper.Map<Model.Post>(entity);
        }

    }
}
