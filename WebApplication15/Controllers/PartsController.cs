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



        // GET: Parts/Details/5
        //Call From Views/Section/Details
        public ActionResult Details(int id)
        {
            Value p = new Value();
            ViewBag.PartID = id;
            //ViewBag.sectionName = db.Sections.Find(id).SectionName;
            //p.ID = db.Values.Max(P => p.ID) + 1;
            return PartialView("Details");
        }



        // GET: Parts/Create
        //Call From Views/Section/Details.cshtml (CreateNew buttom)
        [Authorize(Roles = "manager,editor")]
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
        //Call from Views/Part/Create.cshtml
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "manager,editor")]
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
        //Call From Views/Sections/Details(EditName buttom)
        [Authorize(Roles = "manager,editor")]
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
            ViewBag.NameOfSection = db.Sections.Find(db.Parts.Find(id).SectionID).SectionName;
            return PartialView(part);
        }



        // POST: Parts/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //Call From Views/Parts/Edite.cshtml
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "manager,editor")]
        public ActionResult Edit([Bind(Include = "ID,SectionID,Name")] Part part)
        {
            if (ModelState.IsValid)
            {
                db.Entry(part).State = EntityState.Modified;
                try
                {
                    db.SaveChanges();
                }
                catch { }
                return RedirectToAction("Details", "Sections", new { id = part.SectionID });
            }
            ViewBag.SectionID = new SelectList(db.Sections, "ID", "SectionName", part.SectionID);
            return View(part);
        }


        // GET: Parts/Delete/5
        //Call From Views/Sections/Details(Delete buttom)
        [Authorize(Roles = "manager,editor")]
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



        // POST: Parts/Delete/5
        //Call From Views/Parts/Delete.cshtml
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "manager,editor")]
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

       
    }
}
