using ECommerce.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.Controllers
{
    public class HomeController : Controller
    {
        ECommerceDBEntities context;
        public HomeController() 
        {
            context = new ECommerceDBEntities();
            ViewBag.MenuCategories = context.Categories.Where(x=>x.Parent_Id==null).ToList();

        }
        // GET: Home
        public ActionResult Index(int? id)
        {
            IQueryable<DB.Products> products = context.Products;
            DB.Categories category = null;
            if (id.HasValue) 
            {
                products = products.Where(x=>x.Category_Id==id);
                category = context.Categories.FirstOrDefault(x=>x.Id==id);
            }
            var viewModel = new Models.Home.IndexModel
            {
                Products = products.ToList(),
                Category=category
            };

            return View(viewModel);
        }
    }
}