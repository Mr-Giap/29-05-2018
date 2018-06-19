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
        public ActionResult Register()
        {
            return View();
        }
        public ActionResult ForgetPassword()
        {
            return View();
        }
    }
}