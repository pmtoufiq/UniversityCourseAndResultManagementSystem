using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystem.Gateway;
using UniversityCourseAndResultManagementSystem.Models;

namespace UniversityCourseAndResultManagementSystem.Manager
{
    public class TeacherManager
    {
        TeacherGateway teacherGateway = new TeacherGateway();
        public bool IsExist(string email)
        {
            return teacherGateway.IsExist(email);
        }

        public string Save(Teacher teacher)
        {
            if (teacherGateway.IsExist(teacher.TeacherEmail))
            {
                return "This email already exist";
            }
            if (teacherGateway.Save(teacher)>0)
            {
                return "Teacher saved successfully.";
            }
            return "Failed to save the teacher";
        }
    }
}