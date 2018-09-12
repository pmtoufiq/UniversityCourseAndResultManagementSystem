using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystem.Models;

namespace UniversityCourseAndResultManagementSystem.Gateway
{
    public class SemesterGateway : Gateway
    {
        public List<Semester> GetSemesters()
        {
            Query = "SELECT * FROM SemesterTable";
            Command=new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Semester> semesterList = new List<Semester>();
            while (Reader.Read())
            {
                Semester semester = new Semester
                {
                    SemesterId = (int) Reader["SemesterId"],
                    SemesterName= (string) Reader["SemesterName"]
                };
                semesterList.Add(semester);
            }
            Reader.Close();
            Connection.Close();
            return semesterList;
        }
    }
}