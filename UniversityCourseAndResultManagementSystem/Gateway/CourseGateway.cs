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
    }
}