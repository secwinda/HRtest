var _viewer = this;

//获取父句柄（即采购申请）
var cardView = _viewer.getParHandler();

if(cardView) {
	_viewer.afterRender = function() {
		
		//获取后端/src/com/csdc/test/BuyApplyServ.java的calculate方法
		FireFly.doAct("TS_BUY_APPLY", "calculate", {AP_ID:cardView.getPKCode()},
				false, true, function(data) {
			cardView.getItem("AP_AMOUNT").setValue(data.AP_AMOUNT);
		})
	}
}