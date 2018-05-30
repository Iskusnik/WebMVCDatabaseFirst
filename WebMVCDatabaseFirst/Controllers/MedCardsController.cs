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
    public class MedCardsController : Controller
    {
        private ModelMEDContainer db = new ModelMEDContainer();

        // GET: MedCards
        public ActionResult Index()
        {
            return View(db.MedCardSet.ToList());
        }

        // GET: MedCards/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MedCard medCard = db.MedCardSet.Find(id);
            if (medCard == null)
            {
                return HttpNotFound();
            }
            return View(medCard);
        }

        // GET: MedCards/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: MedCards/Create
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id")] MedCard medCard)
        {
            if (ModelState.IsValid)
            {
                db.MedCardSet.Add(medCard);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(medCard);
        }

        // GET: MedCards/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MedCard medCard = db.MedCardSet.Find(id);
            if (medCard == null)
            {
                return HttpNotFound();
            }
            return View(medCard);
        }

        // POST: MedCards/Edit/5
        // Чтобы защититься от атак чрезмерной передачи данных, включите определенные свойства, для которых следует установить привязку. Дополнительные 
        // сведения см. в статье http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id")] MedCard medCard)
        {
            if (ModelState.IsValid)
            {
                db.Entry(medCard).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(medCard);
        }

        // GET: MedCards/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MedCard medCard = db.MedCardSet.Find(id);
            if (medCard == null)
            {
                return HttpNotFound();
            }
            return View(medCard);
        }

        // POST: MedCards/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            MedCard medCard = db.MedCardSet.Find(id);
            db.MedCardSet.Remove(medCard);
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
