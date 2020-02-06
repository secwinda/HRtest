var _viewer = this;


//新增关联角色button
_viewer.getBtn("add_role").bind("click", function () {

    alert("新增关联角色。不知道如何实现。");

    // Tab.open({
    //     "url": "SYS_USER_ROLE_MANAGE.card.do?pkCode=" + _viewer.itemValue("seq_id"),
    //     "tTitle": "添加关联角色",
    //     "menuFlag": 3,
    //     "params" : {
    //         "callBackHandler" : _viewer,
    //         "closeCallBackFunc" : function() {
    //             _viewer.refresh();
    //         }
    //     }
    // });
});

//判断：是否有用户列表的授权btn传来的参数
if (_viewer.params && _viewer.params.user_code) {
    if (_viewer.IS_FIRST === undefined) {
        _viewer.IS_FIRST = false;
        _viewer.setExtWhere("and user_code='" + _viewer.params.user_code + "'");
        _viewer.refresh();
    }

}


//行按钮：设置有效期button
var modifyBtn = _viewer.grid.getBtn("modify_menu_date");
modifyBtn.unbind("click").bind("click", function () {

    alert("为用户关联的特定角色设置有效期。不会写。");

    var pk = jQuery(this).attr("rowpk");//获取主键信息
    Tab.open({
        "url": "SYS_USER_MENU_VALID.list.do?pkCode=" + pk,
        "tTitle": "设置有效期",
        "menuFlag": 3,
        "params": {
            "callBackHandler": _viewer,
            "closeCallBackFunc": function () {
                _viewer.refresh();
            }
        }
    })
})

//行按钮：删除button
var deleteBtn = _viewer.grid.getBtn("delete_user_role");
deleteBtn.unbind("click").bind("click", function () {

    alert("删除用户-角色关联");

})

