using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using MagicBirdStudio.Models;
using Newtonsoft.Json;

namespace MagicBirdStudio.Controllers
{
    public class UserAuthController : Controller
    {
        //
        // GET: /UserSignUp/
        [HttpGet]
        public ActionResult SignIn()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        public JsonResult SignIn(userAuth user)
        {
            // 判断 AuthAmount 账号类型； 邮箱 or 用户名

            return Json(user,JsonRequestBehavior.AllowGet);
        }  
    }
}
