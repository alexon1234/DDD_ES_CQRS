﻿using ConsoleApp2.Shared.Domain.Queries;
using MediatR;
using System.Threading.Tasks;

namespace ConsoleApp2.Shared.Infrastructure.Queries
{
    public class QueryBus : IQueryBus
    {
        private readonly IMediator _mediator;

        public QueryBus(IMediator mediator)
        {
            _mediator = mediator;
        }

        public Task<TResponse> Send<TQuery, TResponse>(TQuery query) where TQuery : IQuery<TResponse>
        {
            return _mediator.Send(query);
        }
    }
}
