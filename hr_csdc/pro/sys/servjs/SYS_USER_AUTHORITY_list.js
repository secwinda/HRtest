var _viewer = this;

//取消button：点击按钮关闭卡片
_viewer.getBtn("cancel").unbind("click").click(function () {
    Tab.close();
});


var userCode;
var orgCode;
var userType;
//判断：是否有用户列表的授权btn传来的参数
if (_viewer.params && _viewer.params.user_code) {
    if (_viewer.IS_FIRST === undefined) {
        _viewer.IS_FIRST = false;

        //获取userCode/orgCode/userType
        //注：usercode/orgCode/userType是上一个界面的新增关联角色btn传来的
        userCode = _viewer.params.user_code;
        orgCode = _viewer.params.org_code;
        userType = _viewer.params.user_type;

        //SYS_ROLE_INFO展示当前org_code下的管理员/业务角色，且过滤已经关联的角色
        if (userType == 1 || userType == 5 || userType == 4) {  //管理员
            _viewer.setExtWhere("and org_code = '" + orgCode + "'"
                + "and role_type = 1 and role_code not in" +
                "(SELECT role_code FROM sys_user_role where user_code='" + userCode + "')");
        } else if (userType == 2 || userType == 3) {  //业务
            _viewer.setExtWhere("and org_code = '" + orgCode + "'"
                + "and role_type = 2 and role_code not in" +
                "(SELECT role_code FROM sys_user_role where user_code='" + userCode + "')");
        }

        _viewer.refresh();
    }

}


//批量保存btn：batchSave
_viewer.getBtn("batchSave").unbind("click").click(function () {

    var arr = _viewer.grid.getSelectPKCodes();


    var dataList = $.map(arr, function (pk) {
        return {
            user_code: userCode,
            role_code: _viewer.grid.getRowItemValue(pk, "role_code"),
            role_name: _viewer.grid.getRowItemValue(pk, "role_name"),
            org_code: orgCode
        };
    });

    // console.log(dataList)
    FireFly.doAct(_viewer.servId, "doBatchSave", {dataList: $.toJSON(dataList)}, true, true, function () {
        //父页面刷新
        //_viewer.params.closeCallBackFunc是父页面通过“授权btn”传来的参数，其值为页面刷新
        if (_viewer.params && _viewer.params.closeCallBackFunc) {
            _viewer.params.closeCallBackFunc();
        }

        //点击保存btn后，返回父页面
        _viewer.backImg.mousedown();
    });



});




