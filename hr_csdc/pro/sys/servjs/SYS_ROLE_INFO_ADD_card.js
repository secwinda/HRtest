var _viewer = this;

//获取父卡片的org_code并分别赋予新增角色的org_code
if (_viewer.params && _viewer.params.callBackHandler) { //存在父句柄
    var parentCard = _viewer.params.callBackHandler;
    //-----step1. org_code----
    //前端展示的“机构名称”实际是“机构编码通过数据字典转换出来的”
    _viewer.getItem("org_code").setValue(parentCard.itemValue("org_code"));
    _viewer.getItem("org_code").setText(parentCard.getItem("org_code").getText());

    //-----step2. org_name----
    //为了给角色的org_name赋值
    _viewer.getItem("org_name").setValue(parentCard.getItem("org_code").getText());
}


//角色名称提示语
$("#SYS_ROLE_INFO_ADD-role_name_div .right").append(
    $("<div>").text("1-20位字符，支持汉字，字母，数字").css({"color": "red", "margin-top":"10px"}));


//取消button：点击按钮关闭卡片
_viewer.getBtn("cancel").unbind("click").click(function () {
    Tab.close();
});

//保存btn，返回上一个界面
_viewer.saveMind = function() {
    _viewer.saveReturn = true;
};









