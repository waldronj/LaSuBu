using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using LaSuBuMVC.Models;

namespace LaSuBuMVC.Controllers
{
    public class ShopController : Controller
    {
        private LaSuBuEntities db = new LaSuBuEntities();

        //
        // GET: /Shop/

        public ActionResult Index()
        {
            return View(db.StoreItems.ToList());
        }

        //
        // GET: /Shop/Details/5

        public ActionResult Details(int id = 0)
        {
            StoreItem storeitem = db.StoreItems.Find(id);
            if (storeitem == null)
            {
                return HttpNotFound();
            }
            return View(storeitem);
        }

        //
        // GET: /Shop/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Shop/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(StoreItem storeitem)
        {
            if (ModelState.IsValid)
            {
                db.StoreItems.Add(storeitem);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(storeitem);
        }

        //
        // GET: /Shop/Edit/5

        public ActionResult Edit(int id = 0)
        {
            StoreItem storeitem = db.StoreItems.Find(id);
            if (storeitem == null)
            {
                return HttpNotFound();
            }
            return View(storeitem);
        }

        //
        // POST: /Shop/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(StoreItem storeitem)
        {
            if (ModelState.IsValid)
            {
                db.Entry(storeitem).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(storeitem);
        }

        //
        // GET: /Shop/Delete/5

        public ActionResult Delete(int id = 0)
        {
            StoreItem storeitem = db.StoreItems.Find(id);
            if (storeitem == null)
            {
                return HttpNotFound();
            }
            return View(storeitem);
        }

        //
        // POST: /Shop/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            StoreItem storeitem = db.StoreItems.Find(id);
            db.StoreItems.Remove(storeitem);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}