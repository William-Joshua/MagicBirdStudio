using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(KO_ERP_INVENTORY.Startup))]
namespace KO_ERP_INVENTORY
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
