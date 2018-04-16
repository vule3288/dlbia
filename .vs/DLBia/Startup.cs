using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DLBia.Startup))]
namespace DLBia
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
