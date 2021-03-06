﻿using ConsoleApp2.Shared.Domain.Aggregates;
using ConsoleApp2.User.Domain.Events;

namespace ConsoleApp2.User.Domain
{
    public class User: AggregateRoot
    {
        public virtual string Id { get; protected set; }
        public virtual string Name { get;  protected set; }

        protected User() { }

        protected User(string id, string name)
        {
            Id = id;
            Name = name;
        }

        public User(UserId id, string name)
        {
            Id = id.Value;
            Name = name;
        }

        public static User Create(UserId id, string name)
        {
            var user = new User(id.Value, name);

            user.Record(notification: new UserCreatedEvent { Id = id.Value, Name = name });

            return user;
        }

        public virtual void UpdateName(string name)
        {
            Record(new UserNameUpdated(Id, Name, name));
            Name = name;
        }


    }
}
