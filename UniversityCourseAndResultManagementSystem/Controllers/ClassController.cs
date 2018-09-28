using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Web;
using System.Web.Mvc;
using UniversityCourseAndResultManagementSystem.Manager;
using UniversityCourseAndResultManagementSystem.Models;

namespace UniversityCourseAndResultManagementSystem.Controllers
{

    public class ClassController : Controller
    {
        AllocateClassRoomManager allocateClassRoomManager = new AllocateClassRoomManager();
        DepartmentManager departmentManager = new DepartmentManager();
        CourseManager courseManager = new CourseManager();
        RoomManager roomManager = new RoomManager();
        DayManager dayManager = new DayManager();
        
        public ActionResult Save()
        {
            ViewBag.Departments = GetDepartments();
            ViewBag.Courses = GetCourses();
            ViewBag.Rooms = GetRooms();
            ViewBag.Days = GetDays();
            return View();
        }

        [HttpPost]
        public ActionResult Save(AllocateClassRoom allocateClassRoom)
        {
            ViewBag.Message = allocateClassRoomManager.Save(allocateClassRoom);
            ViewBag.Departments = GetDepartments();
            ViewBag.Courses = GetCourses();
            ViewBag.Rooms = GetRooms();
            ViewBag.Days = GetDays();
            return View();
        }

        private List<Department> GetDepartments()
        {
            return departmentManager.GetDepartments();
        }
        private List<Course> GetCourses()
        {
            return courseManager.GetCourses();
        }

        private List<Room> GetRooms()
        {
            return roomManager.GetRooms();
        }

        private List<Day> GetDays()
        {
            return dayManager.GetDays();
        }

        public JsonResult GetCoursesByDepartmentId(int DepartmentId)
        {
            var courses = GetCourses();
            var courseList = courses.Where(a => a.DepartmentId == DepartmentId).ToList();
            return Json(courseList);
        }
	}
}