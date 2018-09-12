using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using UniversityCourseAndResultManagementSystem.Gateway;
using UniversityCourseAndResultManagementSystem.Models;

namespace UniversityCourseAndResultManagementSystem.Manager
{
    public class DepartmentManager
    {
        DepartmentGateway departmentGateway = new DepartmentGateway();
        public string Save(Department department)
        {
            if (departmentGateway.IsExistDepartmentCode(department.DepartmentCode))
            {
                return "This department code already exist.";
            }
            if (departmentGateway.IsExistDepartmentName(department.DepartmentName))
            {
                return "This department name already exist.";
            }
            if (departmentGateway.Save(department)>0)
            {
                return "Department saved successfully.";
            }
            return "Failed to save the Department.";
        }

        public bool IsExistDepartmentCode(string departmentCode)
        {
            return departmentGateway.IsExistDepartmentCode(departmentCode);
        }

        public bool IsExistDepartmentName(string departmentName)
        {
            return departmentGateway.IsExistDepartmentName(departmentName);
        }

        public List<Department> GetDepartments()
        {
            return departmentGateway.GetDepartments();
        } 
    }
}