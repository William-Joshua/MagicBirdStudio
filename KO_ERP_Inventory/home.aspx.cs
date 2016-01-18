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

namespace KO_ERP_Inventory
{
    public partial class home : System.Web.UI.Page
    {
        SqlConnClass sqlconn = new SqlConnClass();
        protected ILog log = log4net.LogManager.GetLogger(System.Reflection.MethodBase.GetCurrentMethod().DeclaringType);//记录日志
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                sqlconn.chkAdminLogin();
            }

        }
    }
}
