using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WU_ValueObjects;
using WU_Controller.Services;

namespace WebUnivercity.Areas.AdminCP.Controllers
{
    public class AccountController : Controller
    {
        // GET: AdminCP/Account
        public ActionResult Index()
        {
            UserControllers uscontrol = new UserControllers();
            ViewBag.listuser = uscontrol.GetallUser();
            return View();
        }
        // POST: AdminCP/Account/Create
        [HttpPost]
        public ActionResult Create(vAccount user)
        {
            if (!ModelState.IsValid)
            {
                //ModelState.AddModelError("", "Vui lòng nhập đầy đủ thông tin");
                return RedirectToAction("Index", "Account");
            }
            UserControllers usontrol = new UserControllers();
            user.UserId = Guid.NewGuid();
            usontrol.InsertUser(user);
            return RedirectToAction("Index","Account");
        }

        // GET: AdminCP/Account/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: AdminCP/Account/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        // POST: AdminCP/Account/Delete/5
        [HttpPost]
        public ActionResult Delete(Guid id)
        {
            UserControllers usontrol = new UserControllers();
            vAccount acc = usontrol.GetallUser().Find(x => x.UserId == id);
            usontrol.DeleteUser(acc);
            return Json(new { rs = "ok" });
        }
    }
}
