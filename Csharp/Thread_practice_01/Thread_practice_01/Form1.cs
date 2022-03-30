using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Thread_practice_01
{
    public partial class Form1 : Form
    {
        BackgroundWorker worker;
        private delegate void DELEGATE();
        public Form1()
        {
            InitializeComponent();
            worker = new BackgroundWorker();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            worker.DoWork += worker_DoWork;
            worker.RunWorkerAsync();
        }

        private void worker_DoWork(object sender, DoWorkEventArgs e)
        {
            Delegate del = new DELEGATE(DoWork);
            this.Invoke(del);
            
        }

        private void DoWork()
        {
            Thread.Sleep(1000);
            richTextBox1.Text = "One Two Three viva L'alerie";
        }
    }
}
