using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp2.User.Domain
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
            var user = await _userRepository.GetUserById(id).ConfigureAwait(false);
            if(user == null)
            {
                throw new UserNotFound(id);
            }
            return user;
        }
    }
}
