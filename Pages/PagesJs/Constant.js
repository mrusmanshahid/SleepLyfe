

ProgressBarHide();
DatePicker();
DatePickerMonth();
DatePickerMonthComplete();
DatePickerComplete();
DatePickerYear();
stopKeyPress();

var HCM_SetupMaster = {
    Vehicle: 10,
    Manufacturer: 11,
    ArrearType: 13,
    LoanType: 6,
    OverTimeRate: 14,
    SalaryStandard: 18,
    FuelType: 22,
    VehicleVariant: 23,
    YearSlabs: 34,
    IncrementType: 33
};


var HCM_SetupDetail =
    {
        BasicInterest: 78,
        PFLoanTypeId: 97
    }

var HCM_TaxLaw =
    {
        TaxLaw34: 8
    }

var HCM_ArrGroupBy = [{
    Id: 'clsLocation',
    Value: 'Location'
},
    {
        Id: 'clsCompany',
        Value: 'Company'
    },
    {
        Id: 'clsDepartment',
        Value: 'Department'
    }, {
        Id: 'clsDesignation',
        Value: 'Designation'
    }, {
        Id: 'clsCostCenter',
        Value: 'Cost Center'
    }
];

var HCM_UploadType =
    [{
        Id: 'Overtime',
        Value: 'Overtime'
    }, {
        Id: 'AbsentLog',
        Value: 'AbsentLog'
    }, {
        Id: 'Separation',
        Value: 'Separation'
    }, {
        Id: 'ContractRenewal',
        Value: 'ContractRenewal'
    }, {
        Id: 'Allowance',
        Value: 'Allowance'
    }, {
        Id: 'BankAccount',
        Value: 'BankAccount'
    }
    ];

function toggleDiv(div) {
    $(div).toggle();
}

function formatDate(_date) {
    if (_date == null)
        return;

    if (_date.indexOf('/') != -1) {
        var retDate = _date.substr(6, 4) + '-' + _date.substr(0, 2) + '-' + _date.substr(3, 2);
        return retDate;
    }
    else {
        if (_date == '' || _date == null || _date == undefined)
            return "";

        var d = new Date(_date);
        var month = (d.getMonth() + 1);
        var date = d.getDate();

        if (month >= 1 && month <= 9)
            month = '0' + month;

        if (date >= 1 && date <= 9)
            date = '0' + date;

        return d.getFullYear() + '-' + month + '-' + date;
    }
}

function serializeData(selector) {
    data = "";
    $(selector).find('input, select, textarea').each(function () {
        data += $(this).attr("name") + "=" + $(this).val() + "&";
    });
    return data.replace(/&$/g, "");
}

function CSS_BorderAndColor(selector, color) {
    $(selector).css("border-style", "solid");
    $(selector).css("border-weight", "5px");
    $(selector).css("border-color", color);
    $(selector).css("border-width", "1px");
}

function validateForm(selector) {
    check = true;
    $(selector).find('select').each(function () {
        if ($(this).val() == 0 || $(this).val() == null) {
            CSS_BorderAndColor(this, 'red');
            showError('Check All Mandotary Fields');
            check = false;
        }
        else
            CSS_BorderAndColor(this, 'green');
    });

    $(selector).find('input, textarea').each(function () {
        if ($(this).val() == "") {
            CSS_BorderAndColor(this, 'red');
            showError('Check All Mandotary Fields');
            check = false;
        }
        else
            CSS_BorderAndColor(this, 'green');
    });
    return check;
}

function FillDropDownByReference(DropDownReference, res) {
    $(DropDownReference).empty().append('<option selected="selected" value="0">--Select--</option>');
    $(res).each(function () {
        $(DropDownReference).append($("<option></option>").val(this.Id).html(this.Value));
    });
}

function ProgressBarShow() {
    $('#waitProgressBar').show();
    $('.loader').show();
}


function ProgressBarHide() {
    $('#waitProgressBar').hide();
    $('.loader').hide();
}

function cloneDiv(divToClone, divToAppend) {
    if (!validateForm(divToAppend))
        return;
    var cloned = $(divToClone).last().clone();
    resetControls(cloned);
    cloned.appendTo(divToAppend)
    DatePicker();
}

function showError(message) {
    AlertBox('Error!', message, 'error');
}

function showSuccess(message) {
    AlertBox('Success!', message, 'success');
}

function AlertBox(title, Message, type) {
    swal(title, Message, type);
}


function DatePicker() {
    $('.DatePicker').datepicker({
        todayBtn: "linked",
        keyboardNavigation: false,
        forceParse: false,
        calendarWeeks: true,
        startDate: '2d+',
        autoclose: true
    });
}

function DatePickerComplete() {
    $('.DatePickerComplete').datepicker({
        todayBtn: "linked",
        keyboardNavigation: false,
        forceParse: false,
        calendarWeeks: true,
        autoclose: true
    });
}


function DatePickerMonth() {
    $('.DatePickerMonth').datepicker({
        minViewMode: 1,
        keyboardNavigation: false,
        forceParse: false,
        autoclose: true,
        startDate: '2d+',
        todayHighlight: true
    });
}

function DatePickerYear() {
    $('.DatePickerYear').datepicker({
        minViewMode: 'years',
        keyboardNavigation: false,
        forceParse: false,
        autoclose: true,
        startDate: '2d+',
        todayHighlight: true,
        format: 'yyyy'
    });
}


function DatePickerMonthComplete() {
    $('.DatePickerMonthComplete').datepicker({
        minViewMode: 1,
        keyboardNavigation: false,
        forceParse: false,
        autoclose: true,
        todayHighlight: true
    });
}

function removeCloneDivs(div) {
    $(div).not(':first').remove();
}

function removeSelectedDiv(child, div) {
    if ($(child).closest(div).siblings().size() != 0)
        $(child).closest(div).remove();
}

function resetControls(selector) {
    $(selector).find('input, textarea').each(function () {
        $(this).val('');
    });
    $(selector).find('select').each(function () {
        $(this).val(0).change();
    });
}

function getCommaSeparatedValues(selector) {
    returnString = "";
    $(selector).each(function () {
        if ($(this).val() != null)
            returnString += $(this).val() + ','
    });
    return returnString + "0";

}



function getCommaSeparatedValues_CheckedBoxes(selector) {
    returnString = "";
    $(selector).each(function () {
        if ($(this).prop('checked')) {
            if ($(this).val() != null)
                returnString += $(this).val() + ','
        }
    });
    return returnString + "0";
}


function validateNumeric() {
    $('.numericOnly').keydown(function (e) {
        if (e.keyCode != 8) {
            if ($(this).val().indexOf(".") > 0 && e.keyCode == 110)
                return false;

            if (!((e.keyCode >= 48 && e.keyCode <= 57) || (e.keyCode >= 96 && e.keyCode <= 105) || (e.keyCode == 110) || (e.keyCode == 190))) {
                return false;
            }
        }
    });
}


function paginateTable(cls, lengthPerPage) {

    var totalRows = $(cls).find('tbody tr:has(td)').length;
    var recordPerPage = lengthPerPage;
    var totalPages = Math.ceil(totalRows / recordPerPage);

    var $pages = $(cls).find('tfoot');

    $pages.html('');

    var $select = $('<tr  ><td colspan="2"><select  class="form-control" id="tableSelect"><select></td><td><button type="button" id="prevv" class="btn btn-white"><i class="fa fa-chevron-left"></i> </button><button id="nextt" type="button" class="btn btn-white"><i class="fa fa-chevron-right"></i> </button></td>  </tr>').appendTo($pages);


    for (i = 0; i < totalPages; i++) {
        $('<option value = "' + (i + 1) + '">' + 'Page: ' + (i + 1) + '</option>').appendTo('#tableSelect');
    }



    $(cls).find('tbody tr:has(td)').hide();
    var tr = $('table tbody tr:has(td)');

    for (var i = 0; i <= recordPerPage - 1; i++) {
        $(tr[i]).show();
    }


    $('#prevv').click(function () {
        if (parseInt($('#tableSelect').val()) != 1)
            $('#tableSelect').val($('#tableSelect').val() - 1).change();
    });


    $('#nextt').click(function () {
        if (!(parseInt($('#tableSelect').val()) + 1 > totalPages))
            $('#tableSelect').val(parseInt($('#tableSelect').val()) + 1).change();
    });

    $('#tableSelect').change(function (event) {
        $(cls).find('tbody tr:has(td)').hide();
        var nBegin = ($(this).val() - 1) * recordPerPage;
        var nEnd = $(this).val() * recordPerPage - 1;
        $('#recordDisp').text(nBegin + ' ' + nEnd);
        for (var i = nBegin; i <= nEnd; i++) {
            $(tr[i]).show();
        }
    });



}


function removeBlankandNulls(val) {
    if (val == '' || val == null || val == undefined)
        return '----';
    else
        return val;
}


function stopKeyPress() {
    $('.keylock').keypress(function (event) {
        event.preventDefault();
    })
}


function FileUploadHandler(fileselector) {
    ProgressBarShow();
    var fileUpload = $(fileselector).get(0);
    var files = fileUpload.files;
    var data = new FormData();
    if (files.length <= 0) {
        showError('No File Uploaded!');
        ProgressBarHide();
        return '';
    }

    var filename = '';
    var isError = false;
    for (var i = 0; i < files.length; i++) {
        data.append(files[i].name, files[i]);
    }
    $.ajax({
        url: "UploadHandler.ashx",
        type: "POST",
        data: data,
        async: false,
        contentType: false,
        processData: false,
        success: function (result) { filename = result },
        error: function (err) { showError(err); isError = true; }
    });

    ProgressBarHide();
    return filename;
}


function excelOut(selector) {
    $(selector).table2excel({
        name: "Data",
        filename: "myFileName",
        fileext: ".xls"
    });
}

function sendPrint(selector) {
    $(selector).printThis();
}

function BindGroupByDDL() {
    //alert(HCM_ArrGroupBy.length);
    FillDropDownByReference('.ddlGroupBy', HCM_ArrGroupBy);
}


