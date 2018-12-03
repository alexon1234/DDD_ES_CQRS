using ConsoleApp2.User.Domain;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace ConsoleApp2.Notify.Domain
{
    public class NotifyUserCreatedHandler : INotificationHandler<UserCreatedEvent>
    {

        public Task Handle(UserCreatedEvent notification, CancellationToken cancellationToken)
        {
            Console.WriteLine($"User is created { notification.Id} - { notification.Name }");
            return Task.CompletedTask;
        }
    }
}
