<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="questionnaire.aspx.cs" Inherits="questionnaire" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .RadioButtonWidth label {
            margin-right: 10px;
        }
    </style>


    <script type="text/javascript">
        $(document).ready(function () {
            var tab = document.getElementById('<%= hidTAB.ClientID%>').value;
            $('#myTabs a[href="' + tab + '"]').tab('show');
        });
    </script>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="panel panel-info">
        <div class="panel-heading">
            Health Questionnaire 
        </div>

        <div class="panel-body">

            <ul class="nav nav-tabs">
                <li><a id="home1" data-toggle="tab" href="#home">Home</a></li>
                <li><a id="medical" href="#menu1" data-toggle="tab">Medical History</a></li>
                <li><a id="eds" data-toggle="tab" href="#menu2">EDS Screen</a></li>
                <li><a id="current" data-toggle="tab" href="#menu3">Current Sleep Problem</a></li>
                <li><a id="med" data-toggle="tab" href="#menu4">Medications</a></li>
                <li><a id="anx" data-toggle="tab" href="#menu5">Generalized Anxiety</a></li>
            </ul>
            <asp:HiddenField ID="hidTAB" runat="server" Value="#home" />
            <div class="tab-content">

                <div id="home" class="tab-pane fade in active">

                    <div class="col-lg-4">
                        <br />
                        <label class="">First Name</label>
                        <input runat="server" type="text" id="firstn" class="form-control" required="required" />

                    </div>


                    <div class="col-lg-4">
                        <br />
                        <label class="">Middle initial</label>
                        <input runat="server" id="middlen" type="text" class="form-control" />
                    </div>
                    <div class="col-lg-4">
                        <br />
                        <label class="">Last Name</label>
                        <input runat="server" id="lastn" type="text" class="form-control" required="required" />
                    </div>

                    <div class="col-lg-4">
                        <br />
                        <label class="">Date of Birth</label>
                        <input type="date" runat="server" id="DOB" class="form-control datepicker" />
                    </div>
                    <div class="col-lg-4">
                        <br />
                        <label class="">Age</label>
                        <input type="number" max="120" runat="server" id="age" class="form-control" required="required" />
                    </div>

                    <div class="col-lg-4">
                        <br />
                        <label class="">Weight</label>
                        <input type="text" runat="server" id="weight" class="form-control" required="required" />
                    </div>
                    <div class="col-lg-4">
                        <br />
                        <label>Height</label>

                        <div class="input-group">
                            <input type="number" class="form-control" runat="server" id="heightinfeet" max="24" placeholder="Feet" required="required" />
                            <span class="input-group-addon">-</span>
                            <input type="number" class="form-control" runat="server" id="heightinches" placeholder="Inches" required="required" />
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <br />
                        <br />
                        <label class="">Gender</label>

                        <asp:RadioButtonList ID="gender" required="required" CssClass="RadioButtonWidth" runat="server" RepeatColumns="2" RepeatDirection="Vertical" RepeatLayout="Table">
                            <asp:ListItem Text="item1" Value="Male">Male</asp:ListItem>
                            <asp:ListItem Text="item2" Value="Male">Female</asp:ListItem>
                        </asp:RadioButtonList>

                        <asp:RequiredFieldValidator
                            ID="ReqiredFieldValidator1"
                            runat="server"
                            ControlToValidate="gender"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="one"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>

                    </div>

                    <div class="col-lg-12">
                        <ul class="pager">
                            <a data-toggle="tab" runat="server" id="next1" class="nxtMenu1" href="#menu1"></a>
                            <asp:Button ValidationGroup="one" CssClass="btn btn-primary pull-right" OnClick="btn_menu1_Click" ID="btn_menu1" runat="server" Text="Next" />
                        </ul>
                    </div>
                </div>


                <div id="menu1" class="tab-pane fade">
                    <div class="heading">
                        Have you been diagnosed or treated for any of the following conditions or have the following symptoms?  
                    </div>
                    <div class="col-lg-12">
                        <div class="col-lg-3">
                            <label class="message-content">*High Blood Pressure</label>
                            <asp:RadioButtonList ID="HighBlood" required="required" CssClass="RadioButtonWidth" runat="server" RepeatColumns="2" RepeatDirection="Vertical" RepeatLayout="Table">
                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>
                            </asp:RadioButtonList>
                                 <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1"
                            runat="server"
                            ControlToValidate="HighBlood"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="two"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>
                        </div>

                        <div class="col-lg-3">
                            <label class="message-content">Heart Disease</label>
                            <asp:RadioButtonList ID="HeartDisease" required="required" CssClass="RadioButtonWidth" runat="server" RepeatColumns="2" RepeatDirection="Vertical" RepeatLayout="Table">
                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>
                            </asp:RadioButtonList>
                                    <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2"
                            runat="server"
                            ControlToValidate="HeartDisease"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="two"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>

                        </div>
                        <div class="col-lg-3">
                            <label class="message-content">Diabetes</label>
                            <asp:RadioButtonList ID="Diabetes" CssClass="RadioButtonWidth" required="required" runat="server" RepeatColumns="2" RepeatDirection="Vertical" RepeatLayout="Table">
                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>
                            </asp:RadioButtonList>
                                      <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator3"
                            runat="server"
                            ControlToValidate="Diabetes"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="two"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>
                        </div>
                        <div class="col-lg-3">
                            <label class="message-content">Restless Leg Syndrome</label>
                            <asp:RadioButtonList ID="RestlessLeg" CssClass="RadioButtonWidth" required="required" runat="server" RepeatColumns="2" RepeatDirection="Vertical" RepeatLayout="Table">
                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>
                            </asp:RadioButtonList>
                                <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator4"
                            runat="server"
                            ControlToValidate="RestlessLeg"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="two"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>

                        </div>

                        <div class="col-lg-3">
                            <label class="message-content">Sleep Apnea</label>
                            <asp:RadioButtonList ID="SleepApnea" CssClass="RadioButtonWidth" required="required" runat="server" RepeatColumns="2" RepeatDirection="Vertical" RepeatLayout="Table">
                                                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>
                                                            </asp:RadioButtonList>
                                   <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator5"
                            runat="server"
                            ControlToValidate="SleepApnea"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="two"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>
                        </div>

                        <div class="col-lg-3">
                            <label class="message-content">Insomnia</label>
                            <asp:RadioButtonList ID="Insomni" CssClass="RadioButtonWidth" required="required" runat="server" RepeatColumns="2" RepeatDirection="Vertical" RepeatLayout="Table">
                                                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>
                                                            </asp:RadioButtonList>

                                  <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator6"
                            runat="server"
                            ControlToValidate="Insomni"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="two"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>

                        </div>
                        <div class="col-lg-3">
                            <label class="message-content">Narcolepsy</label>
                            <asp:RadioButtonList ID="Narcolepsy" CssClass="RadioButtonWidth" required="required" runat="server" RepeatColumns="2" RepeatDirection="Vertical" RepeatLayout="Table">
                                                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>
                                                            </asp:RadioButtonList>

                                 <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator7"
                            runat="server"
                            ControlToValidate="Narcolepsy"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="two"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>

                        </div>
                        <div class="col-lg-3">
                            <label class="message-content">Depression</label>
                            <asp:RadioButtonList ID="Depression" CssClass="RadioButtonWidth" required="required" runat="server" RepeatColumns="2" RepeatDirection="Vertical" RepeatLayout="Table">
                                                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>
                                                            </asp:RadioButtonList>

                            
                                 <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator8"
                            runat="server"
                            ControlToValidate="Depression"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="two"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>
                        </div>

                        <div class="col-lg-3">
                            <label class="message-content">Stroke</label>
                            <asp:RadioButtonList ID="Stroke" CssClass="RadioButtonWidth" required="required" runat="server" RepeatColumns="2" RepeatDirection="Vertical" RepeatLayout="Table">
                                                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>
                                                            </asp:RadioButtonList>

                             
                                 <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator9"
                            runat="server"
                            ControlToValidate="Stroke"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="two"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>

                        </div>

                        <div class="col-lg-3">
                            <label class="message-content">A.M. Headaches</label>
                            <asp:RadioButtonList ID="Headaches" CssClass="RadioButtonWidth" required="required" runat="server" RepeatColumns="2" RepeatDirection="Vertical" RepeatLayout="Table">
                                                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>

                                                            </asp:RadioButtonList>

                            
                             
                                 <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator10"
                            runat="server"
                            ControlToValidate="Headaches"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="two"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>

                        </div>



                    </div>
                    <div class="col-lg-12">
                        <ul class="pager">
                            <a data-toggle="tab" href="#menu2" class="nxtMenu2""></a>
                            <asp:Button ValidationGroup="two" CssClass="btn btn-primary pull-right" OnClick="btn_Menu2_Click" ID="btn_Menu2" runat="server" Text="Next" />
                        </ul>
                    </div>
                </div>

                <div id="menu2" class="tab-pane fade">
                    <div class="h5">


                        <b>Epworth Sleepiness Scale:</b> How likely are you to doze off or fall asleep in the following situations, in contrast to just feeling tired?  This refers to your usual way of life in recent times.  Even if you have not done some of these things recently, try to work out how they would have affected you.  Use the following scale to mark the most appropriate box for each situation.   (M.W. Johns, Sleep 1991) 
                    </div>

                    <div class="col-lg-12 ">
                        <b>0 = would never doze &nbsp&nbsp 1 = slight chance of dozing &nbsp&nbsp 
2 = moderate chance of dozing     &nbsp&nbsp 3 = high chance of dozing </b>
                    </div>

                    <div class="col-lg-12">
                        <div class="col-lg-6">Sitting and reading</div>
                        <div class="col-lg-4">


                            <asp:RadioButtonList ID="Sittingandreading" CssClass="RadioButtonWidth" required="required" runat="server" RepeatColumns="4" RepeatDirection="Vertical" RepeatLayout="Table">

                                <asp:ListItem Text="item1" Value="0">0</asp:ListItem>
                                <asp:ListItem Text="item2" Value="1">1</asp:ListItem>
                                <asp:ListItem Text="item3" Value="2">2</asp:ListItem>
                                <asp:ListItem Text="item4" Value="3">3</asp:ListItem>

                            </asp:RadioButtonList>

                                  <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator11"
                            runat="server"
                            ControlToValidate="Sittingandreading"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="three"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>

                        </div>
                        <div class="col-lg-6">Watching TV </div>
                        <div class="col-lg-4">
                            <asp:RadioButtonList ID="WatchingTV" CssClass="RadioButtonWidth" required="required" runat="server" RepeatColumns="4" RepeatDirection="Vertical" RepeatLayout="Table">


                                <asp:ListItem Text="item1" Value="0">0</asp:ListItem>
                                <asp:ListItem Text="item2" Value="1">1</asp:ListItem>
                                <asp:ListItem Text="item3" Value="2">2</asp:ListItem>
                                <asp:ListItem Text="item4" Value="3">3</asp:ListItem>

                            </asp:RadioButtonList>

                                 <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator12"
                            runat="server"
                            ControlToValidate="WatchingTV"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="three"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>
                        </div>
                        <div class="col-lg-6">Sitting inactive in a public place (Theater, Meeting, Etc.)  </div>
                        <div class="col-lg-4">
                            <asp:RadioButtonList ID="Sittinginactive" CssClass="RadioButtonWidth" required="required" runat="server" RepeatColumns="4" RepeatDirection="Vertical" RepeatLayout="Table">


                                <asp:ListItem Text="item1" Value="0">0</asp:ListItem>
                                <asp:ListItem Text="item2" Value="1">1</asp:ListItem>
                                <asp:ListItem Text="item3" Value="2">2</asp:ListItem>
                                <asp:ListItem Text="item4" Value="3">3</asp:ListItem>
                            </asp:RadioButtonList>

                              <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator13"
                            runat="server"
                            ControlToValidate="Sittinginactive"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="three"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>

                        </div>
                        <div class="col-lg-6">As a passenger in a car for an hour without a break  </div>
                        <div class="col-lg-4">
                            <asp:RadioButtonList ID="passenger" runat="server" CssClass="RadioButtonWidth" required="required" RepeatColumns="4" RepeatDirection="Vertical" RepeatLayout="Table">


                                <asp:ListItem Text="item1" Value="0">0</asp:ListItem>
                                <asp:ListItem Text="item2" Value="1">1</asp:ListItem>
                                <asp:ListItem Text="item3" Value="2">2</asp:ListItem>
                                <asp:ListItem Text="item4" Value="3">3</asp:ListItem>
                            </asp:RadioButtonList>

                            <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator14"
                            runat="server"
                            ControlToValidate="passenger"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="three"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>


                        </div>
                        <div class="col-lg-6">Lying down to rest in the afternoon when circumstances permit </div>
                        <div class="col-lg-4">
                            <asp:RadioButtonList ID="afternoon" runat="server" CssClass="RadioButtonWidth" required="required" RepeatColumns="4" RepeatDirection="Vertical" RepeatLayout="Table">


                                <asp:ListItem Text="item1" Value="0">0</asp:ListItem>
                                <asp:ListItem Text="item2" Value="1">1</asp:ListItem>
                                <asp:ListItem Text="item3" Value="2">2</asp:ListItem>
                                <asp:ListItem Text="item4" Value="3">3</asp:ListItem>
                            </asp:RadioButtonList>
                                <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator15"
                            runat="server"
                            ControlToValidate="afternoon"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="three"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>

                        </div>
                        <div class="col-lg-6">Sitting and talking to someone </div>
                        <div class="col-lg-4">
                            <asp:RadioButtonList ID="Sittingandtalking" runat="server" required="required" CssClass="RadioButtonWidth" RepeatColumns="4" RepeatDirection="Vertical" RepeatLayout="Table">

                                <asp:ListItem Text="item1" Value="0">0</asp:ListItem>
                                <asp:ListItem Text="item2" Value="1">1</asp:ListItem>
                                <asp:ListItem Text="item3" Value="2">2</asp:ListItem>
                                <asp:ListItem Text="item4" Value="3">3</asp:ListItem>

                            </asp:RadioButtonList>

                                  <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator16"
                            runat="server"
                            ControlToValidate="Sittingandtalking"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="three"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>

                        </div>

                        <div class="col-lg-6">Sitting quietly after lunch without alcohol </div>
                        <div class="col-lg-4">
                            <asp:RadioButtonList ID="Sittingquietly" runat="server" required="required" CssClass="RadioButtonWidth" RepeatColumns="4" RepeatDirection="Vertical" RepeatLayout="Table">


                                <asp:ListItem Text="item1" Value="0">0</asp:ListItem>
                                <asp:ListItem Text="item2" Value="1">1</asp:ListItem>
                                <asp:ListItem Text="item3" Value="2">2</asp:ListItem>
                                <asp:ListItem Text="item4" Value="3">3</asp:ListItem>

                            </asp:RadioButtonList>

                               <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator17"
                            runat="server"
                            ControlToValidate="Sittingquietly"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="three"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>

                        </div>
                        <div class="col-lg-6">In a car, while stopped for a few minutes in traffic</div>
                        <div class="col-lg-4">
                            <asp:RadioButtonList ID="whilestopped" runat="server" required="required" CssClass="RadioButtonWidth" RepeatColumns="4" RepeatDirection="Vertical" RepeatLayout="Table" Enabled="true">

                                <asp:ListItem Text="item1" Value="0">0</asp:ListItem>
                                <asp:ListItem Text="item2" Value="1">1</asp:ListItem>
                                <asp:ListItem Text="item3" Value="2">2</asp:ListItem>
                                <asp:ListItem Text="item4" Value="3">3</asp:ListItem>

                            </asp:RadioButtonList>
                            
                            
                               <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator18"
                            runat="server"
                            ControlToValidate="whilestopped"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="three"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>

                        </div>
                    </div>
                    <div class="col-lg-12">
                          <ul class="pager">
                            <a data-toggle="tab" href="#menu3" class="nxtMenu3""></a>
                            <asp:Button ValidationGroup="three" CssClass="btn btn-primary pull-right" OnClick="btn_Menu3_Click" ID="btn_Menu3" runat="server" Text="Next" />
                        </ul>
                    </div>

                </div>


                <div id="menu3" class="tab-pane fade">

                    <div class="col-lg-12">
                        <div class="h5 font-bold">
                            Please rate the CURRENT (i.e., LAST TWO WEEKS) SEVERITY of your insomnia problem(s) 
                        </div>

                        <div class="col-lg-6">Difficulty falling asleep</div>
                        <asp:RadioButtonList ID="fallingasleep" runat="server" required="required" CssClass="RadioButtonWidth col-lg-6" RepeatColumns="6" RepeatDirection="Vertical" RepeatLayout="Table">
                            <asp:ListItem Text="item1" Value="None">None</asp:ListItem>
                            <asp:ListItem Text="item2" Value="Mild">Mild</asp:ListItem>
                            <asp:ListItem Text="item3" Value="Moderate">Moderate</asp:ListItem>
                            <asp:ListItem Text="item4" Value="Severe">	Severe</asp:ListItem>
                            <asp:ListItem Text="item5" Value="Severe">Very Severe</asp:ListItem>
                        </asp:RadioButtonList>
                               <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator19"
                            runat="server"
                            ControlToValidate="fallingasleep"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="four"
                            CssClass="col-lg-12"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>

                        <div class="col-lg-6">Difficulty staying asleep</div>

                        <asp:RadioButtonList ID="stayingasleep" runat="server" required="required" CssClass="RadioButtonWidth col-lg-6" RepeatColumns="6" RepeatDirection="Vertical" RepeatLayout="Table">
                            <asp:ListItem Text="item1" Value="None">None</asp:ListItem>
                            <asp:ListItem Text="item2" Value="Mild">Mild</asp:ListItem>
                            <asp:ListItem Text="item3" Value="Moderate">Moderate</asp:ListItem>
                            <asp:ListItem Text="item4" Value="Severe">	Severe</asp:ListItem>
                            <asp:ListItem Text="item5" Value="Severe">Very Severe</asp:ListItem>
                        </asp:RadioButtonList>

                         <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator20"
                            runat="server"
                            ControlToValidate="stayingasleep"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="four"
                            CssClass="col-lg-12"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>

                        <div class="col-lg-6">Problem waking up too early</div>

                        <asp:RadioButtonList ID="problemwakingup" runat="server" required="required" CssClass="RadioButtonWidth col-lg-6" RepeatColumns="6" RepeatDirection="Vertical" RepeatLayout="Table">
                            <asp:ListItem Text="item1" Value="None">None</asp:ListItem>
                            <asp:ListItem Text="item2" Value="Mild">Mild</asp:ListItem>
                            <asp:ListItem Text="item3" Value="Moderate">Moderate</asp:ListItem>
                            <asp:ListItem Text="item4" Value="Severe">	Severe</asp:ListItem>
                            <asp:ListItem Text="item5" Value="Severe">Very Severe</asp:ListItem>
                        </asp:RadioButtonList>
                            <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator21"
                            runat="server"
                            ControlToValidate="problemwakingup"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            CssClass="col-lg-12"
                            ValidationGroup="four"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>


                    </div>
                    <div class="col-lg-12">
                        <div class="h5 font-bold">
                            <br />
                            To what extent do you consider your sleep problem to INTERFERE with your CURRENT functioning
                        (e.g. daytime fatigue, ability to function at work / daily chores, concentration, memory, mood, etc.)? 
                        </div>
                        <asp:RadioButtonList ID="sleepproblem" CssClass="RadioButtonWidth" required="required" runat="server" RepeatColumns="6" RepeatDirection="Vertical" RepeatLayout="Table">
                            <asp:ListItem Text="item1" Value="Not at all Interfering">Not at all Interfering</asp:ListItem>
                            <asp:ListItem Text="item2" Value="A Little">A Little</asp:ListItem>
                            <asp:ListItem Text="item3" Value="Somewhat">Somewhat</asp:ListItem>
                            <asp:ListItem Text="item4" Value="Much">	Much</asp:ListItem>
                            <asp:ListItem Text="item5" Value="Very Much Interfering">Very Much Interfering</asp:ListItem>
                        </asp:RadioButtonList>

                          <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator22"
                            runat="server"
                            ControlToValidate="sleepproblem"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="four"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>




                    </div>
                    <div class="col-lg-12">
                        <div class="h5 font-bold">
                            How often during the week do you drink alcoholic beverages in the evening before falling asleep? 
                        </div>


                        <asp:RadioButtonList ID="drinkalcoholic" CssClass="RadioButtonWidth" required="required" runat="server" RepeatColumns="6" RepeatDirection="Vertical" RepeatLayout="Table">
                            <asp:ListItem Text="item1" Value="Never">Never</asp:ListItem>
                            <asp:ListItem Text="item2" Value="1-2 Times">1-2 Times</asp:ListItem>
                            <asp:ListItem Text="item3" Value="2-3 Times">2-3 Times</asp:ListItem>
                            <asp:ListItem Text="item4" Value="4–5 Times">4–5 Times</asp:ListItem>
                            <asp:ListItem Text="item5" Value="Always  6-7 Times">Always  6-7 Times</asp:ListItem>
                        </asp:RadioButtonList>

                         <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator23"
                            runat="server"
                            ControlToValidate="drinkalcoholic"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="four"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>


                    </div>


                    <div class="col-lg-12">
                        <div class="h5 font-bold">
                            Do you drink more than one beverage with caffeine in the afternoon or evening (i.e., coffee, tea, energy or soft drinks)? 
                        </div>
                        <asp:RadioButtonList ID="beverage" runat="server" CssClass="RadioButtonWidth" required="required" RepeatColumns="6" RepeatDirection="Vertical" RepeatLayout="Table">
                            <asp:ListItem Text="item1" Value="Never">Never</asp:ListItem>
                            <asp:ListItem Text="item2" Value="Rarely">Rarely</asp:ListItem>
                            <asp:ListItem Text="item3" Value="Sometimes">Sometimes</asp:ListItem>
                            <asp:ListItem Text="item4" Value="Frequently">Frequently</asp:ListItem>
                            <asp:ListItem Text="item5" Value="Almost Always">Almost Always</asp:ListItem>
                        </asp:RadioButtonList>

                         <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator24"
                            runat="server"
                            ControlToValidate="beverage"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="four"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>


                    </div>
                    <div class="col-lg-12">
                        <ul class="pager">
                            <a data-toggle="tab" href="#menu4" class="nxtMenu4""></a>
                            <asp:Button ValidationGroup="four" CssClass="btn btn-primary pull-right" OnClick="btn_Menu4_Click" ID="btn_Menu4" runat="server" Text="Next" />
                        </ul>
                    </div>
                </div>

                <div id="menu4" class="tab-pane fade">

                    <div class="col-lg-12">
                        <div class="h5 font-bold">
                            Do you have problems keeping your legs still at night or need to move them to feel comfortable? 
                        </div>
                        <asp:RadioButtonList ID="legsatnight" runat="server" CssClass="RadioButtonWidth" required="required" RepeatColumns="6" RepeatDirection="Vertical" RepeatLayout="Table">
                            <asp:ListItem Text="item1" Value="Never">Never</asp:ListItem>
                            <asp:ListItem Text="item2" Value="Rarely">Rarely</asp:ListItem>
                            <asp:ListItem Text="item3" Value="Sometimes">Sometimes</asp:ListItem>
                            <asp:ListItem Text="item4" Value="Frequently">Frequently</asp:ListItem>
                            <asp:ListItem Text="item5" Value="Almost Always">Almost Always</asp:ListItem>
                        </asp:RadioButtonList>

                         <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator25"
                            runat="server"
                            ControlToValidate="legsatnight"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="five"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>


                    </div>


                    <div class="col-lg-12">
                        <div class="h5 font-bold">
                            Do you have vivid or troubling nightmares? 
                        </div>
                        <asp:RadioButtonList ID="vivid" runat="server" RepeatColumns="6" CssClass="RadioButtonWidth" required="required" RepeatDirection="Vertical" RepeatLayout="Table">
                            <asp:ListItem Text="item1" Value="Never">Never</asp:ListItem>
                            <asp:ListItem Text="item2" Value="Rarely">Rarely</asp:ListItem>
                            <asp:ListItem Text="item3" Value="Sometimes">Sometimes</asp:ListItem>
                            <asp:ListItem Text="item4" Value="Frequently">Frequently</asp:ListItem>
                            <asp:ListItem Text="item5" Value="Almost Always">Almost Always</asp:ListItem>
                        </asp:RadioButtonList>

                         <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator26"
                            runat="server"
                            ControlToValidate="vivid"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="five"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>


                    </div>

                    <div class="col-lg-12">
                        <div class="h5 font-bold">
                            On average, in the past month, how often have you snored or been told that you snored? 
                        </div>
                        <asp:RadioButtonList ID="snored" runat="server" required="required" RepeatColumns="6" CssClass="RadioButtonWidth" RepeatDirection="Vertical" RepeatLayout="Table">
                            <asp:ListItem Text="item1" Value="Never">Never</asp:ListItem>
                            <asp:ListItem Text="item2" Value="Rarely">Rarely</asp:ListItem>
                            <asp:ListItem Text="item3" Value="Sometimes">Sometimes</asp:ListItem>
                            <asp:ListItem Text="item4" Value="Frequently">Frequently</asp:ListItem>
                            <asp:ListItem Text="item5" Value="Almost Always">Almost Always</asp:ListItem>
                        </asp:RadioButtonList>

                         <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator27"
                            runat="server"
                            ControlToValidate="snored"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="five"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>

                    </div>

                    <div class="col-lg-12">
                        <div class="h5 font-bold">
                            Do you wake up choking or gasping? 
                        </div>
                        <asp:RadioButtonList ID="choking" runat="server" required="required" RepeatColumns="6" CssClass="RadioButtonWidth" RepeatDirection="Vertical" RepeatLayout="Table">
                            <asp:ListItem Text="item1" Value="Never">Never</asp:ListItem>
                            <asp:ListItem Text="item2" Value="Rarely">Rarely</asp:ListItem>
                            <asp:ListItem Text="item3" Value="Sometimes">Sometimes</asp:ListItem>
                            <asp:ListItem Text="item4" Value="Frequently">Frequently</asp:ListItem>
                            <asp:ListItem Text="item5" Value="Almost Always">Almost Always</asp:ListItem>
                        </asp:RadioButtonList>

                        
                         <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator28"
                            runat="server"
                            ControlToValidate="choking"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="five"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>

                    </div>
                    <div class="col-lg-12">
                        <div class="h5 font-bold">
                            Have you been told that you stop breathing in your sleep or wake up choking or gasping? 
                        </div>
                        <asp:RadioButtonList ID="stopbreathing" required="required" runat="server" RepeatColumns="6" CssClass="RadioButtonWidth" RepeatDirection="Vertical" RepeatLayout="Table">
                            <asp:ListItem Text="item1" Value="Never">Never</asp:ListItem>
                            <asp:ListItem Text="item2" Value="Rarely">Rarely</asp:ListItem>
                            <asp:ListItem Text="item3" Value="Sometimes">Sometimes</asp:ListItem>
                            <asp:ListItem Text="item4" Value="Frequently">Frequently</asp:ListItem>
                            <asp:ListItem Text="item5" Value="Almost Always">Almost Always</asp:ListItem>
                        </asp:RadioButtonList>

                         <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator29"
                            runat="server"
                            ControlToValidate="stopbreathing"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="five"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>


                    </div>

                    <div class="col-lg-12">
                        <div class="h5 font-bold">
                            How often do you take a prescription medication to help you fall asleep or stay asleep? 
                        </div>
                        <asp:RadioButtonList ID="medication" required="required" runat="server" RepeatColumns="6" CssClass="RadioButtonWidth" RepeatDirection="Vertical" RepeatLayout="Table">
                            <asp:ListItem Text="item1" Value="Never">Never</asp:ListItem>
                            <asp:ListItem Text="item2" Value="Rarely">Rarely</asp:ListItem>
                            <asp:ListItem Text="item3" Value="Sometimes">Sometimes</asp:ListItem>
                            <asp:ListItem Text="item4" Value="Frequently">Frequently</asp:ListItem>
                            <asp:ListItem Text="item5" Value="Almost Always">Almost Always</asp:ListItem>
                        </asp:RadioButtonList>

                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator30"
                            runat="server"
                            ControlToValidate="medication"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="five"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>

                    </div>

                    <div class="col-lg-12">
                        <div class="h5 font-bold">
                            How often do you take an ‘Over the Counter’ medication to help you fall asleep or stay asleep?
                        </div>
                        <asp:RadioButtonList ID="overthecounter" required="required" runat="server" RepeatColumns="6" CssClass="RadioButtonWidth" RepeatDirection="Vertical" RepeatLayout="Table">
                            <asp:ListItem Text="item1" Value="Never">Never</asp:ListItem>
                            <asp:ListItem Text="item2" Value="Rarely">Rarely</asp:ListItem>
                            <asp:ListItem Text="item3" Value="Sometimes">Sometimes</asp:ListItem>
                            <asp:ListItem Text="item4" Value="Frequently">Frequently</asp:ListItem>
                            <asp:ListItem Text="item5" Value="Almost Always">Almost Always</asp:ListItem>
                        </asp:RadioButtonList>

                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator31"
                            runat="server"
                            ControlToValidate="overthecounter"
                            ErrorMessage="Mandatory Field"
                            SetFocusOnError="true"
                            ValidationGroup="five"
                            ForeColor="Red">
                        </asp:RequiredFieldValidator>


                    </div>



                    <div class="col-lg-12">
                         <ul class="pager">
                            <a data-toggle="tab" href="#menu5" class="nxtMenu5""></a>
                            <asp:Button ValidationGroup="five" CssClass="btn btn-primary pull-right" OnClick="btn_Menu5_Click" ID="btn_Menu5" runat="server" Text="Next" />
                        </ul>
                    </div>

                </div>


                <div id="menu5" class="tab-pane fade">


                    <div class="heading">
                        Do you routinely take any of the following medications?
                    </div>
                    <div class="col-lg-12">
                        <div class="col-lg-3">
                            <label class="message-content">Ambien (Zolpidem)</label>
                            <asp:RadioButtonList ID="Ambien" required="required" runat="server" RepeatColumns="2" CssClass="RadioButtonWidth" RepeatDirection="Vertical" RepeatLayout="Table">

                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>
                            </asp:RadioButtonList>
                             <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator32"
                                runat="server"
                                ControlToValidate="Ambien"
                                ErrorMessage="Mandatory Field"
                                SetFocusOnError="true"
                                ValidationGroup="six"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>


                        <div class="col-lg-3">
                            <label class="message-content">Lunesta (Eszopiclone)</label>
                            <asp:RadioButtonList ID="Lunesta" required="required" runat="server" RepeatColumns="2" CssClass="RadioButtonWidth" RepeatDirection="Vertical" RepeatLayout="Table">

                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>
                            </asp:RadioButtonList>
                             <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator33"
                                runat="server"
                                ControlToValidate="Lunesta"
                                ErrorMessage="Mandatory Field"
                                SetFocusOnError="true"
                                ValidationGroup="six"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>


                        </div>





                        <div class="col-lg-3">
                            <label class="message-content">Halcion</label>
                            <asp:RadioButtonList ID="Halcion" required="required" runat="server" RepeatColumns="2" CssClass="RadioButtonWidth" RepeatDirection="Vertical" RepeatLayout="Table">

                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>

                            </asp:RadioButtonList>

                             <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator34"
                                runat="server"
                                ControlToValidate="Halcion"
                                ErrorMessage="Mandatory Field"
                                SetFocusOnError="true"
                                ValidationGroup="six"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>

                        </div>

                        <div class="col-lg-3">
                            <label class="message-content">Rozerem </label>
                            <asp:RadioButtonList ID="Rozerem" required="required" runat="server" RepeatColumns="2" CssClass="RadioButtonWidth" RepeatDirection="Vertical" RepeatLayout="Table">

                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>

                            </asp:RadioButtonList>
                             <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator35"
                                runat="server"
                                ControlToValidate="Rozerem"
                                ErrorMessage="Mandatory Field"
                                SetFocusOnError="true"
                                ValidationGroup="six"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="col-lg-3">
                            <label class="message-content">Sonata (Zaleplon) </label>
                            <asp:RadioButtonList ID="Sonata" required="required" runat="server" RepeatColumns="2" CssClass="RadioButtonWidth" RepeatDirection="Vertical" RepeatLayout="Table">

                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>
                            </asp:RadioButtonList>
                             <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator36"
                                runat="server"
                                ControlToValidate="Sonata"
                                ErrorMessage="Mandatory Field"
                                SetFocusOnError="true"
                                ValidationGroup="six"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="col-lg-3">
                            <label class="message-content">Restoril </label>
                            <asp:RadioButtonList ID="Restoril" required="required" runat="server" RepeatColumns="2" CssClass="RadioButtonWidth" RepeatDirection="Vertical" RepeatLayout="Table">

                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>

                            </asp:RadioButtonList>
                             <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator37"
                                runat="server"
                                ControlToValidate="Restoril"
                                ErrorMessage="Mandatory Field"
                                SetFocusOnError="true"
                                ValidationGroup="six"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="col-lg-3">
                            <label class="message-content">Intermezzo</label>
                            <asp:RadioButtonList ID="Intermezzo" required="required" runat="server" RepeatColumns="2" CssClass="RadioButtonWidth" RepeatDirection="Vertical" RepeatLayout="Table">

                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>
                            </asp:RadioButtonList>
                             <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator38"
                                runat="server"
                                ControlToValidate="Intermezzo"
                                ErrorMessage="Mandatory Field"
                                SetFocusOnError="true"
                                ValidationGroup="six"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="col-lg-3">
                            <label class="message-content">Silenor (Doxepin)</label>
                            <asp:RadioButtonList ID="Silenor" required="required" runat="server" RepeatColumns="2" CssClass="RadioButtonWidth" RepeatDirection="Vertical" RepeatLayout="Table">

                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>

                            </asp:RadioButtonList>
                             <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator39"
                                runat="server"
                                ControlToValidate="Silenor"
                                ErrorMessage="Mandatory Field"
                                SetFocusOnError="true"
                                ValidationGroup="six"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="col-lg-3">
                            <label class="message-content">Xanax</label>
                            <asp:RadioButtonList ID="Xanax" required="required" runat="server" RepeatColumns="2" CssClass="RadioButtonWidth" RepeatDirection="Vertical" RepeatLayout="Table">

                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>
                            </asp:RadioButtonList>
                             <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator40"
                                runat="server"
                                ControlToValidate="Xanax"
                                ErrorMessage="Mandatory Field"
                                SetFocusOnError="true"
                                ValidationGroup="six"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="col-lg-3">
                            <label class="message-content">Narcotic for Pain</label>
                            <asp:RadioButtonList ID="Narcotic" required="required" runat="server" RepeatColumns="2" CssClass="RadioButtonWidth" RepeatDirection="Vertical" RepeatLayout="Table">

                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>

                            </asp:RadioButtonList>
                             <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator41"
                                runat="server"
                                ControlToValidate="Narcotic"
                                ErrorMessage="Mandatory Field"
                                SetFocusOnError="true"
                                ValidationGroup="six"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>


                        <div class="col-lg-3">
                            <label class="message-content">High Blood Pressure</label>
                            <asp:RadioButtonList ID="Bloodmedication" required="required" runat="server" RepeatColumns="2" CssClass="RadioButtonWidth" RepeatDirection="Vertical" RepeatLayout="Table">

                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>

                            </asp:RadioButtonList>
                             <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator42"
                                runat="server"
                                ControlToValidate="Bloodmedication"
                                ErrorMessage="Mandatory Field"
                                SetFocusOnError="true"
                                ValidationGroup="six"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="col-lg-3">
                            <label class="message-content">Steroid </label>
                            <asp:RadioButtonList ID="Steroid" runat="server" required="required" RepeatColumns="2" CssClass="RadioButtonWidth" RepeatDirection="Vertical" RepeatLayout="Table">

                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>

                            </asp:RadioButtonList>

                             <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator43"
                                runat="server"
                                ControlToValidate="Steroid"
                                ErrorMessage="Mandatory Field"
                                SetFocusOnError="true"
                                ValidationGroup="six"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="col-lg-3">
                            <label class="message-content">Heart Disease</label>
                            <asp:RadioButtonList ID="Heartmedication" required="required" runat="server" RepeatColumns="2" CssClass="RadioButtonWidth" RepeatDirection="Vertical" RepeatLayout="Table">
                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>

                            </asp:RadioButtonList>
                             <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator44"
                                runat="server"
                                ControlToValidate="Heartmedication"
                                ErrorMessage="Mandatory Field"
                                SetFocusOnError="true"
                                ValidationGroup="six"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>

                        </div>

                        <div class="col-lg-3">
                            <label class="message-content">Antidepressant</label>
                            <asp:RadioButtonList ID="Antidepressant" required="required" runat="server" RepeatColumns="2" CssClass="RadioButtonWidth" RepeatDirection="Vertical" RepeatLayout="Table">

                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>
                            </asp:RadioButtonList>
                             <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator45"
                                runat="server"
                                ControlToValidate="Antidepressant"
                                ErrorMessage="Mandatory Field"
                                SetFocusOnError="true"
                                ValidationGroup="six"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="col-lg-3">
                            <label class="message-content">Parkinsons</label>
                            <asp:RadioButtonList ID="Parkinson" required="required" runat="server" RepeatColumns="2" CssClass="RadioButtonWidth" RepeatDirection="Vertical" RepeatLayout="Table">

                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>

                            </asp:RadioButtonList>

                             <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator46"
                                runat="server"
                                ControlToValidate="Parkinson"
                                ErrorMessage="Mandatory Field"
                                SetFocusOnError="true"
                                ValidationGroup="six"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>

                        </div>

                        <div class="col-lg-3">
                            <label class="message-content">Antihistamines</label>
                            <asp:RadioButtonList ID="Antihistamines" required="required" runat="server" RepeatColumns="2" CssClass="RadioButtonWidth" RepeatDirection="Vertical" RepeatLayout="Table">

                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>

                            </asp:RadioButtonList>

                             <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator47"
                                runat="server"
                                ControlToValidate="Antihistamines"
                                ErrorMessage="Mandatory Field"
                                SetFocusOnError="true"
                                ValidationGroup="six"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>

                        </div>

                        <div class="col-lg-3">
                            <label class="message-content">Anti-anxiety/tranquilizer</label>
                            <asp:RadioButtonList ID="anxiety" required="required" runat="server" RepeatColumns="2" CssClass="RadioButtonWidth" RepeatDirection="Vertical" RepeatLayout="Table">

                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>

                            </asp:RadioButtonList>

                             <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator48"
                                runat="server"
                                ControlToValidate="anxiety"
                                ErrorMessage="Mandatory Field"
                                SetFocusOnError="true"
                                ValidationGroup="six"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>
                        </div>

                        <div class="col-lg-3">
                            <label class="message-content">Stimulant/ADHD</label>
                            <asp:RadioButtonList ID="Stimulant" required="required" runat="server" RepeatColumns="2" CssClass="RadioButtonWidth" RepeatDirection="Vertical" RepeatLayout="Table">

                                <asp:ListItem Text="item1" Value="yes">Yes</asp:ListItem>
                                <asp:ListItem Text="item2" Value="no">No</asp:ListItem>

                            </asp:RadioButtonList>

                             <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator49"
                                runat="server"
                                ControlToValidate="Stimulant"
                                ErrorMessage="Mandatory Field"
                                SetFocusOnError="true"
                                ValidationGroup="six"
                                ForeColor="Red">
                            </asp:RequiredFieldValidator>

                        </div>
                    </div>

                    <div class="col-lg-12">

                        <asp:Button ID="BtnSubmit" runat="server" ValidationGroup="six" CssClass="btn btn-success btn-rounded pull-rights" Text="Submit" OnClick="BtnSubmit_Click" />


                    </div>



                </div>



            </div>

        </div>

    </div>




    <script src="PagesJs/Constant.js"></script>
    <script>
        function next(Selector, Target) {

            if (validateForm(Selector)) {
                $(Target)[0].click();
            }

        }

    </script>




</asp:Content>

