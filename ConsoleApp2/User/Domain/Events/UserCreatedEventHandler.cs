using ConsoleApp2.User.Domain.Queries;
using MediatR;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace ConsoleApp2.User.Domain.EventHandler
{
    public class UserCreatedEventHandler : INotificationHandler<UserCreatedEvent>
    {
        private readonly IMediator _mediator;

        public UserCreatedEventHandler(IMediator mediator)
        {
            _mediator = mediator;
        }

        public Task Handle(UserCreatedEvent notification, CancellationToken cancellationToken)
        {
            Console.WriteLine($"UserCreatedEventHandler { notification.Id} - { notification.Name }");
            var userByIdQueryAsyncResult = _mediator.Send(new UserByIdQueryAsync()).Result;



            return Task.CompletedTask;
        }
    }
}
