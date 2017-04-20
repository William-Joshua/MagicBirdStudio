/**
 * MagicBirdStudio_RBAC -- userAuthController.cs
 * Author：William.D.Joshua
 * E-Mail : njl.yxsky@gmail.com
 * Create Date : 
 * Create Description :
 *
 * Copyright (C) : GPL-3.0
 **/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Http.Description;
using Newtonsoft.Json;
using MagicBirdStudio_RBAC.Models;
using MagicBirdStudio_RBAC.Common;

namespace MagicBirdStudio_RBAC.Controllers
{
    public class userAuthController : ApiController
    {
        public userAuth userInfo = new userAuth();
        public userAuth[] userInfos = new userAuth[5];
        private magicbirdstudiorbacEntities mbsRbacEntities = new magicbirdstudiorbacEntities();

        public IEnumerable<userAuth> Get()
        {
            return userInfos;
        }
        /// <summary>
        /// 通过用户ID获取用户信息
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [ResponseType(typeof(userAuth))]
        public string GetUserAuth(string id, string password, string callback)
        {
            int value = userVerify.verifyUserIdentifier(id, password);
            var accountItem = mbsRbacEntities.accountinfo
                .Where(recordset => recordset.UserID == id && recordset.isService == true)
                .Select(recordset => new
                {
                    username = recordset.UserName,
                    joblevel = recordset.JobLevel,
                }).ToList();

            if (accountItem.Count == 0)
            {
                return "not found";
            }
            string json = JsonConvert.SerializeObject(accountItem).ToString();
            return json;
        }
        /// <summary>
        /// 
        /// </summary>
        public void Post([FromBody]string value)
        {
        }
    }
}
