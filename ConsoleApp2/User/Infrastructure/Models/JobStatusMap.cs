﻿using ConsoleApp2.Shared.Domain.Models;
using FluentNHibernate.Mapping;

namespace ConsoleApp2.User.Infrastructure.Models
{
    public class JobStatusMap: ClassMap<JobStatus>
    {
        public JobStatusMap()
        {
            Id(x => x.Id);
            Map(x => x.Name);
        }
    }
}