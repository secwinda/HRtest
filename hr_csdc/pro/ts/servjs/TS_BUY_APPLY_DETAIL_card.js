var _viewer = this;

//采购金额
var calAmount = function (){
//debugger;
		
var itemPrice = _viewer.getItem("ITEM_PRICE").getValue();
var count = _viewer.getItem("DT_COUNT").getValue();

if (itemPrice && count) {
	var amount = itemPrice * count;
	_viewer.getItem("DT_AMOUNT").setValue(amount);
}

};

calAmount();

//自动刷新
_viewer.getItem("ITEM_PRICE").change(calAmount);
_viewer.getItem("DT_COUNT").change(calAmount);

