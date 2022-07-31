using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApplication15.Models;
using System.Web.Security;


namespace WebApplication15.Controllers
{

    [Authorize]
    public class HomeController : Controller
    {

        Jenerator_infoEntities db = new Jenerator_infoEntities();

        //If User Not Be Authurized Direct To This Action
        [AllowAnonymous]
        public ActionResult Index()
        {

            return View("login");
        }



        //Call By Controller/Managment/(Action Method)VerifyManager
        //Call From Views/Shared/UpdateProfile(لغو Button)
        public ActionResult HomePage()
        {

            return View();
        }



        //Call From Views/Home/HomePage.cshtml
        public ActionResult SignOut()
        {
            FormsAuthentication.SignOut();
            return View("login");
        }



        //Call From Views/Home/Login.cshtml
        [AllowAnonymous]
        public ActionResult VerifyLP(string Username, string Password, bool RememberMe = false, string ReturnUrl = "/")
        {
            bool isExis_Username = db.Employees.Any(p => p.UserName == Username && p.Password == Password);

            if (isExis_Username && ModelState.IsValid)
            {
                //FormsAuthentication.SetAuthCookie(Username, RememberMe);
                FormsAuthentication.SetAuthCookie(Username, RememberMe);
                if (ReturnUrl != "/")
                    return Redirect(ReturnUrl);
                return RedirectToAction("HomePage", "Home");


            }
            else
            {
                ModelState.AddModelError("UserName", "کاربری یافت نشد");
                return View("login");
            }

        }



    }
}