using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace ThreadLogic2
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Thread thread = new Thread(new ThreadStart(ThreadTest));
            thread.Start();

            for(int i=1; i<6; i++)
            {
                Console.WriteLine($"메인스레드{i}");
                Thread.Sleep(500);
            }

            thread.Join();
            Console.WriteLine("스레드 종료");
            Console.ReadLine();

        }

        static void ThreadTest()
        {
            for(int i=1; i<6; i++)
            {
                Console.WriteLine($"AddThread {i}");
                Thread.Sleep(500);
            }
        }
    }
}
