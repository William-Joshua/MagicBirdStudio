/**
 * MagicBirdStudio_RBAC -- userAuth.cs
 * Author：William.D.Joshua
 * E-Mail : njl.yxsky@gmail.com
 * Create Date : 2017-02-19
 * Create Description :
 *  用户登陆
 * Copyright (C) : GPL-3.0
 **/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MagicBirdStudio_RBAC.Models
{
    // 用户账号信息
    public class userAuth
    {
        public string AuthAmount { get; set; }
        // 用户ID
        public string UserID { get; set; }
        // 用户邮箱
        public string UserEmail { get; set; }
        // 用户密码
        public string PassWord { get; set; }
    }
}