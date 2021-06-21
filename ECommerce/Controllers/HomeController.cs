using ECommerce.DB;
using ECommerce.Models.Home;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.Controllers
{
    public class HomeController : BaseController
    {
        // GET: Home
        [HttpGet]
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
        [HttpGet]
        public ActionResult Product(int id = 0)
        {
            var pro = context.Products.FirstOrDefault(x => x.Id == id);

            if (pro == null) return RedirectToAction("index", "Home");

            ProductModels model = new ProductModels()
            {
                Product = pro,
                Comments = pro.Comments.ToList()
            };
            return View(model);
        }
        [HttpPost]
        public ActionResult Product(DB.Comments comment)
        {
            try
            {
                comment.Member_Id = base.CurrentUserId();
                comment.AddedDate = DateTime.Now;
                context.Comments.Add(comment);
                context.SaveChanges();
            }
            catch (Exception ex)
            {
                ViewBag.MyError = ex.Message;
            }

            return RedirectToAction("Product", "Home");
        }
    }
}