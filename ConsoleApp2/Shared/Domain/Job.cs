using System.Collections.Generic;

namespace ConsoleApp2.Shared.Domain.Models
{
    public class Job
    {
        public virtual int Id { get; protected set; }

        public virtual string Name { get; set; }

        public virtual Company Company { get; set; }

        public virtual JobType JobType { get; set; }

        public virtual User.Domain.User User { get; set; }

        public virtual JobStatus JobStatus { get; set; }

        public virtual IList<Team> Teams { get; set; }
    } 
}
