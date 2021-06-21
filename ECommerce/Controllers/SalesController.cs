using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.Controllers
{
    public class SalesController : BaseController
    {
        // GET: Sales
        public ActionResult Sales()
        {
            
                var sales = context.OrderDetails.ToList();
                return View(sales.OrderByDescending(x => x.AddedDate).ToList());
            
        }
    }
}