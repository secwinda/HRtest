var _viewer = this;


//编辑button
_viewer.getBtn("modify_user").bind("click", function () {
    Tab.open({
        //因为要传递机构名称，所以URL里要有主键（pkCode)
        "url": "SYS_USER_INFO_MODIFY.card.do?pkCode=" + _viewer.itemValue("seq_id"),
        "tTitle": "修改用户",
        "menuFlag": 3,
        "params" : {
            "callBackHandler" : _viewer,
            "closeCallBackFunc" : function() {
                _viewer.refresh();
            }
        }
    });
});



//业务用户类型：OA、非OA
var userType = _viewer.itemValue("user_type");
if (userType == 3) {  //OA业务用户
    _viewer.getItem("businessUser").setValue("使用OA账号");
}else if (userType == 2) {  //非OA业务用户
    _viewer.getItem("businessUser").setValue("不使用OA账号");
}else if (userType == 1 || userType ==5 || userType  ==4) {  //机构管理员、系统管理员、审计管理员
    //隐藏业务用户类型div
    var div = document.getElementById("SYS_USER_INFO-businessUser_div");
    div.style.display = 'none';
}