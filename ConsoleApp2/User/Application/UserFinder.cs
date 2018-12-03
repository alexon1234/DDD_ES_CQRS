using ConsoleApp2.User.Domain;
using System.Threading.Tasks;
using DomainUserFinder =  ConsoleApp2.User.Domain.UserFinder;

namespace ConsoleApp2.User.Application
{
    public class UserFinder
    {
        private readonly DomainUserFinder _domainUserFinder;
        public UserFinder(IUserRepository userRepository)
        {
            _domainUserFinder = new DomainUserFinder(userRepository);
        }

        public async Task<Domain.User> GetUserById(string id)
        {
            return await _domainUserFinder.GetUserById(id);
        }
    }
}
