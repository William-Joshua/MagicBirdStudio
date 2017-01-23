/**
 * MagicBirdStudio -- 库存管理与流水线生成过程控制系统
 * Author：William.D.Joshua
 * E-Mail : njl.yxsky@gmail.com
 * Create Date : 2017-01-12
 * Create Description :
 *      1. 用户登陆控制器
 * Copyright (C) : GPL-3.0
 **/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using MagicBirdStudio;
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
