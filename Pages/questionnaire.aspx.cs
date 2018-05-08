using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

public partial class questionnaire : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Select();
        // DisplayData();
        if (Session["LoginState"] == null)
        {
            Response.Redirect("~/Pages/landingpage.aspx");
        }


    }

    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        //string script3 = "alert('asas');";
        //ScriptManager.RegisterStartupScript(this, GetType(),
        //                      "ServerControlScript", script3, true);
        insertData();

    }

    protected void abc(object sender, EventArgs e)
    {

        hidTAB.Value = "#menu1";
        insertData();

    }


    public void Select()
    {

        vitalusEntities objvt = new vitalusEntities();
    }

    public void DisplayData()
    {


    }


    public int insertData()
    {
        try
        {
            vitalusEntities objvt = new vitalusEntities();
            Questionnare objq = new Questionnare();

            //firstTab
            objq.Login_id = Convert.ToInt16(Session["LoginId"].ToString());
            objq.Firstname = firstn.Value;
            objq.Middlename = middlen.Value;
            objq.Lastname = lastn.Value;
            objq.Weight = Convert.ToInt32(weight.Value);
            objq.Age = Convert.ToInt32(age.Value);
            objq.Gender = gender.SelectedItem.Value;
            objq.height_feet = Convert.ToInt32(heightinfeet.Value);
            objq.height_inches = Convert.ToInt32(heightinches.Value);
            objq.DateofBirth = DOB.Value;
            ////SecondTab
            objq.HighBloodPressure = HighBlood.SelectedValue;
            objq.HeartDisease = HeartDisease.SelectedValue;
            objq.Diabetes = Diabetes.SelectedValue;
            objq.RestLessSyndrome = RestlessLeg.SelectedValue;
            objq.SleepApnea = SleepApnea.SelectedValue;
            objq.Insomnia = Insomni.SelectedValue;
            objq.Narcolepsy = Narcolepsy.SelectedValue;
            objq.Depression = Depression.SelectedValue;
            objq.Stroke = Stroke.SelectedValue;
            objq.AMHeadaches = Headaches.SelectedValue;
            ////ThirdTab
            objq.SittingandReading = Convert.ToInt32(Sittingandreading.SelectedValue);
            objq.WatchingTV = Convert.ToInt32(WatchingTV.SelectedValue);
            objq.Sittinginactive = Convert.ToInt32(Sittinginactive.SelectedValue);
            objq.AsPassenger = Convert.ToInt32(passenger.SelectedValue);
            objq.LyingDown = Convert.ToInt32(afternoon.SelectedValue);
            objq.SittingTalking = Convert.ToInt32(Sittingandtalking.SelectedValue);
            objq.SittingQuietly = Convert.ToInt32(Sittingquietly.SelectedValue);
            objq.InCar = Convert.ToInt32(whilestopped.SelectedValue);
            ////FourthTab

            objq.DifficultyFallingaseelp = fallingasleep.SelectedValue;
            objq.DifficultyStayingaseelp = stayingasleep.SelectedValue;
            objq.ProblemWaking = problemwakingup.SelectedValue;
            objq.SleepProblem = sleepproblem.SelectedValue;
            objq.DrinkAlcohol = drinkalcoholic.SelectedValue;
            objq.Beverages = beverage.SelectedValue;

            ////FifthTab
            objq.LegsAtNight = legsatnight.SelectedValue;
            objq.Vivid = vivid.SelectedValue;
            objq.Snored = snored.SelectedValue;
            objq.Choking = choking.SelectedValue;
            objq.StopBreathing = stopbreathing.SelectedValue;
            objq.Medication = medication.SelectedValue;
            objq.OvertheCounter = overthecounter.SelectedValue;

            ////SixthTab
            objq.Ambien = Ambien.SelectedValue;
            objq.Lunesta = Lunesta.SelectedValue;
            objq.Halcion = Halcion.SelectedValue;
            objq.Rozerem = Rozerem.SelectedValue;
            objq.Sonata = Sonata.SelectedValue;
            objq.Restoril = Restoril.SelectedValue;
            objq.Intermezzo = Intermezzo.SelectedValue;
            objq.Silenor = Silenor.SelectedValue;
            objq.Xanax = Xanax.SelectedValue;
            objq.NarcoticForPain = Narcotic.SelectedValue;
            objq.HighBloodPressure = HighBlood.SelectedValue;
            objq.Steroid = Steroid.SelectedValue;
            objq.HeartDisease = HeartDisease.SelectedValue;
            objq.AntiDepressant = Antidepressant.SelectedValue;
            objq.Parkinson = Parkinson.SelectedValue;
            objq.Antihistamines = Antihistamines.SelectedValue;
            objq.Anitanxiety = anxiety.SelectedValue;
            objq.Simulant = Stimulant.SelectedValue;

            objvt.Questionnares.Add(objq);
            objvt.SaveChanges();
            string script3 = "alert('Successfully Updated!');";
            ScriptManager.RegisterStartupScript(this, GetType(),
                      "ServerControlScript", script3, true);
            return 1;
        }
        catch (Exception ex)
        {
            string script3 = "alert('All Fields Are Mandatory');";
            ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script3, true);
            return 0;
        }
    }

    protected void btn_menu1_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", "$('.nxtMenu1')[0].click();", true);
    }

    protected void btn_Menu2_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(),
                                 "ServerControlScript", "$('.nxtMenu2')[0].click();", true);
    }

    protected void btn_Menu3_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(),
                                        "ServerControlScript", "$('.nxtMenu3')[0].click();", true);
    }

    protected void btn_Menu4_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(),
                                              "ServerControlScript", "$('.nxtMenu4')[0].click();", true);
    }

    protected void btn_Menu5_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(),
                                            "ServerControlScript", "$('.nxtMenu5')[0].click();", true);
    }
}