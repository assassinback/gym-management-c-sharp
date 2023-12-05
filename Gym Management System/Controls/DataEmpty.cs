using System.Drawing;
using System.Windows.Forms;

namespace Gym_Management_System
{
    public partial class DataEmpty : UserControl
    {
        public DataEmpty()
        {
            InitializeComponent();
            this.Dock = DockStyle.Fill;
        }


        protected override void OnPaint(PaintEventArgs e)
        {
            base.OnPaint(e);
            ControlPaint.DrawBorder(e.Graphics, ClientRectangle,
                                         Color.FromArgb(214, 214, 214), 2, ButtonBorderStyle.Outset,
                                         Color.FromArgb(214, 214, 214), 2, ButtonBorderStyle.Outset,
                                         Color.FromArgb(214, 214, 214), 2, ButtonBorderStyle.Inset,
                                         Color.FromArgb(214, 214, 214), 2, ButtonBorderStyle.Inset);
        }

        private void InitializeComponent()
        {
            this.SuspendLayout();
            // 
            // DataEmpty
            // 
            this.Name = "DataEmpty";
            this.Load += new System.EventHandler(this.DataEmpty_Load);
            this.ResumeLayout(false);

        }

        private void DataEmpty_Load(object sender, System.EventArgs e)
        {

        }
    }
}
