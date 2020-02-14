var _viewer = this;

//行按钮：详情button
var detailBtn = _viewer.grid.getBtn("role_detail_row");
detailBtn.unbind("click").bind("click", function () {

    var pk = jQuery(this).attr("rowpk");//获取主键信息
    Tab.open({
        "url": "SYS_ROLE_INFO.card.do?pkCode=" + pk,
        "tTitle": "角色详情",
        "menuFlag": 3,
        "params": {
            "callBackHandler": _viewer,
            "closeCallBackFunc": function () {
                _viewer.refresh();
            }
        }
    })
})


//行按钮：编辑button
var modifyBtn = _viewer.grid.getBtn("modiy_role_row");
modifyBtn.unbind("click").bind("click", function () {

    var pk = jQuery(this).attr("rowpk");//获取主键信息
    Tab.open({
        "url": "SYS_ROLE_INFO_MODIFY.card.do?pkCode=" + pk,
        "tTitle": "修改角色",
        "menuFlag": 3,
        "params": {
            "callBackHandler": _viewer,
            "closeCallBackFunc": function () {
                _viewer.refresh();
            }
        }
    })
})

//行按钮：删除button
var delBtn = _viewer.grid.getBtn("delete_role_row");
delBtn.unbind("click").bind("click", function () {


    var pk = jQuery(this).attr("rowpk");//获取主键信息

    if (confirm("是否确认删除？")) {
        FireFly.doAct(_viewer.servId, "delete", {_PK_: pk}, true, true, function () {
            _viewer.refresh();
        });
    }

});

//行按钮：授权button
var authorityBtn = _viewer.grid.getBtn("authority_role_row");
authorityBtn.unbind("click").bind("click", function () {

    //获取roleCode，用于传到授权界面
    var roleCode = $(this).parent("td").siblings("td[icode='role_code']").text();

    Tab.open({
        "url": "SYS_ROLE_MENU.card.do",
        "tTitle": "角色关联功能",
        "menuFlag": 3,
        "params": {
            "role_code": roleCode,
            "callBackHandler": _viewer,
            "closeCallBackFunc": function () {
                _viewer.refresh();
            }
        }
    })
})


