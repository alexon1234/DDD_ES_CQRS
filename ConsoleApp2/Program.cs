using System;
using System.Configuration;
using ConsoleApp2.Shared.Domain.Events;
using ConsoleApp2.Shared.Infrastructure.Events;
using ConsoleApp2.User.Application;
using ConsoleApp2.User.Domain;
using ConsoleApp2.User.Repository;
using MediatR;
using Microsoft.Extensions.DependencyInjection;

namespace ConsoleApp2
{
    class Program
    {
        static void Main(string[] args)
        {

            IMediator _mediator = new ServiceCollection()
                                    .AddMediatR()
                                    .BuildServiceProvider()
                                    .GetService<IMediator>();

            string connectionString = ConfigurationManager.ConnectionStrings["Default"].ConnectionString;
            IUserRepository userRepository = new UserPostgresRepository(connectionString);
            IEventBus eventBus = new EventBus(_mediator);


            var userId = new UserId("testUser5@gmail.com");
            new UserUpdateName(eventBus, userRepository).UpdateUserNameAsync(userId.Value, "Test New User").Wait();
            Console.ReadKey();

        }
    }
}
