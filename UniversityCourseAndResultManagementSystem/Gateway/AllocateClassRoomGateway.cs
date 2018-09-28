using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystem.Models;

namespace UniversityCourseAndResultManagementSystem.Gateway
{
    public class AllocateClassRoomGateway:Gateway
    {
        public int Save(AllocateClassRoom allocateClassRoom)
        {
            Query =
                "INSERT INTO AllocateClassRoomTable(DepartmentId, CourseId, RoomId, DayId, From, To) VALUES(@departmentId, @courseId, @roomId, @dayId, @from, @to)";
            Command = new SqlCommand(Query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.AddWithValue("departmentId", allocateClassRoom.DepartmentId);
            Command.Parameters.AddWithValue("courseId", allocateClassRoom.CourseId);
            Command.Parameters.AddWithValue("roomId", allocateClassRoom.RoomId);
            Command.Parameters.AddWithValue("dayId", allocateClassRoom.DayId);
            Command.Parameters.AddWithValue("from", allocateClassRoom.From);
            Command.Parameters.AddWithValue("to", allocateClassRoom.To);
            Connection.Open();
            int rowAffected = Command.ExecuteNonQuery();
            Connection.Close();
            return rowAffected;
        }
    }
}