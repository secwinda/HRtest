var _viewer = this;

//获取父卡片的org_code，seq_id，level并分别赋予新增机构的parent_org_code，parent_org_id，level
_viewer.saveReturn = true;
if (_viewer.params && _viewer.params.callBackHandler) { //存在父句柄
    var parentCard = _viewer.params.callBackHandler;
    _viewer.getItem("parent_org_code").setValue(parentCard.itemValue("org_code"));
    _viewer.getItem("parent_org_code").setText(parentCard.getItem("org_code").getText());
    _viewer.getItem("parent_org_id").setValue(parentCard.itemValue("seq_id"));
    _viewer.getItem("level").setValue(parentCard.itemValue("level") - 0 + 1);

}


//提示语SYS_ORG_INFO_INSERT-org_name_div
$("#SYS_ORG_INFO_INSERT-org_name_div .right").append(
    $("<div>").text("1-20位字符，支持汉字、字母、数字").css({"color": "red", "margin-top": "10px"}));

//取消button：点击按钮关闭卡片
_viewer.getBtn("cancel").unbind("click").click(function () {
    Tab.close();
});

