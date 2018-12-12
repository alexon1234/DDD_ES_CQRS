using MediatR;

namespace ConsoleApp2.Shared.Domain.Queries
{
    public interface IQuery<out TResponse> : IRequest<TResponse>
    {
    }
}
