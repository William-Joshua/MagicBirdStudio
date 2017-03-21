/**
 * MagicBirdStudio_RBAC -- userVerify.cs
 * Author：William.D.Joshua
 * E-Mail : njl.yxsky@gmail.com
 * Create Date : 2017-02-19
 * Create Description :
 * 用户验证相关操作
 * Copyright (C) : GPL-3.0
 **/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text.RegularExpressions;

namespace MagicBirdStudio_RBAC.Common
{
    public class userVerify
    {
        /// <summary>
        /// 确定用户输入账户类型
        /// </summary>
        /// <param name="AuthAmonut"></param>
        /// <returns>
        /// "E" E-Mail 邮箱类型
        /// "I" ID 用户账号
        /// </returns>
        public static string verifyAuthType(string AuthAmonut)
        {
            string AuthType = "-";
            string MailPattern = string.Format("[\\w-\\.]+@([\\w-]+\\.)+[a-z]{2,3}");
            Match m = Regex.Match(AuthAmonut, MailPattern, RegexOptions.IgnoreCase);
            if (m.Success)
            {
                AuthType = "E";
            }
            else
            {
                AuthType = "I";
            }
            return AuthType;
        }
    }
}