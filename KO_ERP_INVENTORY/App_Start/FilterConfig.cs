using System.Web;
using System.Web.Mvc;

namespace KO_ERP_INVENTORY
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
