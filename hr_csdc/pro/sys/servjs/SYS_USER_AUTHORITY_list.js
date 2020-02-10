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

        //SYS_ROLE_INFO展示当前org_code下的管理员/业务角色
        if (userType == 1 || userType == 5 || userType == 4) {  //管理员
            _viewer.setExtWhere("and org_code = '" + orgCode + "'"
            + "and role_type = 1");
        }else if (userType == 2 || userType == 3) {  //业务
            _viewer.setExtWhere("and org_code = '" + orgCode + "'"
                + "and role_type = 2");
        }

        _viewer.refresh();
    }

}

alert("userCode:" + userCode);
alert("orgCode:" + orgCode);
alert("userType:" + userType);

//过滤已经关联的角色
//获取后端/src/com/csdc/portal/UserAddRoleServ.java的getAttachedRole方法
FireFly.doAct("TS_EXPENSE_APPLY", "calculate", {EA_ID:cardView.getPKCode()},
    false, true, function(data) {
        cardView.getItem("EA_PAPER_COUNT").setValue(data.EA_PAPER_COUNT);
        cardView.getItem("EA_AMOUNT").setValue(data.EA_AMOUNT);
    })


