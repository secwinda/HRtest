var _viewer = this;

//获取父卡片的org_code并分别赋予新增用户的user_org_code
_viewer.saveReturn = true;
if (_viewer.params && _viewer.params.callBackHandler) { //存在父句柄
    var parentCard = _viewer.params.callBackHandler;
    //-----step1. user_org_code----
    //前端展示的“机构名称”实际是“机构编码通过数据字典转换出来的”
    _viewer.getItem("user_org_code").setValue(parentCard.itemValue("org_code"));
    _viewer.getItem("user_org_code").setText(parentCard.getItem("org_code").getText());

    //-----step2. user_org_name----
    //为了给user_org_name赋值
    _viewer.getItem("user_org_name").setValue(parentCard.getItem("org_code").getText());
}


//用户账户提示语
$("#SYS_USER_INFO_ADD-user_account_div .right").append(
    $("<div>").text("1-20位字符，支持汉字、字母、数字").css({"color": "red", "margin-top": "10px"}));

//密码提示语
$("#SYS_USER_INFO_ADD-password_div .right").append(
    $("<div>").text("12-20位字符(大写字母、小写字母、数字、特殊符号应至少包含三种)").css({"color": "red", "margin-top": "10px"}));

//取消button：点击按钮关闭卡片
_viewer.getBtn("cancel").unbind("click").click(function () {
    Tab.close();
});
