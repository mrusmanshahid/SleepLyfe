
var objAnalyzed = jQuery.parseJSON(localStorage.DataAnaylzed);

ProcessNormative();
GetPatientDetails();

function secondtotime(s) {
    var h = Math.floor(s / 3600);
    s -= h * 3600;
    var m = Math.floor(s / 60);
    s -= m * 60;
    return h + ":" + (m < 10 ? '0' + m : m) + ":" + (s < 10 ? '0' + s : s);
}

function exportToDocx() {
    $('.divGraphs').hide();
    $(document).googoose({
        area: '#report'
    });
    //$('#report').wordExport();

    $('.divGraphs').show();
}

function getUrlVars() {
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for (var i = 0; i < hashes.length; i++) {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}


function GetPatientDetails() {
    var pid = getUrlVars()["pid"];
    var service = new SleepProfiler.ProfilerService();
    service.getPatiendSummary(pid, onGetPatientDetails, null, null);
}

function onGetPatientDetails(result) {
    var res = jQuery.parseJSON(result);
    var obj = res[0];

    $('.tdFname').text(obj.Firstname);
    $('.tdMname').text(obj.Middlename);
    $('.tdLname').text(obj.Lastname);

    $('.tdAge').text(obj.Age);
    $('.tdWeight').text(obj.Weight);
    $('.tdHeight').text(obj.height_feet + "." + obj.height_inches);

    $('.tdGender').text(obj.Gender);
    $('.tdDOB').text(obj.DateofBirth);

}

function ProcessNormative() {

    var N1Count = objAnalyzed.filter(x=>x.Tag == "N1").length;
    var N2Count = objAnalyzed.filter(x=>x.Tag == "N2").length;
    var N3Count = objAnalyzed.filter(x=>x.Tag == "N3").length;
    var WCount = objAnalyzed.filter(x=>x.Tag == "W").length;
    var RECount = objAnalyzed.filter(x=>x.Tag == "RE").length;
    var len = objAnalyzed.length;
    var N1Percent = (N1Count / len) * 100.0;
    var N2Percent = (N2Count / len) * 100.0;
    var N3Percent = (N3Count / len) * 100.0;
    var W3Percent = (WCount / len) * 100.0;
    var RePercent = (RECount / len) * 100.0;

    $('.tdN1').text(Math.round(N1Percent) + "%");
    $('.tdN2').text(Math.round(N2Percent) + "%");
    $('.tdN3').text(Math.round(N3Percent) + "%");
    $('.tdW').text(Math.round(W3Percent) + "%");
    $('.tdREM').text(Math.round(RePercent) + "%");

    var Relatency = 0;
    var sleepDuration = objAnalyzed.filter(x=>x.Tag != "W").length * 30;

    $(Relatency).each(function (k, v) {
        if (v.Tag == "RE") {
            Relatency = k;
            return;
        }
    });

    var maxPulse = localStorage.maxPulse;
    var minPulse = localStorage.minPulse;

    var maxSnore = localStorage.maxSnore;
    var minSnore = localStorage.minSnore;

    var SnoreDB40 = localStorage.SnoreDB40;
    var SnoreDB50 = localStorage.SnoreDB50;
    var TotalSnoreDB = localStorage.TotalSnoreDB;

    var ConditionMet = 0;

    if (N1Percent > 10)
        ConditionMet++;

    if (N2Percent > 60)
        ConditionMet;

    if (N3Percent < 15)
        ConditionMet++;

    if (RePercent < 20)
        ConditionMet++;

    if (W3Percent > 15)
        ConditionMet++;


    if (ConditionMet > 2) {
        $('.lblVerdict').text("The patient has Sleep Apnea");
    }
    else if ((N1Percent >= 5 && N1Percent <= 10) && (N2Percent >= 45 && N2Percent <= 60) && (N3Percent >= 15 && N3Percent <= 20) && (RePercent >= 20 && RePercent <= 25) && (W3Percent >= 5 && W3Percent <= 10)) {
        $('.lblVerdict').text("The patient does not have Sleep Disorder");
    }
    else {
        $('.lblVerdict').text("The patient has some other Sleep Disorder");
    }


    //var maxPulse = objPulse.reduce(function (lst, num) { return num[0] > lst[0] ? num[0] : lst[0]; });
    //var minPulse = objPulse.reduce(function (lst, num) { return num[0] < lst[0] ? num[0] : lst[0]; });


    //var maxSnore = objSnore.reduce(function (lst, num) { return num[0] > lst[0] ? num[0] : lst[0]; });
    //var minSnore = objPulse.reduce(function (lst, num) { return num[0] < lst[0] ? num[0] : lst[0]; });



    $('.liEfficiency').text((sleepDuration / (len * 30) * 100).toFixed(0));
    $('.liSleepDuration').text(secondtotime(len * 30));
    $('.liRemLetency').text(secondtotime(Relatency));
    $('.liPulse').text(maxPulse + " - " + minPulse);
    $('.liSnore').text(((SnoreDB40 / TotalSnoreDB) * 100).toFixed(0) + " - " + ((SnoreDB50 / TotalSnoreDB) * 100).toFixed(0));

    var AnalyzedData = [
    {
        value: Math.round(N1Percent),
        color: "#bba0ad",
        highlight: "#bba0ad",
        label: "N1"
    },
    {
        value: Math.round(N2Percent),
        color: "#997085",
        highlight: "#997085",
        label: "N2"
    },
    {
        value: Math.round(N3Percent),
        color: "#77415c",
        highlight: "#77415c",
        label: "N3"
    },
    {
        value: Math.round(RePercent),
        color: "#a0adbb",
        highlight: "#a0adbb",
        label: "REM"
    },
    {
        value: Math.round(W3Percent),
        color: "#eee7ea",
        highlight: "#eee7ea",
        label: "W"
    }
    ];
    //////////////////////////////////////////////////////////
    var doughnutData = [
    {
        value: 5,
        color: "#bba0ad",
        highlight: "#bba0ad",
        label: "N1"
    },
    {
        value: 45,
        color: "#997085",
        highlight: "#997085",
        label: "N2"
    },
    {
        value: 15,
        color: "#77415c",
        highlight: "#77415c",
        label: "N3"
    },
    {
        value: 20,
        color: "#a0adbb",
        highlight: "#a0adbb",
        label: "REM"
    },
    {
        value: 15,
        color: "#eee7ea",
        highlight: "#eee7ea",
        label: "W"
    }
    ];

    var doughnutOptions = {
        segmentShowStroke: true,
        segmentStrokeColor: "#fff",
        segmentStrokeWidth: 2,
        percentageInnerCutout: 0, // This is 0 for Pie charts
        animationSteps: 100,
        animationEasing: "easeOutBounce",
        animateRotate: true,
        animateScale: false,
        showTooltip: false,
        onAnimationComplete: function () {
            this.showTooltip(this.segments, true);
        }
    };

    var ctx = document.getElementById("normativeChart").getContext("2d");
    var myNewChart = new Chart(ctx).Doughnut(doughnutData, doughnutOptions);

    var atx = document.getElementById("analyzedChart").getContext("2d");
    var myNewChart = new Chart(atx).Doughnut(AnalyzedData, doughnutOptions);






}