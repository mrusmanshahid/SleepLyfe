using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Activation;
using System.Text;
//using EDF;
using System.IO;
using Newtonsoft.Json;

[ServiceContract(Namespace = "SleepProfiler")]
[AspNetCompatibilityRequirements(RequirementsMode = AspNetCompatibilityRequirementsMode.Allowed)]

public class ProfilerService
{
    vitalusEntities context = new vitalusEntities();

    [OperationContract]
    public string getAllCustomers()
    {
        try
        {
            var lst = context.Questionnares
                .Where(x => x.login.Type == "user")
                .AsEnumerable()
                .Select(x => new
                {
                    Id = x.login.LoginID,
                    Value = x.login.Username.ToUpper() + " - " + x.Firstname
                }).ToList();
            var JSON = JsonConvert.SerializeObject(lst);
            return JSON;
        }
        catch (Exception e)
        {
            return null;
        }
    }



    [OperationContract]
    public string getPatiendSummary(int Pid)
    {
        try
        {
            var lst = context.Questionnares.Where(x => x.Login_id == Pid).Select(x => new
            {
                x.Firstname,
                x.Lastname,
                x.Middlename,
                x.Age,
                x.Weight,
                x.height_feet,
                x.height_inches,
                x.Gender,
                x.DateofBirth
            }).ToList();
            var JSON = JsonConvert.SerializeObject(lst);
            return JSON;
        }
        catch (Exception e)
        {
            return null;
        }
    }

    //[OperationContract]
    //public string getEDFData()
    //{
    //    try
    //    {
    //        EDFFile edfFileInput = new EDFFile();
    //        //       var a =  Directory.GetCurrentDirectory();
    //        edfFileInput.readFile(@"F:\Usman Shahid\PrivateProjects\SleepAn\Files\abc.edf");
    //        var _edfFileInput = edfFileInput.DataRecords.Take(1000).ToList();
    //        var JSON = JsonConvert.SerializeObject(_edfFileInput);
    //       // var JSON = "";// _edfFileInput;


    //        return JSON;
    //    }
    //    catch (Exception e)
    //    {
    //        return null;
    //    }

    //}
}
