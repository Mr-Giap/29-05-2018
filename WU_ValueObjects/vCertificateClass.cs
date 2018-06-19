using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WU_ValueObjects
{
    public class vCertificateClass
    {
        public long ClassId { get; set; }
        public string ClassName { get; set; }
        public long? SubjectId { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public long? ProfessorId { get; set; }
    }
}
