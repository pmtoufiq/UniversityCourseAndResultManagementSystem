using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystem.Models;

namespace UniversityCourseAndResultManagementSystem.Gateway
{
    public class DayGateway:Gateway
    {
        public List<Day> GetDays()
        {
            Connection.Open();
            Query = "Select * from DayTable";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            List<Day> dayList = new List<Day>();
            while (Reader.Read())
            {
                Day day = new Day
                {
                    DayId = (int)Reader["DayId"],
                    DayName = (string)Reader["DayName"],
                };
                dayList.Add(day);
            }
            Connection.Close();
            Reader.Close();
            return dayList;
        }
    }
}