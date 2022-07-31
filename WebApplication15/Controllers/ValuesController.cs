using ASPNET_MVC_ChartsDemo.Models;
using LinqToExcel;
using Newtonsoft.Json;
using OfficeOpenXml;
using Rotativa;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Threading.Tasks;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication15.Models;

namespace WebApplication15.Controllers
{
    [Authorize]

    public class ValuesController : Controller

    {
        private Jenerator_infoEntities db = new Jenerator_infoEntities();




        //Call from Views/Values/ExprtToChart.cshtml(مقایسه ای button)
        [Authorize(Roles ="manager,analyzer")]
        public ActionResult Comparation2Days(int id) 
        {
            //ViewBag.Part = db.Parts.Find(id);
            ViewBag.PartID = id;
            return PartialView("Comparation2Days");
        }



        //Call From Views/Values/(Partialview)Comparation2Days.cshtml
        [HttpPost]
        [Authorize(Roles = "manager,analyzer")]
        public ActionResult Comparation2Days(int partID, DateTime FDate,DateTime LDate)
        {

            List<Value> F_list1 = db.Values.Where(p => p.PartID == partID && p.Date == FDate).ToList();
            List<Value> L_list1 = db.Values.Where(p => p.PartID == partID && p.Date == LDate).ToList();

            List<DataPoint> dataPoints1 = new List<DataPoint>();
            List<DataPoint> dataPoints2 = new List<DataPoint>();

            foreach (var i in F_list1)
            {
                if (i.Value1 != null)
                    dataPoints1.Add(new DataPoint((int)i.Clock, (int)i.Value1));
            }
            foreach (var i in L_list1)
            {
                if (i.Value1 != null)
                    dataPoints2.Add(new DataPoint((int)i.Clock, (int)i.Value1));
            }
            ViewBag.DataPoints1 = JsonConvert.SerializeObject(dataPoints1);
            ViewBag.DataPoints2 = JsonConvert.SerializeObject(dataPoints2);
            ViewBag.FDate = FDate.ToShortDateString();
            ViewBag.LDate = LDate.ToShortDateString();
            ViewBag.NameOfPart = db.Parts.Find(partID).Name;
            ViewBag.NameOfSection = db.Sections.Find(db.Parts.Find(partID).SectionID).SectionName;
            ViewBag.PartID = partID;
            Employee employee_Model = db.Employees.Find(User.Identity.Name);
            if (employee_Model == null)
            {
                Manager manager_Model = db.Managers.Find(User.Identity.Name);
                ViewBag.Model = manager_Model;
            }
            else
            {
                ViewBag.Model = employee_Model;
            }


            //viewbag مقدار دهی داده های آماری درون 
            //1_Average
            var a1 = db.Values.Where(p => p.Value1 != null && p.PartID == partID && p.Date == FDate).Select(p => p.Value1).Average();
            ViewBag.avg = $"{a1:N}"; 
            
            var a2 = db.Values.Where(p => p.Value1 != null && p.PartID == partID && p.Date == LDate).Select(p => p.Value1).Average();
            ViewBag.avg2 = $"{a2:N}";

            //2_Median
            int[] M1 = db.Values.Where(p => p.Value1 != null && p.PartID == partID && p.Date == FDate).Select(p => p.Value1).ToList().ToArray();
            int[] M2 = db.Values.Where(p => p.Value1 != null && p.PartID == partID && p.Date == LDate).Select(p => p.Value1).ToList().ToArray();
            int numberCount = M1.Count();
            int halfIndex = M1.Count() / 2;
            var sortedNumbers1 = M1.OrderBy(n => n);
            var sortedNumbers2 = M2.OrderBy(n => n);
            double median1;
            double median2;
            if ((numberCount % 2) == 0)
            {
                median1 = ((sortedNumbers1.ElementAt(halfIndex) + sortedNumbers1.ElementAt((halfIndex - 1))) / 2);
                median2 = ((sortedNumbers2.ElementAt(halfIndex) + sortedNumbers2.ElementAt((halfIndex - 1))) / 2);
            }
            else
            {
                median1 = sortedNumbers1.ElementAt(halfIndex);
                median2 = sortedNumbers2.ElementAt(halfIndex);
            }
            ViewBag.median = median1;
            ViewBag.median2 = median2;

            //3_Mode
            var mode1 = M1.GroupBy(n => n).OrderByDescending(g => g.Count()).Select(g => g.Key).FirstOrDefault();
            var mode2 = M2.GroupBy(n => n).OrderByDescending(g => g.Count()).Select(g => g.Key).FirstOrDefault();
            ViewBag.mod = mode1;
            ViewBag.mod2 = mode2;


            //4_Varianc
            double F_sum = 0;
            double L_sum = 0;
            List<int> F_list2 = db.Values.Where(p => p.Value1 != null && p.PartID == partID && p.Date == FDate).Select(p => p.Value1).ToList();
            List<int> L_list2 = db.Values.Where(p => p.Value1 != null && p.PartID == partID && p.Date == LDate).Select(p => p.Value1).ToList();
            foreach (var i in F_list2)
            {
                F_sum += Math.Pow(i - a1, 2);
            }
            foreach (var i in L_list2)
            {
                L_sum += Math.Pow(i - a1, 2);
            }
            F_sum /= F_list2.Count();
            L_sum /= L_list2.Count();
            ViewBag.varianc = $"{F_sum:N}";
            ViewBag.varianc2 = $"{L_sum:N}";


            //5_Enheraf_Meyar
            ViewBag.enheraf = $"{Math.Sqrt(F_sum):N}";
            ViewBag.enheraf2 = $"{Math.Sqrt(L_sum):N}";
            return View("ExportTochart");
        }



        //Call From Views/Home/HomePage.cshtml(Edit Info Button)
        //Call By Controler/Values/(Post Action Method)UpdateProfile
        [HttpGet]
        public ActionResult UpdateProfile()
        {
            var employee = db.Employees.Find(User.Identity.Name);
            if (employee == null)
            {
                return HttpNotFound();
            }
            ViewBag.Model = employee;
            return View();
        }



        //Call From Views/Shared/UpdateProfile.cshtml(Update Button)
        [HttpPost]
        public ActionResult UpdateProfile(Employee employee, HttpPostedFileBase imgUp)
        {
            if (imgUp != null)
            {
                if (employee.ImageName != null)
                {
                    System.IO.File.Delete(Server.MapPath("~/UserImages/" + employee.ImageName));
                }
                employee.ImageName = Guid.NewGuid() + Path.GetExtension(imgUp.FileName);
                imgUp.SaveAs(Server.MapPath("~/UserImages/" + employee.ImageName));
            }


            if (ModelState.IsValid)
            {
                employee.UserName = employee.UserName.Trim();
                employee.Password = employee.Password.Trim();
                employee.Roles = employee.Roles.Trim();
                if (employee.Name != null)
                    employee.Name = employee.Name.Trim();
                if (employee.Family != null)
                    employee.Family = employee.Family.Trim();
                if (employee.City != null)
                    employee.City = employee.City.Trim();
                if (employee.Address != null)
                    employee.Address = employee.Address.Trim();
                if (employee.Phone != null)
                    employee.Phone = employee.Phone.Trim();
                if (employee.Email != null)
                    employee.Email = employee.Email.Trim();

                db.Entry(employee).State = EntityState.Modified;
                try
                {
                    // Your code...
                    // Could also be before try if you know the exception occurs in SaveChanges

                    db.SaveChanges();
                }
                catch
                {

                }
                return RedirectToAction("UpdateProfile", "values", new { UserName_Employee = employee.UserName });

            }
            return HttpNotFound();
        }



        // GET: Values
        //Call By (onChange)cheange Date in Views/Values/Index.cshtml(Call By ajax)
        public ActionResult ChangeDate(Value value)
        {
            List<Value> val = db.Values.Where(p => p.PartID == value.PartID && p.Date == value.Date).ToList();
            if (val.Count == 0)
                for (int i = 1; i < 25; i++)
                {
                    Value V = new Value();
                    V.ID = db.Values.DefaultIfEmpty().Max(r => r == null ? 0 : r.ID) + i;
                    V.PartID = value.PartID;
                    V.Value1 = 0;
                    V.Date = value.Date;
                    V.Clock = i;
                    val.Add(V);
                    db.Values.Add(V);

                }
            try
            {
                db.SaveChanges();
            }
            catch { }
            ViewBag.PartID = value.PartID;
            ViewBag.Date = value.Date;

            //return Json(new { val, JsonRequestBehavior.AllowGet });
            return Json(new { newUrl = Url.Action("Index", val[0]) });
        }

        //public ActionResult sss(int id)
        //{
        //    return View();
        //}




        //Call From Views/Values/Index.cshtml(مقدار دهی با اکسل button)
        //this action return partialView for boorstrap Madal
        [Authorize(Roles = "manager,editor")]
        public ActionResult Upload(int id)
        {
            ViewBag.PartID = id;
            return PartialView();
        }




        //Call from Views/Values/Upload.cshtml
        [HttpPost]
        [Authorize(Roles = "manager,editor")]
        public ActionResult Upload(string Date, string FirstDate, string EndDate, int PartID, FormCollection UploadedFile)
        {
            DateTime date = DateTime.Now;
            DateTime firstdate = DateTime.Now;
            DateTime enddate = DateTime.Now;
            int interval_or_single = 0;
            if (Date != "")
            {
                date = DateTime.Parse(Date);
                interval_or_single = 0;
            }
            if (FirstDate != "")
            {
                firstdate = DateTime.Parse(FirstDate);
                interval_or_single = 1;

            }
            if (EndDate != "")
            {
                enddate = DateTime.Parse(EndDate);

            }

            var ValuesList = new List<Value>();
            if (Request != null)
            {
                HttpPostedFileBase file = Request.Files["UploadedFile"];
                if ((file != null) && (file.ContentLength > 0) && !string.IsNullOrEmpty(file.FileName))
                {
                    string fileName = file.FileName;
                    string fileContentType = file.ContentType;
                    byte[] fileBytes = new byte[file.ContentLength];
                    var data = file.InputStream.Read(fileBytes, 0, Convert.ToInt32(file.ContentLength));
                    ExcelPackage.LicenseContext = LicenseContext.Commercial;
                    ExcelPackage.LicenseContext = LicenseContext.NonCommercial;
                    using (ExcelPackage package = new ExcelPackage(file.InputStream))
                    {
                        var currentSheet = package.Workbook.Worksheets;
                        var workSheet = currentSheet.First();
                        var noOfCol = workSheet.Dimension.End.Column;
                        var noOfRow = workSheet.Dimension.End.Row;
                        //for single Date
                        if (interval_or_single == 0)
                        {
                            List<Value> remove_Previous_Values = new List<Value>();
                            remove_Previous_Values = db.Values.Where(p => p.PartID == PartID && p.Date == date).ToList();

                            if (remove_Previous_Values != null)
                                db.Values.RemoveRange(remove_Previous_Values);
                            try
                            {
                                db.SaveChanges();

                            }
                            catch { }
                            for (int rowIterator = 2; rowIterator <= noOfRow; rowIterator++)
                            {
                                var Value = new Value();
                                //Value.ID = Convert.ToInt32(workSheet.Cells[rowIterator, 1].Value);
                                Value.ID = db.Values.DefaultIfEmpty().Max(r => r == null ? 0 : r.ID) + rowIterator - 1;
                                Value.PartID = PartID;
                                //Value.PartID = Convert.ToInt32(workSheet.Cells[rowIterator, 2].Value);
                                Value.Value1 = Convert.ToInt32(workSheet.Cells[rowIterator, 2].Value);
                                //Value.PartID = workSheet.Cells[rowIterator, 2].Value.ToString();
                                //Value.Date = DateTime.Parse(workSheet.Cells[rowIterator, 2].Value.ToString());
                                Value.Date = date;
                                Value.Clock = Convert.ToInt32(workSheet.Cells[rowIterator, 1].Value);


                                ValuesList.Add(Value);
                                if (rowIterator == 25)
                                    break;
                            }
                        }
                        //for inderval date
                        else if (interval_or_single == 1)
                        {
                            List<Value> remove_Previous_Values = new List<Value>();
                            remove_Previous_Values = db.Values.Where(p => p.PartID == PartID && p.Date <= enddate && p.Date >= firstdate).ToList();
                            if (remove_Previous_Values != null)
                                db.Values.RemoveRange(remove_Previous_Values);
                            try
                            {
                                db.SaveChanges();
                            }
                            catch { }



                            DateTime DT = firstdate;
                            for (int rowIterator = 2; rowIterator <= noOfRow; rowIterator++)
                            {
                                var Value = new Value();
                                //Value.ID = Convert.ToInt32(workSheet.Cells[rowIterator, 1].Value);
                                Value.ID = db.Values.DefaultIfEmpty().Max(r => r == null ? 0 : r.ID) + rowIterator - 1;
                                Value.PartID = PartID;
                                //Value.PartID = Convert.ToInt32(workSheet.Cells[rowIterator, 2].Value);
                                Value.Value1 = Convert.ToInt32(workSheet.Cells[rowIterator, 2].Value);
                                //Value.PartID = workSheet.Cells[rowIterator, 2].Value.ToString();
                                //Value.Date = DateTime.Parse(workSheet.Cells[rowIterator, 2].Value.ToString());
                                Value.Date = DT;
                                Value.Clock = Convert.ToInt32(workSheet.Cells[rowIterator, 1].Value);


                                if (rowIterator % 24 == 1 && DT < enddate)
                                    DT = DT.AddDays(1);
                                ValuesList.Add(Value);
                            }
                        }

                    }
                }
            }
            using (Jenerator_infoEntities excelImportDBEntities = new Jenerator_infoEntities())
            {
                foreach (var item in ValuesList)
                {
                    excelImportDBEntities.Values.Add(item);
                }
                try
                {
                    excelImportDBEntities.SaveChanges();
                    //ViewBag.ResultExcelSave = true;




                }
                catch (Exception e)
                {
                    Console.WriteLine(e.Message);
                    //ViewBag.ResultExcelSave = false;

                }

            }
            List<Value> valueList = new List<Value>();
            if (interval_or_single == 0)
                valueList = db.Values.Where(p => p.PartID == PartID && p.Date == date).ToList();
            else if (interval_or_single == 1)
                valueList = db.Values.Where(p => p.PartID == PartID && p.Date == firstdate).ToList();

            //return View("Index", valueList);
            return RedirectToAction("Index", valueList.First());
        }




        //from Values/ExportToExcel  Action Controller
        //use for export to excel ;for single Date
        //use in ExportToExcel method
        [Authorize(Roles = "manager,editor")]
        public IList<Value> GetValuesList(int partID, DateTime Date)
        {
            Jenerator_infoEntities db = new Jenerator_infoEntities();
            var ValueList = db.Values.Where(p => p.Date == Date && p.PartID == partID).ToList();

            //typeof ValueList is DataTable
            return ValueList;
        }




        //use for export to excel for interval Date
        //use in ExportToExcel method
        //from Values/ExportToExcel  Action Controller
        [Authorize(Roles = "manager,editor")]
        public IList<Value> GetValuesList(int partID, DateTime FirstDate, DateTime EndDate)
        {
            Jenerator_infoEntities db = new Jenerator_infoEntities();
            var ValueList = db.Values.Where(p => p.Date >= FirstDate && p.Date <= EndDate && p.PartID == partID).OrderBy(d => d.Date).ToList();

            //this is return DataTable
            return ValueList;
        }



        //Call From View/Values/Index.cshtml
        public ActionResult ExportToExcel(int id)
        {
            ViewBag.PartID = id;
            return PartialView();
        }



        //from View/Values/ExportToExcel
        [HttpPost]
        public ActionResult ExportToExcel(string Date, string FirstDate, string EndDate, int PartID)
        {

            DateTime date = DateTime.Now;
            DateTime firstdate = DateTime.Now;
            DateTime enddate = DateTime.Now;
            int interval_or_single = 0;
            if (Date != "")
            {
                date = DateTime.Parse(Date);
                interval_or_single = 0;
            }
            if (FirstDate != "")
            {
                firstdate = DateTime.Parse(FirstDate);
                interval_or_single = 1;

            }
            if (EndDate != "")
            {
                enddate = DateTime.Parse(EndDate);

            }








            var gv = new GridView();
            if (interval_or_single == 0)
                gv.DataSource = this.GetValuesList(PartID, date);
            else if (interval_or_single == 1)
                gv.DataSource = this.GetValuesList(PartID, firstdate, enddate);

            gv.Font.Name = "Tahoma";
            gv.Font.Size = 10;
            gv.DataBind();
            Response.ClearContent();
            Response.Buffer = false;
            if (interval_or_single == 1)
                Response.AddHeader("content-disposition", "attachment; filename=" + firstdate.ToShortDateString() + " تا " + enddate.ToShortDateString() + ".xls");
            else if (interval_or_single == 0)
                Response.AddHeader("content-disposition", "attachment; filename=" + date.ToShortDateString() + ".xls");
            Response.ContentType = "application/ms-excel";
            Response.Charset = "";
            gv.HeaderStyle.ForeColor = System.Drawing.Color.FromArgb(0, 250, 140);
            gv.AlternatingRowStyle.BackColor = System.Drawing.Color.FromArgb(191, 191, 191);
            gv.AlternatingRowStyle.BackColor = System.Drawing.Color.FromArgb(191, 191, 191);
            gv.HeaderStyle.Font.Bold = true;
            StringWriter objStringWriter = new StringWriter();
            HtmlTextWriter objHtmlTextWriter = new HtmlTextWriter(objStringWriter);
            gv.RenderControl(objHtmlTextWriter);
            Response.Output.Write(objStringWriter.ToString());
            Response.Flush();
            Response.End();
            return RedirectToAction("Index");
        }



        //call from Views/ValuesExportToChart(نمودار گیر روزانه  buttom)
        [Authorize(Roles ="manager,analyzer")]
        public ActionResult IntervalDate(int id)
        {
            //ViewBag.Part = db.Parts.Find(id);
            ViewBag.PartID = id;
            return PartialView("IntervalDate");
        }




        //call from Views/Values/IntervalDate(madal)(نمودار گیر بازه ای  buttom)
        [Authorize(Roles = "manager,analyzer")]
        [HttpPost]
        public ActionResult IntervalDate(string Date1, string Date2, int PartID)
        {
            DateTime date1 = DateTime.Parse(Date1);
            DateTime date2 = DateTime.Parse(Date2);
            DateTime DT = date1;
            List<int> clock = new List<int>();
            List<int> value = new List<int>();
            List<Value> list = new List<Value>();

            //list = db.Values.Select(p => p).ToList();

            while (DT <= date2)
            {
                list = db.Values.Where(p => p.PartID == PartID && p.Date == DT).ToList();
                if (list.Count == 0)
                    for (int i = 1; i < 25; i++)
                    {
                        Value V = new Value();
                        V.ID = db.Values.DefaultIfEmpty().Max(r => r == null ? 0 : r.ID) + i;
                        V.PartID = PartID;
                        V.Value1 = 0;
                        V.Date = DT;
                        V.Clock = i;
                        list.Add(V);
                        db.Values.Add(V);

                    }
                DT = DT.AddDays(1);
                try
                {
                    db.SaveChanges();
                }
                catch { }

            }


            list = db.Values.Where(p => p.PartID == PartID && p.Date <= date2 && p.Date >= date1).ToList();

            List<DataPoint> dataPoints = new List<DataPoint>();
            var time = 0;
            var flag = 0;
            foreach (var i in list)
            {
                if (flag == 0)
                    time = (int)i.Clock;
                else
                    time++;
                if (time == 24)
                    flag = 1;


                if (i.Value1 != null)
                    dataPoints.Add(new DataPoint(time, (int)i.Value1));

                //else { dataPoints.Add(new DataPoint((int)i.Clock, 13)); }
            }
            ViewBag.DataPoints = JsonConvert.SerializeObject(dataPoints);
            ViewBag.Date1 = date1.ToShortDateString();
            ViewBag.Date2 = date2.ToShortDateString();
            ViewBag.NameOfPart = db.Parts.Find(PartID).Name;
            ViewBag.NameOfSection = db.Sections.Find(db.Parts.Find(PartID).SectionID).SectionName;
            ViewBag.PartID = PartID;
            Employee employee_Model = db.Employees.Find(User.Identity.Name);
            if (employee_Model == null)
            {
                Manager manager_Model = db.Managers.Find(User.Identity.Name);
                ViewBag.Model = manager_Model;
            }
            else
            {
                ViewBag.Model = employee_Model;
            }


            var a1 = db.Values.Where(p => p.Value1 != null && p.Date <= date2 && p.Date >= date1).Select(p => p.Value1).Average();
            ViewBag.avg = $"{a1:N}";

            List<int> list2 = new List<int>();

            list2 = db.Values.Where(p => p.Value1 != null && p.Date <= date2 && p.Date >= date1).Select(p => p.Value1).ToList();
            int[] a3 = list2.ToArray();
            int numberCount = a3.Count();
            int halfIndex = a3.Count() / 2;
            var sortedNumbers = a3.OrderBy(n => n);
            double median;
            if ((numberCount % 2) == 0)
            {
                median = ((sortedNumbers.ElementAt(halfIndex) + sortedNumbers.ElementAt((halfIndex - 1))) / 2);
            }
            else
            {
                median = sortedNumbers.ElementAt(halfIndex);
            }
            ViewBag.median = median;


            int[] a = list2.ToArray();
            var mode = a.GroupBy(n => n).OrderByDescending(g => g.Count()).Select(g => g.Key).FirstOrDefault();
            ViewBag.mod = mode;

            double sum = 0;
            foreach (var i in list2)
            {
                sum += Math.Pow(i - a1, 2);
            }
            sum /= list2.Count();
            ViewBag.varianc = $"{sum:N}";
            ViewBag.enheraf = $"{Math.Sqrt(sum):N}";
            return View("ExportToChart");



        }



        //call from Views/Values/SingleDate(madal)
        //call by نمودار گیر بازه ای  buttom in SingleDate.cshtml
        [Authorize(Roles = "manager,analyzer")]
        [HttpPost]
        public ActionResult SingleDate(int PartID, DateTime Date)
        {
            //DateTime date = DateTime.Parse(Date) ;
            List<int> clock = new List<int>();
            List<int> value = new List<int>();
            List<Value> list = new List<Value>();

            list = db.Values.Where(p => p.PartID == PartID && p.Date == Date).ToList();
            if (list.Count == 0)
                for (int i = 1; i < 25; i++)
                {
                    Value V = new Value();
                    V.ID = db.Values.DefaultIfEmpty().Max(r => r == null ? 0 : r.ID) + i;
                    V.PartID = PartID;
                    V.Value1 = 0;
                    V.Date = Date;
                    V.Clock = i;
                    list.Add(V);
                    db.Values.Add(V);

                }
            try
            {
                db.SaveChanges();
            }
            catch { }



            List<DataPoint> dataPoints = new List<DataPoint>();

            foreach (var i in list)
            {
                if (i.Value1 != null)
                    dataPoints.Add(new DataPoint((int)i.Clock, (int)i.Value1));
            }
            ViewBag.DataPoints = JsonConvert.SerializeObject(dataPoints);
            ViewBag.Date = Date.ToShortDateString();
            ViewBag.NameOfPart = db.Parts.Find(PartID).Name;
            ViewBag.NameOfSection = db.Sections.Find(db.Parts.Find(PartID).SectionID).SectionName;
            ViewBag.PartID = PartID;
            Employee employee_Model = db.Employees.Find(User.Identity.Name);
            if (employee_Model == null)
            {
                Manager manager_Model = db.Managers.Find(User.Identity.Name);
                ViewBag.Model = manager_Model;
            }
            else
            {
                ViewBag.Model = employee_Model;
            }




            var a1 = db.Values.Where(p => p.Value1 != null && p.Date == Date).Select(p => p.Value1).Average();
            ViewBag.avg = $"{a1:N}";

            List<int> list2 = new List<int>();
            list2 = db.Values.Where(p => p.Value1 != null && p.Date == Date).Select(p => p.Value1).ToList();
            int[] a3 = list2.ToArray();
            int numberCount = a3.Count();
            int halfIndex = a3.Count() / 2;
            var sortedNumbers = a3.OrderBy(n => n);
            double median;
            if ((numberCount % 2) == 0)
            {
                median = ((sortedNumbers.ElementAt(halfIndex) + sortedNumbers.ElementAt((halfIndex - 1))) / 2);
            }
            else
            {
                median = sortedNumbers.ElementAt(halfIndex);
            }
            ViewBag.median = median;


            int[] a = list2.ToArray();
            var mode = a.GroupBy(n => n).OrderByDescending(g => g.Count()).Select(g => g.Key).FirstOrDefault();
            ViewBag.mod = mode;

            double sum = 0;
            foreach (var i in list2)
            {
                sum += Math.Pow(i - a1, 2);
            }
            sum /= list2.Count();
            ViewBag.varianc = $"{sum:N}";
            ViewBag.enheraf = $"{Math.Sqrt(sum):N}";
            return View("ExportToChart");
        }



        //call from Views/ValuesExportToChart
        //call by نمودار گیر روزانه  buttom
        [Authorize(Roles = "manager,analyzer")]
        public ActionResult SingleDate(int id)
        {
            ViewBag.PartID = id;
            return PartialView("_SingleDate");
        }



        //Call from Views/Values/Index.cshtml
        //Call By Controller/Values/(Action method)Comparation2Days
        [Authorize(Roles = "manager,analyzer")]
        public ActionResult ExportToChart(int partID, DateTime Date)
        {
            List<int> clock = new List<int>();
            List<int> value = new List<int>();
            List<Value> list = new List<Value>();

            //list = db.Values.Select(p => p).ToList();
            list = db.Values.Where(p => p.PartID == partID && p.Date == Date).ToList();

            List<DataPoint> dataPoints = new List<DataPoint>();

            foreach (var i in list)
            {
                if (i.Value1 != null)
                    dataPoints.Add(new DataPoint((int)i.Clock, (int)i.Value1));
                //else { dataPoints.Add(new DataPoint((int)i.Clock, 13)); }
            }
            ViewBag.DataPoints = JsonConvert.SerializeObject(dataPoints);
            ViewBag.Date = Date.ToShortDateString();
            ViewBag.NameOfPart = db.Parts.Find(partID).Name;
            ViewBag.NameOfSection = db.Sections.Find(db.Parts.Find(partID).SectionID).SectionName;
            ViewBag.PartID = partID;
            Employee employee_Model = db.Employees.Find(User.Identity.Name);
            if (employee_Model == null)
            {
                Manager manager_Model = db.Managers.Find(User.Identity.Name);
                ViewBag.Model = manager_Model;
            }
            else
            {
                ViewBag.Model = employee_Model;
            }



            //محاسبه ی داده های آماری
            //1_میانگین
            var a1 = db.Values.Where(p => p.Value1 != null && p.Date == Date).Select(p => p.Value1).Average();
            ViewBag.avg = $"{a1:N}";

            //2_میانه
            List<int> list2 = new List<int>();
            list2 = db.Values.Where(p => p.Value1 != null && p.Date == Date).Select(p => p.Value1).ToList();
            int[] a3 = list2.ToArray();
            int numberCount = a3.Count();
            int halfIndex = a3.Count() / 2;
            var sortedNumbers = a3.OrderBy(n => n);
            double median;
            if ((numberCount % 2) == 0)
            {
                median = ((sortedNumbers.ElementAt(halfIndex) + sortedNumbers.ElementAt((halfIndex - 1))) / 2);
            }
            else
            {
                median = sortedNumbers.ElementAt(halfIndex);
            }
            ViewBag.median = median;

            //3_مد
            int[] a = list2.ToArray();
            var mode = a.GroupBy(n => n).OrderByDescending(g => g.Count()).Select(g => g.Key).FirstOrDefault();
            ViewBag.mod = mode;

            double sum = 0;
            foreach (var i in list2)
            {
                sum += Math.Pow(i - a1, 2);
            }
            sum /= list2.Count();
            //4_ واریانس
            ViewBag.varianc = $"{sum:N}";

            //5_انحراف معیار
            ViewBag.enheraf = $"{Math.Sqrt(sum):N}";
            return View();
        }


        //Call From Views/Parts/(PartialView)Details.cshtml
        public ActionResult Index(Value value)
        {
            List<Value> val = db.Values.Where(p => p.PartID == value.PartID && p.Date == value.Date).ToList();
            if (val.Count == 0)
                for (int i = 1; i < 25; i++)
                {
                    Value V = new Value();
                    V.ID = db.Values.DefaultIfEmpty().Max(r => r == null ? 0 : r.ID) + i;
                    V.PartID = value.PartID;
                    V.Value1 = 0;
                    V.Date = value.Date;
                    V.Clock = i;
                    val.Add(V);
                    db.Values.Add(V);

                }
            try
            {
                db.SaveChanges();
                ViewBag.ResultSave = true;
            }
            catch { ViewBag.ResultSave = false; }
            ViewBag.PartID = value.PartID;
            ViewBag.Date = value.Date;
            ViewBag.SectionID = db.Parts.Find(value.PartID).SectionID;
            //if(ResultSave != null)
            //    ViewBag.ResultOfSave = ResultSave;
            return View(val);
        }



        //Call From Views/Values/Index.cshtml(Save button)
        [HttpPost]
        [Authorize(Roles = "manager,editor")]
        public ActionResult SaveingDB(IList<Value> values)
        {
            for (int i = 0; i < values.Count; i++)
            {

                Value val = db.Values.Find(values[i].ID);
                if (val != null)
                {
                    val.PartID = values[i].PartID;
                    val.Value1 = values[i].Value1;
                    val.Date = values[i].Date;
                    val.Clock = values[i].Clock;
                }
                else
                {
                    db.Values.Add(values[i]);
                }
            }
            try
            {
                db.SaveChanges();
                ViewBag.ResultOfSave = true;
            }
            catch { ViewBag.ResultOfSave = false; }
            ViewBag.PartID = values[0].PartID;
            ViewBag.Date = values[0].Date;
            //return View("Index",values);
            return RedirectToAction("Index", values[0]);
        }



        //from Views/Values/Index.cshtml(Pdf Button)
        public ActionResult PrintPartialViewToPdf(int id)
        {
            ViewBag.PartID = id;
            return PartialView();

        }


        [HttpPost]
        //from Views/Values/PrintPartialViewToPdf
        public ActionResult PrintPartialViewToPdf(string Date, string FirstDate, string EndDate, int PartID)
        {

            DateTime date = DateTime.Now;
            DateTime firstdate = DateTime.Now;
            DateTime enddate = DateTime.Now;
            int interval_or_single = 0;
            if (Date != "")
            {
                date = DateTime.Parse(Date);
                interval_or_single = 0;
            }
            if (FirstDate != "")
            {
                firstdate = DateTime.Parse(FirstDate);
                interval_or_single = 1;

            }
            if (EndDate != "")
            {
                enddate = DateTime.Parse(EndDate);

            }
            List<Value> list = new List<Value>();


            if (interval_or_single == 0)
            {
                list = db.Values.Where(p => p.PartID == PartID && p.Date == date).ToList();
                ViewBag.SectionName = db.Sections.Find(db.Parts.Find(PartID).SectionID).SectionName;
                ViewBag.PartName = db.Parts.Find(PartID).Name;
                ViewBag.Date = date.ToShortDateString();

            }
            else if (interval_or_single == 1)
            {
                list = db.Values.Where(p => p.PartID == PartID && p.Date <= enddate && p.Date >= firstdate).OrderBy(p => p.Date).ToList();
                ViewBag.SectionName = db.Sections.Find(db.Parts.Find(PartID).SectionID).SectionName;
                ViewBag.PartName = db.Parts.Find(PartID).Name;
                ViewBag.firstdate = firstdate.ToShortDateString();
                ViewBag.enddate = enddate.ToShortDateString();
            }
            var report = new PartialViewAsPdf("~/Views/Values/DetailCustomer.cshtml", list);
            return report;
        }



        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }






        // GET: Values/Edit/5
        //must remove
        //public ActionResult Edit(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Value value = db.Values.Find(id);
        //    if (value == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    ViewBag.PartID = new SelectList(db.Parts, "ID", "Name", value.PartID);
        //    return View(value);
        //}



        // POST: Values/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //must remove
        //public ActionResult Edit([Bind(Include = "ID,PartID,Value1,Date,Clock")] Value value)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Entry(value).State = EntityState.Modified;
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }
        //    ViewBag.PartID = new SelectList(db.Parts, "ID", "Name", value.PartID);
        //    return View(value);
        //}

        // GET: Values/Delete/5
        //must remove
        //public ActionResult Delete(int? id)
        //{
        //    if (id == null)
        //    {
        //        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
        //    }
        //    Value value = db.Values.Find(id);
        //    if (value == null)
        //    {
        //        return HttpNotFound();
        //    }
        //    return View(value);
        //}

        // POST: Values/Delete/5
        //[HttpPost, ActionName("Delete")]
        //[ValidateAntiForgeryToken]
        //must remove
        //public ActionResult DeleteConfirmed(int id)
        //{
        //    Value value = db.Values.Find(id);
        //    db.Values.Remove(value);
        //    db.SaveChanges();
        //    return RedirectToAction("Index");
        //}


    }
}