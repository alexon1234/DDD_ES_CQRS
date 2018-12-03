using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp2.Shared.ValueObject
{
    public class StringValueObject
    {
        protected string value;

        protected StringValueObject(string value)
        {
            this.value = value;
        }

        public virtual string Value
        {
            get { return value; }
        }
    }
}
