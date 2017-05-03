using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Autofac;

namespace KickStarter.Ioc
{
    public class CoreIocModule : Module
    {
        protected override void Load(ContainerBuilder builder)
        {
            builder.RegisterType<DummyService>().As<IDummyService>();

            base.Load(builder);
        }
    }
}
