using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASF.UI.Process;
using ASF.Entities;

namespace ASF.UI.WbSite.Areas.Categories.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Categories/Category
        public ActionResult Index()
        {
            var cp = new CategoryProcess();
            var lista = cp.SelectList();
            return View(lista);
        }

        // GET: Categories/Category
        public ActionResult Detail(int id)
        {
            var cp = new CategoryProcess();
            var lista = cp.FindByID(id);
            return View(lista);
        }


        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Category cat)
        {
            var cp = new CategoryProcess();
            cp.add(cat);
            return RedirectToAction("Index");
        }

    }
    }