using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityCourseAndResultManagementSystem.Manager;
using UniversityCourseAndResultManagementSystem.Models;

namespace UniversityCourseAndResultManagementSystem.Controllers
{
    public class CourseController : Controller
    {
        //
        // GET: /Course/
        CourseManager courseManager = new CourseManager();
        DepartmentManager departmentManager = new DepartmentManager();
        SemesterManager semesterManager = new SemesterManager();
        [HttpGet]
        public ActionResult SaveCourse()
        {
            ViewBag.Departments = departmentManager.GetDepartments();
            ViewBag.Semesters = semesterManager.GetSemesters();
            return View();
        }

        [HttpPost]
        public ActionResult SaveCourse(Course course)
        {
            ViewBag.Message = courseManager.Save(course);
            ViewBag.Departments = departmentManager.GetDepartments();
            ViewBag.Semesters = semesterManager.GetSemesters();
            return View();
        }
        private List<Course> GetCourses()
        {
            return courseManager.GetCourses();
        }

        public JsonResult GetCourseById(int courseId)
        {
            var courses = GetCourses();
            Course course = courses.FirstOrDefault(c => c.CourseId == courseId);
            return Json(course);
        }

        public JsonResult GetCoursesByDepartmentId(int DepartmentId)
        {
            var courses = GetCourses();
            var courseList = courses.Where(a => a.DepartmentId == DepartmentId).ToList();
            return Json(courseList);
        }
	}
}