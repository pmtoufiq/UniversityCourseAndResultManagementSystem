using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystem.Models;

namespace UniversityCourseAndResultManagementSystem.Gateway
{
    public class DepartmentGateway : Gateway
    {
        public int Save(Department department)
        {
            Query =
                "INSERT INTO DepartmentTable(DepartmentCode, DepartmentName) VALUES(@departmentCode, @departmentName)";
            Command = new SqlCommand(Query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.AddWithValue("departmentCode", department.DepartmentCode);
            Command.Parameters.AddWithValue("departmentName", department.DepartmentName);
            Connection.Open();
            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected;
        }

        public bool IsExistDepartmentCode(string departmentCode)
        {
            Connection.Open();
            Query = "SELECT * FROM DepartmentTable WHERE DepartmentCode='" + departmentCode + "'";
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

        public bool IsExistDepartmentName(string departmentName)
        {
            Connection.Open();
            Query = "SELECT * FROM DepartmentTable WHERE DepartmentName='" + departmentName + "'";
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

        public List<Department> GetDepartments()
        {
            Connection.Open();
            Query = "Select * from DepartmentTable";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            List<Department> departmentList = new List<Department>();
            while (Reader.Read())
            {
                Department department = new Department
                {
                    DepartmentId = (int)Reader["DepartmentId"],
                    DepartmentCode = (string)Reader["DepartmentCode"],
                    DepartmentName = (string)Reader["DepartmentName"]
                };


                departmentList.Add(department);
            }
            Connection.Close();
            Reader.Close();
            return departmentList;
        }
    }
}