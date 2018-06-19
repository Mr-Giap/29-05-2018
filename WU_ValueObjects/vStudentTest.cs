using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WU_ValueObjects
{
    public class vStudentTest
    {
        public long StudentId { get; set; }
        public long ClassId { get; set; }
        public decimal? FirstScore { get; set; }
        public decimal? SecondScore { get; set; }
        public decimal? ThirdScore { get; set; }
    }
}
