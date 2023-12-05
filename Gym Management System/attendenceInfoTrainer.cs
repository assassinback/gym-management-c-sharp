using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gym_Management_System
{
    class attendenceInfoTrainer
    {
        private int id;
        private int user_id;
        private string member_name;
        private string status;
        private string attendence_date;

        public int Id { get => id; set => id = value; }
        public int User_id { get => user_id; set => user_id = value; }
        public string Status { get => status; set => status = value; }
        public string Attendence_date { get => attendence_date; set => attendence_date = value; }
        public string Member_name { get => member_name; set => member_name = value; }
    }
}
