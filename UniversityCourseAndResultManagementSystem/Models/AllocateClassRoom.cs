using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UniversityCourseAndResultManagementSystem.Models
{
    public class AllocateClassRoom
    {
        public int AllocateClassRoomId { get; set; }
        public int DepartmentId { get; set; }
        public int CourseId { get; set; }
        public int RoomId { get; set; }
        public int DayId { get; set; }
        public int From { get; set; }
        public int To { get; set; }
    }
}