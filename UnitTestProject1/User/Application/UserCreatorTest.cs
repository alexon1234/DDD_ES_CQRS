using System.Threading;
using System.Threading.Tasks;
using ConsoleApp2.Shared.Infrastructure.Events;
using ConsoleApp2.User.Application;
using ConsoleApp2.User.Domain;
using MediatR;
using Moq;
using NUnit.Framework;

namespace UnitTestProject1.User.Application
{
    public class UserCreatorTest
    {
        private readonly Mock<IMediator> _mediator;
        private readonly Mock<IUserRepository> _userRepository;
        private readonly UserCreator _userCreator;

        public UserCreatorTest()
        {
            _userRepository = new Mock<IUserRepository>();
            _mediator = new Mock<IMediator>();
            _userRepository.Setup(u => u.Save(It.IsAny<ConsoleApp2.User.Domain.User>()))
                           .Returns(Task.CompletedTask);

            var eventBus = new EventBus(_mediator.Object);
            _userCreator = new UserCreator(eventBus, _userRepository.Object);
        }


        [Test]
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
