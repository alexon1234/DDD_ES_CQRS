using System;
using System.Configuration;
using Autofac;
using ConsoleApp2.Notify.Domain;
using ConsoleApp2.Shared.Domain.Events;
using ConsoleApp2.Shared.Infrastructure.Events;
using ConsoleApp2.User.Application;
using ConsoleApp2.User.Domain;
using ConsoleApp2.User.Domain.Events;
using ConsoleApp2.User.Repository;
using MediatR;

namespace ConsoleApp2
{
    class Program
    {
        static void Main(string[] args)
        {

            var container = Container();
            using(var scope = container.BeginLifetimeScope())
            {
                var userId = new UserId("testUser6@gmail.com");
                scope.Resolve<UserCreator>().CreateUser(userId, "Previous User").Wait();
            }
            
            Console.ReadKey();

        }
        static private IContainer Container()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["Default"].ConnectionString;

            var builder = new ContainerBuilder();
            builder
              .RegisterType<Mediator>()
              .As<IMediator>()
              .InstancePerLifetimeScope();

            // request & notification handlers
            builder.Register<ServiceFactory>(context =>
            {
                var c = context.Resolve<IComponentContext>();
                return t => c.Resolve(t);
            });

            builder.RegisterType<UserUpdateName>();
            builder.RegisterType<UserCreator>();
            builder.RegisterType<NotifyUserCreatedHandler>().AsImplementedInterfaces().InstancePerDependency();  
            builder.Register(c => new EventBus(c.Resolve<IMediator>())).As<IEventBus>().SingleInstance();
            builder.Register(_ => new UserPostgresRepository(connectionString)).As<IUserRepository>().SingleInstance();

            return builder.Build();
        }
    }
}
