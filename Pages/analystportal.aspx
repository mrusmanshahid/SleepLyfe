<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="analystportal.aspx.cs" Inherits="Pages_analystportal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <div class="panel panel-info">
        <div class="panel-heading">
            Analyst Portal 
        </div>

        <div class="panel-body">
            <div class="col-lg-4">
                <label>Username</label>
                <asp:TextBox ID="txtUsername" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator ValidationGroup="one" CssClass="label label-danger" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username cannot be empty!" />
            </div>

            <div class="col-lg-4">
                <label>Password</label>
                <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" runat="server" />
                <asp:RequiredFieldValidator ValidationGroup="one" CssClass="label label-danger" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password cannot be empty!" />
            </div>

            <div class="col-lg-12">
                <asp:Button ValidationGroup="one" CssClass="btn btn-primary pull-right" Text="Create Login" runat="server" ID="btnCreateLogin" OnClick="btnCreateLogin_Click" />
            </div>
        </div>




    </div>












</asp:Content>

