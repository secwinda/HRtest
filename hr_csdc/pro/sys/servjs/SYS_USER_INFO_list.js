var _viewer = this;

//行按钮：详情button
var detailBtn = _viewer.grid.getBtn("user_detail_row");
detailBtn.unbind("click").bind("click", function () {

    var pk = jQuery(this).attr("rowpk");//获取主键信息
    Tab.open({
        "url": "SYS_USER_INFO.card.do?pkCode=" + pk,
        "tTitle": "用户详情",
        "menuFlag": 3,
        "params" : {
            "callBackHandler" : _viewer,
            "closeCallBackFunc" : function() {
                _viewer.refresh();
            }
        }
    })
})


//行按钮：编辑button
var modifyBtn = _viewer.grid.getBtn("modiy_user_row");
modifyBtn.unbind("click").bind("click", function () {

    var pk = jQuery(this).attr("rowpk");//获取主键信息
    Tab.open({
        "url": "SYS_USER_INFO_MODIFY.card.do?pkCode=" + pk,
        "tTitle": "修改用户",
        "menuFlag": 3,
        "params" : {
            "callBackHandler" : _viewer,
            "closeCallBackFunc" : function() {
                _viewer.refresh();
            }
        }
    })
})

//行按钮：删除button
var delBtn = _viewer.grid.getBtn("delete_user_row");
delBtn.unbind("click").bind("click", function () {

    alert("删除用户");
    var pk = jQuery(this).attr("rowpk");//获取主键信息

})

//行按钮：授权button
var authorityBtn = _viewer.grid.getBtn("authority_user_row");
authorityBtn.unbind("click").bind("click", function () {

    alert("授权用户");
    var pk = jQuery(this).attr("rowpk");//获取主键信息
    Tab.open({
        "url": "SYS_USER_ROLE.list.do?pkCode=" + pk,
        "tTitle": "用户授权",
        "menuFlag": 3,
        "params" : {
            "callBackHandler" : _viewer,
            "closeCallBackFunc" : function() {
                _viewer.refresh();
            }
        }
    })
})


