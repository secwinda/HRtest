var _viewer = this;

//行按钮：详情button
var detailBtn = _viewer.grid.getBtn("role_detail_row");
detailBtn.unbind("click").bind("click", function () {

    var pk = jQuery(this).attr("rowpk");//获取主键信息
    Tab.open({
        "url": "SYS_ROLE_INFO.card.do?pkCode=" + pk,
        "tTitle": "角色详情",
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
var modifyBtn = _viewer.grid.getBtn("modiy_role_row");
modifyBtn.unbind("click").bind("click", function () {

    var pk = jQuery(this).attr("rowpk");//获取主键信息
    Tab.open({
        "url": "SYS_ROLE_INFO_MODIFY.card.do?pkCode=" + pk,
        "tTitle": "修改角色",
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
var delBtn = _viewer.grid.getBtn("delete_role_row");
delBtn.unbind("click").bind("click", function () {

    alert("删除角色");

    var pk = jQuery(this).attr("rowpk");//获取主键信息

    alert(pk);

    FireFly.doAct(_viewer.servId, "delete", {_PK_: pk}, true, true, function () {
        _viewer.refresh();
    });

})

// //行按钮：授权button
// var authorityBtn = _viewer.grid.getBtn("authority_role_row");
// authorityBtn.unbind("click").bind("click", function () {
//
//     //获取roleCode，用于传到授权界面
//     var roleCode = $(this).parent("td").siblings("td[icode='role_code']").text();
//
//     // 获取orgCode, roleType，用于传到授权界面
//     var orgCode = $(this).parent("td").siblings("td[icode='org_code']").text();
//     var roleType = $(this).parent("td").siblings("td[icode='role_type']").text();
//
//     Tab.open({
//         "url": "SYS_USER_ROLE.list.do",？？？这个要复制
//         "tTitle": "角色授权",
//         "menuFlag": 3,
//         "params" : {
//             "user_code": userCode,
//             "org_code": orgCode,
//             "user_type": userType,
//             "callBackHandler" : _viewer,
//             "closeCallBackFunc" : function() {
//                 _viewer.refresh();
//             }
//         }
//     })
// })
//
//
