using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WU_ValueObjects;
using WU_Controller.Services;
using System.Web.Security;

namespace WebUnivercity.Controllers
{
    
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        
        public ActionResult Login(vAccount acc)
        {
            UserControllers uscl = new UserControllers();
            vAccount kq = uscl.checkLogin(acc);
            if(kq.UserId == Guid.Empty)
            {
                ModelState.AddModelError("","Tên đăng nhập hoặc mật khẩu không đúng");
                return View();
            }
            else
            {
                Session.Add(CommonStant.SESSION_USER,kq);
                FormsAuthentication.SetAuthCookie(kq.UserName, kq.RememberMe);
                return RedirectToAction("Index", "Home");
            }
        }
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(vAccount acc)
        {
            UserControllers uscontrol = new UserControllers();
            bool rs = false;
            foreach(var item in uscontrol.GetallUser())
            {
                if(item.UserName == acc.UserName)
                {
                    rs = true;
                }
            }
            if(rs == true)
            {
                ModelState.AddModelError("", "Tên đăng nhập hoặc mật khẩu không đúng.");
                return View();
            }
            else
            {
                acc.UserId = Guid.NewGuid();
                bool kq = uscontrol.InsertUser(acc);
                if (kq == true)
                {
                    return RedirectToAction("Login", "Login");
                }
                else
                {
                    ModelState.AddModelError("", "Thêm không thành công. Đã có lỗi xảy ra");
                    return View();
                }
            }
        }
        public ActionResult Logout()
        {
            Session[CommonStant.SESSION_USER] = null;
            return RedirectToAction("Login", "Login");
        }
        public ActionResult ForgetPassword()
        {
            return View();
        }
    }
}