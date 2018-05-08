<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EDFViewer.aspx.cs" Inherits="Pages_EDFViewer" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="panel panel-primary">
        <div class="panel-heading">
            <input type="file" class="btn btn-primary" id="fileInput" />
            <input type="button" style="margin-top: -35px" class="btn btn-danger  pull-right" onclick="redirectWindow()" value="Diagnose" />
        </div>
    </div>

    <div class="panel panel-info">
        <div class="panel-heading">
            File Options
        </div>
        <div class="panel-body">

            <div class="col-lg-12">


                <%--            <div sty class="col-lg-1">
                <input type="button" value="ExportDataPoints" class="btn btn-success" onclick="excelOut('.tablePoints')" />
            </div>--%>
                <div class="col-lg-12">

                    <div class="col-lg-3">
                        <label>Select Window</label>
                        <select class="form-control windowSize" onchange="reinitChart()">
                            <option value="1" selected="selected">01 Seconds</option>
                            <option value="10">10 Seconds</option>
                            <option value="30">30 Seconds</option>
                            <option value="60">60 Seconds</option>
                            <option value="600">10 Minutes</option>
                            <option value="1800">30 Minutes</option>
                        </select>
                    </div>

                    <div class="col-lg-3">
                        <label>Select Night</label>
                        <select class="form-control nightSelect" onchange="setNights()">
                            <option value="0" selected="selected">Night 1</option>
                        </select>
                    </div>

                    <div class="col-lg-3">
                        <label>Select Clock</label>
                        <input type="text" class="form-control clockpicker clockTime" onchange="setStart()" data-autoclose="true" />
                    </div>

                    <div class="col-lg-3 dvPatients">
                        <label>Select Patient</label>
                        <select class="form-control ddlCustomers">
                        </select>
                    </div>

                </div>

                <div class="col-lg-12" style="margin-top: 10px">
                </div>

            </div>
            <div class="row">

                <div class="col-lg-12">
                </div>
            </div>
        </div>

    </div>

    <div class="panel panel-info">
        <div class="panel-heading">
            LEOG
        </div>
    </div>
    <div class="flot-chart">
        <div id="LEOG">
        </div>
    </div>



    <div class="panel panel-info">
        <div class="panel-heading">
            REOG
        </div>
    </div>
    <div class="flot-chart">
        <div id="REOG">
        </div>
    </div>

    <div class="panel panel-info">
        <div class="panel-heading">
            EEG
        </div>
    </div>
    <div class="flot-chart">
        <div id="EEG">
        </div>
    </div>


    <div class="panel panel-info">
        <div class="panel-heading">
            Decomposed Wave
        </div>
    </div>
    <div class="flot-chart">
        <div id="RTC">
        </div>
    </div>


    <div class="panel panel-info">
        <div class="panel-heading">
            PULSE
        </div>
    </div>
    <div class="flot-chart">
        <div id="PULSE">
        </div>
    </div>

    <div class="panel panel-info">
        <div class="panel-heading">SNORE </div>
    </div>
    <div class="flot-chart">
        <div id="SNORE">
        </div>
    </div>

    <div class="panel panel-info">
        <div class="panel-heading">HPos </div>
    </div>
    <div class="flot-chart">
        <div id="HPos">
        </div>
    </div>


    <div class="panel panel-info">
        <div class="panel-heading">HMov </div>
    </div>
    <div class="flot-chart">
        <div id="HMov">
        </div>
    </div>

    <div style="background-color: black">
        <div class="col-lg-12 dvASM" style="position: fixed; display: flex; top: 0; z-index: 99999; width: 92%; margin-left: 10px;">
        </div>
    </div>

    <div style="background-color: black">
        <div class="col-lg-12 dvAsmAll" style="position: fixed; display: flex; height: 3.5%; top: 18px; z-index: 99999; width: 92%; margin-left: 10px;">
        </div>
    </div>


    <%--    <table class="table table-responsive table-border tablePoints">
    </table>--%>


    <script src="/js/dist/edfdecoder.umd.js"></script>
    <script src="PagesJs/jquery.fft.js"></script>
    <script src="PagesJs/EDFViewer.js"></script>
    <script src="PagesJs/fft.js"></script>
    <script src="PagesJs/DSP.js"></script>
    <script src="PagesJs/CaseEEGFilter.js"></script>

    <style>
        .c3-circle {
            display: none !important;
        }

        .flot-chart {
            height: 200px !important;
        }

        .canvasjs-chart-canvas {
            height: 200px !important;
            width: 100% !important;
        }

        .panel {
            margin-bottom: 0 !important;
        }
    </style>

    <script>
        function pageLoad() {
            $('.navbar-minimalize').click();
        }
    </script>


</asp:Content>

