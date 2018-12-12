using ConsoleApp2.Shared.Domain.Events;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp2.User.Domain.Events
{
    public class UserNameUpdated: IEvent
    {
        public string UserId { get; set; }
        public string PreviousName { get; set; }
        public string NewName { get; set; }

        public UserNameUpdated(string userId, string previousName, string newName)
        {
            UserId = userId;
            PreviousName = previousName;
            NewName = newName;
        }
    }
}
