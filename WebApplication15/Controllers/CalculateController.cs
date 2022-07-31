using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.DataVisualization.Charting;
using WebApplication15.Models;

namespace WebApplication15.Controllers
{
    public class CalculateController : Controller

    {
        private Jenerator_infoEntities db = new Jenerator_infoEntities();

        // GET: Calculate
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult IntervalChart(string Date1,string Date2,int PartID)
        {
           
            return View("Values", "ExportToChart");
        }
    }
}