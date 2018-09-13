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
	}
}