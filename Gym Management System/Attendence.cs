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
    public partial class Attendence : Form
    {
        public Attendence()
        {
            InitializeComponent();
            foreach (attendenceInfo info in staticVariables.attendence_info)
            {
                checkedListBox1.Items.Add(info);
            }
            checkedListBox1.DisplayMember = "Member_name";
            for (int i = 0; i < checkedListBox1.Items.Count; i++)
            {
                attendenceInfo x = (attendenceInfo)checkedListBox1.Items[i];
                //CheckState st = checkedListBox1.GetItemCheckState(checkedListBox1.Items.IndexOf(i));
                if(x.Status=="present")
                {
                    checkedListBox1.SetItemChecked(i, true);
                }
                

            }
        }

        private void Attendence_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            sqlconnect x = new sqlconnect();
            x.recreateAttendence();
            int j = 0;
            foreach(attendenceInfo att in checkedListBox1.CheckedItems)
            {
                ((attendenceInfo)checkedListBox1.CheckedItems[j]).Status = "present";
                j++;
            }
            for (int i = 0; i < checkedListBox1.Items.Count; i++)
            {
                //CheckState st = checkedListBox1.GetItemCheckState(checkedListBox1.Items.IndexOf(i));
                
                x.insertAttendence((attendenceInfo)checkedListBox1.Items[i]);
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

        private void checkedListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            AdminPanel x = new AdminPanel();
            x.Visible = true;
            this.Visible = false;
        }
    }
}
