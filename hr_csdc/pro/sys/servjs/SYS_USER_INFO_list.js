var _viewer = this;


//编辑button
_viewer.getBtn("modiy_user_row").bind("click", function () {

    console.log("进入编辑用户卡片");

    Tab.open({
        "url": "SYS_USER_INFO_MODIFY.card.do?pkCode=" + _viewer.itemValue("seq_id"),
        "tTitle": "修改用户",
        "menuFlag": 3,
        "params" : {
            "callBackHandler" : _viewer,
            "closeCallBackFunc" : function() {
                _viewer.refresh();
            }
        }
    });

});