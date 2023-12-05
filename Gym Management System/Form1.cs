using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace Gym_Management_System
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            //button1.AutoSize = true;
            //button2.AutoSize = true;
            //this.Bounds = Screen.PrimaryScreen.Bounds;
            //this.WindowState = FormWindowState.Maximized;
            //this.WindowState = FormWindowState.Maximized;
        }

        

        private void button1_Click_1(object sender, EventArgs e)
        {
            sqlconnect x = new sqlconnect();
            bool res = x.adminLogin(textBox1.Text, textBox2.Text);
            if (res)
            {
                staticVariables.username = textBox1.Text;
                staticVariables.password = textBox2.Text;
                MessageBox.Show("Logged in");
                AdminPanel z = new AdminPanel(textBox1.Text, textBox2.Text);
                
                z.Visible = true;
                this.Visible = false;
            }
            else
            {
                MessageBox.Show("Invalid username or password");
            }
        }
    }
}
