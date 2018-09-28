using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityCourseAndResultManagementSystem.Manager;
using UniversityCourseAndResultManagementSystem.Models;

namespace UniversityCourseAndResultManagementSystem.Controllers
{
    
    public class TeacherController : Controller
    {

        //
        // GET: /Teacher/

        DesignationManager designationManager = new DesignationManager();
        DepartmentManager departmentManager = new DepartmentManager();
        TeacherManager teacherManager = new TeacherManager();
        CourseManager courseManager = new CourseManager();

        [HttpGet]
        public ActionResult SaveTeacher()
        {
            ViewBag.Departments = departmentManager.GetDepartments();
            ViewBag.Designations = designationManager.GetDesignations();
            return View();
        }
        [HttpPost]
        public ActionResult SaveTeacher(Teacher teacher)
        {
            ViewBag.Message = teacherManager.Save(teacher);
            ViewBag.Departments = departmentManager.GetDepartments();
            ViewBag.Designations = designationManager.GetDesignations();
            return View();
        }

        //teacher assign

        public ActionResult AssignCourse()
        {
            ViewBag.Departments = GetDepartments();
            return View();
        }

        [HttpPost]
        public ActionResult AssignCourse(AssignCourse assignCourse)
        {
            ViewBag.Message = courseManager.AssignCourse(assignCourse);
            ViewBag.Departments = GetDepartments();
            return View();
        }

        public JsonResult GetTeachersByDepartmentId(int DepartmentId)
        {
            var teachers = GetTeachers();
            var teacherList = teachers.Where(a => a.DepartmentId == DepartmentId).ToList();
            return Json(teacherList);
        }

        public JsonResult GetTeacherById(int teacherId)
        {
            var teachers = GetTeachers();
            Teacher teacher = teachers.FirstOrDefault(c => c.TeacherId == teacherId);
            teacher.RemainingCredit = teacher.CreditToBeTaken - GetCourseCredit(teacherId);
            
            return Json(teacher);
        }

        private List<Department> GetDepartments()
        {
            return departmentManager.GetDepartments();
        }

        private List<Teacher> GetTeachers()
        {
            return teacherManager.GetTeachers();
        }

        public decimal GetCourseCredit(int teacherId)
        {
            return courseManager.GetCourseCredit(teacherId);
        }
	}
}