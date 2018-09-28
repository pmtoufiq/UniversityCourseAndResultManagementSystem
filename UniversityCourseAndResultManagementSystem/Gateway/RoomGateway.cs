using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystem.Models;

namespace UniversityCourseAndResultManagementSystem.Gateway
{
    public class RoomGateway:Gateway
    {
        public List<Room> GetRooms()
        {
            Connection.Open();
            Query = "Select * from RoomTable";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            List<Room> roomList = new List<Room>();
            while (Reader.Read())
            {
                Room room = new Room
                {
                    RoomId = (int)Reader["RoomId"],
                    RoomNo = (int)Reader["RoomNo"],
                };
                roomList.Add(room);
            }
            Connection.Close();
            Reader.Close();
            return roomList;
        }
    }
}