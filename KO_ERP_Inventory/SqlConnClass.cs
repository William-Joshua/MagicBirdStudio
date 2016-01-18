using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.OleDb;
using System.IO;
using System.Collections.Generic;

namespace KO_ERP_Inventory
{
    public class SqlConnClass
    {
        #region ConnectionString
        /// <summary>
        /// 利用 connectionString，连接数据库,本项目所有数据库连接接口：sqlConn
        /// 数据库信息：
        /// Data Source=192.168.1.63;
        /// Database=ko_erp_inventory;
        /// User Id=sa;Password=123;
        /// </summary>
        /// 
        protected static SqlConnection sqlConn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["SS2000Conn"].ConnectionString);
        #endregion

        #region checkusernamePassword
        /// <summary>
        /// 判断登陆用户用户名密码
        /// </summary>
        /// <param name="username"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        ///
        public string[] checkUserPassRight(string username, string password)
        {
            string[] userPower = new string[11];
            try
            {
                if (sqlConn.State == System.Data.ConnectionState.Closed)
                    sqlConn.Open();

                string sqlText = "SELECT * FROM usermanagement WHERE UserID = @userid AND PassWord = @password";

                SqlCommand sqlComm = new SqlCommand(sqlText, sqlConn);
                SqlParameter[] paraUserPass = new SqlParameter[]{
                    new SqlParameter("@userid",username),
                    new SqlParameter("@password",password)
                };

                sqlComm.Parameters.AddRange(paraUserPass);

                using (SqlDataReader sdrLogInfo = sqlComm.ExecuteReader())
                {
                    sdrLogInfo.Read();
                    if (sdrLogInfo.HasRows)
                    {
                        userPower[0] = "True";
                        userPower[1] = sdrLogInfo["UserID"].ToString();
                        userPower[2] = sdrLogInfo["UserName"].ToString();
                        userPower[3] = sdrLogInfo["LoginLv1"].ToString();
                        userPower[4] = sdrLogInfo["LoginLv2"].ToString();
                        userPower[5] = sdrLogInfo["LoginLv3"].ToString();
                        userPower[6] = sdrLogInfo["LoginLv4"].ToString();
                        userPower[7] = sdrLogInfo["LoginLv5"].ToString();
                        userPower[8] = sdrLogInfo["LoginLv6"].ToString();
                        userPower[9] = sdrLogInfo["LoginLv7"].ToString();
                        userPower[10] = sdrLogInfo["LoginLv8"].ToString();
                    }
                    else
                    {
                        userPower[0] = "False";
                        userPower[1] = "N";
                        userPower[2] = "N";
                        userPower[3] = "N";
                        userPower[4] = "N";
                        userPower[5] = "N";
                        userPower[6] = "N";
                        userPower[7] = "N";
                        userPower[8] = "N";
                        userPower[9] = "N";
                        userPower[10] = "N";

                    }
                    sdrLogInfo.Close();
                }
                return userPower;
            }
            catch
            {
                //数据库连接异常
                userPower[0] = "False";
                userPower[1] = "N";
                userPower[2] = "N";
                 userPower[3] = "N";
                userPower[4] = "N";
                userPower[5] = "N";
                userPower[6] = "N";
                userPower[7] = "N";
                userPower[8] = "N";
                userPower[9] = "N";
                userPower[10] = "N";
                return userPower;
            }
        }
        #endregion


        #region getcookie
        public string[] getWebCookie()
        {
            string[] userPowerStr = new string[11];// 存储客户端cookies

            HttpCookie cookie = HttpContext.Current.Request.Cookies["asperp"];//获取客户端cookies

            if (null == cookie)
            {
                // 判断客户端cookie是否显示为登陆允许
                if ("True" == cookie.Values["logstate"].ToString())
                {
                    userPowerStr[0] = HttpContext.Current.Server.UrlDecode(cookie.Values["logstate"].ToString());
                    userPowerStr[1] = HttpContext.Current.Server.UrlDecode(cookie.Values["userid"].ToString());
                    userPowerStr[2] = HttpContext.Current.Server.UrlDecode(cookie.Values["username"].ToString());
                    userPowerStr[3] = HttpContext.Current.Server.UrlDecode(cookie.Values["loginlv1"].ToString());
                    userPowerStr[4] = HttpContext.Current.Server.UrlDecode(cookie.Values["loginlv2"].ToString());
                    userPowerStr[5] = HttpContext.Current.Server.UrlDecode(cookie.Values["loginlv3"].ToString());
                    userPowerStr[6] = HttpContext.Current.Server.UrlDecode(cookie.Values["loginlv4"].ToString());
                    userPowerStr[7] = HttpContext.Current.Server.UrlDecode(cookie.Values["loginlv5"].ToString());
                    userPowerStr[8] = HttpContext.Current.Server.UrlDecode(cookie.Values["loginlv6"].ToString());
                    userPowerStr[9] = HttpContext.Current.Server.UrlDecode(cookie.Values["loginlv7"].ToString());
                    userPowerStr[10] = HttpContext.Current.Server.UrlDecode(cookie.Values["loginlv8"].ToString());
                }
            }
            return userPowerStr;
        }

        #endregion

        #region chkAdminLogin
        /// <summary>
        /// 根据cookie判断用户是否登陆
        /// </summary>
        /// 
        public void chkAdminLogin()
        {
            HttpCookie cookie = HttpContext.Current.Request.Cookies["asperp"];//获取客户端cookies

            if (null != cookie)
            {
                if ("True" != cookie.Values["logstate"].ToString())
                    HttpContext.Current.Response.Write(@"<script>alert('你还没有登陆或登陆超时！');window.location.href='index.aspx';</script>");
            }
            else
                HttpContext.Current.Response.Write(@"<script>alert('你还没有登陆或登陆超时！');window.location.href='index.aspx';</script>");
        }
        #endregion
    }
}
