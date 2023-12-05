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
    public partial class takeFee : Form
    {
        public takeFee()
        {
            InitializeComponent();
            sqlconnect x = new sqlconnect();
            x.memberInfo(comboBox1);
            DataGridViewButtonColumn btn = new DataGridViewButtonColumn();
            btn.UseColumnTextForButtonValue = true;
            btn.Name = "Update";
            btn.Text = "Update";
            dataGridView1.Columns.Add(btn);
            btn = new DataGridViewButtonColumn();
            btn.UseColumnTextForButtonValue = true;
            btn.Name = "Delete";
            btn.Text = "Delete";
            dataGridView1.Columns.Add(btn);
            //sqlconnect x = new sqlconnect();
            DataTable dt = x.getFeeData();
            dataGridView1.DataSource = dt;
            dataGridView1.Columns[2].ReadOnly = true;
            dataGridView1.Columns[3].ReadOnly = true;
        }

        private void takeFee_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            sqlconnect x = new sqlconnect();
            string id =staticVariables.member_ids.ToArray()[comboBox1.SelectedIndex].ToString();
            x.takeFee(id, textBox1.Text, dateTimePicker1.Value.ToString("yyyy-MM-dd"));
        }

        private void button2_Click(object sender, EventArgs e)
        {
            AdminPanel x = new AdminPanel();
            x.Visible = true;
            this.Visible = false;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 0)
            {
                //update
                sqlconnect x = new sqlconnect();
                int z = e.RowIndex;
                bool t = x.updateFee(dataGridView1.Rows[z].Cells[2].Value.ToString(), dataGridView1.Rows[z].Cells[3].Value.ToString(), dataGridView1.Rows[z].Cells[4].Value.ToString(), dataGridView1.Rows[z].Cells[5].Value.ToString());
                if (t)
                {
                    MessageBox.Show("Updated");
                }
            }
            if (e.ColumnIndex == 1)
            {

                //delete
                sqlconnect x = new sqlconnect();
                bool t = x.deleteFee(dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString());
                if (t)
                {
                    dataGridView1.Rows.RemoveAt(e.RowIndex);
                }
            }
        }
    }
}
