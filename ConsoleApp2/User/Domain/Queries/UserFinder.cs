using System.Threading.Tasks;

namespace ConsoleApp2.User.Domain.Queries
{
    public class UserFinder
    {
        private readonly IUserRepository _userRepository;
        public UserFinder(IUserRepository userRepository)
        {
            _userRepository = userRepository;
        }

        public async Task<User> GetUserById(string id)
        {
            var user = await _userRepository.Find(id).ConfigureAwait(false);
            if(user == null)
            {
                throw new UserNotFound(id);
            }
            return user;
        }
    }
}
