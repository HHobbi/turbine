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
    [Authorize]

    public class SectionsController : Controller
    {
        private Jenerator_infoEntities db = new Jenerator_infoEntities();

        // GET: Sections
        //Call From Views/Home/Homepage(فهرست بخش ها)
        public ActionResult Index()
        {
            
            return View(db.Sections.ToList());
        }



        //public ActionResult ind()
        //{
        //    return PartialView();
        //}




        // GET: Sections/Details/5
        //Call from Views/Section/Index.cshtml
        [HttpGet]
        [Route("{id}/{flag}")]
        public ActionResult Details(int id, int flag)
        {

            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Section section = db.Sections.Find(id);
            if (section == null)
            {
                return HttpNotFound();
            }

            List<Part> part = db.Parts.Where(P => P.SectionID == id).Select(p => p).ToList();
            ViewBag.Title = db.Sections.Find(id).SectionName;
            ViewBag.SectionID = id;
            ViewBag.Part = section.SectionName;
            ViewBag.flag = flag;
            return View(part);
        }



        // GET: Sections/Create
        //Call From Views/Section/Index.cshtml(CreateNew buttom)
        [Authorize(Roles = "manager,editor")]
        public ActionResult Create()
        {
            int id = db.Sections.Max(p => p.ID) + 1;
            ViewBag.id = id;
            return PartialView();
        }




        // POST: Sections/Create
        //Call From Views/Sections/Create.cshtml
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "manager,editor")]
        public ActionResult Create([Bind(Include = "ID,SectionName")] Section section)
        {
            if (ModelState.IsValid)
            {
                db.Sections.Add(section);
                try
                {
                    db.SaveChanges();
                }
                catch
                {
                    ViewBag.Message = "....ارور در هنگام ثبت اطلاعات";
                }
                return RedirectToAction("Index");
            }

            return View(section);
        }




        // GET: Sections/Edit/5
        //Call From Views/Sections/Index.cshtml(Edit button)
        [Authorize(Roles = "manager,editor")]
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Section section = db.Sections.Find(id);
            if (section == null)
            {
                return HttpNotFound();
            }
            return PartialView(section);
        }




        // POST: Sections/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "manager,editor")]
        public ActionResult Edit([Bind(Include = "ID,SectionName")] Section section)
        {
            if (ModelState.IsValid)
            {
                db.Entry(section).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(section);
        }




        // GET: Sections/Delete/5
        //Call From Views/Sectioms/Index.cshtml (remove button)
        [Authorize(Roles = "manager,editor")]
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Section section = db.Sections.Find(id);
            if (section == null)
            {
                return HttpNotFound();
            }
            return PartialView(section);
        }



        // POST: Sections/Delete/5
        //Call From Views/Sections/Delete.cshtml
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [Authorize(Roles = "manager,editor")]
        public ActionResult DeleteConfirmed(int id)
        {
            Section section = db.Sections.Find(id);
            db.Sections.Remove(section);

            List<Part> Parts = db.Parts.Where(p => p.SectionID == id).ToList();
            foreach (var part in Parts)
            {
                db.Parts.Remove(part);
            }
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
    }
}
