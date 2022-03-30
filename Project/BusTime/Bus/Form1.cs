using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml;

namespace Bus
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        { 

            string yourkey = textBox1.Text;
            string query = "http://openapi.tago.go.kr/openapi/service/ArvlInfoInqireService/getSttnAcctoArvlPrearngeInfoList?serviceKey=" + yourkey + "&cityCode="+textBox2.Text+"&nodeId=" + textBox3.Text;
            WebRequest wr = WebRequest.Create(query);
            wr.Method = "GET";

            WebResponse wrs = wr.GetResponse();
            Stream s = wrs.GetResponseStream();//reasponse 받은 것을 빼옴
            StreamReader sr = new StreamReader(s);
            string response = sr.ReadToEnd();

            XmlDocument xd = new XmlDocument();
            xd.LoadXml(response);

            XmlNode xn = xd["response"]["body"]["items"];

            listView2.Items.Clear();
            listView1.Items.Clear();
            for(int i =0; i<xn.ChildNodes.Count; i++)
            {
                ListViewItem lvi = new ListViewItem();
                lvi.Text = xn.ChildNodes[i]["routeno"].InnerText;
                lvi.SubItems.Add(xn.ChildNodes[i]["arrprevstationcnt"].InnerText);
                lvi.SubItems.Add(xn.ChildNodes[i]["arrtime"].InnerText);
                lvi.SubItems.Add(xn.ChildNodes[i]["nodeid"].InnerText);
                lvi.SubItems.Add(xn.ChildNodes[i]["nodenm"].InnerText);
                lvi.SubItems.Add(xn.ChildNodes[i]["routeid"].InnerText);
                lvi.SubItems.Add(xn.ChildNodes[i]["routetp"].InnerText);
                lvi.SubItems.Add(xn.ChildNodes[i]["vehicletp"].InnerText);

                int arrtime = int.Parse(xn.ChildNodes[i]["arrtime"].InnerText);
                if(arrtime<180)
                {
                    listView1.Items.Add(lvi);
                }
                else
                {
                    listView2.Items.Add(lvi);
                }

                
                //richTextBox1.Text += xn.ChildNodes[i]["routeno"].InnerText + "\n";

            }

           
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void listView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
