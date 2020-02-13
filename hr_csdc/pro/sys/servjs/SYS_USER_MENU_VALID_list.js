var _viewer = this;

var userCode;
var roleCode;
//判断：是否有用户列表的授权btn传来的参数
if (_viewer.params && _viewer.params.user_code) {
    if (_viewer.IS_FIRST === undefined) {
        _viewer.IS_FIRST = false;

        //获取userCode/roleCode
        //注：userCode/roleCode是上一个界面的列表里传来的
        userCode = _viewer.params.user_code;
        roleCode = _viewer.params.role_code;

        //SYS_USER_MENU展示当前user_code和role_code下的菜单
        _viewer.setExtWhere("and user_code = '" + userCode
            + "'and role_code = '" + roleCode + "'");

        _viewer.refresh();
    }

}

//生效起止时间：精确到时分秒就行、不需要微秒
$(input).substring(0, 19);

// var start_date = _viewer.getItem("start_date");
// start_date.setValue(start_date.getValue().substring(0, 19));
// var end_date = _viewer.getItem("end_date");
// end_date.setValue(end_date.getValue().substring(0, 19));

