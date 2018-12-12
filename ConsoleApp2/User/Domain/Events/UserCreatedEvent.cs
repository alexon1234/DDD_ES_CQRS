using ConsoleApp2.Shared.Domain.Events;

namespace ConsoleApp2.User.Domain.Events
{
    public class UserCreatedEvent: IEvent
    {
        public string Id { get; set; }

        public string Name { get; set; }
    }
}
