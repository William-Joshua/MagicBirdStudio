using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.Entity;
using System.Data.Entity;

namespace MagicBirdStudio_RBAC.Models
{
    [DbConfigurationType(typeof(MySqlEFConfiguration))]
    public class accountInfoDBContex : DbContext
    {
        public accountInfoDBContex()
            : base("MagicBirdStudio_RBAC_Entities")
        {
        }
    }
}