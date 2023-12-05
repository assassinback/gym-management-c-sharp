using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace Gym_Management_System
{
    class sqlconnect
    {
        //
        public SqlConnection con1()
        {
            SqlConnection con;
            try
            {
                con = new SqlConnection("Data Source=DESKTOP-N2D3UGC;Initial Catalog=gym_management;Integrated Security=True");
                return con;
            }
            catch (System.Exception)
            {

            }
            return null;
        }
        public void addMember(string name, string fathername, string address, string phone, string package, string admission_date, string admission_fee, string monthly_fee, string gender,string cnic)
        {
            try
            {
                SqlConnection con = con1();
                con.Open();
                //MessageBox.Show(admission_fee);
                SqlCommand cmd = new SqlCommand("INSERT INTO member_info(name,father_name,address,phone,package,admission_date,admission_fee,monthly_fee,gender,cnic) VALUES('"+name+"','"+fathername+"','"+address+"','"+phone+"','"+package+"','"+admission_date+"',"+admission_fee+","+monthly_fee+",'"+gender+"','"+cnic+"')", con);
                cmd.ExecuteNonQuery();
                MessageBox.Show("Admission successful");
                //SqlDataReader reader = cmd.ExecuteReader();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            
        }
        public bool adminLogin(string user, string pw)
        {
            try
            {
                SqlConnection con = con1();
                SqlCommand cmd = new SqlCommand("Select * from admin_login", con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    if (reader.HasRows)
                    {
                        //MessageBox.Show("here");
                        if (reader.GetString(1) == user && reader.GetString(2) == pw)
                        {
                            return true;
                        }
                        else
                        {

                        }
                    }
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return false;
        }
        public List<packageInfo> packageInfo()
        {
            List<packageInfo> packages = new List<packageInfo>();
            try
            {
                
                SqlConnection con = con1();
                SqlCommand cmd = new SqlCommand("Select * from gym_packages", con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                
                while (reader.Read())
                {
                    if (reader.HasRows)
                    {
                        packageInfo x = new packageInfo();
                        x.PackageName = reader.GetString(1);
                        x.PackageDuration = reader.GetString(2);
                        x.PackageMonthlyFee = reader.GetInt32(3);
                        packages.Add(x);
                    }
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return packages;
        }
        public DataTable bookedroomsInfo()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlConnection con = con1();
                SqlCommand command = new SqlCommand("Select * from gym_packages", con);
                con.Open();
                using (command)
                {
                    SqlDataReader reader = command.ExecuteReader();
                    dt.Load(reader);
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return dt;
        }
        public void addPackage(string packageName, string packagePrice, string packageDuration)
        {
            try
            {
                SqlConnection con = con1();
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO gym_packages(package_name,package_duration,package_price) VALUES('"+packageName+"','"+packageDuration+"',"+packagePrice+")", con);
                cmd.ExecuteNonQuery();
                //SqlDataReader reader = cmd.ExecuteReader();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }
        public void addTrainer(string name, string fathername, string address, string phone, string join_date, string salary, string gender, string cnic)
        {
            try
            {
                SqlConnection con = con1();
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO trainer_info(name,father_name,address,phone,join_date,salary,gender,cnic) VALUES('"+name+"','"+fathername+"','"+address+"','"+phone+"','"+join_date+"',"+salary+",'"+gender+"','"+cnic+"')", con);
                cmd.ExecuteNonQuery();
                MessageBox.Show("Trainer Data Inserted Successfully");
                //SqlDataReader reader = cmd.ExecuteReader();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }
        public void addExpense(string expenseName, string expensePrice, string expenseDate)
        {
            try
            {
                SqlConnection con = con1();
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO expenses(expense_name,expense_price,expense_date) VALUES('"+expenseName+"',"+expensePrice+",'"+ expenseDate+ "')", con);
                cmd.ExecuteNonQuery();
                //SqlDataReader reader = cmd.ExecuteReader();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }
        public DataTable expenseInfo()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlConnection con = con1();
                SqlCommand command = new SqlCommand("Select * from expenses", con);
                con.Open();
                using (command)
                {
                    SqlDataReader reader = command.ExecuteReader();
                    dt.Load(reader);
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return dt;
        }
        public string memberCount()
        {
            string count = "";
            try
            {

                SqlConnection con = con1();
                SqlCommand cmd = new SqlCommand("Select COUNT(*) from member_info", con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    if (reader.HasRows)
                    {
                        count = reader.GetInt32(0)+"";
                    }
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return count;
        }
        public int totalEarning()
        {
            int earning=0;
            int expenses=0;
            int total=0;
            string query = "SELECT monthly_fee FROM member_info";
            string query1 = "SELECT expense_price FROM expenses";
            try
            {

                SqlConnection con = con1();
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    if (reader.HasRows)
                    {
                        earning += reader.GetInt32(0);
                        //count = reader.GetInt32(0) + "";
                    }
                }
                con.Close();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            try
            {

                SqlConnection con = con1();
                SqlCommand cmd = new SqlCommand(query1, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    if (reader.HasRows)
                    {
                        expenses += reader.GetInt32(0);
                        //count = reader.GetInt32(0) + "";
                    }
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            total = earning - expenses;
            return total;
        }
        public int totalEarningMonthly()
        {
            int earning = 0;
            int expenses = 0;
            int total = 0;
            string query = "SELECT monthly_fee FROM member_info WHERE insert_date >= DATEADD(day,-30,GETDATE()) and insert_date <= getdate()";
            string query1 = "SELECT expense_price FROM expenses WHERE expense_date >= DATEADD(day,-30,GETDATE()) and expense_date <= getdate()";
            try
            {

                SqlConnection con = con1();
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    if (reader.HasRows)
                    {
                        earning += reader.GetInt32(0);
                        //count = reader.GetInt32(0) + "";
                    }
                }
                con.Close();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            try
            {

                SqlConnection con = con1();
                SqlCommand cmd = new SqlCommand(query1, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    if (reader.HasRows)
                    {
                        expenses += reader.GetInt32(0);
                        //count = reader.GetInt32(0) + "";
                    }
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            total = earning - expenses;
            return total;
        }
        public int totalNewMembers()
        {
            //int earning = 0;
            //int expenses = 0;
            //int total = 0;
            string query = "SELECT COUNT(*) FROM member_info WHERE insert_date >= DATEADD(day,-30,GETDATE()) and insert_date <= getdate()";
            //string query1 = "SELECT expense_price FROM expenses WHERE expense_date >= DATEADD(day,-30,GETDATE()) and expense_date <= getdate()";
            try
            {

                SqlConnection con = con1();
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    if (reader.HasRows)
                    {
                        return reader.GetInt32(0);
                        //count = reader.GetInt32(0) + "";
                    }
                }
                con.Close();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            
            //total = earning - expenses;
            return 0;
        }
        public void getAttendenceData()
        {
            
            try
            {
                staticVariables.attendence_info = new List<attendenceInfo>();
                SqlConnection con = con1();
                SqlCommand cmd = new SqlCommand("Select * from attendence where attendence_date=cast(getdate() as Date)", con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    if (reader.HasRows)
                    {
                        attendenceInfo x = new attendenceInfo();
                        x.Id = reader.GetInt32(0);
                        x.User_id = reader.GetInt32(1);
                        x.Member_name= reader.GetString(2);
                        x.Status = reader.GetString(3);
                        x.Attendence_date= reader.GetDateTime(4).Date.ToString();
                        staticVariables.attendence_info.Add(x);
                    }
                }
                con.Close();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            try
            {
                SqlConnection con = con1();
                SqlCommand cmd = new SqlCommand("Select * from member_info", con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    bool testAtt = false;
                    if (reader.HasRows)
                    {
                        foreach (attendenceInfo y in staticVariables.attendence_info)
                        {
                            if (y.User_id == reader.GetInt32(0))
                            {
                                testAtt = true;
                                break;
                            }
                            else
                            {
                                
                            }
                        }
                        if(testAtt==false)
                        {
                            attendenceInfo x = new attendenceInfo();
                            x.Id = 0;
                            x.User_id = reader.GetInt32(0);
                            x.Member_name = reader.GetString(1);
                            x.Status = "absent";
                            x.Attendence_date = DateTime.Now.ToString("yyyy/M/d");
                            staticVariables.attendence_info.Add(x);
                        }
                    }
                }
                con.Close();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }
        public void insertAttendence(attendenceInfo x)
        {
            try
            {

                SqlConnection con = con1();
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO attendence(user_id,member_name,status,attendence_date) VALUES(" + x.User_id + ",'" + x.Member_name + "','" + x.Status + "','"+x.Attendence_date+"')", con);
                cmd.ExecuteNonQuery();
                //SqlDataReader reader = cmd.ExecuteReader();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        public void recreateAttendence()
        {
            try
            {

                SqlConnection con = con1();
                con.Open();
                SqlCommand cmd = new SqlCommand("Delete from attendence where attendence_date=cast(getdate() as Date)", con);
                cmd.ExecuteNonQuery();
                //SqlDataReader reader = cmd.ExecuteReader();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        public DataTable attendenceinfo(string member_name)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlConnection con = con1();
                SqlCommand command = new SqlCommand("Select * from attendence where member_name='"+member_name+"'", con);
                con.Open();
                using (command)
                {
                    SqlDataReader reader = command.ExecuteReader();
                    dt.Load(reader);
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return dt;
        }
        public DataTable allMemberInfo()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlConnection con = con1();
                SqlCommand command = new SqlCommand("Select * from member_info", con);
                con.Open();
                using (command)
                {
                    SqlDataReader reader = command.ExecuteReader();
                    dt.Load(reader);
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return dt;
        }
        public bool deleteUser(string roomid)
        {
            try
            {
                SqlConnection con = con1();
                con.Open();
                SqlCommand command = new SqlCommand("Delete from member_info where id=" + roomid, con);
                command.ExecuteNonQuery();
                return true;
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return false;
        }
        public bool updateUser(string id,string name, string fathername, string address, string phone, string package, string admission_date, string admission_fee, string monthly_fee, string gender, string cnic)
        {
            try
            {
                SqlConnection con = con1();
                con.Open();
                SqlCommand command = new SqlCommand("UPDATE member_info set name='"+name+"', father_name='"+fathername+"',address='"+address+"', phone='"+phone+"', package='"+package+"', admission_date='"+admission_date+ "', admission_fee="+admission_fee+", monthly_fee="+monthly_fee+", gender='"+gender+"', cnic='"+cnic+"' where id="+id, con);
                command.ExecuteNonQuery();
                return true;
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return false;
        }
        public DataTable allTrainerInfo()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlConnection con = con1();
                SqlCommand command = new SqlCommand("Select * from trainer_info", con);
                con.Open();
                using (command)
                {
                    SqlDataReader reader = command.ExecuteReader();
                    dt.Load(reader);
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return dt;
        }
        public bool deleteTrainer(string roomid)
        {
            try
            {
                SqlConnection con = con1();
                con.Open();
                SqlCommand command = new SqlCommand("Delete from trainer_info where id=" + roomid, con);
                command.ExecuteNonQuery();
                return true;
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return false;
        }
        public bool updateTrainer(string id, string name, string fathername, string address, string phone, string join_date, string salary, string gender, string cnic)
        {
            try
            {
                SqlConnection con = con1();
                con.Open();
                SqlCommand command = new SqlCommand("UPDATE trainer_info set name='" + name + "', father_name='" + fathername + "',address='" + address + "', phone='" + phone + "', join_date='" + join_date + "', salary=" + salary + ", gender='" + gender + "', cnic='" +cnic + "' where id=" + id, con);
                command.ExecuteNonQuery();
                return true;
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return false;
        }
        public DataTable searchMemberInfo(string name)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlConnection con = con1();
                SqlCommand command = new SqlCommand("Select * from member_info where name='"+name+"'", con);
                con.Open();
                using (command)
                {
                    SqlDataReader reader = command.ExecuteReader();
                    dt.Load(reader);
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return dt;
        }
        public DataTable searchTrainerInfo(string name)
        {
            DataTable dt = new DataTable();
            try
            {
                SqlConnection con = con1();
                SqlCommand command = new SqlCommand("Select * from trainer_info where name='" + name + "'", con);
                con.Open();
                using (command)
                {
                    SqlDataReader reader = command.ExecuteReader();
                    dt.Load(reader);
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return dt;
        }
        public void trainerInfo(ComboBox trainer)
        {
            try
            {
                SqlConnection con = con1();
                SqlCommand command = new SqlCommand("Select * from trainer_info", con);
                con.Open();
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    trainer.Items.Add(reader.GetString(1));
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        public void memberInfo(ComboBox member)
        {
            try
            {
                staticVariables.member_ids = new List<int>();
                SqlConnection con = con1();
                SqlCommand command = new SqlCommand("Select * from member_info", con);
                con.Open();
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    staticVariables.member_ids.Add(reader.GetInt32(0));
                    member.Items.Add(reader.GetString(1));
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        public DataTable getReport(string user_type,string user_name, string to, string from)
        {
            DataTable dt = new DataTable();
            try
            {

                SqlConnection con = con1();
                SqlCommand command = new SqlCommand("Select attendence1.*,member.* from " + user_type + "_info as member LEFT JOIN attendence as attendence1 on member.id=attendence1.user_id where name='" + user_name + "' and attendence1.attendence_date BETWEEN '" + to + "' and '" + from + "'", con);
                if (user_type=="trainer")
                {
                    command = new SqlCommand("Select attendence1.*,member.* from " + user_type + "_info as member LEFT JOIN attendenceTrainer as attendence1 on member.id=attendence1.user_id where name='" + user_name + "' and attendence1.attendence_date BETWEEN '" + to + "' and '" + from + "'", con);
                }
                else
                {

                }
                //SqlCommand command = new SqlCommand("Select attendence.*,member.* from "+user_type+ "_info as member LEFT JOIN attendence as attendence on member.id=attendence.user_id where name='"+user_name+ "' and attendence_date BETWEEN '"+to+"' and '"+from+"'", con);
                con.Open();
                //MessageBox.Show("Select attendence.*,member.* from " + user_type + "_info as member LEFT JOIN attendence as attendence on member.id=attendence.user_id where name='" + user_name + "' and attendence_date BETWEEN '" + to + "' and '" + from + "'");
                using (command)
                {
                    SqlDataReader reader = command.ExecuteReader();
                    dt.Load(reader);
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return dt;
        }
        public void getAttendenceDataTrainer()
        {

            try
            {
                staticVariables.attendence_infoTrainer = new List<attendenceInfoTrainer>();
                SqlConnection con = con1();
                SqlCommand cmd = new SqlCommand("Select * from attendenceTrainer where attendence_date=cast(getdate() as Date)", con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    if (reader.HasRows)
                    {
                        attendenceInfoTrainer x = new attendenceInfoTrainer();
                        x.Id = reader.GetInt32(0);
                        x.User_id = reader.GetInt32(1);
                        x.Member_name = reader.GetString(2);
                        x.Status = reader.GetString(3);
                        x.Attendence_date = reader.GetDateTime(4).Date.ToString();
                        staticVariables.attendence_infoTrainer.Add(x);
                    }
                }
                con.Close();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            try
            {
                SqlConnection con = con1();
                SqlCommand cmd = new SqlCommand("Select * from trainer_info", con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    bool testAtt = false;
                    if (reader.HasRows)
                    {
                        foreach (attendenceInfoTrainer y in staticVariables.attendence_infoTrainer)
                        {
                            if (y.User_id == reader.GetInt32(0))
                            {
                                testAtt = true;
                                break;
                            }
                            else
                            {

                            }
                        }
                        if (testAtt == false)
                        {
                            attendenceInfoTrainer x = new attendenceInfoTrainer();
                            x.Id = 0;
                            x.User_id = reader.GetInt32(0);
                            x.Member_name = reader.GetString(1);
                            x.Status = "absent";
                            x.Attendence_date = DateTime.Now.ToString("yyyy/M/d");
                            staticVariables.attendence_infoTrainer.Add(x);
                        }
                    }
                }
                con.Close();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }
        public void insertAttendenceTrainer(attendenceInfoTrainer x)
        {
            try
            {

                SqlConnection con = con1();
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO attendenceTrainer(user_id,member_name,status,attendence_date) VALUES(" + x.User_id + ",'" + x.Member_name + "','" + x.Status + "','" + x.Attendence_date + "')", con);
                cmd.ExecuteNonQuery();
                //SqlDataReader reader = cmd.ExecuteReader();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        public void recreateAttendenceTrainer()
        {
            try
            {

                SqlConnection con = con1();
                con.Open();
                SqlCommand cmd = new SqlCommand("Delete from attendenceTrainer where attendence_date=cast(getdate() as Date)", con);
                cmd.ExecuteNonQuery();
                //SqlDataReader reader = cmd.ExecuteReader();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        public bool deleteAttendence(string roomid)
        {
            try
            {
                SqlConnection con = con1();
                con.Open();
                SqlCommand command = new SqlCommand("Delete from attendence where id=" + roomid, con);
                command.ExecuteNonQuery();
                return true;
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return false;
        }
        public bool deleteAttendenceTrainer(string roomid)
        {
            try
            {
                SqlConnection con = con1();
                con.Open();
                SqlCommand command = new SqlCommand("Delete from attendenceTrainer where id=" + roomid, con);
                command.ExecuteNonQuery();
                return true;
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return false;
        }
        public bool updateAttendence(string id, string name, string fathername, string address, string phone)
        {
            try
            {
                SqlConnection con = con1();
                con.Open();
                SqlCommand command = new SqlCommand("UPDATE attendence set user_id=" + name + ", member_name='" + fathername + "',status='" + address + "', attendence_date='" + phone + "' where id=" + id, con);
                command.ExecuteNonQuery();
                return true;
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return false;
        }
        public bool updateAttendenceTrainer(string id, string name, string fathername, string address, string phone)
        {
            try
            {
                SqlConnection con = con1();
                con.Open();
                SqlCommand command = new SqlCommand("UPDATE attendenceTrainer set user_id=" + name + ", member_name='" + fathername + "',status='" + address + "', attendence_date='" + phone + "' where id=" + id, con);
                command.ExecuteNonQuery();
                return true;
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return false;
        }
        public void takeFee(string user_id,string fee_status,string fee_date)
        {
            try
            {

                SqlConnection con = con1();
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO gym_fee(user_id,fee_status,fee_date) VALUES("+user_id+",'"+fee_status+ "','"+fee_date+"')", con);
                cmd.ExecuteNonQuery();
                MessageBox.Show("Fee Saved");
                //SqlDataReader reader = cmd.ExecuteReader();
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
        public DataTable getFeeData()
        {
            DataTable dt = new DataTable();
            try
            {
                SqlConnection con = con1();
                SqlCommand command = new SqlCommand("Select * from gym_fee", con);
                con.Open();
                using (command)
                {
                    SqlDataReader reader = command.ExecuteReader();
                    dt.Load(reader);
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return dt;
        }
        public bool deleteFee(string roomid)
        {
            try
            {
                SqlConnection con = con1();
                con.Open();
                SqlCommand command = new SqlCommand("Delete from gym_fee where id=" + roomid, con);
                command.ExecuteNonQuery();
                return true;
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return false;
        }
        public bool updateFee(string id, string name, string fathername, string address)
        {
            try
            {
                SqlConnection con = con1();
                con.Open();
                SqlCommand command = new SqlCommand("UPDATE gym_fee set user_id=" + name + ", fee_status ='" + fathername + "',fee_date='" + address + "' where id=" + id, con);
                command.ExecuteNonQuery();
                return true;
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return false;
        }
        public int getLastIdMember()
        {
            int count = 0;
            try
            {
                SqlConnection con = con1();
                SqlCommand cmd = new SqlCommand("Select id from member_info", con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    if (reader.HasRows)
                    {
                        //MessageBox.Show("here");
                        count=reader.GetInt32(0);
                    }
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return count;
        }
        public int getLastIdCoach()
        {
            int count = 0;
            try
            {
                SqlConnection con = con1();
                SqlCommand cmd = new SqlCommand("Select id from trainer_info", con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    if (reader.HasRows)
                    {
                        //MessageBox.Show("here");
                        count = reader.GetInt32(0);
                    }
                }
            }
            catch (System.Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            return count;
        }
    }
}
