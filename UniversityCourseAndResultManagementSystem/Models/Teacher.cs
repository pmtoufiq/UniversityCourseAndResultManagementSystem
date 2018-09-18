using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityCourseAndResultManagementSystem.Models
{
    public class Teacher
    {
        public int TeacherId { get; set; }
        public string TeacherName { get; set; }
        public string TeacherAddress { get; set; }
        public string TeacherEmail { get; set; }
        public string TeacherContactNo { get; set; }
        public int DesignationId { get; set; }
        public int DepartmentId { get; set; }
        public decimal CreditToBeTaken { get; set; }
        public decimal RemainingCredit { get; set; }
    }
}