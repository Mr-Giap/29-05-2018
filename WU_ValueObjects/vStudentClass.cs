using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WU_ValueObjects
{
    public class vStudentClass
    {
        public long StudentId { get; set; }
        public long ClassId { get; set; }
        public decimal? TestScore { get; set; }
    }
}
