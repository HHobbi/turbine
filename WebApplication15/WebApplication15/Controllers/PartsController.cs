using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebApplication15.Models;


namespace WebApplication15.Controllers
{
    public class PartsController : Controller
    {
        private Jenerator_infoEntities db = new Jenerator_infoEntities();

        //GET: Parts
        public ActionResult Index()
        {
            //var parts = db.Parts.Include(p => p.Section);
            return View();
        }

        // GET: Parts/Details/5
        public ActionResult Details(int id)
        {
            Value p = new Value();
            ViewBag.PartID = id;
            //ViewBag.sectionName = db.Sections.Find(id).SectionName;
            //p.ID = db.Values.Max(P => p.ID) + 1;
            return PartialView("Details");
        }

        // GET: Parts/Create
        public ActionResult Create(int? SectionID)
        {
            if (SectionID != null)
            {
                ViewBag.SectionID = new SelectList(db.Sections, "ID", "SectionName");
                ViewBag.id = db.Parts.DefaultIfEmpty().Max(r => r == null ? 0 : r.ID) + 1;
                return PartialView();
            }
            else
            {
                return HttpNotFound();
            }
        }

        // POST: Parts/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID,SectionID,Name")] Part part)
        {
            if (ModelState.IsValid)
            {
                db.Parts.Add(part);
                db.SaveChanges();
                return RedirectToAction("Details", "Sections", new { id = part.SectionID });
            }

            ViewBag.SectionID = new SelectList(db.Sections, "ID", "SectionName", part.SectionID);

            return View(part);
        }

        // GET: Parts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Part part = db.Parts.Find(id);
            if (part == null)
            {
                return HttpNotFound();
            }
            ViewBag.SectionID = new SelectList(db.Sections, "ID", "SectionName", part.SectionID);
            return PartialView(part);
        }

        // POST: Parts/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID,SectionID,Name")] Part part)
        {
            if (ModelState.IsValid)
            {
                db.Entry(part).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Details", "Sections", new { id = part.SectionID });
            }
            ViewBag.SectionID = new SelectList(db.Sections, "ID", "SectionName", part.SectionID);
            return View(part);
        }

        // GET: Parts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Part part = db.Parts.Find(id);
            if (part == null)
            {
                return HttpNotFound();
            }
            return PartialView(part);
        }


        //public ActionResult GetValues([Bind(Include ="PartID,Date")]Value value)
        //{
        //    List<Value> val = db.Values.Where(p => p.ID == value.PartID && p.Date == value.Date).ToList();

        //    return View(val);
        //}
        public ActionResult GetValues(List<Value> value)
        {
            foreach (Value i in value)
            {
                if (i.Value1 != null)
                    db.Values.Add(i);
            }
            try
            {
                db.SaveChanges();
                ViewBag.Message = "با موفقیت ذخیره شد";
            }
            catch { ViewBag.Message = "با موفقیت ذخیره شد"; }
            return View();
        }
        // POST: Parts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Part part = db.Parts.Find(id);
            db.Parts.Remove(part);
            List<Value> DeleteValueList = db.Values.Where(p => p.PartID == id).ToList();
            foreach (var value in DeleteValueList)
            {
                db.Values.Remove(value);
            }

            try
            {
                db.SaveChanges();
            }
            catch { }
            return RedirectToAction("Details", "Sections", new { id = part.SectionID });

        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
        public ActionResult GetAndSaveData(Value value)
        {

            return View();
        }
    }
}
