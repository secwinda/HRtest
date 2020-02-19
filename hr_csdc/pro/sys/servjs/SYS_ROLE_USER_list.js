var _viewer = this;

//判断：是否有角色列表的"关联用户btn"传来的参数
if (_viewer.params && _viewer.params.role_code) {
    if (_viewer.IS_FIRST === undefined) {
        _viewer.IS_FIRST = false;

        //SYS_ROLE_USER只展示当前role_code下的用户-角色关系
        _viewer.setExtWhere("and role_code = '" + _viewer.params.role_code + "'");

        _viewer.refresh();
    }

}

//新增关联用户button
_viewer.getBtn("add_user").bind("click", function () {

    //获取rolecode/orgCode/roleType，用于传到新增关联用户界面
    //注：rolecode/orgCode/roleType是上一个界面的授权btn传来的
    var roleCode = _viewer.params.role_code;
    var orgCode = _viewer.params.org_code;
    var roleType = _viewer.params.role_type;

    Tab.open({
        "url": "SYS_ROLE_AUTHORITY.list.do",
        "tTitle": "添加关联用户",
        "menuFlag": 3,
        "params" : {
            "role_code": roleCode,
            "org_code": orgCode,
            "role_type": roleType,
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

    if (confirm("是否确认删除？")) {
        FireFly.doAct(_viewer.servId, "delete", {_PK_: pk}, true, true, function () {
            _viewer.refresh();
        });
    }


})

