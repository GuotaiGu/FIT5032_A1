using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FIT5032_A1.Models;

namespace FIT5032_A1.Controllers
{
    public class Seat_BookingController : Controller
    {
        private Chinese_Restaurant_ModelContainer db = new Chinese_Restaurant_ModelContainer();

        // GET: Seat_Booking
        public ActionResult Index()
        {
            var seat_Booking = db.Seat_Booking.Include(s => s.Customer).Include(s => s.Food).Include(s => s.Seat);
            return View(seat_Booking.ToList());
        }

        // GET: Seat_Booking/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Seat_Booking seat_Booking = db.Seat_Booking.Find(id);
            if (seat_Booking == null)
            {
                return HttpNotFound();
            }
            return View(seat_Booking);
        }

        // GET: Seat_Booking/Create
        public ActionResult Create()
        {
            ViewBag.CustomerId = new SelectList(db.Customers, "Id", "FirstName");
            ViewBag.FoodId = new SelectList(db.Foods, "Id", "Price");
            ViewBag.SeatId = new SelectList(db.Seats, "Id", "Availablity");
            return View();
        }

        // POST: Seat_Booking/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,CustomerId,FoodId,SeatId,Date,Cost")] Seat_Booking seat_Booking)
        {
            if (ModelState.IsValid)
            {
                db.Seat_Booking.Add(seat_Booking);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CustomerId = new SelectList(db.Customers, "Id", "FirstName", seat_Booking.CustomerId);
            ViewBag.FoodId = new SelectList(db.Foods, "Id", "Price", seat_Booking.FoodId);
            ViewBag.SeatId = new SelectList(db.Seats, "Id", "Availablity", seat_Booking.SeatId);
            return View(seat_Booking);
        }

        // GET: Seat_Booking/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Seat_Booking seat_Booking = db.Seat_Booking.Find(id);
            if (seat_Booking == null)
            {
                return HttpNotFound();
            }
            ViewBag.CustomerId = new SelectList(db.Customers, "Id", "FirstName", seat_Booking.CustomerId);
            ViewBag.FoodId = new SelectList(db.Foods, "Id", "Price", seat_Booking.FoodId);
            ViewBag.SeatId = new SelectList(db.Seats, "Id", "Availablity", seat_Booking.SeatId);
            return View(seat_Booking);
        }

        // POST: Seat_Booking/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,CustomerId,FoodId,SeatId,Date,Cost")] Seat_Booking seat_Booking)
        {
            if (ModelState.IsValid)
            {
                db.Entry(seat_Booking).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CustomerId = new SelectList(db.Customers, "Id", "FirstName", seat_Booking.CustomerId);
            ViewBag.FoodId = new SelectList(db.Foods, "Id", "Price", seat_Booking.FoodId);
            ViewBag.SeatId = new SelectList(db.Seats, "Id", "Availablity", seat_Booking.SeatId);
            return View(seat_Booking);
        }

        // GET: Seat_Booking/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Seat_Booking seat_Booking = db.Seat_Booking.Find(id);
            if (seat_Booking == null)
            {
                return HttpNotFound();
            }
            return View(seat_Booking);
        }

        // POST: Seat_Booking/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Seat_Booking seat_Booking = db.Seat_Booking.Find(id);
            db.Seat_Booking.Remove(seat_Booking);
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
