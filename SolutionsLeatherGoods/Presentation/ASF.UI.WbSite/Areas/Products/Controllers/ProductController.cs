using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASF.UI.Process;
using ASF.Entities;
using System.IO;


namespace ASF.UI.WbSite.Areas.Products.Controllers
{
    public class ProductController : Controller
    {
        // GET: Products/Product
        public ActionResult Index()
        {
            var pp = new ProductProcess();
            var lista = pp.SelectList();
            return View(lista);
        }

       [Authorize]
        public ActionResult IndexFilter(int Category = -1)
        {
            
            var cp = new CategoryProcess();
            var pp = new ProductProcess();
            ViewData["Categoria"] = cp.SelectList();
            var lista = new List<Product>();
            if(Category > -1)
                lista = pp.SelectByCat(Category);
            
            //var lista = DataCache.Instance.CategoryList();
            return View(lista);
            
        }

        // GET: Products/Details
        public ActionResult Details(int id)
        {
            var pp = new ProductProcess();
            var prd = pp.Find(id);

            return View(prd);
        }

        // GET: Products/Create
        public ActionResult Create()
        {
            var dp = new DealerProcess();
            var lista = dp.SelectList();
            ViewData["Dealer"] = lista;
            return View();
        }
        
        //[HttpPost]
        //// POST: Card/Create
        //public ActionResult CreateCart(Cart cart)
        //{
        //    var cp = new CartProcess();
        //    cart.CartDate = DateTime.Now;
        //    HttpCookie cookie = Request.Cookies[".AspNet.ApplicationCookie"]; 
        //    cart.Cookie = cookie.Value;
        //    cp.Insert(cart);
            
        //    return RedirectToAction("Index");
        //}
        [HttpPost]
        // POST: CardItem/Create
        public ActionResult CreateItemCart(int id)
        {
            var pp = new CartItemProcess();
            var cookie = Request.Cookies[".AspNet.ApplicationCookie"].Value;
            var cp = new CartProcess();
            var cart = cp.Cookie(cookie);
            if(cart == null)
            {
                cp.Insert(new Cart()
                {
                    CartDate = DateTime.Now,
                    Cookie = cookie
                });
                cart = cp.Cookie(cookie);
            }
            var item = new CartItem();
            item.CartId = cart.Id;
            item.ProductId = id;
            item.Quantity = 1;
            pp.Insert(item);

            return RedirectToAction("Index");
        }

        public ActionResult FindByCookie()
        {
            //var pp = new ProductProcess();
            var cookie = Request.Cookies[".AspNet.ApplicationCookie"].Value;
            var cp = new ProductProcess();
            var prod = cp.Cookie(cookie);

            return View(prod);
        }

        [HttpPost]
        // POST: Products/Create
        public ActionResult Create(Product prd, HttpPostedFileBase file)
        {
            //if (ModelState.IsValid)
            //{
            //    var originalFilename = Path.GetFileName(prd.Image);
            //    var path = Path.Combine(Server.MapPath("~/Uploads/Photo/"));
            //    prd.Image = path;
            //    File1.SaveAs(path)
            //}
            if (file != null && file.ContentLength > 0)
                try
                {

                    string path = Path.Combine(Server.MapPath("~/Content/files"), Path.GetFileName(file.FileName));
                    file.SaveAs(path);
                    ViewBag.Message = "File uploaded Successfully";
                }
                catch (Exception ex)
                {

                    ViewBag.Message = "Error:" + ex.Message.ToString();
                }
            else
            {
                ViewBag.Message = "You have not Specified a file";
            }
            var pp = new ProductProcess();
            pp.Insert(prd);
            return RedirectToAction("Index");
        }

        // GET: Products/Delete
        public ActionResult Delete(int id)
        {
            var pp = new ProductProcess();
            pp.Delete(id);
            return RedirectToAction("Index");
        }

        // GET: Products/Edit
        public ActionResult Edit(int id)
        {
            var pp = new ProductProcess();
            var prd = pp.Find(id);

            return View(prd);
        }

        [HttpPost]
        // POST: Products/Edit
        public ActionResult Edit(Product prd)
        {
            var pp = new ProductProcess();
            pp.Edit(prd);
            return RedirectToAction("Index");
        }



    }
}