
ProcessNormative();

function ProcessNormative() {


    var doughnutData = [
    {
        value: 5,
        color: "#a3e1d4",
        highlight: "#1ab394",
        label: "N1"
    },
    {
        value: 45,
        color: "#dedede",
        highlight: "#1ab394",
        label: "N2"
    },
    {
        value: 15,
        color: "#b5b8cf",
        highlight: "#1ab394",
        label: "N3"
    },
    {
        value: 20,
        color: "#b5b8cf",
        highlight: "RED",
        label: "REM"
    },
    {
        value: 15,
        color: "#b5b8cf",
        highlight: "gray",
        label: "W"
    }
    ];

    var doughnutOptions = {
        segmentShowStroke: true,
        segmentStrokeColor: "#fff",
        segmentStrokeWidth: 2,
        percentageInnerCutout: 45, // This is 0 for Pie charts
        animationSteps: 100,
        animationEasing: "easeOutBounce",
        animateRotate: true,
        animateScale: false,
        responsive: true,
    };

    var ctx = document.getElementById("doughnutChart").getContext("2d");
    var myNewChart = new Chart(ctx).Doughnut(doughnutData, doughnutOptions);
}