using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace _3_15_2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string s1 = null;
            string s2 = s1 ?? "몰루";
            Console.WriteLine(s2);
        }
    }
}
