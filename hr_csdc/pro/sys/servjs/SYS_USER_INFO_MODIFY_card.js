var _viewer = this;

//提示语
$("#SYS_USER_INFO_MODIFY-user_account_div .right").append(
    $("<div>").text("1-20位字符，支持字母、数字、下划线").css({"color": "red", "margin-top":"10px"}));

//取消button：点击按钮关闭卡片
_viewer.getBtn("cancel").unbind("click").click(function () {
    Tab.close();
});