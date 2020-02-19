var _viewer = this;

//取消button：点击按钮关闭卡片
_viewer.getBtn("cancel").unbind("click").click(function () {
    Tab.close();
});


var roleCode;
var orgCode;
var roleType;
//判断：是否有角色列表的"关联用户btn"传来的参数
if (_viewer.params && _viewer.params.role_code) {
    if (_viewer.IS_FIRST === undefined) {
        _viewer.IS_FIRST = false;

        //获取rolecode/orgCode/roleType
        //注：rolecode/orgCode/roleType是上一个界面的新增关联用户btn传来的
        roleCode = _viewer.params.role_code;
        orgCode = _viewer.params.org_code;
        roleType = _viewer.params.role_type;

        //SYS_USER_INFO展示当前org_code下的管理员/业务用户，且过滤已经关联的用户
        if (roleType == 1) {  //管理员
            _viewer.setExtWhere("and user_org_code = '" + orgCode + "'"
                + "and (user_type = 1 or user_type = 5 or user_type = 4) and user_code not in" +
                "(SELECT user_code FROM sys_user_role where role_code='" + roleCode + "')");
        } else if (roleType == 2) {  //业务
            _viewer.setExtWhere("and user_org_code = '" + orgCode + "'"
                + "and (user_type = 2 or user_type = 3) and user_code not in" +
                "(SELECT user_code FROM sys_user_role where role_code='" + roleCode + "')");
        }

        _viewer.refresh();
    }
}


//批量保存btn：batchSave
_viewer.getBtn("batchSave").unbind("click").click(function () {

    var arr = _viewer.grid.getSelectPKCodes();

    var dataList = $.map(arr, function (pk) {
        return {
            role_code: roleCode,
            user_code: _viewer.grid.getRowItemValue(pk, "user_code"),
            user_org_code: orgCode
        };
    });

    // console.log(dataList)
    FireFly.doAct(_viewer.servId, "doBatchSave", {dataList: $.toJSON(dataList)}, true, true, function () {
        //父页面刷新
        //_viewer.params.closeCallBackFunc是父页面通过“关联用户btn”传来的参数，其值为页面刷新
        if (_viewer.params && _viewer.params.closeCallBackFunc) {
            _viewer.params.closeCallBackFunc();
        }

        //点击保存btn后，返回父页面
        _viewer.backImg.mousedown();
    });

});




