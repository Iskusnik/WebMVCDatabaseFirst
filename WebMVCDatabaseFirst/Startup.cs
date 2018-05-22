using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WebMVCDatabaseFirst.Startup))]
namespace WebMVCDatabaseFirst
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
