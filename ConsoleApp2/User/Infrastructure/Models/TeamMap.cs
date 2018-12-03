﻿
using ConsoleApp2.Shared.Domain.Models;
using FluentNHibernate.Mapping;

namespace ConsoleApp2.User.Infrastructure.Models
{
    public class TeamMap : ClassMap<Team>
    {
        public TeamMap()
        {
            Id(x => x.Id);
            Map(x => x.Name);
            HasManyToMany(x => x.Jobs)
               .Cascade.All()
               .Inverse()
               .Table("JobTeams");
        }
    }
}
