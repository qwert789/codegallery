//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Sixeyed.CarValet.Entities
{
    using System;
    using System.Collections.Generic;
    
    public partial class VehicleType
    {
        public VehicleType()
        {
            this.Vehicles = new HashSet<Vehicle>();
        }
    
        public string TypeCode { get; set; }
        public string TypeDescription { get; set; }
    
        public virtual ICollection<Vehicle> Vehicles { get; set; }
    }
}
