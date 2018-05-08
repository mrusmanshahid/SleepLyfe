<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Diagnoses.aspx.cs" Inherits="Pages_Diagnoses" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="panel panel-primary">
        <div class="panel-heading">
            <input type="button" class="btn btn-primary" value="Export To Doc" onclick="exportToDocx()" />
        </div>
    </div>

    <div id="report">

        <div class="panel panel-primary">
            <div class="panel-heading">
                Patient Detail
            </div>
            <div class="panel-body">
                <table class="table table-bordered table-responsive ">
                    <tr>
                        <th class="">First Name</th>
                        <td class=" tdFname">First Name</td>

                        <th class="">Middle Name</th>
                        <td class=" tdMname">Middle Name</td>

                        <th class="">Last Name</th>
                        <td class=" tdLname">Last Name</td>
                    </tr>
                    <tr>
                        <th class="">Age</th>
                        <td class=" tdAge">Age</td>

                        <th class="">Weight</th>
                        <td class=" tdWeight">Weight</td>

                        <th class="">Height</th>
                        <td class=" tdHeight">Height</td>
                    </tr>

                    <tr>
                        <th class="">Gender</th>
                        <td class=" tdGender">Gender</td>

                        <th class="">Date of Birth</th>
                        <td class=" tdDOB">Date of Birth</td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="panel panel-primary">
            <div class="panel-heading">
                Statistics
            </div>
            <div class="panel-body">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        Stages
                    </div>
                    <div class="panel-body">

                        <div class="col-lg-12 divGraphs">
                            <div class="col-lg-6">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        Normative
                                    </div>
                                    <div class="panel-body">
                                        <canvas id="normativeChart" height="226" width="485" style="width: 485px; height: 226px;"></canvas>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="panel panel-success">
                                    <div class="panel-heading">
                                        Analyzed
                                    </div>
                                    <div class="panel-body">
                                        <canvas id="analyzedChart" height="226" width="485" style="width: 485px; height: 226px;"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    Analysis in Percentage
                                </div>
                                <div class="panel-body">
                                    <table class="table table-bordered table-responsive table-hover">
                                        <tr class="success">
                                            <th>Measures</th>
                                            <th>Normative</th>
                                            <th>Analyzed</th>
                                        </tr>
                                        <tr>
                                            <th>N1</th>
                                            <th>05%</th>
                                            <th class="tdN1"></th>
                                        </tr>
                                        <tr>
                                            <th>N2</th>
                                            <th>45%</th>
                                            <th class="tdN2"></th>
                                        </tr>
                                        <tr>
                                            <th>N3</th>
                                            <th>15%</th>
                                            <th class="tdN3"></th>
                                        </tr>
                                        <tr>
                                            <th>W</th>
                                            <th>15%</th>
                                            <th class="tdW"></th>
                                        </tr>
                                        <tr>
                                            <th>REM</th>
                                            <th>20%</th>
                                            <th class="tdREM"></th>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-12">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    Analysis
                                </div>
                                <div class="panel-body">
                                    <table class="table table-bordered table-responsive table-hover">
                                        <tr class="success">
                                            <th>Factor</th>
                                            <th>Normative</th>
                                            <th>Analyzed</th>
                                        </tr>
                                        <tr>
                                            <th>PULSE</th>
                                            <th>83 - 45</th>
                                            <th class="liPulse"></th>
                                        </tr>
                                        <tr>
                                            <th>SNORING</th>
                                            <th>18% (40 DB) - 09% (50 DB)</th>
                                            <th class="liSnore"></th>
                                        </tr>
                                        <tr>
                                            <th>SLEEP EFFICIENY</th>
                                            <th>85%</th>
                                            <th class="liEfficiency"></th>
                                        </tr>
                                        <tr>
                                            <th>REM LATENCY</th>
                                            <th>70 Minutes</th>
                                            <th class="liRemLetency"></th>
                                        </tr>
                                        <tr>
                                            <th>SLEEP DURATION</th>
                                            <th>7 - 8 Hours</th>
                                            <th class="liSleepDuration"></th>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="panel panel-primary">
                    <div class="panel-heading">
                        Verdict
                    </div>
                    <div class="panel-body" style="text-align: center;">
                        <label class="label label-danger lblVerdict" style="font-size: medium;">The patient has Sleep </label>
                    </div>
                </div>

            </div>



        </div>

    </div>
    <script src="https://fastcdn.org/FileSaver.js/1.1.20151003/FileSaver.min.js"></script>
    <script src="PagesJs/jquery.wordexport.js"></script>
    <script src="PagesJs/docxDownload.js"></script>
    <%--<script type="text/javascript" src="http://github.com/aadel112/googoose/jquery.googoose.js"></script>--%>
    <script src="PagesJs/Diagnoses.js"></script>

</asp:Content>

