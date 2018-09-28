using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystem.Gateway;
using UniversityCourseAndResultManagementSystem.Models;

namespace UniversityCourseAndResultManagementSystem.Manager
{
    public class AllocateClassRoomManager
    {
        AllocateClassRoomGateway allocateClassRoomGateway = new AllocateClassRoomGateway();
        public string Save(AllocateClassRoom allocateClassRoom)
        {
            if (allocateClassRoomGateway.Save(allocateClassRoom) > 0)
            {
                return "The class room allocated successfully.";
            }
            return "Failed to allocate the class room.";
        }
    }
}