using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASF.UI.Process;
using ASF.Entities;

namespace ASF.UI.WbSite.Areas.Orders.Controllers
{
    public class OrderController : Controller
    {
        // GET: Orders/Order
        public ActionResult Index()
        {
            var op = new OrderProcess();
            var lista = op.SelectList();
            return View(lista);
        }

        // GET: Orders/Details
        public ActionResult Details(string id)
        {
            var op = new OrderProcess();
            var order = op.Find(id);

            return View(order);
        }

        // GET: Orders/Create
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        // POST: Orders/Create
        public ActionResult Create(Order order)
        {
            var op = new OrderProcess();
            op.Insert(order);
            return RedirectToAction("Index");
        }
        [HttpPost]
        // POST: Orders/Checkout
        public ActionResult Checkout(FormCollection form)
        {
            var op = new OrderProcess();
            var order = op.Insert(new Order() { ClientId = User.Identity.Name });
            var cookie = Request.Cookies[".AspNet.ApplicationCookie"].Value;
            var pp = new ProductProcess();
            var prod = pp.Cookie(cookie);
           
            foreach (var item in prod)
            {
                var OD = new OrderDetailProcess();
                var ode = new OrderDetail();
                ode.OrderId = order.Id;
                ode.ProductId = item.Id;
                ode.Price = item.Price;
                ode.Quantity = Convert.ToInt32(form["qty_" + item.Id]);
                OD.Insert(ode);
            }
            var cp = new CartProcess();
            HttpCookie cookie2 = Request.Cookies[".AspNet.ApplicationCookie"];
            var cart = cp.Cookie(cookie2.Value);
            var cartid = cart.Id;
            var cartItem = new CartItemProcess();
            cartItem.Delete(cart.Id);

            return RedirectToAction("FindByCookie", "Product", new { Area = "Products" });
        }


        // GET: Orders/Delete
        public ActionResult Delete(int id)
        {
            var op = new OrderProcess();
            op.Delete(id);
            return RedirectToAction("Index");
        }

        // GET: Orders/Edit
        public ActionResult Edit(string id)
        {
            var op = new OrderProcess();
            var order = op.Find(id);

            return View(order);
        }

        [HttpPost]
        // POST: Orders/Edit
        public ActionResult Edit(Order order)
        {
            var op = new OrderProcess();
            op.Edit(order);
            return RedirectToAction("Index");
        }

    }
}