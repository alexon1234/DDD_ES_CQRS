﻿using System.Threading.Tasks;


namespace ConsoleApp2.User.Domain
{
    public interface IUserRepository
    {
        Task Save(User user);

        Task<User> Find(string id);

    }
}