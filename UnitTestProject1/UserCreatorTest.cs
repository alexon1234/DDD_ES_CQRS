using System;
using System.Threading;
using System.Threading.Tasks;
using ConsoleApp2.User.Application;
using ConsoleApp2.User.Domain;
using MediatR;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;

namespace UnitTestProject1
{
    [TestClass]
    public class UserCreatorTest
    {
        private readonly Mock<IMediator> _mediator;
        private readonly Mock<IUserRepository> _userRepository;
        private readonly UserCreator _userCreator;

        public UserCreatorTest()
        {
            _mediator = new Mock<IMediator>();
            _userRepository = new Mock<IUserRepository>();

            _userRepository.Setup(u => u.CreateUser(It.IsAny<User>()))
                           .Returns(Task.CompletedTask);

            _userCreator = new UserCreator(_mediator.Object, _userRepository.Object);
        }


        [TestMethod]
        public async Task Event_user_created_been_published_after_user_created()
        {
            UserId userId = new UserId("alejandro.gonzalez@sustainalytics.com");
            const string userName = "Alejandro Del Amo";

            await _userCreator.CreateUser(userId, userName).ConfigureAwait(false);

            _mediator.Verify(m =>
                        m.Publish(It.IsAny<INotification>(), It.IsAny<CancellationToken>())
                        , Times.Once);
        }
    }
}
