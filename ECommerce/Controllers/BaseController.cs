using ECommerce.DB;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ECommerce.Controllers
{
    public class BaseController : Controller
    {
        //sadece miras alanlar görebilsin o yüzden protected
        //değer atarken sadece bu sınıf içinden değer atanacak
        protected ECommerceDBEntities context { get; private set; }
        public BaseController()
        {
            context = new ECommerceDBEntities();
            ViewBag.MenuCategories = context.Categories.Where(x => x.Parent_Id == null).ToList();
        }
    }
}