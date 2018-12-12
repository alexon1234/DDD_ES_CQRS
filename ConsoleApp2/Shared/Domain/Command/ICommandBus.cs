using System.Threading.Tasks;

namespace ConsoleApp2.Shared.Domain.Command
{
    public interface ICommandBus
    {
        Task Send<TCommand>(TCommand command) where TCommand : ICommand;
    }
}
