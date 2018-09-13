using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystem.Models;

namespace UniversityCourseAndResultManagementSystem.Gateway
{
    public class DesignationGateway : Gateway
    {
        public List<Designation> GetDesignations()
        {
            Query = "SELECT * FROM DesignationTable";
            Command = new SqlCommand(Query, Connection);
            Connection.Open();
            Reader = Command.ExecuteReader();
            List<Designation> designationList = new List<Designation>();
            while (Reader.Read())
            {
                Designation designation = new Designation
                {
                    DesignationId = (int)Reader["DesignationId"],
                    DesignationName = Reader["DesignationName"].ToString()
                };
                designationList.Add(designation);
            }
            Connection.Close();
            Reader.Close();
            return designationList;
        }
    }
}