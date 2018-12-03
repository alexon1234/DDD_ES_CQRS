using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp2.User.Domain
{
    public class UserNotFound: Exception
    {
        public UserNotFound(string id) : base($"User {id} not found", new ArgumentException()) { }
    }
}
