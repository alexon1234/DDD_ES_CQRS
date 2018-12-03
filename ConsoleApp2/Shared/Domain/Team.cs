using System.Collections.Generic;

namespace ConsoleApp2.Shared.Domain.Models
{
    public class Team
    {
        public virtual int Id { get; protected set; }
        public virtual string Name { get; set; }
        public virtual IList<Job> Jobs { get; set; }
    }
}