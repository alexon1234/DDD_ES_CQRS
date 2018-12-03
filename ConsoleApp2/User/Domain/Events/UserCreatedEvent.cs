using ConsoleApp2.Shared.Domain.Bus.Event;
using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp2.User.Domain
{
    public class UserCreatedEvent: INotification
    {
        public string Id { get; set; }

        public string Name { get; set; }
    }
}
