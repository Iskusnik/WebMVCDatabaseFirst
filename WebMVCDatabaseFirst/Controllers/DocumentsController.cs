using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebMVCDatabaseFirst.Models;

namespace WebMVCDatabaseFirst.Controllers
{
    public class DocumentsController : Controller
    {
        private ModelMEDContainer db = new ModelMEDContainer();

        // GET: Documents
        public ActionResult Index()
        {
            return View(db.DocumentsSet.ToList());
        }

        // GET: Documents/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Documents documents = db.DocumentsSet.Find(id);
            if (documents == null)
            {
                return HttpNotFound();
            }
            return View(documents);
        }

        // GET: Documents/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Documents/Create
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,Number")] Documents documents)
        {
            if (ModelState.IsValid)
            {
                db.DocumentsSet.Add(documents);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(documents);
        }

        // GET: Documents/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Documents documents = db.DocumentsSet.Find(id);
            if (documents == null)
            {
                return HttpNotFound();
            }
            return View(documents);
        }

        // POST: Documents/Edit/5
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,Number")] Documents documents)
        {
            if (ModelState.IsValid)
            {
                db.Entry(documents).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(documents);
        }

        // GET: Documents/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Documents documents = db.DocumentsSet.Find(id);
            if (documents == null)
            {
                return HttpNotFound();
            }
            return View(documents);
        }

        // POST: Documents/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Documents documents = db.DocumentsSet.Find(id);
            db.DocumentsSet.Remove(documents);
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
