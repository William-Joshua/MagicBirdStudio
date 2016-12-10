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
        private string _authamount;
        public string AuthAmount
        {
            get { return _authamount; }
            set { _authamount = value; }
        }

        /// <summary>
        /// Name（用户名）
        /// Type(string)
        /// </summary>
        [Required]
        [Display(Name = "用户名")]
        private string _username;
        public string UserName
        {
            get { return _username; }
            set { _username = value; }
        }

        [Required]
        [Display(Name = "邮箱")]
        [RegularExpression(@"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*")]
        private string _useremail;
        public string UserEMail
        {
            get { return _useremail; }
            set { _useremail = value; }
        }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "密码")]
        private string _password;
        public string PassWord
        {
            get { return _password; }
            set { _password = value; }
        }
    }
}