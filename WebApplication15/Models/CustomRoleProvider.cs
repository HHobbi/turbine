using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using WebApplication15.Models;

namespace Myproject.Security
{
    public class CustomRoleProvider : RoleProvider
    {
        //این کلاس کلا جهت احراز هویت ایجاد شده است
        Jenerator_infoEntities db = new Jenerator_infoEntities();

        public override string ApplicationName { get => throw new NotImplementedException(); set => throw new NotImplementedException(); }

        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }
        
        public override void CreateRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException();
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            throw new NotImplementedException();
        }

        public override string[] GetAllRoles()
        {
            return db.Employees.Select(r => r.Roles).ToArray();
        }

        public override string[] GetRolesForUser(string username = "")
        {

            Jenerator_infoEntities db1 = new Jenerator_infoEntities();

            Employee employee = new Employee();
            employee = db1.Employees.FirstOrDefault(u => u.UserName.Equals(username, StringComparison.CurrentCultureIgnoreCase));
            string[] rol = { "", "" };
            if (employee != null)
            {
                rol = employee.Roles.Split(',');
                return rol;

            }
            else if (employee == null)
            {
                Manager manager = db1.Managers.FirstOrDefault(u => u.UserName.Equals(username, StringComparison.CurrentCultureIgnoreCase));

                rol = manager.Roles.Split(',');
                return rol;

            }

            //var roles = from ur in employee.Roles from r in db.Roles where ur.RoleId == r.Id select r.Name;
            //var roles = db.Employees.Where(p => p.UserName == username).Select(p => p.Roles);//
            //var roles = db.Employees.Find(username).Roles;
            else {
                return new string[] { };

            }



        }

        public override string[] GetUsersInRole(string roleName)
        {
            throw new NotImplementedException();
        }

        public override bool IsUserInRole(string username, string roleName)
        {


            Employee employee = db.Employees.FirstOrDefault(u => u.UserName.Equals(username, StringComparison.CurrentCultureIgnoreCase));

            //var roles = from ur in employee.Roles from r in db.Roles where ur.RoleId == r.Id select r.Name;
            var roles = db.Employees.Where(p => p.Roles == roleName).Select(p => p.Roles);//
            if (employee != null)
                return roles.Any(r => r.Equals(roleName, StringComparison.CurrentCultureIgnoreCase));
            else
                return false;

        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            throw new NotImplementedException();
        }

        public override bool RoleExists(string roleName)
        {
            throw new NotImplementedException();
        }
    }
}