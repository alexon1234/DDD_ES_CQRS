using ConsoleApp2.Shared.Domain.Events;
using ConsoleApp2.Shared.Domain.Queries;
using ConsoleApp2.User.Domain.Queries;
using System;
using System.Threading;
using System.Threading.Tasks;

namespace ConsoleApp2.User.Domain.Events
{
    public class UserCreatedEventHandler : IEventHandler<UserCreatedEvent>
    {
        private readonly IQueryBus _queryBus;

        public UserCreatedEventHandler(IQueryBus queryBus)
        {
            _queryBus = queryBus;
        }

        public Task Handle(UserCreatedEvent notification, CancellationToken cancellationToken)
        {
            Console.WriteLine($"UserCreatedEventHandler { notification.Id} - { notification.Name }");
            var userByIdQueryAsyncResult = _queryBus.Send<UserByIdQueryAsync, UserByIdQueryAsyncResult>(new UserByIdQueryAsync()).Result;

            return Task.CompletedTask;
        }
    }
}
