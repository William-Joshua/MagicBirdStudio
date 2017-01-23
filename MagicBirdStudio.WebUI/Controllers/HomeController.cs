/**
 * MagicBirdStudio -- 库存管理与流水线生成过程控制系统
 * Author：William.D.Joshua
 * E-Mail : njl.yxsky@gmail.com
 * Create Date : 2017-01-12
 * Create Description :
 *      1. 主页，显示基本信息；
 *      2. 提供用户登陆；
 * Copyright (C) : GPL-3.0
 **/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MagicBirdStudio.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        public ActionResult Index()
        {
            return View();
        }

    }
}
