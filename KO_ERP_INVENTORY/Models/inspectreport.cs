//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace KO_ERP_INVENTORY.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class inspectreport
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public inspectreport()
        {
            this.inspectinformations = new HashSet<inspectinformation>();
        }
    
        public string InspectID { get; set; }
        public string InspectName { get; set; }
        public byte[] Details { get; set; }
        public System.DateTime AddTime { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<inspectinformation> inspectinformations { get; set; }
    }
}
