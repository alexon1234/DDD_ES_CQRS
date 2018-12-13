using ConsoleApp2.Shared.Domain.Events;
using ConsoleApp2.User.Application;
using ConsoleApp2.User.Domain;
using ConsoleApp2.User.Domain.Events;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace ConsoleApp2.Notify.Domain
{
    public class NotifyUserCreatedHandler : IEventHandler<UserCreatedEvent>, IEventHandler<UserNameUpdated>
    {
        private readonly IEventBus _eventBus;
        private readonly IUserRepository _userRepository;

        public NotifyUserCreatedHandler(IEventBus eventBus, IUserRepository userRepository)
        {
            _eventBus = eventBus;
            _userRepository = userRepository;
        }

        public Task Handle(UserCreatedEvent notification, CancellationToken cancellationToken)
        {
            Console.WriteLine($"User is created { notification.Id} - { notification.Name }");

            return new UserUpdateName(_eventBus, _userRepository).UpdateUserNameAsync(notification.Id, "New Test Name");
        }

        public Task Handle(UserNameUpdated notification, CancellationToken cancellationToken)
        {
            Console.WriteLine($"User {notification.UserId} from {notification.PreviousName} to {notification.NewName}");
            return Task.CompletedTask;
        }
    }
}
