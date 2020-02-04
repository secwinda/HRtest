var _viewer = this;

//提示语
$("#SYS_ORG_INFO_MODIFY-org_name_div .right").append(
    $("<div>").text("1-20位字符，支持汉字、字母、数字").css({"color": "red", "margin-top":"10px"}));

//取消button：点击按钮关闭卡片
_viewer.getBtn("cancel").unbind("click").click(function () {
    Tab.close();
});