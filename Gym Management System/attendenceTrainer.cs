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
    public partial class attendenceTrainer : Form
    {
        public attendenceTrainer()
        {
            InitializeComponent();
            foreach (attendenceInfoTrainer info in staticVariables.attendence_infoTrainer)
            {
                checkedListBox1.Items.Add(info);
            }
            checkedListBox1.DisplayMember = "Member_name";
            for (int i = 0; i < checkedListBox1.Items.Count; i++)
            {
                attendenceInfoTrainer x = (attendenceInfoTrainer)checkedListBox1.Items[i];
                //CheckState st = checkedListBox1.GetItemCheckState(checkedListBox1.Items.IndexOf(i));
                if (x.Status == "present")
                {
                    checkedListBox1.SetItemChecked(i, true);
                }


            }
        }

        private void checkedListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            AdminPanel x = new AdminPanel();
            x.Visible = true;
            this.Visible = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            sqlconnect x = new sqlconnect();
            x.recreateAttendenceTrainer();
            int j = 0;
            foreach (attendenceInfoTrainer att in checkedListBox1.CheckedItems)
            {
                ((attendenceInfoTrainer)checkedListBox1.CheckedItems[j]).Status = "present";
                j++;
            }
            for (int i = 0; i < checkedListBox1.Items.Count; i++)
            {
                //CheckState st = checkedListBox1.GetItemCheckState(checkedListBox1.Items.IndexOf(i));
                x.insertAttendenceTrainer((attendenceInfoTrainer)checkedListBox1.Items[i]);
                //if (st == CheckState.Checked)
                //{

                //}
                //else if (st == CheckState.Unchecked)
                //{ 

                //}

                //else
                //{ 

                //}  // inderminate

            }
            MessageBox.Show("Attendence Saved");
        }
    }
}
