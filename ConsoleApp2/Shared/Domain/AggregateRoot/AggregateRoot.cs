using MediatR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp2.Shared.Domain.AggregateRoot
{
    public abstract class AggregateRoot
    {
        private readonly List<INotification> _domainEvents;

        protected AggregateRoot()
        {
            _domainEvents = new List<INotification>();
        }

        public virtual List<INotification> PullDomainEvents()
        {
            var domainEvents = _domainEvents.ToList();
            _domainEvents.Clear();
            return domainEvents;
        }

        public virtual void Record(INotification notification)
        {
            _domainEvents.Add(notification);
        }
    }
}
