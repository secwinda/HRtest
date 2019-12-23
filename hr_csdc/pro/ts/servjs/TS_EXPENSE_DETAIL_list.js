var _viewer = this;

//获取父句柄（即报销申请）
//用法详解/pro/sy/base/frame/engines/rhListView.js
var cardView = _viewer.getParHandler();

//getPKCode：获取主键
//console.log(cardView.getPKCode());

if(cardView) {
	_viewer.afterRender = function() {
		
		//获取后端/src/com/csdc/test/ExpenseServ.java的calculate方法
		FireFly.doAct("TS_EXPENSE_APPLY", "calculate", {EA_ID:cardView.getPKCode()},
				false, true, function(data) {
			cardView.getItem("EA_PAPER_COUNT").setValue(data.EA_PAPER_COUNT);
			cardView.getItem("EA_AMOUNT").setValue(data.EA_AMOUNT);
		})
	}
}