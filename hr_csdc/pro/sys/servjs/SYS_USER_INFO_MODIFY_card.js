var _viewer = this;

//账户提示语
$("#SYS_USER_INFO_MODIFY-user_account_div .right").append(
    $("<div>").text("管理员命名规则为：机构首字母缩写+admin 例上海开发部管理员账号为SHKFB_admin").css({"color": "red", "margin-top":"10px"}));

//密码提示语
$("#SYS_USER_INFO_MODIFY-password_div .right").append(
    $("<div>").text("12-20位字符(大写字母、小写字母、数字、特殊符号应至少包含三种)").css({"color": "red", "margin-top": "10px"}));


//取消button：点击按钮关闭卡片
_viewer.getBtn("cancel").unbind("click").click(function () {
    Tab.close();
});