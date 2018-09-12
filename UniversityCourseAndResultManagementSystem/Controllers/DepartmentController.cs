using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using UniversityCourseAndResultManagementSystem.Manager;
using UniversityCourseAndResultManagementSystem.Models;

namespace UniversityCourseAndResultManagementSystem.Controllers
{
    public class DepartmentController : Controller
    {
        //
        // GET: /Department/
        DepartmentManager departmentManager = new DepartmentManager();
        public string Save(Department department)
        {
            return departmentManager.Save(department);
        }
        [HttpGet]
        public ActionResult SaveDepartment()
        {
            return View();
        }
        [HttpPost]
        public ActionResult SaveDepartment(Department department)
        {
            ViewBag.Message = departmentManager.Save(department);
            return View();
        }

        public List<Department> GetDepartments()
        {
            return departmentManager.GetDepartments();
        }

        public ActionResult ShowDepartment()
        {
            List<Department> departments = GetDepartments();
            return View(departments);
        }
	}
}