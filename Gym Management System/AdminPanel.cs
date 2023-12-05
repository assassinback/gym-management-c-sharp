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
    public partial class AdminPanel : Form
    {
        public AdminPanel()
        {
            InitializeComponent();
            label1.Text = "Welcome Back " + staticVariables.username;
            sqlconnect x = new sqlconnect();
            label2.Text = "Total Members in Gym Are:"+x.memberCount();
            label4.Text = "Total Earning:" + x.totalEarning() + "";
            label3.Text = "Total Earning This Month:" + x.totalEarningMonthly() + "";
            label5.Text = "Total New Members:" + x.totalNewMembers() + "";
            //sqlconnect x = new sqlconnect();
            x.getAttendenceData();
            x.getAttendenceDataTrainer();
        }
        public AdminPanel(string username,string password)
        {
            InitializeComponent();
            label1.Text = "Welcome Back " + staticVariables.username;
            sqlconnect x = new sqlconnect();
            label2.Text = "Total Members in Gym Are:" + x.memberCount();
            label4.Text = "Total Earning:"+x.totalEarning() + "";
            label3.Text = "Total Earning This Month:" + x.totalEarningMonthly() + "";
            label5.Text = "Total New Members:" + x.totalNewMembers() + "";
            //sqlconnect x = new sqlconnect();
            x.getAttendenceData();
            x.getAttendenceDataTrainer();
        }
        private void AdminPanel_Load(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            Reports x = new Reports();
            x.Visible = true;
            this.Visible = false;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            NewAdmission x = new NewAdmission();
            x.Visible = true;
            this.Visible = false;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            TrainerEntry x = new TrainerEntry();
            x.Visible = true;
            this.Visible = false;
        }

        private void button4_Click(object sender, EventArgs e)
        {
            Expenses x = new Expenses();
            x.Visible = true;
            this.Visible = false;
        }

        private void button5_Click(object sender, EventArgs e)
        {
            
            Form1 x = new Form1();
            x.Visible = true;
            this.Visible = false;
            
        }

        private void button6_Click(object sender, EventArgs e)
        {
            Packages x = new Packages();
            x.Visible = true;
            this.Visible = false;
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void button7_Click(object sender, EventArgs e)
        {
            Attendence x = new Attendence();
            x.Visible = true;
            this.Visible = false;
        }

        private void button8_Click(object sender, EventArgs e)
        {
            viewUserInfo x = new viewUserInfo();
            x.Visible = true;
            this.Visible = false;
        }

        private void button9_Click(object sender, EventArgs e)
        {
            ViewTrainers x = new ViewTrainers();
            x.Visible = true;
            this.Visible = false;
        }

        private void button10_Click(object sender, EventArgs e)
        {
            takeFee x = new takeFee();
            x.Visible = true;
            this.Visible = false;
        }

        private void button11_Click(object sender, EventArgs e)
        {
            attendenceTrainer x = new attendenceTrainer();
            x.Visible = true;
            this.Visible = false;
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button12_Click(object sender, EventArgs e)
        {

        }
    }
}
