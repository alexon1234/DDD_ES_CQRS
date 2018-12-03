using ConsoleApp2.User.Domain;
using MediatR;
using System.Threading.Tasks;
using UserClass = ConsoleApp2.User.Domain.User;

namespace ConsoleApp2.User.Application
{
    public class UserCreator
    {
        private readonly IUserRepository _userRepository;
        private readonly IMediator _mediator;

        public UserCreator(IMediator mediator, IUserRepository userRepository)
        {
            _mediator = mediator;
            _userRepository = userRepository;
        }

        public async Task CreateUser(UserId id, string name)
        {
            var user = UserClass.Create(id, name);
            await _userRepository.CreateUser(user);
            user.PullDomainEvents().ForEach(n => _mediator.Publish(n));
        }
    }
}
