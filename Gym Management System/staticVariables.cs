using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gym_Management_System
{
    class staticVariables
    {
        public static string username;
        public static string password;
        public static List<attendenceInfo> attendence_info = new List<attendenceInfo>();
        public static List<attendenceInfoTrainer> attendence_infoTrainer = new List<attendenceInfoTrainer>();
        public static List<int> member_ids = new List<int>();
        public static string ipAddress = "192.168.10.201";
        public static string port = "4370";
    }
}
