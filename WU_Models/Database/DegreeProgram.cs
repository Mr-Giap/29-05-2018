//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WU_Models.Database
{
    using System;
    using System.Collections.Generic;
    
    public partial class DegreeProgram
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public DegreeProgram()
        {
            this.Students = new HashSet<Student>();
        }
    
        public long ProgramId { get; set; }
        public string ProgramName { get; set; }
        public Nullable<long> FacultyId { get; set; }
        public Nullable<long> ProfessorId { get; set; }
    
        public virtual Faculty Faculty { get; set; }
        public virtual Professor Professor { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Student> Students { get; set; }
    }
}
