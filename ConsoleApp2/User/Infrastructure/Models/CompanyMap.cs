

using ConsoleApp2.Shared.Domain.Models;
using FluentNHibernate.Mapping;

namespace ConsoleApp2.User.Infrastructure.Models
{
    public class CompanyMap: ClassMap<Company>
    {
        public CompanyMap()
        {
            Id(x => x.Id);
            Map(x => x.Name);
        }
    }
}
