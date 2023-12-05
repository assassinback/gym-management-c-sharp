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
    public partial class ViewTrainers : Form
    {
        public ViewTrainers()
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
            sqlconnect x = new sqlconnect();
            DataTable dt = x.allTrainerInfo();
            dataGridView1.DataSource = dt;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            AdminPanel x = new AdminPanel();
            x.Visible = true;
            this.Visible = false;
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 1)
            {

                //delete
                sqlconnect x = new sqlconnect();
                bool t = x.deleteTrainer(dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString());
                if (t)
                {
                    dataGridView1.Rows.RemoveAt(e.RowIndex);
                }
            }
            if (e.ColumnIndex == 0)
            {
                //update
                sqlconnect x = new sqlconnect();
                int z = e.RowIndex;
                bool t = x.updateTrainer(dataGridView1.Rows[z].Cells[2].Value.ToString(), dataGridView1.Rows[z].Cells[3].Value.ToString(), dataGridView1.Rows[z].Cells[4].Value.ToString(), dataGridView1.Rows[z].Cells[5].Value.ToString(), dataGridView1.Rows[z].Cells[6].Value.ToString(), dataGridView1.Rows[z].Cells[7].Value.ToString(), dataGridView1.Rows[z].Cells[8].Value.ToString(), dataGridView1.Rows[z].Cells[9].Value.ToString(), dataGridView1.Rows[z].Cells[10].Value.ToString());
                if (t)
                {
                    MessageBox.Show("Updated");
                }
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            sqlconnect x = new sqlconnect();
            DataTable dt = x.allTrainerInfo();
            dataGridView1.DataSource = dt;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            sqlconnect x = new sqlconnect();
            DataTable dt = x.searchTrainerInfo(textBox1.Text);
            //x.allMemberInfo();
            dataGridView1.DataSource = dt;
        }
    }
}
