<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="sleepdiary.aspx.cs" Inherits="Pages_sleepdiary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
     .RadioButtonWidth label {  margin-right:10px; }  
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="panel panel-info">
        <div class="panel-heading">
           SLEEP DIARY
        </div>

        <div class="panel-body">
           <div class="col-lg-12">
        <asp:Table runat="server" CssClass="col-lg-12">
            <asp:TableHeaderRow >

                <asp:TableHeaderCell> Questions</asp:TableHeaderCell>
             
                <asp:TableHeaderCell> Options </asp:TableHeaderCell>
            
                
                 </asp:TableHeaderRow> 
             <asp:TableRow>
                <asp:TableCell>Select Night </asp:TableCell>
                <asp:TableCell>
                 <asp:DropDownList runat="server" required="required" ID="night" CssClass="form-control form-group" >
                     <asp:listitem Value="1">1</asp:listitem>
                     <asp:ListItem Value="2">2 </asp:ListItem>
                     <asp:ListItem Value="3">3</asp:ListItem>
                 </asp:DropDownList>
                    </asp:TableCell>
            </asp:TableRow>
            
            
            <asp:TableRow>
                <asp:TableCell>Date study started: </asp:TableCell>
                <asp:TableCell><input type="date" required="required" runat="server" id="datestart" class="form-control"/></asp:TableCell>
            </asp:TableRow>
            
                <asp:TableRow>
                <asp:TableCell>Did you take a prescription medication to help you fall or stay asleep?</asp:TableCell>
                <asp:TableCell>
                <asp:RadioButtonList ID="prescription" CssClass="RadioButtonWidth" runat="server" RepeatColumns="2" RepeatDirection="Vertical" RepeatLayout="Table"  CellPadding="3" CellSpacing="2" ValidationGroup="abc" ValidateRequestMode="Inherit">
                <asp:ListItem Value="yes">Yes</asp:ListItem>
                <asp:ListItem Value="no">No</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator 
            ID="ReqiredFieldValidator1"
            runat="server"
            ControlToValidate="Prescription"
           ValidationGroup ="abc"
            ErrorMessage="Mandatory Field"
            ForeColor="Red">
        </asp:RequiredFieldValidator> 
                                    
                    
                    
                     </asp:TableCell>
                </asp:TableRow>
            
                <asp:TableRow>
                <asp:TableCell>How many alcoholic beverages did you consume within 4 hours before bedtime?  Beer, glass of wine, mixed drink  </asp:TableCell>
                <asp:TableCell><input type="text" required="required" runat="server" id="beverages"  class="form-control"/></asp:TableCell>
                </asp:TableRow>
             
                <asp:TableRow>
                <asp:TableCell>How many caffeinated beverages did you consume within 4 hours before bedtime?  Coffee, soda, energy drink </asp:TableCell>
                <asp:TableCell><input  type="text" required="required" runat="server" id="caffeinated" class="form-control" /></asp:TableCell>
                </asp:TableRow>
                
                <asp:TableRow>
                <asp:TableCell>What time did you turn the lights off and begin trying to fall asleep?  (Hr-Min-AM/PM)  </asp:TableCell>
                <asp:TableCell><input type="time" runat="server" required="required" id="lights" class="form-control" /></asp:TableCell>
                </asp:TableRow>
                
                <asp:TableRow>
                <asp:TableCell>How long do you think it took you to fall asleep? DO NOT look at the clock. (Hr-Min)  </asp:TableCell>
                <asp:TableCell>    
                    <div class="input-group">
                    <input type="number" class="form-control" required="required" runat="server" id="sleephour" placeholder="Hr"/>
                    <span class="input-group-addon">-</span>
                    <input type="number" class="form-control" required="required" runat="server" id="sleepmin" placeholder="Min"/>
                    </div>
                </asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                <asp:TableCell>How many times do you think you woke up between the time you first fell asleep and your final awakening? </asp:TableCell>
                <asp:TableCell><input type="number" required="required" runat="server" id="wokeup" class="form-control" /></asp:TableCell>
                </asp:TableRow>

                <asp:TableRow>
                <asp:TableCell>What was the total time you think you were awake after you initially fell asleep until you ended your night of sleep?  DO NOT look at the clock </asp:TableCell>
                <asp:TableCell><input type="number" required="required" runat="server" id="totaltime"  class="form-control"/></asp:TableCell>
                </asp:TableRow>
             
               <asp:TableRow>
                <asp:TableCell>What time did you turn the device off for your final awakening that ended your night of sleep? (Hr-Min-AM/PM) </asp:TableCell>
                <asp:TableCell><input type="time" required="required" runat="server" id="turnofftime" class="form-control" /></asp:TableCell>
                </asp:TableRow>
            
                <asp:TableRow>
                <asp:TableCell>Approximately how long did you sleep last night? (Hr-Min) </asp:TableCell>
                <asp:TableCell><div class="input-group">
                    <input type="number" class="form-control" runat="server" id="totalsleephours" max="24" placeholder="Hr"/>
                    <span class="input-group-addon">-</span>
                    <input type="number" class="form-control" required="required" runat="server" id="totalsleepmin" min="60" placeholder="Min"/>
                    </div></asp:TableCell>
                </asp:TableRow>
                </asp:Table>
                
               <div class="col-lg-12">
                <br />
                <asp:Button ID="submit" CssClass="btn-success btn-rounded pull-right" runat="server" Text="Submit" OnClick="submit_Click"  ValidationGroup="abc"/>
                
               </div>
                </div>
                   
    </div>
    </div>


</asp:Content>

