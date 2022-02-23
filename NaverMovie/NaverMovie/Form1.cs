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

namespace NaverMovie
{
    public partial class Form1 : Form
    {
        Bitmap noimage = new Bitmap("./no_image.png");
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {   
            if(textBox3.Text =="")
            {
                MessageBox.Show("검색어를 입력해주세요!");
            }
            else
            {
            string query = "https://openapi.naver.com/v1/search/movie.xml?query=" + textBox3.Text;
            string your_client_id = textBox1.Text;
            string your_client_secret = textBox2.Text; 


                WebRequest wr = WebRequest.Create(query);
                wr.Method = "GET";
                wr.Headers.Add("X-Naver-Client-Id", your_client_id);
                wr.Headers.Add("X-Naver-Client-Secret", your_client_secret);

                WebResponse wrs = wr.GetResponse();
                Stream s = wrs.GetResponseStream();
                StreamReader sr = new StreamReader(s);

                string reasponse = sr.ReadToEnd();


                //richTextBox1.Text = reasponse;

                XmlDocument xd = new XmlDocument();
                xd.LoadXml(reasponse);

                //rss 채널
                XmlNode xn = xd["rss"]["channel"];

                label10.Text = xn.ChildNodes[0].InnerText;
                label11.Text = xn.ChildNodes[3].InnerText; ;


                //원래 리스트뷰에 있는 것을 삭제한다
                listView1.Items.Clear();

                for(int i=7; i<xn.ChildNodes.Count; i++)
                {
                    ListViewItem lvi = new ListViewItem();
                    lvi.Text = xn.ChildNodes[i]["title"].InnerText.Replace("<b>", "").Replace("</b>", "") + "\n";



                    lvi.SubItems.Add(xn.ChildNodes[i]["link"].InnerText);
                    lvi.SubItems.Add(xn.ChildNodes[i]["image"].InnerText);
                    lvi.SubItems.Add(xn.ChildNodes[i]["subtitle"].InnerText);
                    lvi.SubItems.Add(xn.ChildNodes[i]["pubDate"].InnerText);
                    lvi.SubItems.Add(xn.ChildNodes[i]["director"].InnerText);
                    lvi.SubItems.Add(xn.ChildNodes[i]["actor"].InnerText);
                    lvi.SubItems.Add(xn.ChildNodes[i]["userRating"].InnerText);

                    listView1.Items.Add(lvi);
                    //richTextBox1.Text += xn.ChildNodes[i]["title"].InnerText.Replace("<b>","").Replace("</b>", "") + "\n";
                }
                

            }  
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void richTextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void listView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listView1.SelectedItems.Count == 1)
            {

            textBox4.Text = listView1.SelectedItems[0].SubItems[0].Text;
            textBox5.Text = listView1.SelectedItems[0].SubItems[3].Text;
            textBox6.Text = listView1.SelectedItems[0].SubItems[4].Text;
            textBox7.Text = listView1.SelectedItems[0].SubItems[5].Text;
            textBox8.Text = listView1.SelectedItems[0].SubItems[6].Text;
            textBox9.Text = listView1.SelectedItems[0].SubItems[7].Text;
                
             string imagpe_path = listView1.SelectedItems[0].SubItems[2].Text;
                if(imagpe_path != "")
                {

                pictureBox1.Load(imagpe_path);
                }
                else
                {
                    pictureBox1.Image = noimage;

                }
            }
        }
    }
}
