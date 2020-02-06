var _viewer = this;

//保存之前校验
_viewer.saveMind = function() {

    if (_viewer.itemValue("password") !== _viewer.itemValue("comfirm_password")) {
        _viewer.cardBarTipError("两次输入的密码不一致");
        return false;
    }

};

//账户提示语
$("#SYS_USER_INFO_MODIFY-user_account_div .right").append(
    $("<div>").text("管理员命名规则为：机构首字母缩写+admin 例上海开发部管理员账号为SHKFB_admin").css({"color": "red", "margin-top":"10px"}));

//密码提示语
$("#SYS_USER_INFO_MODIFY-password_div .right").append(
    $("<div>").text("12-20位字符(大写字母、小写字母、数字、特殊符号应至少包含三种)").css({"color": "red", "margin-top": "10px"}));


//业务用户类型：OA、非OA
var userType = _viewer.itemValue("user_type");
if (userType == 3) {  //OA业务用户
    _viewer.getItem("businessUser").setValue("使用OA账号");
}else if (userType == 2) {  //非OA业务用户
    _viewer.getItem("businessUser").setValue("不使用OA账号");
}else if (userType == 1 || userType ==5 || userType  ==4) {  //机构管理员、系统管理员、审计管理员
    //隐藏业务用户类型div
    var div = document.getElementById("SYS_USER_INFO_MODIFY-businessUser_div");
    div.style.display = 'none';
}


//是否显示使用人OA信息
if (userType == 3 || userType == 2) {  //业务用户
    //隐藏使用人OA信息div
    var divOAaccount = document.getElementById("SYS_USER_INFO_MODIFY-OAaccount_div");
    divOAaccount.style.display = 'none';
    var diaOAname = document.getElementById("SYS_USER_INFO_MODIFY-OAname_div");
    diaOAname.style.display = 'none';
}

//取消button：点击按钮关闭卡片
_viewer.getBtn("cancel").unbind("click").click(function () {
    Tab.close();
});

//点击保存btn后，返回列表
_viewer.saveReturn = true;