﻿using ConsoleApp2.Shared.Domain.Models;
using FluentNHibernate.Mapping;

namespace ConsoleApp2.User.Infrastructure.Models
{
    public class JobTypeMap: ClassMap<JobType>
    {
        public JobTypeMap()
        {
            Id(x => x.Id);
            Map(x => x.Name);
        }
    }

}