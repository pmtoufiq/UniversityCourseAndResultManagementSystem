using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystem.Models;

namespace UniversityCourseAndResultManagementSystem.Gateway
{
    public class CourseGateway:Gateway
    {
        public int Save(Course course)
        {
            Query =
                "INSERT INTO CourseTable(CourseCode, CourseName, CourseCredit, CourseDescription, DepartmentId, SemesterId) VALUES (@courseCode, @courseName, @courseCredit, @courseDescription, @departmentId, @semesterid)";
            Command=new SqlCommand(Query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.AddWithValue("courseCode", course.CourseCode);
            Command.Parameters.AddWithValue("courseName", course.CourseName);
            Command.Parameters.AddWithValue("courseCredit", course.CourseCredit);
            if (course.CourseDescription != null)
            {
                Command.Parameters.AddWithValue("courseDescription", course.CourseDescription);
            }
            else
            {
                Command.Parameters.AddWithValue("courseDescription", DBNull.Value);
            }
            Command.Parameters.AddWithValue("departmentId", course.DepartmentId);
            Command.Parameters.AddWithValue("semesterid", course.SemesterId);
            Connection.Open();
            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected;
        }

        public bool IsExistCourseCode(string courseCode)
        {
            Connection.Open();
            Query = "SELECT * FROM CourseTable WHERE CourseCode='" + courseCode + "'";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                Connection.Close();
                return true;
            }
            else
            {
                Connection.Close();
                return false;
            }
        }

        public bool IsExistCourseName(string courseName)
        {
            Connection.Open();
            Query = "SELECT * FROM CourseTable WHERE CourseName='" + courseName + "'";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                Connection.Close();
                return true;
            }
            else
            {
                Connection.Close();
                return false;
            }
        }

        public List<Course> GetCourses()
        {
            Connection.Open();
            Query = "Select * from CourseTable";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            List<Course> courseList = new List<Course>();
            while (Reader.Read())
            {
                Course course = new Course()
                {
                    CourseId = (int)Reader["CourseId"],
                    CourseCode = (string)Reader["CourseCode"],
                    CourseName = (string)Reader["CourseName"],
                    CourseCredit = (decimal)Reader["CourseCredit"],
                    //CourseDescription = (string)Reader["CourseDescription"],
                    DepartmentId = (int)Reader["DepartmentId"],
                    SemesterId = (int)Reader["SemesterId"]
                };
                courseList.Add(course);
            }
            Connection.Close();
            Reader.Close();
            return courseList;
        }

        public decimal GetCourseCredit(int teacherId)
        {
            Connection.Open();
            Query = "Select at.TeacherId,isnull(sum(c.CourseCredit),0) as TotalCourseCredit FROM AssignCourseToTeacherTable at INNER JOIN CourseTable c ON at.TeacherId = c.CourseId where at.TeacherId='" + teacherId + "' GROUP BY at.TeacherId";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            Course course = new Course();
            if(Reader.Read())
            {
                course.CourseCredit = (decimal)Reader["TotalCourseCredit"];
            }
            else
            {
                course.CourseCredit = 0;
            }
           
            Connection.Close();
            return course.CourseCredit;
        }

        public int AssignCourse(AssignCourse assignCourse)
        {
            Query =
                "INSERT INTO AssignCourseToTeacherTable(DepartmentId, TeacherId, CourseId) VALUES (@departmentId, @teacherId, @courseId)";
            Command = new SqlCommand(Query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.AddWithValue("departmentId", assignCourse.DepartmentId);
            Command.Parameters.AddWithValue("teacherId", assignCourse.TeacherId);
            Command.Parameters.AddWithValue("courseId", assignCourse.CourseId);
            Connection.Open();
            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected;
        }

        public bool IsExistCourse(int courseId)
        {
            Connection.Open();
            Query = "SELECT * FROM AssignCourseToTeacherTable WHERE CourseId='" + courseId + "'";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            if (Reader.HasRows)
            {
                Connection.Close();
                return true;
            }
            else
            {
                Connection.Close();
                return false;
            }
        }
    }
}