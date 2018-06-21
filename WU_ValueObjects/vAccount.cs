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
        [Display(Name = "Tên đăng nhập")]
        [Required(ErrorMessage = "Vui lòng nhập dữ liệu cho trường này.")]
        public string UserName { get; set; }
        [Display(Name = "Mật khẩu")]
        [DataType(DataType.Password)]
        [Required(ErrorMessage = "Vui lòng nhập dữ liệu cho trường này.")]
        public string PassWord { get; set; }
        [DataType(DataType.Password)]
        [Display(Name = "Nhập lại mật khẩu")]
        [Compare("Password", ErrorMessage = "The new password and confirmation password do not match.")]
        public string RetypePassword { get; set; }
        [EmailAddress]
        [Display(Name = "Email")]
        [Required(ErrorMessage = "Vui lòng nhập dữ liệu cho trường này.")]
        public string Email { get; set; }
        [Phone]
        [Display(Name = "Số điện thoại")]
        [Required(ErrorMessage = "Vui lòng nhập dữ liệu cho trường này.")]
        public string Mobile { get; set; }
        public string Description { get; set; }
        public bool RememberMe { get; set; }
    }
}
