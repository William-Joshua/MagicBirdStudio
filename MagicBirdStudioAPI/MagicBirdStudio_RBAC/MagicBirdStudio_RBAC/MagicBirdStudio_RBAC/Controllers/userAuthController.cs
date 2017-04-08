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
        public IHttpActionResult GetUserAuth(string id)
        {
            magicbirdstudiorbacEntities mbsRbacEntities = new magicbirdstudiorbacEntities();
            var accountItem = mbsRbacEntities.accountinfo
                .Where(recordset => recordset.UserID == id && recordset.isService == true)
                .Select(recordset => new
                              {
                                  username = recordset.UserName,
                                  joblevel = recordset.JobLevel,
                              }).ToList();

            if (accountItem[0].username.Length == 0)
            {
                return NotFound();
            }
            string strb = string.Empty;
            strb = JsonConvert.SerializeObject(accountItem);
            return Ok(strb);
        }
        /// <summary>
        /// 
        /// </summary>
        public void Post([FromBody]string value)
        {
        }
        
        /// <summary>
        /// 验证用户账号
        /// </summary>
        /// <returns></returns>
        public userAuth verifyUserAuth(userAuth userAuth)
        {
            string AuthType = userVerify.verifyAuthType(userAuth.AuthAmount);
            switch (AuthType)
            {
                case "E": 
                    {
                        userInfo = verifyEmail(userAuth);
                    }; break;
                case "I": 
                    {
                        userInfo = verifyUserID(userAuth);
                    }; break;
                default: 
                    {
                    }; break;
            }
            return userInfo;
        }

        public userAuth verifyUserID(userAuth userAuth)
        {
            return userInfo;
        }

        public userAuth verifyEmail(userAuth userAuth)
        {
            return userInfo;
        }
    }
}
