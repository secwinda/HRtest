var _viewer = this;

//机构名称
var initOrgName = "";
_viewer.getItem("org_name").setValue(initOrgName);

//提示语SYS_ORG_INFO_INSERT-org_name_div
$("#SYS_ORG_INFO_INSERT-org_name_div .right").append(
    $("<div>").text("1-20位字符，支持汉字、字母、数字").css({"color": "red", "margin-top":"10px"}));

//取消button：点击按钮关闭卡片
_viewer.getBtn("cancel").unbind("click").click(function () {
    Tab.close();
});

//上级机构名
_viewer.afterRender = function() {
    /**
     * FireFly.doAct 执行某服务的某个方法和后台交互
     * sld 服务编码
     * ald 方法编码
     * data json格式的数据，用于传递给后台使用
     * tipFlag 是否提示信息
     * async 异步标识
     * func 成功执行后的回调方法
     */
    //获取后端/src/com/csdc/portal/InsertOrgServ.java的findParentOrgName方法
    FireFly.doAct("SYS_ORG_INFO", "findParentOrgName",
        false,
        false, true,
        function(data) {
            cardView.getItem("parent_org_name").setValue(data.parent_org_name);
        })

}