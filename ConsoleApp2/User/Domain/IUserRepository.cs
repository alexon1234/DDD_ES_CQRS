using System.Threading.Tasks;


namespace ConsoleApp2.User.Domain
{
    public interface IUserRepository
    {
        Task CreateUser(User user);

        Task<User> GetUserById(string id);
    }
}