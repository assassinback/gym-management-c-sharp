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
    public partial class TrainerEntry : Form
    {
        DeviceManipulator manipulator = new DeviceManipulator();
        public ZkemClient objZkeeper;
        private bool isDeviceConnected = false;
        public TrainerEntry()
        {
            InitializeComponent();
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
                connect.addTrainer(textBox1.Text,textBox2.Text,textBox3.Text,textBox4.Text, dateTimePicker1.Value.ToString("dd-MM-yyyy"),textBox5.Text,radioButton1.Text,textBox7.Text);
            }
            else
            {
                connect.addTrainer(textBox1.Text, textBox2.Text, textBox3.Text, textBox4.Text, dateTimePicker1.Value.ToString("dd-MM-yyyy"), textBox5.Text, radioButton2.Text, textBox7.Text);
            }
            List<UserInfo> lstUserInfo = new List<UserInfo>();
            UserInfo x = new UserInfo();
            int enrollmentNumber = connect.getLastIdCoach();
            //enrollmentNumber++;
            x.EnrollNumber = enrollmentNumber.ToString();
            x.Name = textBox1.Text;
            x.Password = "123456";
            bool xyz = manipulator.PushUserDataToDevice(objZkeeper, 1, x.EnrollNumber, x.Name, x.Password);
        }
    }
}
