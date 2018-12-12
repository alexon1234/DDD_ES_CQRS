using ConsoleApp2.Shared.Infrastructure.Events;
using ConsoleApp2.User.Application;
using ConsoleApp2.User.Domain;
using MediatR;
using Moq;
using NUnit.Framework;
using System;
using System.Collections.Generic;
using System.Threading;
using System.Threading.Tasks;
using UserClass = ConsoleApp2.User.Domain.User;

namespace UnitTestProject1.User.Application
{
    public class UserUpdateNameTest
    {
        private readonly Mock<IMediator> _mediator;
        private readonly IUserRepository _userRepository;
        private readonly UserUpdateName _userUpdateName;

        private class FakeUserRepository : IUserRepository
        {
            private readonly List<UserClass> _users;
            public FakeUserRepository(List<UserClass> users)
            {
                _users = users;
            }

            public Task<UserClass> Find(string id)
            {
                var users = _users.ConvertAll(x => new UserClass(new UserId(x.Id), x.Name));
                var user = users.Find(u => u.Id == id);
                return Task.FromResult(user);
            }

            public Task Save(UserClass user)
            {
                _users.RemoveAt(0);
                _users.Add(user);
                return Task.CompletedTask;
            }
        }



        public UserUpdateNameTest()
        {
            _mediator = new Mock<IMediator>();

            var users = new List<UserClass>()
            {
                new UserClass(new UserId("alejandro.gonzalez@sustainalytics.com"), "Old Name")
            };

            _userRepository = new FakeUserRepository(users);

            var eventBus = new EventBus(_mediator.Object);
            _userUpdateName = new UserUpdateName(eventBus, _userRepository);
        }


        [Test]
        public async Task Event_user_name_updated_been_published_after_user_name_update()
        {
            var userId = new UserId("alejandro.gonzalez@sustainalytics.com");
            var newUserName = "New Name";
            var expectedUser = new UserClass(userId, newUserName);


            await _userUpdateName.UpdateUserNameAsync(userId.Value, newUserName).ConfigureAwait(false);

            _mediator.Verify(m =>
                        m.Publish(It.IsAny<INotification>(), It.IsAny<CancellationToken>())
                        , Times.Once);

            var persistentUser = await _userRepository.Find(userId.Value);

            Assert.AreEqual(persistentUser.Id, expectedUser.Id);
            Assert.AreEqual(persistentUser.Name, expectedUser.Name);
        }

        [Test]
        public void User_update_name_should_throw_exception_if_user_not_exist()
        {
            var userId = new UserId("test@sustainalytics.com");
            var newUserName = "New Name";

            Assert.That(async () =>
                await _userUpdateName.UpdateUserNameAsync(userId.Value, newUserName),
                Throws.TypeOf<UserNotFound>());

        }
    }
}
