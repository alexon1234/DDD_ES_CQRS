using System;
using System.Configuration;
using System.Linq;
using System.Reflection;
using ConsoleApp2.User.Application;
using ConsoleApp2.User.Domain;
using ConsoleApp2.User.Domain.EventHandler;
using ConsoleApp2.User.Domain.Queries;
using ConsoleApp2.User.Repository;
using MediatR;
using Microsoft.Extensions.DependencyInjection;
using UserFinder = ConsoleApp2.User.Application.UserFinder;

namespace ConsoleApp2
{
    class Program
    {
        static void Main(string[] args)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Default"].ConnectionString;

            var services = new ServiceCollection();
            services.AddMediatR();
            IMediator _mediator = services.BuildServiceProvider().GetService<IMediator>();

            IUserRepository userRepository = new UserPostgresRepository(connectionString);



            var userId = new UserId("testUser4@gmail.com");
            new UserCreator(_mediator, userRepository).CreateUser(userId, "Test User").Wait();




            Console.ReadKey();

        }
    }
}
