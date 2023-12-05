using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Gym_Management_System
{
    class packageInfo
    {
        private string packageName;
        private int packageMonthlyFee;
        private string packageDuration;

        public string PackageName { get => packageName; set => packageName = value; }
        public int PackageMonthlyFee { get => packageMonthlyFee; set => packageMonthlyFee = value; }
        public string PackageDuration { get => packageDuration; set => packageDuration = value; }
    }
}
