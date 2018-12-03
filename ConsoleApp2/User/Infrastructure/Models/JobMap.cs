﻿using ConsoleApp2.Shared.Domain.Models;
using FluentNHibernate.Mapping;

namespace ConsoleApp2.User.Infrastructure.Models
{
    public class JobMap : ClassMap<Job>
    {
        public JobMap()
        {
            Id(x => x.Id);
            Map(x => x.Name);

            References(x => x.Company);
            References(x => x.JobType);
            References(x => x.User);
            References(x => x.JobStatus);

            HasManyToMany(x => x.Teams)
               .Cascade.All()
               .Table("JobTeams");
        }
    }

    
}
