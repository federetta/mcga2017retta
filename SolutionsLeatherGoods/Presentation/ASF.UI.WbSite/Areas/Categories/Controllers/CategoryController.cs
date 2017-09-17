using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASF.UI.Process;
using ASF.Entities;
using ASF.UI.WbSite.Services.Cache;

namespace ASF.UI.WbSite.Areas.Categories.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Categories/Category
        public ActionResult Index()
        {
            //var cp = new CategoryProcess();
            //var lista = cp.SelectList();
            var lista = DataCache.Instance.CategoryList();
            return View(lista);
            
        }

        // GET: Categories/Category
        public ActionResult Detail(int id)
        {
            var cp = new CategoryProcess();
            var lista = cp.FindByID(id);
            return View(lista);
        }

        //Get: Categories/Create
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        //Post: Categories/Create
        [HttpPost]
        public ActionResult Create(Category cat)
        {
            var cp = new CategoryProcess();
            cp.Add(cat);
            return RedirectToAction("Index");
        }
        [HttpGet]
        // GET: Categories/Category
        public ActionResult Edit(int id)
        {
            var cp = new CategoryProcess();
            var lista = cp.FindByID(id);
            return View(lista);
        }
        [HttpPost]
        // POST: Categories/Category
        public ActionResult Edit(Category category)
        {
            var cp = new CategoryProcess();
            cp.Edit(category);
            return RedirectToAction("Index");
        }


        [HttpGet]
        // GET: Categories/Category
        public ActionResult Delete(int id)
        {
            var cp = new CategoryProcess();
            var lista = cp.FindByID(id);
            return View(lista);
        }
        [HttpPost]
        // POST: Categories/Category
        public ActionResult Delete(Category category)
        {
            var cp = new CategoryProcess();
            cp.Delete(category);
            return RedirectToAction("Index");
        }


    }
}