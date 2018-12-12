using MediatR;

namespace ConsoleApp2.Shared.Domain.Events
{
    public interface IEventHandler<in TEvent>: INotificationHandler<TEvent> where TEvent : IEvent
    {
    }
}