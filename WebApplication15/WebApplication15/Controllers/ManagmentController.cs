using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication15.Models;


namespace WebApplication15.Controllers
{
    public class ManagmentController : Controller
    {
        Jenerator_infoEntities db = new Jenerator_infoEntities();
        // GET: Managment
        public ActionResult Index()
        {
            return View("Loginmanager");
        }
        public ActionResult Loginmanager()
        {
            return View("Loginmanager");
        }
        [HttpPost]
        public ActionResult VerifyManager(Manager Manager)
        {
            //bool isExist_Username = db.Managers.Any(p => p.username == Manager.username && p.password == Manager.password);
            var manager = db.Managers.Find(Manager.username);


            if (manager != null)
                return RedirectToAction("adduser", "managment", new { UserName_manager = manager.username });
            else
            {
                ModelState.AddModelError("username", "کاربری یافت نشد");


            }
            return View("Loginmanager");

        }

        [HttpGet]

        public ActionResult AddUser(string UserName_manager)

        {
            var Manager = db.Managers.Find(UserName_manager);
            if (Manager == null)
            {
                return HttpNotFound();
            }
            return View(Manager);


        }

        public ActionResult RemoveUser(string UserName_manager)
        {
            var Manager = db.Managers.Find(UserName_manager);
            if (Manager == null)
            {
                return HttpNotFound();
            }
            return View(Manager);
        }
        [HttpPost]
        public ActionResult AddUser([Bind(Include = "UserName,Password,Type")] Employee user)
        {
            bool isExis_Username = db.Employees.Any(p => p.UserName == user.UserName);
            if (!isExis_Username)
                db.Employees.Add(user);
            else
                return View("fail");
            try
            {

                db.SaveChanges();


            }
            catch
            {
            }

            return View("successfull");
        }
        [HttpPost]
        public ActionResult RemoveUser(string UserName_manager, Employee employee)
        {
            var Manager = db.Managers.Find(UserName_manager);
            var is_Exist_Employee = db.Employees.Find(employee.UserName);
            if (is_Exist_Employee != null)
            {
                db.Employees.Remove(is_Exist_Employee);
                ModelState.AddModelError("username", "با موفقیت حذف شد");
            }
            else
                ModelState.AddModelError("username", "نام کاربری وجود ندارد");
            try
            {

                db.SaveChanges();


            }
            catch
            {
            }

            return View(Manager);
        }

        public ActionResult ChangeInfo(string UserName_manager)
        {
            var Manager = db.Managers.Find(UserName_manager);
            if (Manager == null)
            {
                return HttpNotFound();
            }
            return View(Manager);
        }
        [HttpPost]
        public ActionResult ChangeInfo(Manager manager)
        {

            if (ModelState.IsValid)
            {
                db.Entry(manager).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("adduser", "managment", new { UserName_manager = manager.username });

            }
            return View("adduser", "managment", manager);
        }





    }
}