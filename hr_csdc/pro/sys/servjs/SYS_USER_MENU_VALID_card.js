var _viewer = this;

//生效起止时间：精确到年月日就行、不需要时分秒
var formatDate = function (){

    var start_date = _viewer.getItem("start_date");
    start_date.setValue(start_date.getValue().substring(0, 10));

    var end_date = _viewer.getItem("end_date");
    end_date.setValue(end_date.getValue().substring(0, 10));

};

formatDate();

//自动刷新
_viewer.getItem("start_date").change(formatDate);
_viewer.getItem("end_date").change(formatDate);

//有效天数
var calculateDays = function (){

    var dateSpan, iDays;
    var startDate = _viewer.getItem("start_date").getValue().substring(0, 10);
    var endDate = _viewer.getItem("end_date").getValue().substring(0, 10);

    var sDate1 = Date.parse(startDate);
    var sDate2 = Date.parse(endDate);
    dateSpan = sDate2 - sDate1;
    dateSpan = Math.abs(dateSpan);
    iDays = Math.floor(dateSpan / (24 * 3600 * 1000));

    _viewer.getItem("valid_days").setValue(iDays);

};

calculateDays();

//自动刷新
_viewer.getItem("valid_days").change(calculateDays);




