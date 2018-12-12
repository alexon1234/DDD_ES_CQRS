using ConsoleApp2.Shared.Domain.Queries;
using System.Threading;
using System.Threading.Tasks;

namespace ConsoleApp2.User.Domain.Queries
{
    public class UserByIdQueryAsyncHandler : IQueryHandler<UserByIdQueryAsync, UserByIdQueryAsyncResult>
    {
        public async Task<UserByIdQueryAsyncResult> Handle(UserByIdQueryAsync request, CancellationToken cancellationToken)
        {
            return await Task.Run(() => new UserByIdQueryAsyncResult { Id = 1223, Name = $"Description {request.Id}" });
        }
    }
}
