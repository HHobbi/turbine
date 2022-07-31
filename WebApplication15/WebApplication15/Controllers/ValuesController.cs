using ASPNET_MVC_ChartsDemo.Models;
using Newtonsoft.Json;
using Rotativa;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication15.Models;

namespace WebApplication15.Controllers
{
    public class ValuesController : Controller
    {
        private Jenerator_infoEntities db = new Jenerator_infoEntities();


        // GET: Values

        public ActionResult Ind(Value value)
        {
            List<Value> val = db.Values.Where(p => p.PartID == value.PartID && p.Date == value.Date).ToList();
            if (val.Count == 0)
                for (int i = 1; i < 25; i++)
                {
                    Value V = new Value();
                    V.ID = db.Values.DefaultIfEmpty().Max(r => r == null ? 0 : r.ID) + i;
                    V.PartID = value.PartID;
                    V.Value1 = 0;
                    V.Date = value.Date;
                    V.Clock = i;
                    val.Add(V);
                    db.Values.Add(V);

                }
            try
            {
                db.SaveChanges();
            }
            catch { }
            ViewBag.PartID = value.PartID;
            ViewBag.Date = value.Date;
            
            //return Json(new { val, JsonRequestBehavior.AllowGet });
            return Json(new { newUrl = Url.Action("Index", val[0]) });
        }

        public ActionResult IntervalDate()
        {
            ViewBag.PartID = 1;
            return PartialView("IntervalDate");
        }
        public ActionResult Index(Value value)
        {
            List<Value> val = db.Values.Where(p => p.PartID == value.PartID && p.Date == value.Date).ToList();
            if (val.Count == 0)
                for (int i = 1; i < 25; i++)
                {
                    Value V = new Value();
                    V.ID = db.Values.DefaultIfEmpty().Max(r => r == null ? 0 : r.ID) + i;
                    V.PartID = value.PartID;
                    V.Value1 = 0;
                    V.Date = value.Date;
                    V.Clock = i;
                    val.Add(V);
                    db.Values.Add(V);

                }
            try
            {
                db.SaveChanges();
            }
            catch { }
            ViewBag.PartID = value.PartID;
            ViewBag.Date = value.Date;
            ViewBag.SectionID = db.Parts.Find(value.PartID).SectionID;
            //if(ResultSave != null)
            //    ViewBag.ResultOfSave = ResultSave;
            return View(val);
        }



        // GET: Values/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Value value = db.Values.Find(id);
            if (value == null)
            {
                return HttpNotFound();
            }
            return View(value);
        }

        [HttpPost]
        public ActionResult SaveingDB(IList<Value> values)
        {
            for (int i = 0; i < values.Count; i++) {

                Value val = db.Values.Find(values[i].ID);
                if (val != null)
                {
                    val.PartID = values[i].PartID;
                    val.Value1 = values[i].Value1;
                    val.Date = values[i].Date;
                    val.Clock = values[i].Clock;
                }
                else
                {
                    db.Values.Add(values[i]);
                }
            }
            try
            {
                db.SaveChanges();
                ViewBag.ResultOfSave = true;
            }
            catch { ViewBag.ResultOfSave = false; }
            ViewBag.PartID = values[0].PartID;
            ViewBag.Date = values[0].Date;
            //return View("Index",values);
            return RedirectToAction("Index", values[0]);
        }
        // GET: Values/Create
        public ActionResult Create()
        {
            ViewBag.PartID = new SelectList(db.Parts, "ID", "Name");
            return View();
        }

        // POST: Values/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,PartID,Value1,Date,Clock")] Value value)
        {
            if (ModelState.IsValid)
            {
                db.Values.Add(value);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.PartID = new SelectList(db.Parts, "ID", "Name", value.PartID);
            return View(value);
        }

        // GET: Values/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Value value = db.Values.Find(id);
            if (value == null)
            {
                return HttpNotFound();
            }
            ViewBag.PartID = new SelectList(db.Parts, "ID", "Name", value.PartID);
            return View(value);
        }

        // POST: Values/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,PartID,Value1,Date,Clock")] Value value)
        {
            if (ModelState.IsValid)
            {
                db.Entry(value).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.PartID = new SelectList(db.Parts, "ID", "Name", value.PartID);
            return View(value);
        }

        // GET: Values/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Value value = db.Values.Find(id);
            if (value == null)
            {
                return HttpNotFound();
            }
            return View(value);
        }

        // POST: Values/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Value value = db.Values.Find(id);
            db.Values.Remove(value);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }




      



        /// <summary>
        /// provide List of Values for DataSource in ExportToExcel action
        /// </summary>
        /// <param name="partID"></param>
        /// <param name="Date"></param>
        /// <returns></returns>
        public IList<Value> GetValuesList(int partID, DateTime Date)
        {
            Jenerator_infoEntities db = new Jenerator_infoEntities();
            var ValueList = db.Values.Where(p => p.Date == Date && p.PartID == partID).ToList();

            return ValueList;
        }
        /// <summary>
        /// get List of Values and put it in Excl
        /// </summary>
        /// <param name="partID"></param>
        /// <param name="Date"></param>
        /// <returns></returns>
        public ActionResult ExportToExcel(int partID, DateTime Date)
        {
            var gv = new GridView();
            gv.DataSource = this.GetValuesList(partID, Date);
            gv.DataBind();
            Response.ClearContent();
            Response.Buffer = false;
            Response.AddHeader("content-disposition", "attachment; filename=DemoExcel.xls");
            Response.ContentType = "application/ms-excel";
            Response.Charset = "";
            StringWriter objStringWriter = new StringWriter();
            HtmlTextWriter objHtmlTextWriter = new HtmlTextWriter(objStringWriter);
            gv.RenderControl(objHtmlTextWriter);
            Response.Output.Write(objStringWriter.ToString());
            Response.Flush();
            Response.End();
            return RedirectToAction("Index");
        }

        /// <summary>
        /// make a chart of data in 1 day
        /// </summary>
        /// <param name="partID"></param>
        /// <param name="Date"></param>
        /// <returns></returns>
        public ActionResult ExportToChart(int partID, DateTime Date)
        {
            List<int> clock = new List<int>();
            List<int> value = new List<int>();
            List<Value> list = new List<Value>();

            //list = db.Values.Select(p => p).ToList();
            list = db.Values.Where(p => p.PartID == partID && p.Date == Date).ToList();

            List<DataPoint> dataPoints = new List<DataPoint>();

            foreach (var i in list)
            {
                if (i.Value1 != null)
                    dataPoints.Add(new DataPoint((int)i.Clock, (int)i.Value1));
                //else { dataPoints.Add(new DataPoint((int)i.Clock, 13)); }
            }
            ViewBag.DataPoints = JsonConvert.SerializeObject(dataPoints);
            ViewBag.Date = Date;
            ViewBag.NameOfPart = db.Parts.Find(partID).Name;
            ViewBag.NameOfSection = db.Sections.Find(db.Parts.Find(partID).SectionID).SectionName;

            return View();
        }

        public ActionResult PrintViewToPdf()
        {
            //var report = new ActionAsPdf("Index");
            //return report;

            List<Value> customers = db.Values.ToList();
            var List = new PartialViewAsPdf("~/Views/Shared/IndexForPDF.cshtml", customers);
            return List;


        }
       

        public ActionResult PrintPartialViewToPdf(int partID, DateTime Date)
        {
            List<Value> list = new List<Value>();
            list = db.Values.Where(p => p.PartID == partID && p.Date == Date).ToList();
            ViewBag.SectionName = db.Sections.Find(db.Parts.Find(partID).SectionID).SectionName;
            ViewBag.PartName = db.Parts.Find(partID).Name;
            ViewBag.Date = Date;
            var report = new PartialViewAsPdf("~/Views/Shared/DetailCustomer.cshtml", list);
            return report;
        }
    }
}