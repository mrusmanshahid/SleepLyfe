<%@ Page Language="C#" AutoEventWireup="true" CodeFile="landingpage.aspx.cs" Inherits="Pages_landingpage" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <script type="text/javascript">


        function abc() {
            if (document.getElementById('form-username').value == 'admin' && document.getElementById('form-password').value == 'admin') {
                window.location.href = "pages/selectform.aspx";


            }
            else {

                alert("error")
            }
        }



    </script>
    <script src="/assets/js/jquery-1.11.1.min.js"></script>
    <script src="/assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="/assets/js/jquery.backstretch.min.js"></script>
    <script src="/assets/js/scripts.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sleeplyfe</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- CSS -->
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
    <link rel="stylesheet" href="/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="/assets/css/form-elements.css">
    <link rel="stylesheet" href="/assets/css/style.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->
    <style>
        body {
            background-color: #333;
        }
    </style>

</head>

<body>

    <!-- Top content -->
    <div class="top-content">

        <div class="inner-bg">
            <div class="container">
                <div class="row">
                    <div class="col-sm-8 col-sm-offset-2 text">
                        <h1><strong>Sleeplyfe</strong> Login Form</h1>
                        <br />
                        <br />

                    </div>

                    <div class="col-sm-8 col-sm-offset-2" >
                        <ul class="nav nav-pills">

                            <li class="col-lg-offset-4 col-lg-pull-1 "  style="border: solid; border-radius: 8px 8px; height:120px; width:155px;" ><a style="color: white; text-align:center; height:116px; width:150px;" data-toggle="pill" href="#home" > <label style="padding-top:35px; font-size:medium" > Patient </label> </a></li">
                            <li class="col-lg-push-0"  style="border: solid; border-radius: 8px 8px; height:120px; width:155px;" ><a style="color: white; height:116px; width:150px;" data-toggle="pill" href="#menu1"><label style="padding-top:35px; font-size:medium" >Analyst </label></a></li>
                        </ul>
                    </div>

                    <form runat="server">

                        <div class="tab-content">



                            <div id="home" class="tab-pane ">

                                <div class="row">
                                    <div class="col-sm-6 col-sm-offset-3 form-box">
                                        <div class="form-top">
                                            <div class="form-top-left">

                                                <h3>Login to Patient portal</h3>

                                            </div>

                                            <div class="form-top-right">
                                                <i class="fa fa-key"></i>
                                            </div>
                                        </div>
                                        <div class="form-bottom">

                                            <div class="form-group">
                                                <label>Username</label>

                                                <asp:TextBox ID="username" runat="server" CssClass="form-control">   </asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label>Password</label>
                                                <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="form-control">   </asp:TextBox>
                                            </div>
                                            <label id="pas" runat="server" style="color: red;" visible="false">Invalid username/password </label>

                                            <asp:Button runat="server" Text="Sign in!" CssClass="btn-success form-control" OnClick="Unnamed_Click2" />


                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="menu1" class="tab-pane">


                                <div class="row">
                                    <div class="col-sm-6 col-sm-offset-3 form-box">
                                        <div class="form-top">
                                            <div class="form-top-left">

                                                <h3>Login to Analyst portal</h3>

                                            </div>

                                            <div class="form-top-right">
                                                <i class="fa fa-key"></i>
                                            </div>
                                        </div>
                                        <div class="form-bottom">
                                            <div class="form-group">
                                    
                                                <label>Username</label>

                                                <asp:TextBox ID="analystn" runat="server" CssClass="form-control"> </asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                            <label>Password</label>
                                                <asp:TextBox ID="analystp" runat="server" TextMode="Password" CssClass="form-control">   </asp:TextBox>
                                            </div>
                                            <label id="Label1" runat="server" style="color: red;" visible="false">Invalid username/password </label>

                                            <asp:Button runat="server" Text="Sign in!" CssClass="btn-success form-control" OnClick="Unnamed_Click1" />




                                        </div>
                                    </div>
                                </div>




                            </div>



                        </div>
                    </form>
                </div>

            </div>
        </div>

    </div>


    <!-- Javascript -->


    <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

</body>

</html>
