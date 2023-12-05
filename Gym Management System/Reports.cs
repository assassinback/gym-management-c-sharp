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
    public partial class Reports : Form
    {
        string table_type = "user";
        public Reports()
        {
            InitializeComponent();
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
        }

        private void button1_Click(object sender, EventArgs e)
        {
            sqlconnect x = new sqlconnect();
            //MessageBox.Show(table_type);
            DataTable dt = x.getReport(table_type,comboBox1.Text, dateTimePicker1.Value.ToString("yyyy-MM-dd"), dateTimePicker2.Value.ToString("yyyy-MM-dd"));
            dataGridView1.DataSource = dt;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            AdminPanel x = new AdminPanel();
            x.Visible = true;
            this.Visible = false;
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            if(radioButton1.Checked)
            {
                sqlconnect x = new sqlconnect();
                comboBox1.Items.Clear();
                x.trainerInfo(comboBox1);
                table_type = "trainer";
            }
        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            if (radioButton2.Checked)
            {
                sqlconnect x = new sqlconnect();
                comboBox1.Items.Clear();
                x.memberInfo(comboBox1);
                table_type = "member";
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 0)
            {
                //update
                sqlconnect x = new sqlconnect();
                int z = e.RowIndex;
                bool t = false;
                if(radioButton2.Checked)
                {
                    t = x.updateAttendence(dataGridView1.Rows[z].Cells[2].Value.ToString(), dataGridView1.Rows[z].Cells[3].Value.ToString(), dataGridView1.Rows[z].Cells[4].Value.ToString(), dataGridView1.Rows[z].Cells[5].Value.ToString(), dataGridView1.Rows[z].Cells[6].Value.ToString());
                }
                else
                {
                    t = x.updateAttendenceTrainer(dataGridView1.Rows[z].Cells[2].Value.ToString(), dataGridView1.Rows[z].Cells[3].Value.ToString(), dataGridView1.Rows[z].Cells[4].Value.ToString(), dataGridView1.Rows[z].Cells[5].Value.ToString(), dataGridView1.Rows[z].Cells[6].Value.ToString());
                }
                
                if (t)
                {
                    MessageBox.Show("Updated");
                }
            }
            if (e.ColumnIndex == 1)
            {

                //delete
                sqlconnect x = new sqlconnect();
                bool t = false;
                if(radioButton2.Checked)
                {
                    t = x.deleteAttendence(dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString()); 
                }
                else
                {
                    t = x.deleteAttendenceTrainer(dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString());
                }
                if (t)
                {
                    dataGridView1.Rows.RemoveAt(e.RowIndex);
                }
            }
        }
    }
}
