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

namespace KO_ERP_Inventory
{
    public partial class TopAction : System.Web.UI.Page
    {
        /// <summary>
        /// 获得登陆用户信息，并显示在页面上
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        /// 
        SqlConnClass sqlconn = new SqlConnClass();
        protected static string usernameStr = "visitor";//用户名：初始化为来宾
        protected static string loglevelStr = "查询"; // 登陆权限：初始化为查询
        protected ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);

        protected void Page_Load(object sender, EventArgs e)
        {
            string[] logUserInfo = new string[11];
            logUserInfo = sqlconn.getWebCookie();

            usernameStr = logUserInfo[2];
            // 判断用户登录权限，由于登陆用户共八个职能，并且该8个职能不存在上下隶属关系
            // 权限明细
            // lv_1 : 查询权限
            // lv_2 : 仓库管理权限(出入库,来料管理)
            // lv_3 : 质量检测权限(检测元器件及检测结果编辑)
            // lv_4 : 生产计划负责人(出入库异常处理)
            // lv_5 : 清单管理员(下发生产计划单)
            // lv_6 : 用户管理员(管理用户组)
            // lv_7 : 生产器件清单下发与元器件编号制定
            // lv_8 : 合同负责人(上传合同或送样小试单)

            this.username.Text = usernameStr;
            this.userright.Text = loglevelStr; // 目前用户权限全以默认显示
        }
    }
}
