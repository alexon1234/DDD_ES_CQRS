using System;

namespace ConsoleApp2.User.Domain
{
    public class UserNotFound: Exception
    {
        public UserNotFound(string id) : base($"User {id} not found", new ArgumentException()) { }
    }
}
