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
        public ActionResult Index(int pageindex = 0)
        {

            UserControllers uscontrol = new UserControllers();
            const int pagesize = 10;
            var count = uscontrol.GetallUser().Count;
            var data = uscontrol.Getbypaging(pageindex * pagesize, pagesize);
            ViewBag.maxpage = (count / pagesize) - (count % pagesize == 0 ? 1 : 0);
            ViewBag.page = pageindex;
            return View(data);
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        // POST: AdminCP/Account/Create
        [HttpPost]
        public ActionResult Create(vAccount user)
        {
            UserControllers usontrol = new UserControllers();
            user.UserId = Guid.NewGuid();
            usontrol.InsertUser(user);
            return RedirectToAction("Index","Account");
        }

        // GET: AdminCP/Account/Edit/5
        public ActionResult Edit(Guid id)
        {
            UserControllers ucontroll = new UserControllers();
            var user = ucontroll.GetallUser().Find(x => x.UserId == id);
            return View(user);
        }

        // POST: AdminCP/Account/Edit/5
        [HttpPost]
        public ActionResult Edit(vAccount acc)
        {
                if (ModelState.IsValid)
                {
                    UserControllers ucontroll = new UserControllers();
                    ucontroll.UpdateUser(acc);
                    return RedirectToAction("Index");
                }
                return View();
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
        [HttpGet]
        public ActionResult InsertMulti()
        {
            return View();
        }
        [HttpPost]
        public ActionResult InsertMulti(List<vAccount> listAcc)
        {
            UserControllers Ucontroll = new UserControllers();
            foreach(var item in listAcc)
            {
                item.UserId = Guid.NewGuid();
                Ucontroll.InsertUser(item);
            }
            return RedirectToAction("Index","Account");
        }
    }
}
