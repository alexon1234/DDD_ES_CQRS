using ConsoleApp2.Shared.Domain.Events;
using ConsoleApp2.User.Domain;
using System.Threading.Tasks;

namespace ConsoleApp2.User.Application
{
    public class UserUpdateName
    {
        private readonly IEventBus _eventBus;
        private readonly IUserRepository _userRepository;
        private readonly Domain.Queries.UserFinder _userFinder;

        public UserUpdateName(IEventBus eventBus, IUserRepository userRepository)
        {
            _eventBus = eventBus;
            _userRepository = userRepository;
            _userFinder = new Domain.Queries.UserFinder(userRepository);
        }

        public async Task UpdateUserNameAsync(string id, string name)
        {
            var user = await _userFinder.GetUserById(id);
            user.UpdateName(name);
            await _userRepository.Save(user);
            await _eventBus.Publish(user.PullDomainEvents());
        }
    }
}
