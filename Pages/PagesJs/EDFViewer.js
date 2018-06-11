$('.clockpicker').clockpicker();
$('.clockpicker-button').val('ok');
$('.footer').slideToggle();

var Data;
GetCustomers();

function GetCustomers() {
    var service = new SleepProfiler.ProfilerService();
    service.getAllCustomers(onGetCustomers, null, null);
}

function onGetCustomers(result) {
    var res = jQuery.parseJSON(result);
    FillDropDownByReference('.ddlCustomers', res);
}

function redirectWindow() {
    var objPulse = output._physicalSignals[4];
    var objSnore = output._physicalSignals[5];

    var maxPulse = objPulse[0][0];
    var minPulse = objPulse[0][0];
    localStorage.maxPulse = maxPulse;
    localStorage.minPulse = minPulse;

    var maxSnore = objSnore[0][0];
    var minSnore = objSnore[0][0];
    localStorage.maxSnore = maxSnore;
    localStorage.minSnore = minSnore;

    $(objPulse).each(function (k, v) {
        if (v[0] > maxPulse)
            maxPulse = v[0];

        if (v[0] < minPulse && v[0] != 0)
            minPulse = v[0];
    });

    var SnoreDB40 = 0;
    var SnoreDB50 = 0;
    var TotalSnoreDB = 0;

    $(objSnore).each(function (k, v) {
        if (v[0] != 0) {
            var snoreDB = 20 * Math.log10(v[0]);
            TotalSnoreDB++;

            if (snoreDB > 40 && snoreDB < 50)
                SnoreDB40++;

            if (snoreDB > 50)
                SnoreDB50++;
        }
    });

    localStorage.SnoreDB40 = SnoreDB40;
    localStorage.SnoreDB50 = SnoreDB50;
    localStorage.TotalSnoreDB = TotalSnoreDB;
    
    if (!validateForm('.dvPatients'))
        return;
    window.location.replace("Diagnoses.aspx?pid=" + $('.ddlCustomers').val());
}



var start = 0;
var end = start + parseFloat($(".windowSize").val());

//readFile();

var fileInput = document.getElementById('fileInput');
// the foo object is part of our edfdecoder module
var decoder = new edfdecoder.EdfDecoder();

// event listener of the file dialog, it then triggers the file decoding
fileInput.addEventListener('change', function (e) {
    ProgressBarShow();
    var files = e.target.files;
    var reader = new FileReader();

    if (!files.length) {
        return;
    }

    reader.onloadend = function (event) {
        var buffer = event.target.result;
        readEdfFile(buffer);
    }
    reader.readAsArrayBuffer(files[0]);
});

var output;

function readEdfFile(buff) {

    decoder.setInput(buff);
    decoder.decode();
    output = decoder.getOutput();
    //console.log(output);


    var SecondNiteTime = SecondNight();
    var ThirdNiteTime = ThirdNight();
    $('.nightSelect').append('<option value="' + SecondNiteTime + '">Night 2</option>');
    if (ThirdNiteTime != 0)
        $('.nightSelect').append('<option value="' + ThirdNiteTime + '">Night 3</option>')

    RangeSlider(SecondNiteTime, ThirdNiteTime);
    $('.footer').slideToggle(1000);
    ProcessASM();
    generateGraph();
}


function SecondNight() {
    var SecondNiteSt = 25200;
    var SecondPattCount = 0;
    var SecondNite = [];
    var SecondNiteMin = [];
    var SecondNiteHour;
    var SecondNiteMin;
    while (SecondNiteSt < 50400) {
        a = output._physicalSignals[2][SecondNiteSt].filter(x => x <= -995 || x >= 995).length;
        if (a >= 255) {
            SecondNite.push(Math.floor(SecondNiteSt / 3600));
        }
        SecondNiteSt++;
    }
    var SecondNiteUnique = SecondNite.slice();
    $.unique(SecondNiteUnique).sort().forEach(function (v, k) {
        var count = SecondNite.filter(x=>x == v).length;
        if (count >= 60) {
            SecondNiteHour = v;
            return;
        }
    });
    var stMin = SecondNiteHour * 3600;
    var enMin = stMin + 3600;

    for (i = stMin; i < enMin; i++) {
        a = output._physicalSignals[2][i].filter(x => x <= -995 || x >= 995).length;
        if (a >= 200) {
            SecondNiteMin.push((i / 3600).toFixed(2));
        }
    }
    var SecondNiteMinUnique = SecondNiteMin.slice();
    var SecondNiteMinVal = "";

    $.unique(SecondNiteMinUnique).sort().reverse().forEach(function (v, k) {
        var count = SecondNiteMin.filter(x=>x == v).length;
        if (count >= 5 && SecondNiteMinVal == "") {
            SecondNiteMinVal = v;
        }
    });
    return SecondNiteMinVal * 3600;
}




function ThirdNight() {
    var SecondNiteSt = 75600;
    var SecondPattCount = 0;
    var SecondNite = [];
    var SecondNiteMin = [];
    var SecondNiteHour;
    var SecondNiteMin;
    while (SecondNiteSt < 50400) {
        a = output._physicalSignals[2][SecondNiteSt].filter(x => x <= -995 || x >= 995).length;
        if (a >= 255) {
            SecondNite.push(Math.floor(SecondNiteSt / 3600));
        }
        SecondNiteSt++;
    }
    var SecondNiteUnique = SecondNite.slice();
    $.unique(SecondNiteUnique).sort().forEach(function (v, k) {
        var count = SecondNite.filter(x=>x == v).length;
        if (count >= 60) {
            SecondNiteHour = v;
            return;
        }
    });
    var stMin = SecondNiteHour * 3600;
    var enMin = stMin + 3600;

    for (i = stMin; i < enMin; i++) {
        a = output._physicalSignals[2][i].filter(x => x <= -995 || x >= 995).length;
        if (a >= 200) {
            SecondNiteMin.push((i / 3600).toFixed(2));
        }
    }
    var SecondNiteMinUnique = SecondNiteMin.slice();
    var SecondNiteMinVal = "";

    $.unique(SecondNiteMinUnique).sort().reverse().forEach(function (v, k) {
        var count = SecondNiteMin.filter(x=>x == v).length;
        if (count >= 5 && SecondNiteMinVal == "") {
            SecondNiteMinVal = v;
        }
    });
    return SecondNiteMinVal * 3600;
}





function mode(arr) {
    return arr.sort((a, b) =>
        arr.filter(v => v === a).length - arr.filter(v => v === b).length
    ).pop();
}

function buildChart(fwd) {
    var windowSize = parseFloat($(".windowSize").val());
    if (fwd) {
        start += windowSize;
        end += windowSize;
    }
    else {
        start -= windowSize;
        end -= windowSize;
        if (start < 0) {
            start = 0;
            end = windowSize;
        }
    }
    var slider = document.getElementById('basic_slider');
    slider.noUiSlider.set(start);
    generateGraph();
}

function reinitChart() {
    end = start + parseFloat($(".windowSize").val());
    generateGraph();
}

function setNights() {
    start = parseFloat($('.nightSelect').val());
    end = start + parseFloat($(".windowSize").val());
    generateGraph();
}

plotAnalysisChart();

function plotAnalysisChart() {
    var chart = new CanvasJS.Chart("chartContainer", {
        animationEnabled: true,
        theme: "light2",
        title: {
            text: ""
        },
        axisY: {
        },
        data: [
        {
            type: "stackedBar100",
            toolTipContent: "",
            showInLegend: true,
            name: "April",
            dataPoints: [
                { y: 600, label: "" }
            ]
        },
        ]
    });
    chart.render();
}


function generateGraph() {
    AllWavesArray = [];

    var eegChuck = "";
    var leogChuck = "";
    var rtcChuck = "";
    var snoreChuck = "";
    var pulse = "";

    var y = 0;

    var xPoint = 0;

    ProgressBarShow();
    //========PLOT=====================================================================
    plotChart("LEOG", 0);
    plotChart("REOG", 1);
    plotChart("EEG", 2);
    plotChart("RTC", 2);
    plotChart("PULSE", 4);
    plotChart("SNORE", 5);
    plotChart("HPos", 6);
    plotChart("HMov", 7);
    //========PLOT=====================================================================
    ProgressBarHide();
    $('.timeWindow').text(secondtotime(start) + " - " + secondtotime(end));
}

function smoothArray(values, smoothing) {
    var value = values[0]; // start with the first input
    for (var i = 1, len = values.length; i < len; ++i) {
        var currentValue = values[i];
        value += (currentValue - value) / smoothing;
        values[i] = value;
    }
}

function smoothArray2(values) {
    var RC = 1.0 / (50 * 2 * 3.14);
    var dt = 1.0 / 256;
    var alpha = dt / (RC + dt);
    var filteredArray = [];
    filteredArray[0] = values[0];
    var numSamples = values.length;
    for (i = 1; i < numSamples; i++) {
        filteredArray[i] = filteredArray[i - 1] + (alpha * (values[i] - filteredArray[i - 1]));
    }
}



function lowPass(values, dt) {
    var alpha = 0.5;
    var RC = 256 * (1 - alpha) / alpha;
    var alpha = dt / (RC + dt)
    var n = values.length;
    values[0] = alpha * values[0];
    for (i = 1; i < n ; i++) {
        var a = alpha * values[i] + (1 - alpha) * values[i - 1];
        values[i] = a;
    }
}


function onMouseover(e) {
    //    alert($(e).closest('panel').html());
    //alert(e.dataSeries.type + ", dataPoint { x:" + e.dataPoint.x + ", y: " + e.dataPoint.y + " }");
}


function plotChart(idDiv, waveid) {

    var data = [];
    var dataseries = { type: "line", lineThickness: 1 };
    var datapoints = [];

    var xPoint = 0;


    var dataseriesAlpha = { markerType: "none", name: "Alpha", type: "line", lineThickness: 1 };
    var datapointsAlpha = [];

    var dataseriesBeta = { markerType: "none", name: "Beta", type: "line", lineThickness: 1 };
    var datapointsBeta = [];

    var dataseriesTheeta = { markerType: "none", name: "Delta", type: "line", lineThickness: 1 };
    var datapointsTheeta = [];

    var sumPoint = 0;

    var maxAmp;

    if (idDiv == "RTC") {

        var fftOut = [];
        var totalAmp = 0;
        for (i = start; i < end; i += 2) {
            var fft = new FFT(256, 256);


            //var arrWave2 = output._physicalSignals[waveid][i + 1].slice();
            //smoothArray(arrWave2, 50);

            var arrWave = output._physicalSignals[waveid][i].slice();
            smoothArray(arrWave, 50);

            ////  var arrWave3 = $.merge(arrWave2,arrWave);
            //var arrWave3 = $.merge($.merge([], arrWave), arrWave2);

            //console.log(arrWave);
            //console.log(arrWave2);
            //console.log(arrWave3);

            fft.forward(arrWave);
            //console.log(fft);
            fftOut.push(fft);
        }

        var pointAlpha = 0;
        var pointBeta = 0;
        var pointTheeta = 0;
        var pointG = 0;

        for (i = 0; i < fftOut.length; i++) {
            var objFFt = fftOut[i];

            for (k = 0; k < 128; k++) {

                var freq_ = objFFt.getBandFrequency(k);
                var amp = Math.sqrt(Math.pow(objFFt.real[k], 2)); // objFFt.spectrum[k];  //Math.atan(objFFt.imag[k] / (objFFt.real[k]));

                if (freq_ >= 8 && freq_ <= 14) {
                    datapointsAlpha.push({
                        x: pointAlpha == 0 ? pointAlpha : pointAlpha,
                        y: amp
                    });
                    pointAlpha++;
                    pointG++;
                }

                if (freq_ >= 13 && freq_ <= 30) {
                    datapointsBeta.push({
                        x: pointBeta == 0 ? pointBeta : pointBeta,
                        y: amp
                    });
                    pointG++;
                    pointBeta++;
                }

                if (freq_ >= 1 && freq_ <= 4) {
                    datapointsTheeta.push({
                        x: pointTheeta == 0 ? pointTheeta : pointTheeta,
                        y: amp   // Math.sqrt(Math.pow(objFFt.real[k], 2) + Math.pow(objFFt.imag[k], 2))
                    });
                    pointG++;
                    pointTheeta++;
                }

            }
        }

        dataseriesAlpha.dataPoints = datapointsAlpha;
        dataseriesBeta.dataPoints = datapointsBeta;
        dataseriesTheeta.dataPoints = datapointsTheeta;

        data.push(dataseriesAlpha);
        data.push(dataseriesBeta);
        data.push(dataseriesTheeta);
    }
    else {
        var lstWaveArray = [];
        for (i = start; i < end; i++) {

            var label = "";
            var arrWave = output._physicalSignals[waveid][i].slice();

            //var objWaveArray = [];

            smoothArray(arrWave, 7);
            var BaseLineEEG = FindBaseLine(arrWave) * (-1);

            $(arrWave).each(function (k, v) {

                if (idDiv == "EEG" || idDiv == "REOG" || idDiv == "LEOG")
                    v = v * (-1);

                if (idDiv == "SNORE")
                    v = v != 0 ? 20 * Math.log10(v / 1) : v;

                if (idDiv == "HPos")
                    label = v == 0 ? "HS" : "HT";


                sumPoint += v;
                //objWaveArray.push({ x: k, y: v });

                datapoints.push({
                    name: idDiv,
                    indexLabel: label,
                    x: xPoint,
                    y: v
                });
                xPoint++;

            });
            //lstWaveArray.push(objWaveArray);

        }
        //AllWavesArray.push(lstWaveArray);
        dataseries.dataPoints = datapoints;
        data.push(dataseries);

        //if (AllWavesArray.length == 7)
        //    ProcessASM(AllWavesArray);

    }

    ///////////STRIP LINE DATA////////
    var stripLineData = [];
    var dtStripLines = new Object();
    dtStripLines.value = sumPoint / xPoint;
    dtStripLines.label = 'BaseLine AT ' + (sumPoint / xPoint);
    stripLineData.push(dtStripLines);
    //////////////////////////////////
    var windowSize = $('.windowSize').val();

    ///////////STRIP LINE DATAX////////
    var multiplicationfactore = 256;

    if (idDiv == "SNORE")
        multiplicationfactore = 10;


    var stripLineDataX = [];
    for (i = 1; i <= 4; i++) {
        var dtStripLinesX = new Object();
        dtStripLinesX.value = i * (((end - start) * multiplicationfactore) / 4);
        dtStripLinesX.label = secondtotime(start + (i * (windowSize / 4)));
        stripLineDataX.push(dtStripLinesX);
    }

    //alert(((end - start) * multiplicationfactore) / 4);
    //////////////////////////////////

    var chart = new CanvasJS.Chart(idDiv, {
        animationEnabled: true,
        zoomEnabled: true,
        title: {
            text: ""
        },
        axisY: {
            //includeZero: false,
            valueFormatString: "-",
            //minimum: -50,
            //maximum: 50,
            stripLines: stripLineData
        },
        axisX: {
            valueFormatString: "-",
            stripLines: stripLineDataX
        },
        toolTip: {
            shared: true
        },
        data: data
    });

    chart.render();

    $('.dvASM').html('');

    for (i = start; i < end; i += 30) {
        var val = Math.ceil(i / 30);
        //console.log(start + ":" + val);
        var obj = objAnalyzed[val];
        var div = '<div style="color: black;background-color:' + obj.Color + '; width: 100%; text-align: center">' + obj.Tag + '</div>';
        $('.dvASM').append(div);
    }


}

function arrayMin(arr) {
    return arr.reduce(function (p, v) {
        return (p < v ? p : v);
    });
}

function findmax(val1, val2) {
    return val1 >= val2 ? val1 : val2;
}

function findmin(val1, val2) {
    return val1 <= val2 ? val1 : val2;
}

function getTenSecondBaseLine(start, end) {
    var retArr = [];
    for (i = start; i < end; i++) {
        var filterEEG = output._physicalSignals[2][i].slice();
        smoothArray(filterEEG, 7);
        $.merge(retArr, filterEEG);
    }
    var avg = retArr.reduce(function (total, num) { return total + num; }) / retArr.length;
    return avg;
}


function ProcessVertex(arr) {
    var windowSize = 102;
    var VertexFound = 0;

    //for (i = 0; i < 256; i++) {
    //    if (i + 128 < 255) {
    //        var max = Math.max(arr.slice(i, i + 128));
    //        var min = Math.min(arr.slice(i, i + 128));
    //        if (Math.abs(max - min) >= 60) {
    //            VertexFound = true;
    //            break;
    //        }
    //    }
    //    else {
    //        var max = Math.max(arr.slice(i, 255));
    //        var min = Math.min(arr.slice(i, 255));
    //        if (Math.abs(max - min) >= 60) {
    //            VertexFound = true;
    //            break;
    //        }
    //    }
    //}

    var max_fh = arr.slice(0, 102).reduce(function (lst, num) { return num > lst ? num : lst; });
    var min_fh = arr.slice(0, 102).reduce(function (lst, num) { return num < lst ? num : lst; });

    var max_sh = arr.slice(103, 205).reduce(function (lst, num) { return num > lst ? num : lst; });
    var min_sh = arr.slice(103, 205).reduce(function (lst, num) { return num < lst ? num : lst; });


    if (Math.abs(max_fh - min_fh) >= 75 || Math.abs(max_sh - min_sh) >= 75) {
        VertexFound = 1;
    }

    return VertexFound;
}


function ProcessSpindles(arrbak, arr, arrnext) {
    var BaseLineEEG = FindBaseLine(filterEEG) * (-1);
    $(arr).each(function (k, v) {
        v = v * (-1);
        if (prev == null)
            prev = v;

        if (next == null)
            next = v;

        if (prev != null && next != null) {
            var fst = findmin(prev, next);
            var third = findmax(prev, next);

            if (fst <= BaseLineEEG && BaseLineEEG <= third) {
                CollisionFound++;
            }

            prev = next;
            next = v;
        }
    });

}


function ProcessN3() {
    for (k = 0; k < 873 ; k++) {
        var initI = k * 6;
        var endI = initI + 6;
        var prev = null, next = null;
        var CollisionFound = 0;

        for (i = initI; i < endI; i++) {
            var filterEEG = output._physicalSignals[2][i].slice();
            smoothArray(filterEEG, 7);
            var BaseLineEEG = FindBaseLine(filterEEG) * (-1);

            $(filterEEG).each(function (k, v) {
                v = v * (-1);
                if (prev == null)
                    prev = v;

                if (next == null)
                    next = v;

                if (prev != null && next != null) {
                    var fst = findmin(prev, next);
                    var third = findmax(prev, next);

                    if (fst <= BaseLineEEG && BaseLineEEG <= third) {
                        CollisionFound++;
                    }

                    prev = next;
                    next = v;
                }

            });
        }
    }
}


function ProcessASM() {
    var objAnalysis = [];
    objAnalyzed = [];

    for (k = 0; k < 873 ; k++) { //873
        var initI = k * 30;
        var endI = initI + 30;
        var objSubAnalysis = [];

        var iTen = k * 10;
        var eTen = iTen + 10;

        var tenBaseline = getTenSecondBaseLine(iTen, eTen) * (-1);

        for (i = initI; i < endI; i++) {
            var prev = null, next = null;
            var CollisionFound = 0;
            var CollisionFoundTenSec = 0;
            var CollisionFoundSnore = 0;


            var filterLEOG = output._physicalSignals[0][i].slice();
            smoothArray(filterLEOG, 7);

            var filterEEG = output._physicalSignals[2][i].slice();
            smoothArray(filterEEG, 7);

            var BaseLineLEOG = FindBaseLine(filterLEOG) * (-1);
            var BaseLineEEG = FindBaseLine(filterEEG) * (-1);
            var BaseLineSnore = 20 * Math.log10(FindBaseLine(output._physicalSignals[5][i]));

            var EEGMaxAmp = arrayMin(filterEEG) * (-1);

            var minAmp_ = filterEEG[0];
            var maxAmp_ = filterEEG[0];

            var minAmp_sh = filterEEG[0];
            var maxAmp_sh = filterEEG[0];

            var snoreK_prev = null;
            var snoreK_next = null;

            $(output._physicalSignals[5][i]).each(function (k, v) {
                if (snoreK_prev == null)
                    snoreK_prev = v == 0 ? 0 : 20 * Math.log10(v);

                if (snoreK_next == null)
                    snoreK_next = v == 0 ? 0 : 20 * Math.log10(v);

                if (snoreK_prev != null && snoreK_next != null) {
                    var fst = findmin(snoreK_prev, snoreK_next);
                    var third = findmax(snoreK_prev, snoreK_next);
                    var k = v == 0 ? 0 : 20 * Math.log10(v);

                    if (BaseLineSnore >= 40) {
                        if (fst <= BaseLineSnore && BaseLineSnore <= third) {
                            CollisionFoundSnore++;
                        }
                    }

                    snoreK_prev = snoreK_next;
                    snoreK_next = v == 0 ? 0 : 20 * Math.log10(v);
                }
            });


            $(filterEEG).each(function (k, v) {
                v = v * (-1);
                if (prev == null)
                    prev = v;

                if (next == null)
                    next = v;

                if (prev != null && next != null) {
                    var fst = findmin(prev, next);
                    var third = findmax(prev, next);

                    if (fst <= BaseLineEEG && BaseLineEEG <= third) {
                        CollisionFound++;
                    }

                    if (fst <= tenBaseline && tenBaseline <= third) {
                        CollisionFoundTenSec++;
                    }
                    prev = next;
                    next = v;
                }

            });

            var VertexWave = 0;
            if (tenBaseline >= -10 && tenBaseline <= 10) {
                VertexWave = ProcessVertex(filterEEG);
            }

            objSubAnalysis.push({ NoCycle: CollisionFound, MaxEmpEEG: EEGMaxAmp, Vertex: VertexWave, NoCycleInTenBase: CollisionFoundTenSec, SnoreCycle: CollisionFoundSnore });
        }

        objAnalysis.push(objSubAnalysis);

    }
    $(objAnalysis).each(function (k, v) {
        var NumberCyclein30sec = v.filter(x=>Math.floor(x.NoCycle / 2) >= 5 && Math.floor(x.NoCycle / 2) <= 20).length;
        var NumberOfN2N3Cycles = v.filter(x=>Math.floor(x.NoCycle / 2) <= 4).length;

        var NumberOfREMCycles = v.filter(x=>Math.floor(x.NoCycle / 2) <= 2).length;


        var AmplitudeVariationREM = v.filter(x=>x.MaxEmpEEG > 30).length;
        var AmplitudeVariationEEG = v.filter(x=>x.MaxEmpEEG > 60).length;
        var AmplitudeN1Variation = v.filter(x=>x.MaxEmpEEG <= 60).length;

        var VertexWavesCount = v.filter(x=>x.Vertex == 1).length;
        var NumberCycle = v.filter(x=>Math.floor(x.NoCycle / 2) >= 7).length;
        var NumberCycleSnore = v.filter(x=>x.SnoreCycle >= 1).length;

        var TagN3Count = 0;
        var Spindle = 0;


        // ~>~>~>~> N3
        $(v).each(function (k, x) {
            if (TagN3Count < 6) {
                if (Math.floor(x.NoCycle / 2) < 3) {
                    TagN3Count++;
                }
                else {
                    TagN3Count = 0;
                }
            }
        });

        // ~>~>~>~> Spindles ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        for (i = 10 ; i >= 7; i--) {
            if (Spindle == 0) {
                for (k = 0; k < v.length; k++) {
                    x = v[k];
                    if (Spindle == 6)
                        Spindle = 0;
                    if (Math.floor(x.NoCycle / 2) >= i && x.MaxEmpEEG <= 50) {
                        Spindle++;
                    }
                    else if (Math.floor(x.NoCycle) / 2 >= i - 2 && Math.floor(x.NoCycle) / 2 <= i - 1 && Spindle != 0) {
                        Spindle++;
                    }
                    else if (Math.floor(x.NoCycle) / 2 <= i - 3 && Spindle != 0) {
                        break;
                    }
                }
            }
            else {
                break;
            }
        }

        // ~>~>~>~> Priority Conditions ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        if (NumberCyclein30sec >= 15 && AmplitudeVariationEEG >= 15) {       //   Amplitude > 60   :: Cycle 5-20
            objAnalyzed.push({ Span: k, Tag: "W", Color: '#eee7ea' });
        }
        else if (NumberCyclein30sec >= 13 && AmplitudeN1Variation >= 10) {    //   Amplitude <= 60   :: Cycle 5-20
            objAnalyzed.push({ Span: k, Tag: "N1", Color: '#bba0ad' });
        }
        else if (VertexWavesCount > 0) {                                      //  If Vertex Found Then N1 
            objAnalyzed.push({ Span: k, Tag: "N1", Color: '#eee7ea' });
        }
        else if (NumberOfREMCycles >= 15 && AmplitudeVariationREM > 10) {
            objAnalyzed.push({ Span: k, Tag: "RE", Color: '#a0adbb' });
        }
        else if (NumberOfN2N3Cycles >= 15 && TagN3Count == 6) {
            objAnalyzed.push({ Span: k, Tag: "N3", Color: '#77415c' });
        }
        else if (NumberOfN2N3Cycles >= 15) {
            objAnalyzed.push({ Span: k, Tag: "N2", Color: '#997085' });
        }
        else if (Spindle > 0) {
            objAnalyzed.push({ Span: k, Tag: "N2", Color: '#997085' });
        }
        else {
            objAnalyzed.push({ Span: k, Tag: "IN", Color: 'red' });
        }
        // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    });

    localStorage.DataAnaylzed = JSON.stringify(objAnalyzed);


    $(objAnalyzed).each(function (k, v) {
        var div = '<div style="color: black;background-color:' + v.Color + '; width: 100%; text-align: center"></div>';
        $('.dvAsmAll').append(div);
    });
    //    console.log(objAnalyzed);
}


function FindBaseLine(arr) {
    var total = 0;
    var sum = arr.reduce(function (total, num) { return total + num; });
    return sum / arr.length;
}



function setStart() {
    var hms = $('.clockTime').val();
    var a = hms.split(':');
    var seconds = ((a[0]) * 60 * 60) + (+a[1]) * 60;
    start = seconds;
    end = start + parseFloat($(".windowSize").val());
    generateGraph();
}

function RangeSlider(FirstNite, SecondNite) {
    var night = $('.nightSelect').val();

    if (night == 0) {
        var startS = 0;
        var endS = FirstNite == 0 ? 8 * 3600 : FirstNite;
    }
    else if (night == FirstNite) {
        var startS = FirstNite;
        var endS = SecondNite;
    }
    else {
        var startS = SecondNite;
        var endS = SecondNite + 36000;
    }

    var slider = document.getElementById('basic_slider');
    noUiSlider.create(slider, {
        start: startS,
        step: 1,
        connect: true,
        range: {
            'min': startS,
            'max': endS
        }
    });

    slider.noUiSlider.on('update', function () {
        $('.lblSliderval').text(secondtotime(slider.noUiSlider.get()));
    });

    slider.noUiSlider.on('change', function () {
        start = parseInt(slider.noUiSlider.get());
        end = start + parseFloat($(".windowSize").val());
        generateGraph();
    });
}


function secondtotime(s) {
    var h = Math.floor(s / 3600);
    s -= h * 3600;
    var m = Math.floor(s / 60);
    s -= m * 60;
    return h + ":" + (m < 10 ? '0' + m : m) + ":" + (s < 10 ? '0' + s : s);
}

function avc() {
    var lineData = {
        labels: ["January", "January"],
        datasets: [
            {
                label: "Example dataset",
                fillColor: "rgba(220,220,220,0.5)",
                strokeColor: "rgba(220,220,220,1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                pointHighlightFill: "#fff",
                pointHighlightStroke: "rgba(220,220,220,1)",
                data: [65, 59, 80, 81, 56, 55, 40]
            }
        ]
    };

    var lineOptions = {
        scaleShowGridLines: true,
        scaleGridLineColor: "rgba(0,0,0,.05)",
        scaleGridLineWidth: 1,
        bezierCurve: true,
        bezierCurveTension: 0.4,
        pointDot: true,
        pointDotRadius: 4,
        pointDotStrokeWidth: 1,
        pointHitDetectionRadius: 20,
        datasetStroke: true,
        datasetStrokeWidth: 2,
        datasetFill: true,
        responsive: true,
    };


    var ctx = document.getElementById("lineChart").getContext("2d");
    var myNewChart = new Chart(ctx).Line(lineData, lineOptions);
}