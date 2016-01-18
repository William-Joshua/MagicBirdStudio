using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using log4net;
using System.Reflection;

[assembly:log4net.Config.XmlConfigurator(Watch= true)]
namespace KO_ERP_Inventory
{
    public partial class _Default : System.Web.UI.Page
    {
        SqlConnClass sqlconn = new SqlConnClass();

        protected static string usernameStr = "visitor";//用户名：初始化为来宾
        protected static string passwordStr = "000000";//密码：默认密码为 000000
        protected ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        /// <summary>
        /// 对cookie进行认证，判断是否用户已登录
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        /// 
        protected void Page_Load(object sender, EventArgs e)
        {
            ///<summary>
            /// 清除cookie状态，重新登陆
            ///</summary>
            ///
            HttpCookie cookie = Request.Cookies["asperp"]; // 获取cookie
            if (null != cookie)
            {
                cookie.Values["logstate"] = "False";
                cookie.Values["userid"] = "";
                cookie.Values["username"] = "";
                cookie.Values["loginlv1"] = "N";
                cookie.Values["loginlv2"] = "N";
                cookie.Values["loginlv3"] = "N";
                cookie.Values["loginlv4"] = "N";
                cookie.Values["loginlv5"] = "N";
                cookie.Values["loginlv6"] = "N"; 
                cookie.Values["loginlv7"] = "N";
                cookie.Values["loginlv8"] = "N";
                Response.AppendCookie(cookie);
            }
        }

        /// <summary>
        /// 用户及密码认证
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        /// 
        protected void login_Click(object sender, EventArgs e)
        {
            usernameStr = username.Text.ToString().Trim();
            passwordStr = password.Text.ToString().Trim();

            // 判断用户名是否为空
            if (0 == usernameStr.Length)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script> alert('账号不能为空!');</script>");
                return;
            }

            // 判断密码是否为空
            if (0 == passwordStr.Length)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script> alert('密码不能为空!');</script>");
            }

            // 验证用户名密码并获得用户登录权限

            string[] userLoginPower = new string[11];
            userLoginPower = sqlconn.checkUserPassRight(usernameStr, passwordStr);

            //根据返回值中的 userLoginPower[0] 状态，来判断生成对应 cookie
            if ("True" == userLoginPower[0])
            {
                // 用户名密码正确
                // 将用户名及权限写入cookies
                HttpCookie loginCookie = new HttpCookie("asperp");//创建 cookie

                loginCookie.Values.Add("logstate", HttpContext.Current.Server.UrlEncode(userLoginPower[0]));
                loginCookie.Values.Add("userid", HttpContext.Current.Server.UrlEncode(userLoginPower[1]));
                loginCookie.Values.Add("username", HttpContext.Current.Server.UrlEncode(userLoginPower[2]));
                loginCookie.Values.Add("loginlv1", HttpContext.Current.Server.UrlEncode(userLoginPower[3]));
                loginCookie.Values.Add("loginlv2", HttpContext.Current.Server.UrlEncode(userLoginPower[4]));
                loginCookie.Values.Add("loginlv3", HttpContext.Current.Server.UrlEncode(userLoginPower[5]));
                loginCookie.Values.Add("loginlv4", HttpContext.Current.Server.UrlEncode(userLoginPower[6]));
                loginCookie.Values.Add("loginlv5", HttpContext.Current.Server.UrlEncode(userLoginPower[7]));
                loginCookie.Values.Add("loginlv6", HttpContext.Current.Server.UrlEncode(userLoginPower[8]));
                loginCookie.Values.Add("loginlv7", HttpContext.Current.Server.UrlEncode(userLoginPower[9]));
                loginCookie.Values.Add("loginlv8", HttpContext.Current.Server.UrlEncode(userLoginPower[10]));

                //设置 cookie失效时间,此处设为 1小时
                loginCookie.Expires = System.DateTime.Now.AddHours(1);
                // 客户端添加cookie
                HttpContext.Current.Response.Cookies.Add(loginCookie);
                Response.Redirect("home.aspx");
            }
            else
            {
                // 用户名密码错误
                Page.ClientScript.RegisterStartupScript(this.GetType(), "", "<script> alert('用户名或密码错误，请重试!');</script>");
                this.password.Text = "";
                this.password.Focus();
            }

        }

        /// <summary>
        /// 来宾模式
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        /// 
        protected void visitor_Click(object sender, EventArgs e)
        {
            HttpCookie loginCookie = new HttpCookie("asperp");//创建 cookie

            loginCookie.Values.Add("logstate", HttpContext.Current.Server.UrlEncode("True"));
            loginCookie.Values.Add("userid", HttpContext.Current.Server.UrlEncode("visitor"));
            loginCookie.Values.Add("username", HttpContext.Current.Server.UrlEncode("访客"));
            loginCookie.Values.Add("loginlv1", HttpContext.Current.Server.UrlEncode("Y"));
            loginCookie.Values.Add("loginlv2", HttpContext.Current.Server.UrlEncode("N"));
            loginCookie.Values.Add("loginlv3", HttpContext.Current.Server.UrlEncode("N"));
            loginCookie.Values.Add("loginlv4", HttpContext.Current.Server.UrlEncode("N"));
            loginCookie.Values.Add("loginlv5", HttpContext.Current.Server.UrlEncode("N"));
            loginCookie.Values.Add("loginlv6", HttpContext.Current.Server.UrlEncode("N"));
            loginCookie.Values.Add("loginlv7", HttpContext.Current.Server.UrlEncode("N"));
            loginCookie.Values.Add("loginlv8", HttpContext.Current.Server.UrlEncode("N"));

            //设置 cookie失效时间,此处设为 1小时
            loginCookie.Expires = System.DateTime.Now.AddHours(1);
            // 客户端添加cookie
            HttpContext.Current.Response.Cookies.Add(loginCookie);
            Response.Redirect("home.aspx");
        }
    }
}
