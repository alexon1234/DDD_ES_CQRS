﻿
using ConsoleApp2.Shared.Domain.Queries;

namespace ConsoleApp2.User.Domain.Queries
{
    public class UserByIdQueryAsync: IQuery<UserByIdQueryAsyncResult>
    {
        public long Id { get; set; }
    }
}
