using Microsoft.VisualBasic.FileIO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace csv_datagridview
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnParseDisplay_Click(object sender, EventArgs e)
        {
            OpenFileDialog fd = new OpenFileDialog();
            fd.Filter = "csv (*csv)|*.csv";
            fd.FilterIndex = 0;
            fd.InitialDirectory = null;
            fd.FileName = null;
            DialogResult dr = fd.ShowDialog();
            string strFile = null;
           
            if(dr== DialogResult.OK)
            {
                strFile = fd.FileName;
                label1.Text = "File Name : " + strFile;
            }


            FileStream fs = new FileStream(strFile, FileMode.Open);
            StreamReader sr = new StreamReader(fs, Encoding.UTF8, false);
            string strLineValue = null;
            string[] keys = null;
            string[] values = null;

            TextFieldParser parser = new TextFieldParser(fs);
            parser.TextFieldType = FieldType.Delimited;
            parser.SetDelimiters(",");
            DataTable table = new DataTable();
            while (!parser.EndOfData)
            {
                string[] fields = parser.ReadFields();
                for(int i =0; i<fields.Length; i++)
                {
                    if (i <10)
                        table.Columns.Add(fields[i], typeof(string));
                    
                    
                   
                    
                }
            }
            dataGridView1.DataSource = table;
            /*while((strLineValue = sr.ReadLine()) !=null)
            {
                if (string.IsNullOrEmpty(strLineValue)) 
                    return;

                if (strLineValue.Substring(0, 1).Equals("#"))
                {
                    keys = strLineValue.Split(',');

                    keys[0] = keys[0].Replace("#", "");
                    richTextBox1.Text+= "Key :";
                     
                    for(int i = 0; i<keys.Length; i++)
                    {
                        richTextBox1.Text +=keys[i];
                        if(i !=keys.Length - 1)
                        {
                            
                        }
                        continue;
                            
                    }
                    values = strLineValue.Split(',');

                    richTextBox1.Text += "values: ";
                    for(int i=2; i<values.Length; i++)
                    {
                        richTextBox1.Text += values[i];
                        if (i != values.Length - 1)
                            richTextBox1.Text += ",";
                    }

                }

            }*/





        }

        private void richTextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
