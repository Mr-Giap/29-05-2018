using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WU_ValueObjects;
using WU_Controller.Services;
using System.Web.Security;

namespace WebUnivercity.Areas.AdminCP.Controllers
{
    public class AdLoginController : Controller
    {
        // GET: AdminCP/AdLogin
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(vAccount acc)
        {
            UserControllers uscl = new UserControllers();
            vAccount kq = uscl.checkLogin(acc);
            if (kq.UserId == Guid.Empty)
            {
                ModelState.AddModelError("", "Tên đăng nhập hoặc mật khẩu không đúng");
                return View();
            }
            else
            {
                Session.Add(CommonStant.SESSION_USER, kq);
                FormsAuthentication.SetAuthCookie(kq.UserName, kq.RememberMe);
                return RedirectToAction("Home", "Admin");
            }
        }
        public ActionResult Logout()
        {
            Session[CommonStant.SESSION_USER] = null;
            return RedirectToAction("Login", "AdLogin");
        }
    }
}