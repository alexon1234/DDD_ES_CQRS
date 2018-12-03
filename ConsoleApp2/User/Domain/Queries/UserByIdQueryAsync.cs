using MediatR;

namespace ConsoleApp2.User.Domain.Queries
{
    public class UserByIdQueryAsync: IRequest<UserByIdQueryAsyncResult>
    {
        public long Id { get; set; }
    }
}
