using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp2.Notify.Domain
{
    interface INotifySender
    {
        void Notify(string text);
    }
}
