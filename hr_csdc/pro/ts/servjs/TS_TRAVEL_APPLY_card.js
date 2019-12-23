var _viewer = this;


//天数
var calDiffDays = function () {
    var startDate = _viewer.getItem("TA_BEGIN_DATE").getValue();
    var endDate = _viewer.getItem("TA_END_DATE").getValue();
    //console.log(endDate)


    if (startDate && endDate) {
        var diffDays = rhDate.doDateDiff("D", startDate, endDate) + 1;
        _viewer.getItem("TA_DAYS").setValue(diffDays);
    }

};

calDiffDays();

//自动刷新
_viewer.getItem("TA_BEGIN_DATE").change(calDiffDays);
_viewer.getItem("TA_END_DATE").change(calDiffDays);


//为流程里用到的“审批按钮”添加方法
try {
	//wfCard表示流程卡片里出现
	_viewer.wfCard._getBtn("BT_PASS").layoutObj.unbind("click").bind("click", function (event) {
		FireFly.doAct("TS_TRAVEL_APPLY", "save", {
				_PK_: _viewer.getPKCode(),
				TA_STATUS: "2"
			},
			false, true, function (data) {
				_viewer.refresh();
			});
	});
} catch (e) {
	//
}

