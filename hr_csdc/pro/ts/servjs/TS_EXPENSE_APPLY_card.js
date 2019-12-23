var _viewer = this;

//单据总数 && 报销总金额（数字）
//后端实现，详见/src/com/csdc/test/DetailServ.java && ExpenseServ.java


//人民币大写转换
var cnAmount = function () {
	var RMBnumber = _viewer.getItem("EA_AMOUNT").getValue();
	var RMBcn = Format.RMBCapital(RMBnumber);
	_viewer.getItem("EA_CN_AMOUNT").setValue(RMBcn);
}
cnAmount();


//自动刷新
_viewer.getItem("EA_AMOUNT").change(cnAmount);


//为流程里用到的“审批通过”button添加方法
try {
	//wfCard表示流程卡片里出现
	_viewer.wfCard._getBtn("BTN_PASS").layoutObj.unbind("click").bind("click", function (event) {
		FireFly.doAct("TS_EXPENSE_APPLY", "save", {
				_PK_: _viewer.getPKCode(),
				EA_STATUS: "2"
			},
			false, true, function (data) {
				_viewer.refresh();
			});
	});
} catch (e) {
	//
}

//为流程里用到的“发放”button添加方法
try {
	//wfCard表示流程卡片里出现
	_viewer.wfCard._getBtn("BTN_GIVE").layoutObj.unbind("click").bind("click", function (event) {
		FireFly.doAct("TS_EXPENSE_APPLY", "save", {
				_PK_: _viewer.getPKCode(),
				EA_STATUS: "3"
			},
			false, true, function (data) {
				_viewer.refresh();
			});
	});
} catch (e) {
	//
}

