using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication15.Models;
using System.Web.Security;
using Myproject.Security;
using System.IO;

namespace WebApplication15.Controllers
{
    [Authorize(Roles = "manager")]
    public class ManagmentController : Controller
    {

        Jenerator_infoEntities db = new Jenerator_infoEntities();
        // GET: Managment
        //Call By Controller/Managment/SignOut Action
        //Call From Views/Values/ExportToChart.cshtml(LogOut Button)
        [AllowAnonymous]
        public ActionResult Index()
        {
            return View("Loginmanager");
        }



        //Call From Views/Home/HomePage.cshtml(فهرست کاربران button)
        public ActionResult AllowcationRole()
        {
            return View(db.Employees.ToList());
        }



        //Call Form Views/Home/HomePage.cshtml(Manager Info button)
        [AllowAnonymous]
        public ActionResult MainManagerInfo() 
        {
            List<Manager> managers= db.Managers.ToList();
            return PartialView(managers);
        }



        //Call From Views/Managmant/Index.cshtml
        [HttpPost]
        [AllowAnonymous]
        public ActionResult VerifyManager(Manager Manager, string ReturnUrl = "/", bool RememberMe = false)
        {
            //bool isExist_Username = db.Managers.Any(p => p.username == Manager.username && p.password == Manager.password);
            var manager = db.Managers.Find(Manager.UserName);


            if (manager != null && manager.Password == Manager.Password)
            {
                FormsAuthentication.SetAuthCookie(manager.UserName, RememberMe);
                if (ReturnUrl == "/")
                    return RedirectToAction("HomePage", "Home");
                else
                    return Redirect(ReturnUrl);
            }
            else
            {
                ModelState.AddModelError("username", "کاربری یافت نشد");


            }
            return View("Loginmanager");

        }



        //Call From Views/Home/HomePage.cshtml
        public ActionResult SignOut()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index");
        }



        //call by VerifyManager ActionMethod
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



        //Call by Views/Managment/AllocationRole
        public ActionResult EditEmployee(string UserName)
        {
            var employee = db.Employees.Find(UserName);
            if (employee == null)
            {
                return HttpNotFound();
            }
            return PartialView(employee);
        }




        //Call in Views/Managment/EditeEmployee.csHtml
        [HttpPost]
        public ActionResult EditEmployee([Bind(Include = "UserName,Password")] Employee employee, bool manager = false, bool visitor = false, bool editor = false, bool analyzer = false)
        {
            var emp = db.Employees.Find(employee.UserName);
            db.Employees.Remove(emp);
            db.SaveChanges();
            MadalAddUser(employee,manager,visitor,editor,analyzer);
            return RedirectToAction("AllowcationRole");
        }





        //Call by Views/Managment/AllocationRole(CreteNew button)
        public ActionResult MadalAddUser()
        {

            return PartialView();
        }




        //Call From Views/Managment/MadalAddUser.cshtml
        [HttpPost]
        public ActionResult MadalAddUser([Bind(Include = "UserName,Password")] Employee employee, bool manager = false, bool visitor = false, bool editor = false, bool analyzer = false)
        {
            if (ModelState.IsValid)
            {
                bool isExis_Username_in_Employees = db.Employees.Any(p => p.UserName == employee.UserName);
                bool isExis_Username_in_Managers = db.Managers.Any(M => M.UserName == employee.UserName);

                if (!isExis_Username_in_Employees && !isExis_Username_in_Managers)
                {
                    if (manager)
                        employee.Roles = employee.Roles + "manager" + ',';
                    if (visitor)
                        employee.Roles = employee.Roles + "visitor" + ',';
                    if (editor)
                        employee.Roles = employee.Roles + "editor" + ',';
                    if (analyzer)
                        employee.Roles = employee.Roles + "analyzer" + ',';
                    db.Employees.Add(employee);
                }
                else
                {
                    ViewBag.UserName = employee.UserName;
                    return View("fail");
                }
                try
                {

                    db.SaveChanges();


                }
                catch
                {
                    ViewBag.UserName = employee.UserName;
                    return View("fail");
                }
                //note
                //User.Identity.Name return username of cooki and typeOf User.Identity.Name is string
                ViewBag.UserName_manager = User.Identity.Name;
                return RedirectToAction("allowcationRole");
            }
            return HttpNotFound();
        }


        //call by View/Managment/AddUser
        [HttpPost]
        public ActionResult AddUser([Bind(Include = "UserName,Password,Roles")] Employee employee)
        {
            bool isExis_Username_in_Employees = db.Employees.Any(p => p.UserName == employee.UserName);
            bool isExis_Username_in_Managers = db.Managers.Any(M => M.UserName == employee.UserName);

            if (!isExis_Username_in_Employees && !isExis_Username_in_Managers)
            {
                employee.Roles = employee.Roles + ',';
                db.Employees.Add(employee);
            }
            else
            {
                ViewBag.UserName = employee.UserName;
                return View("fail");
            }
            try
            {

                db.SaveChanges();


            }
            catch
            {
            }
            //note
            //User.Identity.Name return username of cooki and typeOf User.Identity.Name is string
            ViewBag.UserName_manager = User.Identity.Name;
            return View("successfull");
        }



        //Call From Views/Managment/AllowcationRole.cshtml(remove buttom)
        public ActionResult GetModalRemoveEmployee(string UserName) 
        {

            return PartialView(db.Employees.Find(UserName));
        }



        //Call From Views/Managment/GetModalRemoveEmployee.cshtml(PatialView)
        [HttpPost]
        public ActionResult PostModalRemoveEmployee(Employee employee)
        {
            Employee emp = db.Employees.Find(employee.UserName);
            db.Employees.Remove(emp);
            try
            {
                db.SaveChanges();
            }
            catch { }
            return RedirectToAction("AllowcationRole");
        }




        //Call From Views/Home/HomePage.cshtml(Edit Profile Button)
        [HttpGet]
        public ActionResult UpdateProfile()
        {
            var manager = db.Managers.Find(User.Identity.Name);
            if (manager == null)
            {
                return HttpNotFound();
            }
            ViewBag.Model = manager;
            return View();
        }


        //Call From Views/Shared/UpdateProfile.cshtml(Update Button)
        [HttpPost]
        public ActionResult UpdateProfile(Manager manager, HttpPostedFileBase imgUp)
        {
            
            if (imgUp != null)
            {
                if (manager.ImageName != null)
                {
                    System.IO.File.Delete(Server.MapPath("~/UserImages/" + manager.ImageName));
                }
                manager.ImageName = Guid.NewGuid() + Path.GetExtension(imgUp.FileName);
                imgUp.SaveAs(Server.MapPath("~/UserImages/" + manager.ImageName));
            }


            if (ModelState.IsValid)
            {
                manager.UserName = manager.UserName.Trim();
                manager.Password = manager.Password.Trim();
                manager.Roles = manager.Roles.Trim();
                if (manager.Name != null)
                    manager.Name = manager.Name.Trim();
                if (manager.Family != null)
                    manager.Family = manager.Family.Trim();
                if (manager.Phone != null)
                    manager.Phone = manager.Phone.Trim();
                if (manager.Email != null)
                    manager.Email = manager.Email.Trim();

                db.Entry(manager).State = EntityState.Modified;
                try
                {
                    // Your code...
                    // Could also be before try if you know the exception occurs in SaveChanges

                    db.SaveChanges();
                }
                catch
                {

                }
                return RedirectToAction("UpdateProfile", "managment", new { UserName_Manager = manager.UserName });

            }
            return HttpNotFound();
        }






    }
}