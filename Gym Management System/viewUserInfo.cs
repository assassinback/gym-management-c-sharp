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
    public partial class viewUserInfo : Form
    {
        DeviceManipulator manipulator = new DeviceManipulator();
        public ZkemClient objZkeeper;
        private bool isDeviceConnected = false;
        public viewUserInfo()
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
            DataTable dt = x.allMemberInfo();
            dataGridView1.DataSource = dt;
            //dataGridView1.Columns[2].ReadOnly = true;
            //dataGridView1.Columns[3].ReadOnly = true;
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
            btnDownloadFingerPrint_Click();
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

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 0)
            {
                //update
                sqlconnect x = new sqlconnect();
                int z = e.RowIndex;
                bool t = x.updateUser(dataGridView1.Rows[z].Cells[2].Value.ToString(), dataGridView1.Rows[z].Cells[3].Value.ToString(), dataGridView1.Rows[z].Cells[4].Value.ToString(), dataGridView1.Rows[z].Cells[5].Value.ToString(), dataGridView1.Rows[z].Cells[6].Value.ToString(), dataGridView1.Rows[z].Cells[7].Value.ToString(), dataGridView1.Rows[z].Cells[8].Value.ToString(), dataGridView1.Rows[z].Cells[9].Value.ToString(), dataGridView1.Rows[z].Cells[10].Value.ToString(), dataGridView1.Rows[z].Cells[11].Value.ToString(), dataGridView1.Rows[z].Cells[12].Value.ToString());
                if (t)
                {
                    MessageBox.Show("Updated");
                }
            }
            if (e.ColumnIndex == 1)
            {

                //delete
                sqlconnect x = new sqlconnect();
                bool t = x.deleteUser(dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString());
                if (t)
                {
                    dataGridView1.Rows.RemoveAt(e.RowIndex);
                }
            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            AdminPanel x = new AdminPanel();
            x.Visible = true;
            this.Visible = false;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            sqlconnect x = new sqlconnect();
            DataTable dt = x.searchMemberInfo(textBox1.Text);
             //x.allMemberInfo();
            dataGridView1.DataSource = dt;
        }

        private void button3_Click(object sender, EventArgs e)
        {
            sqlconnect x = new sqlconnect();
            DataTable dt = x.allMemberInfo();
            dataGridView1.DataSource = dt;
        }

        private void viewUserInfo_Load(object sender, EventArgs e)
        {
            
        }
        private void btnDownloadFingerPrint_Click()
        {
            try
            {
                //ShowStatusBar(string.Empty, true);

                ICollection<UserInfo> lstFingerPrintTemplates = manipulator.GetAllUserInfo(objZkeeper, 1);
                if (lstFingerPrintTemplates != null && lstFingerPrintTemplates.Count > 0)
                {
                    BindToGridView(lstFingerPrintTemplates);
                    //ShowStatusBar(lstFingerPrintTemplates.Count + " records found !!", true);
                }
                //else
                    //DisplayListOutput("No records found");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                //DisplayListOutput(ex.Message);
            }

        }
        private void BindToGridView(object list)
        {
            //ClearGrid();
            dataGridView1.DataSource = list;
            dataGridView1.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.Fill;
            UniversalStatic.ChangeGridProperties(dataGridView1);
        }
    }
}
