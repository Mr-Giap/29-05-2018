using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WU_ValueObjects
{
    public class vAccount
    {
        public Guid UserId { get; set; }
        [Required]
        [Display(Name = "Tên đăng nhập")]
        public string UserName { get; set; }
        [Required]
        [Display(Name = "Mật khẩu")]
        public string PassWord { get; set; }
        public string Email { get; set; }
        public string Mobile { get; set; }
        public string Description { get; set; }
        public bool RememberMe { get; set; }
    }
}
