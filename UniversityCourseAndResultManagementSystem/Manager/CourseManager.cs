using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystem.Gateway;
using UniversityCourseAndResultManagementSystem.Models;

namespace UniversityCourseAndResultManagementSystem.Manager
{
    public class CourseManager
    {
        CourseGateway courseGateway = new CourseGateway();

        public string Save(Course course)
        {
            if (courseGateway.IsExistCourseCode(course.CourseCode))
            {
                return "This course code already exist.";
            }
            if (courseGateway.IsExistCourseName(course.CourseName))
            {
                return "This course name already exist.";
            }
            if (courseGateway.Save(course)>0)
            {
                
                return "Course saved succcessfully.";
            }
            return "Failed to save the course";
        }

        public bool IsExistCourseCode(string courseCode)
        {
            return courseGateway.IsExistCourseCode(courseCode);
        }

        public bool IsExistCourseName(string courseName)
        {
            return courseGateway.IsExistCourseName(courseName);
        }

        public List<Course> GetCourses()
        {
            return courseGateway.GetCourses();
        }

        public decimal GetCourseCredit(int teacherId)
        {
            int courseCredit = Convert.ToInt32(courseGateway.GetCourseCredit(teacherId));
            return courseCredit;
        }

        public string AssignCourse(AssignCourse assignCourse)
        {
            if (courseGateway.IsExistCourse(assignCourse.CourseId))
            {
                return "This course code already assigned to a teacher.";
            }
            if (courseGateway.AssignCourse(assignCourse) > 0)
            {

                return "The course assigend to the teacher succcessfully.";
            }
            return "Failed to assign the course";
        }

        public bool IsExistCourse(int courseId)
        {
            return courseGateway.IsExistCourse(courseId);
        }
    }
}