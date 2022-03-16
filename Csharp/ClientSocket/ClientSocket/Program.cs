using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;

namespace ClientSocket
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Socket socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            socket.Connect("127.0.0.1", 9999);

            if (socket.Connected)
                Console.WriteLine("서버에 연결 되었습니다.");

            string message = string.Empty;

            while ((message = Console.ReadLine()) != "x")//스트링을 입력 받음
            {
                byte[] buff = Encoding.UTF8.GetBytes(message); //String을 byte로 바꿔 저장
                socket.Send(buff);// 저장한 것을 소켓에 보냄 > 서버로 전송
            }
        }
    }
}
