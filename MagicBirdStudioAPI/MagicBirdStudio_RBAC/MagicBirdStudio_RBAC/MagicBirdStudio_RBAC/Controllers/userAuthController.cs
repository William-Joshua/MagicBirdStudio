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
using System.Net;
using System.Net.Http;
using System.Web.Http;
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

        public userAuth Get(string id)
        {
            return userInfo;
        }

        public IHttpActionResult GetUserAuth(string id)
        {
            magicbirdstudiorbacEntities mbsRbacEntities = new magicbirdstudiorbacEntities();
            var accountItem = from recordset in mbsRbacEntities.accountinfo
                          where recordset .UserID == id
                          select recordset;

            if (accountItem == null)
            {
                return NotFound();
            }
            return Ok(accountItem);
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

                    }; break;
                case "I": 
                    {
 
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
