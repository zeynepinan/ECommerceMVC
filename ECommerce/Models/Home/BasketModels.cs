using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ECommerce.Models.Home
{
    public class BasketModels
    {

        public DB.Products Product { get; set; }
        public int Count { get; set; }
    }
}