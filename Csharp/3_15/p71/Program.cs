using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace p71
{
    public class Wine
    {
        public decimal Price;
        public int Year;
        public Wine(decimal price, int year) { Price = price; }
        public Wine(decimal price, DateTime year) : this(price, year.Year) { }
    }
    public class Panda {
        string name;
        public Panda(string n)
        {
            name = n;
            Console.WriteLine(n);
        }
    }
    public class Bunny
    {
        public string Name;
        public bool LikesCarrots;
        public bool LikesHumans;

        public Bunny() { }
        public Bunny(string n) { Name = n; }
    }

    public class Stock
    {
        decimal currentPrice;
        public decimal CurrentPrice
        {
            get { return currentPrice; }
            set { currentPrice = value; }
        }
    }

    internal class Program
    {   
       public void foo(int x)// 메서드
        {
            Console.WriteLine(x);
        }
        public void foo(ref int x)
        {
            Console.WriteLine(x);
        }
        static void Main(string[] args)
        {
            Stock msft = new Stock();
            msft.CurrentPrice = 30;
            
            Console.WriteLine(msft.CurrentPrice);//99
        }
    }
}
