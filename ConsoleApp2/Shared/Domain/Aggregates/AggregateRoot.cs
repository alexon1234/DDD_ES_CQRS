using ConsoleApp2.Shared.Domain.Events;
using System.Collections.Generic;

namespace ConsoleApp2.Shared.Domain.Aggregates
{
    public abstract class AggregateRoot
    {
        private readonly Queue<IEvent> _domainEvents;

        protected AggregateRoot()
        {
            _domainEvents = new Queue<IEvent>();
        }

        public virtual IEvent[] PullDomainEvents()
        {
            var domainEvents = _domainEvents.ToArray();
            _domainEvents.Clear();
            return domainEvents;
        }

        protected void Record(IEvent notification)
        {
            _domainEvents.Enqueue(notification);
        }
    }
}
