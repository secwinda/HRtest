var _viewer = this;

//判断：是否有用户列表的授权btn传来的参数
if (_viewer.params && _viewer.params.user_code) {
    if (_viewer.IS_FIRST === undefined) {
        _viewer.IS_FIRST = false;

        //SYS_USER_ROLE只展示当前user_code下的用户-角色关系
        _viewer.setExtWhere("and user_code = '" + _viewer.params.user_code + "'");

        _viewer.refresh();
    }

}

//新增关联角色button
_viewer.getBtn("add_role").bind("click", function () {

    //获取usercode/orgCode/userType，用于传到新增关联角色界面
    //注：usercode/orgCode/userType是上一个界面的授权btn传来的
    var userCode = _viewer.params.user_code;
    var orgCode = _viewer.params.org_code;
    var userType = _viewer.params.user_type;

    Tab.open({
        "url": "SYS_USER_AUTHORITY.list.do",
        "tTitle": "添加关联角色",
        "menuFlag": 3,
        "params" : {
            "user_code": userCode,
            "org_code": orgCode,
            "user_type": userType,
            "callBackHandler" : _viewer,
            "closeCallBackFunc" : function() {
                _viewer.refresh();
            }
        }
    })

});


//行按钮：设置有效期button
var modifyBtn = _viewer.grid.getBtn("modify_menu_date");
modifyBtn.unbind("click").bind("click", function () {

    //获取usercode/roleCode，用于传到设置有效期界面
    //注：usercode是上一个界面的授权btn传来的
    // var userCode = _viewer.params.user_code;

    //获取roleCode，用于传到授权界面
    var userCode = $(this).parent("td").siblings("td[icode='user_code']").text();
    var roleCode = $(this).parent("td").siblings("td[icode='role_code']").text();

    Tab.open({
        "url": "SYS_USER_MENU_VALID.list.do",
        "tTitle": "设置有效期",
        "menuFlag": 3,
        "params": {
            "user_code": userCode,
            "role_code": roleCode,
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

    var pk = jQuery(this).attr("rowpk"); //获取主键信息

    FireFly.doAct(_viewer.servId, "delete", {_PK_: pk}, true, true, function () {
        _viewer.refresh();
    });
})

