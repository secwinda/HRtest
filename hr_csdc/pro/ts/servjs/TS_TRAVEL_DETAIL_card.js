var _viewer = this;

//主表页面
var cardView;
try {
	//主表是子表parent的parent
	//解释：子表的parent是主表里子表数据的list，这个list的parent才是主表
	cardView = _viewer.getParHandler().getParHandler();
} catch (e) {
	//
}

//处理时间：结束时间必须大于等于出发时间
var TD_BEGIN_DATE = _viewer.getItem("TD_BEGIN_DATE");
var TD_END_DATE = _viewer.getItem("TD_END_DATE");


//天数
var calDiffDays = function () {
    var startDate = _viewer.getItem("TD_BEGIN_DATE").getValue();
    var endDate = _viewer.getItem("TD_END_DATE").getValue();

    //计算天数
    if (startDate && endDate) {
        var diffDays = rhDate.doDateDiff("D", startDate, endDate) + 1;
        _viewer.getItem("TD_DAYS").setValue(diffDays);
    }


    //子表日期范围控制在主表时间段之间
	//即从主表读到出发日期和返回日期，子表的开始日期和结束日期必须在这两个值之间
	if (cardView) {
		var taBeginDate = cardView.itemValue("TA_BEGIN_DATE");
		var taEndDate = cardView.itemValue("TA_END_DATE");

		TD_BEGIN_DATE._opts.item_input_config = '{"minDate":"' + taBeginDate + '","maxDate":"' + taEndDate + '"}';

		TD_END_DATE._opts.item_input_config = '{"minDate":"' + (TD_BEGIN_DATE.getValue() || taBeginDate) + '","maxDate":"' + taEndDate + '"}';
	}

};


calDiffDays();

//自动刷新
_viewer.getItem("TD_BEGIN_DATE").change(calDiffDays);
_viewer.getItem("TD_END_DATE").change(calDiffDays);



