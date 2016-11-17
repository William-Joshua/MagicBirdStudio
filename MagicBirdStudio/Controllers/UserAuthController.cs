using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MagicBirdStudio.Controllers
{
    public class UserAuthController : Controller
    {
        //
        // GET: /UserSignUp/

        public ActionResult SignIn()
        {
            return View();
        }

    }
}
