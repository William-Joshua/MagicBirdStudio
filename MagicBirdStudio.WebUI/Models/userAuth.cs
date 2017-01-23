/**
 * MagicBirdStudio -- 库存管理与流水线生成过程控制系统
 * Author：William.D.Joshua
 * E-Mail : njl.yxsky@gmail.com
 * Create Date : 2017-01-12
 * Create Description :
 *     1. 用于验证用户登陆；
 * Copyright (C) : GPL-3.0
 **/
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MagicBirdStudio.Models
{
    public class userAuth
    {
        /// <summary>
        /// Name(用户账号)
        /// Type(string)
        /// </summary>
        [Required]
        [Display(Name = " 用户账号")]
        public string AuthAmount { get; set; }

        /// <summary>
        /// Name（用户名）
        /// Type(string)
        /// </summary>
        [Required]
        [Display(Name = "用户名")]
        public string UserName { get; set; }

        [Required]
        [Display(Name = "邮箱")]
        [RegularExpression(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*")]
        public string UserEMail { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "密码")]
        public string PassWord { get; set; }
    }
}