using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp2.Shared.Domain.Bus.Event
{
    public abstract class DomainEvent
    {
        private string _eventId;
        private int _aggregateId;

        public DomainEvent(string eventId)
        {
            _eventId = eventId;
        }

    }
}
