using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystem.Models;

namespace UniversityCourseAndResultManagementSystem.Gateway
{
    public class TeacherGateway:Gateway
    {
        public int Save(Teacher teacher)
        {
            Query =
                "INSERT INTO TeacherTable(TeacherName, TeacherAddress, TeacherEmail, TeacherContactNo, DesignationId, DepartmentId, CreditToBeTaken) " +
                "VALUES(@teacherName, @teacherAddress, @teacherEmail, @teacherContactNo, @designationId, @departmentId, @creditToBeTaken)";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Command.Parameters.Clear();
            Command.Parameters.AddWithValue("teacherName", teacher.TeacherName);
            Command.Parameters.AddWithValue("teacherEmail", teacher.TeacherEmail);
            Command.Parameters.AddWithValue("teacherAddress", teacher.TeacherAddress);
            Command.Parameters.AddWithValue("teacherContactNo", teacher.TeacherContactNo);
            Command.Parameters.AddWithValue("designationId", teacher.DesignationId);
            Command.Parameters.AddWithValue("departmentId", teacher.DepartmentId);
            Command.Parameters.AddWithValue("creditToBeTaken", teacher.CreditToBeTaken);

            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected;
        }

        public bool IsExist(string email)
        {
            Connection.Open();
            Query = "SELECT * FROM TeacherTAble WHERE TeacherEmail='" + email + "'";
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

        public List<Teacher> GetTeachers()
        {
            Connection.Open();
            Query = "Select * from TeacherTable";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            List<Teacher> teacherList = new List<Teacher>();
            while (Reader.Read())
            {
                Teacher teacher = new Teacher()
                {
                    TeacherId = (int)Reader["TeacherId"],
                    TeacherName = (string)Reader["TeacherName"],
                    TeacherAddress = (string)Reader["TeacherAddress"],
                    TeacherEmail = (string)Reader["TeacherEmail"],
                    TeacherContactNo = (string)Reader["TeacherContactNo"],
                    DesignationId = (int)Reader["DesignationId"],
                    DepartmentId = (int)Reader["DepartmentId"],
                    CreditToBeTaken = (decimal)Reader["CreditToBeTaken"],
                };


                teacherList.Add(teacher);
            }
            Connection.Close();
            Reader.Close();
            return teacherList;
        }
    }
}