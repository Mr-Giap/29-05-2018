using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WU_ValueObjects
{
    public class vDegreeProgram
    {
        public long ProgramId { get; set; }
        public string ProgramName { get; set; }
        public long? FacultyId { get; set; }
        public long? ProfessorId { get; set; }
    }
}
