var _viewer = this;


//编辑button
_viewer.getBtn("modify_user").bind("click", function () {
    Tab.open({
        //因为要传递机构名称，所以URL里要有主键（pkCode)
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