using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;


namespace ChatServer
{
    public class ServerManager
    {
        
        
        public EventHandler<string> Onreceived;
        private List<TcpClient> m_listClient = null;
        private TcpClient m_Client = null;
        private TcpListener m_TcpListener = null;
        private Thread m_Thread = null;
        private bool m_BIsThreadStop = false;
        public ServerManager() { }
        public void Initializer()
        {
            if (m_TcpListener == null)
            {
                IPAddress iPAddress;
                if (IPAddress.TryParse(Define.CONNECTION_IP, out iPAddress))
                {
                    m_TcpListener = new TcpListener(iPAddress, Define.CONNECTION_PORT);
                }
                else
                {
                    return;
                }
            }
            if(m_Thread == null)
            {
                m_Thread = new Thread(ThreadFunc)
                {
                    IsBackground = true
                };
            }
        m_TcpListener.Start();
            m_Thread.Start();
        }
        public void Deinitialize()
        {
            if(m_Thread !=null && m_Thread.IsAlive == true)
            {
                m_BIsThreadStop = true;
                m_Thread.Join(500);
                m_Thread = null;
            }
            if(m_TcpListener != null)
            {
                m_TcpListener.Stop();
                m_TcpListener = null;
            }
        }
        public bool Send(string strMessage)
        {

        
       
            if(m_Client != null && m_listClient.Count >0)
            {
                foreach(TcpClient tcpClient in m_listClient)
                {
                byte[] buffer = Encoding.UTF8.GetBytes(strMessage);
                NetworkStream ns = m_Client.GetStream();

                ns.Write(buffer, 0, buffer.Length);

                }
                return true;
            }
            return false;
        }

        

        private void ThreadFunc()
        {
            throw new NotImplementedException();
        }
    }
}
