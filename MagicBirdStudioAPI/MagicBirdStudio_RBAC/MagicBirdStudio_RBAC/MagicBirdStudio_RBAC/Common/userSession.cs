/**
 * MagicBirdStudio_RBAC -- userSession.cs
 * Author：William.D.Joshua
 * E-Mail : njl.yxsky@gmail.com
 * Create Date : 2017-04-20
 * Create Description :
 * Session 相关操作
 * Copyright (C) : GPL-3.0
 **/using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Remoting.Messaging;

namespace MagicBirdStudio_RBAC.Common
{
    public class userSession
    {
        /// <summary>
        /// 获取客户端 IP 地址，CS/BS可用
        /// </summary>
        /// <returns></returns>
        public static string GetClientIp()
        {

            string clientip;
            if (CallContext.GetData("X-SessionID") != null)
            {
                clientip = CallContext.GetData("ClientIPAddress").ToString();
            }
            else if (HttpContext.Current != null)
            {
                clientip = HttpContext.Current.Request.UserHostAddress;
            }
            else
            {
                clientip = "";
            }
            return clientip;
        }

    }
}