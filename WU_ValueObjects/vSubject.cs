using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WU_ValueObjects
{
    public class vSubject
    {
        public long SubjectId { get; set; }
        public string SubjectName { get; set; }
        public long? FacultyId { get; set; }
    }
}
