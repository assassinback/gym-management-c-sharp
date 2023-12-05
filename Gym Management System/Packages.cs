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
    public partial class Packages : Form
    {
        public Packages()
        {
            InitializeComponent();
            sqlconnect x = new sqlconnect();
            DataTable dt = x.bookedroomsInfo();
            dataGridView1.DataSource = dt;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            sqlconnect x = new sqlconnect();
            x.addPackage(textBox1.Text,textBox2.Text,textBox3.Text);
            DataTable dt = x.bookedroomsInfo();
            dataGridView1.DataSource = dt;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            AdminPanel x = new AdminPanel();
            x.Visible = true;
            this.Visible = false;
        }
    }
}
