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
using MagicBirdStudio_RBAC.Models;

namespace MagicBirdStudio_RBAC.Common
{
    public class userVerify
    {
        /// <summary>
        /// 验证登陆用户
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static int verifyUserIdentifier(string id, string password)
        {
            int reValue = 0;
            magicbirdstudiorbacEntities mbsRbacEntities = new magicbirdstudiorbacEntities();
            int recordCount = mbsRbacEntities.userauth.Where(recordset => recordset.Identifier == id).Select(recordset => recordset.Identifier).Count();
            if (0 == recordCount)
            {
                // 该用户尚未注册，登陆信息不存在，当采用 UserID/Email 登陆时，提示密码或用户名不存在
                return reValue;
            }

            var userInfo = from UA in mbsRbacEntities.userauth
                           join AI in mbsRbacEntities.accountinfo on UA.UserID equals AI.UserID
                           where (UA.Identifier == id) && (UA.Credential == password)
                           select new
                           {
                               UserID = AI.UserID,
                               UserName = AI.UserName,
                               JobLevel = AI.JobLevel,
                               isService = AI.isService == true ? "在职":"离职"
                           };
            if(1 == userInfo.Count())
            {
                // 存在该用户，并允许登陆
                reValue = 1;
            }
            return reValue;
        }


        private void recordSession()
        {

        }

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