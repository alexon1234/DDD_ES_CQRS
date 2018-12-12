using MediatR;

namespace ConsoleApp2.Shared.Domain.Command
{
    public interface ICommandHandler<in T> : IRequestHandler<T> where T : ICommand
    {

    }
}

