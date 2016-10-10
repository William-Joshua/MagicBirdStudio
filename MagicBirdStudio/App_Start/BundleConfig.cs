using System.Web;
using System.Web.Optimization;

namespace MagicBirdStudio
{
    public class BundleConfig
    {
        // 有关绑定的详细信息，请访问 http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            // Bootstrap Core CSS
            bundles.Add(new StyleBundle("~/Content/Bootstrap").Include(
                "~/Content/Components/bootstrap/dist/css/bootstrap.min.css"
                ));
            bundles.Add(new StyleBundle("~/Content/Components/metisMenu").Include(
                "~/Content/Components/metisMenu/dist/metisMenu.min.css"
                ));
            bundles.Add(new StyleBundle("~/Content/Timeline").Include(
                "~/Content/Styles/css/timeline.css"
                ));
            bundles.Add(new StyleBundle("~/Content/sb-admin-2").Include(
                "~/Content/Styles/css/sb-admin-2.css"
                ));
            bundles.Add(new StyleBundle("~/Content/Font").Include(
                "~/Content/Components/font-awesome/css/font-awesome.min.css"
                ));
            bundles.Add(new StyleBundle("~/Content/morris").Include(
                "~/Content/Components/morrisjs/morris.css"
                ));
            bundles.Add(new ScriptBundle("~/Script/Jquery").Include(
                "~/Content/Components/jquery/dist/jquery.min.js"
                ));
            bundles.Add(new ScriptBundle("~/Script/bootstrap").Include(
                "~/Content/Components/bootstrap/dist/js/bootstrap.min.js"
                ));
            bundles.Add(new ScriptBundle("~/Script/metisMenu").Include(
                "~/Content/Components/metisMenu/dist/metisMenu.min.js"
                ));
            bundles.Add(new ScriptBundle("~/Script/raphael").Include(
                "~/Content/raphael/raphael-min.js"
                ));
            bundles.Add(new ScriptBundle("~/Script/morris").Include(
                "~/Content/Components/morrisjs/morris.min.js"
                ));
            bundles.Add(new ScriptBundle("~/Script/sb-admin-2").Include(
                "~/Content/Scripts/js/sb-admin-2.js"
                ));
        }
    }
}