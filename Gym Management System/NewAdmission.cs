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
    public partial class NewAdmission : Form
    {
        DeviceManipulator manipulator = new DeviceManipulator();
        public ZkemClient objZkeeper;
        private bool isDeviceConnected = false;
        List<packageInfo> comboInfo;
        public NewAdmission()
        {
            InitializeComponent();
            radioButton1.Checked = true;
            sqlconnect x = new sqlconnect();
            
            //comboBox1.Items.Add("No Package");
            comboInfo = x.packageInfo();
            comboBox1.DisplayMember = "PackageName";
            foreach (packageInfo info in comboInfo)
            {
                comboBox1.Items.Add(info);
            }
            //comboBox1.ValueMember = "packageName";

            //comboBox1.DataSource = comboInfo.ToArray();
            try
            {
                this.Cursor = Cursors.WaitCursor;
                //ShowStatusBar(string.Empty, true);

                if (IsDeviceConnected)
                {
                    IsDeviceConnected = false;
                    this.Cursor = Cursors.Default;

                    return;
                }

                string ipAddress = staticVariables.ipAddress;
                string port = staticVariables.port;
                if (ipAddress == string.Empty || port == string.Empty)
                    throw new Exception("The Device IP Address and Port is mandotory !!");

                int portNumber = 4370;
                if (!int.TryParse(port, out portNumber))
                    throw new Exception("Not a valid port number");

                bool isValidIpA = UniversalStatic.ValidateIP(ipAddress);
                if (!isValidIpA)
                    throw new Exception("The Device IP is invalid !!");

                isValidIpA = UniversalStatic.PingTheDevice(ipAddress);
                if (!isValidIpA)
                    throw new Exception("The device at " + ipAddress + ":" + port + " did not respond!!");

                objZkeeper = new ZkemClient(RaiseDeviceEvent);
                IsDeviceConnected = objZkeeper.Connect_Net(ipAddress, portNumber);

                if (IsDeviceConnected)
                {
                    string deviceInfo = manipulator.FetchDeviceInfo(objZkeeper, int.Parse("1"));
                    //lblDeviceInfo.Text = deviceInfo;
                }

            }
            catch (Exception ex)
            {
                //ShowStatusBar(ex.Message, false);
            }
            this.Cursor = Cursors.Default;
        }
        private void RaiseDeviceEvent(object sender, string actionType)
        {
            switch (actionType)
            {
                case UniversalStatic.acx_Disconnect:
                    {
                        //ShowStatusBar("The device is switched off", true);
                        //DisplayEmpty();
                        //btnConnect.Text = "Connect";
                        //ToggleControls(false);
                        break;
                    }

                default:
                    break;
            }

        }
        public bool IsDeviceConnected
        {
            get { return isDeviceConnected; }
            set
            {
                isDeviceConnected = value;
                if (isDeviceConnected)
                {
                    //ShowStatusBar("The device is connected !!", true);
                    //btnConnect.Text = "Disconnect";
                    //ToggleControls(true);
                }
                else
                {
                    //ShowStatusBar("The device is diconnected !!", true);
                    objZkeeper.Disconnect();
                    //btnConnect.Text = "Connect";
                    //ToggleControls(false);
                }
            }
        }
        private void NewAdmission_Load(object sender, EventArgs e)
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
            sqlconnect connect = new sqlconnect();
            if (radioButton1.Checked)
            {
                if(comboBox1.SelectedIndex>=0)
                {
                    connect.addMember(textBox1.Text, textBox2.Text, textBox3.Text, textBox4.Text, comboBox1.Text, ((packageInfo)comboBox1.SelectedItem).PackageDuration,textBox5.Text, textBox6.Text, textBox7.Text, radioButton1.Text);
                }
                else 
                {
                    connect.addMember(textBox1.Text, textBox2.Text, textBox3.Text, textBox4.Text, comboBox1.Text, dateTimePicker1.Value.ToString("dd-MM-yyyy"), textBox5.Text, textBox6.Text, textBox7.Text, radioButton1.Text);
                    //connect.addMember(textBox1.Text, textBox2.Text, textBox3.Text, textBox4.Text, textBox5.Text, comboBox1.Text, dateTimePicker1.Value.ToString("dd-MM-yyyy"), textBox6.Text, textBox7.Text, radioButton1.Text);                
                }
                
            }
            else
            {
                if (comboBox1.SelectedIndex >= 0)
                {
                    connect.addMember(textBox1.Text, textBox2.Text, textBox3.Text, textBox4.Text, comboBox1.Text, ((packageInfo)comboBox1.SelectedItem).PackageDuration, textBox5.Text, textBox6.Text, textBox7.Text, radioButton2.Text);
                    //connect.addMember(textBox1.Text, textBox2.Text, textBox3.Text, textBox4.Text, textBox5.Text, comboBox1.Text, ((packageInfo)comboBox1.SelectedItem).PackageDuration, textBox6.Text, textBox7.Text, radioButton2.Text);
                }
                else
                {
                    connect.addMember(textBox1.Text, textBox2.Text, textBox3.Text, textBox4.Text, comboBox1.Text, dateTimePicker1.Value.ToString("dd-MM-yyyy"), textBox5.Text, textBox6.Text, textBox7.Text, radioButton2.Text);
                    //connect.addMember(textBox1.Text, textBox2.Text, textBox3.Text, textBox4.Text, textBox5.Text, comboBox1.Text, dateTimePicker1.Value.ToString("dd-MM-yyyy"), textBox6.Text, textBox7.Text, radioButton2.Text);
                }
                
            }
            List<UserInfo> lstUserInfo = new List<UserInfo>();
            UserInfo x = new UserInfo();
            int enrollmentNumber = connect.getLastIdMember();
            //enrollmentNumber++;
            x.EnrollNumber = enrollmentNumber.ToString();
            x.Name = textBox1.Text;
            x.Password = "123456";
            bool xyz=manipulator.PushUserDataToDevice(objZkeeper,1,x.EnrollNumber,x.Name,x.Password);
            //if(xyz)
            //{
            //    MessageBox.Show("inserted to device");
            //}
            //if (!xyz)
            //{
            //    MessageBox.Show("not inserted to device");
            //}
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(comboBox1.SelectedIndex>=0)
            {
                //textBox5.Text = staticVariables.packagePrice;
                //textBox6.Text = staticVariables.packagePrice;
                int fee = ((packageInfo)comboBox1.SelectedItem).PackageMonthlyFee;
                textBox5.Text = fee+"";
                textBox6.Text = fee+"";
                textBox5.ReadOnly = true;
                textBox6.ReadOnly = true;
                dateTimePicker1.Enabled = false;

            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
