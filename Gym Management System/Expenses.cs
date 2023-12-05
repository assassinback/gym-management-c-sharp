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
    public partial class Expenses : Form
    {
        public Expenses()
        {
            InitializeComponent();
            sqlconnect x = new sqlconnect();
            DataTable dt = x.expenseInfo();
            dataGridView1.DataSource = dt;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            sqlconnect x = new sqlconnect();
            x.addExpense(textBox1.Text, textBox2.Text, dateTimePicker1.Value.ToString("dd-MM-yyyy"));
            DataTable dt = x.expenseInfo();
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
