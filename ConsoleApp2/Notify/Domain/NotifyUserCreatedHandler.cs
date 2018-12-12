using ConsoleApp2.Shared.Domain.Events;
using ConsoleApp2.User.Domain.Events;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace ConsoleApp2.Notify.Domain
{
    public class NotifyUserCreatedHandler : IEventHandler<UserCreatedEvent>, IEventHandler<UserNameUpdated>
    {
        public Task Handle(UserCreatedEvent notification, CancellationToken cancellationToken)
        {
            Console.WriteLine($"User is created { notification.Id} - { notification.Name }");
            return Task.CompletedTask;
        }

        public Task Handle(UserNameUpdated notification, CancellationToken cancellationToken)
        {
            Console.WriteLine($"User {notification.UserId} from {notification.PreviousName} to {notification.NewName}");
            return Task.CompletedTask;
        }
    }
}
