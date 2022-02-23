using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace kakao_map_api
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void webBrowser3_DocumentCompleted(object sender, WebBrowserDocumentCompletedEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            List<Locale> locales = KakaoAPI.Search(textBox1.Text);
            listBox1.Items.Clear();
            foreach(Locale item in locales)
            {
                listBox1.Items.Add(item);
            }
        }

        private void textBox1_KeyUp(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
                button1.PerformClick(); //button1 누름
        }

        private void listBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (listBox1.SelectedIndex == -1)
                return;
            Locale ml = listBox1.SelectedItem as Locale;
            object[] position = new object[] { ml.Lat, ml.Lng };
            HtmlDocument hdoc = webBrowser3.Document;
            hdoc.InvokeScript("setCenter", position);

        }
    }
}
