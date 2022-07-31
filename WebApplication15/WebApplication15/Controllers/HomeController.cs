using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication15.Models;
using System.Web.Security;


namespace WebApplication15.Controllers
{
    public class HomeController : Controller
    {
        Jenerator_infoEntities db = new Jenerator_infoEntities();

        public ActionResult Index()
        {

            return View("login");
        }


        public ActionResult VerifyLP(string Username, string Password, bool RememberMe)
        {
            bool isExis_Username = db.Employees.Any(p => p.UserName == Username && p.Password == Password);

            if (isExis_Username)
            {
                FormsAuthentication.SetAuthCookie(Username, RememberMe);
                return RedirectToAction("Index", "sections");
            }
            else
            {

                return RedirectToAction("Index");
            }

        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}