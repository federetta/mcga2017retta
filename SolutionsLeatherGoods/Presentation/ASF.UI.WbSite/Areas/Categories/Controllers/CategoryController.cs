using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ASF.UI.Process;

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
    }
}