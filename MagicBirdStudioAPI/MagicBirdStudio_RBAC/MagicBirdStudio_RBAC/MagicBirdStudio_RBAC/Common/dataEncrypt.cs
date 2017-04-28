/**
 * MagicBirdStudio_RBAC -- dataEncrypt.cs
 * Author：William.D.Joshua
 * E-Mail : njl.yxsky@gmail.com
 * Create Date : 2017-04-23
 * Create Description :
 * 通用加密解密方法集合
 * Copyright (C) : GPL-3.0
 **/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Security.Cryptography;

namespace MagicBirdStudio_RBAC.Common
{
    public class dataEncrypt
    {
        private string MD5Hash = "f0xle@rn";

        /// <summary>
        /// MD5 加密
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public string MD5Encrypt(string value)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] md5EncryptValue = md5.ComputeHash(Encoding.Default.GetBytes(value));
            return Encoding.Default.GetString(md5EncryptValue);
        }

        /// <summary>
        /// SHA-1 加密
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public string SHA1Encrypt(string value)
        {
            SHA1 sha1 = new SHA1CryptoServiceProvider();
            byte[] sha1EncryptValue = sha1.ComputeHash(Encoding.Default.GetBytes(value));
            return Encoding.Default.GetString(sha1EncryptValue);
        }

        /// b <summary>
        /// DES 加密
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public string DESEncrypt(string value)
        {
            byte[] data = UTF8Encoding.UTF8.GetBytes(value);
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                byte[] keys = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(MD5Hash));
                using (TripleDESCryptoServiceProvider tripDes = new TripleDESCryptoServiceProvider() { Key = keys, Mode = CipherMode.ECB, Padding = PaddingMode.PKCS7 })
                {
                    ICryptoTransform transform = tripDes.CreateEncryptor();
                    byte[] desEncryptValue = transform.TransformFinalBlock(data, 0, data.Length);
                    return Convert.ToBase64String(desEncryptValue, 0, desEncryptValue.Length);
                }
            }
        }
        /// <summary>
        /// DES 解密
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public string DESDecrypt(string value)
        {
            byte[] data = Convert.FromBase64String(value);
            using (MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider())
            {
                byte[] keys = md5.ComputeHash(UTF8Encoding.UTF8.GetBytes(MD5Hash));
                using (TripleDESCryptoServiceProvider tripDes = new TripleDESCryptoServiceProvider() { Key = keys, Mode = CipherMode.ECB, Padding = PaddingMode.PKCS7 })
                {
                    ICryptoTransform transform = tripDes.CreateEncryptor();
                    byte[] desEncryptValue = transform.TransformFinalBlock(data, 0, data.Length);
                    return UTF8Encoding.UTF8.GetString(desEncryptValue);
                }
            }
        }
    }
}