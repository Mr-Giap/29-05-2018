using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebUnivercity.Areas.AdminCP.Controllers
{
    public class AdminController : Controller
    {
        // GET: AdminCP/Admin
        public ActionResult Home()
        {
            return View();
        }
    }
}