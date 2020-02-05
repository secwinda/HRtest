var _viewer = this;

//编辑机构button，绑定方法使用参考demo.js
_viewer.getBtn("modify_sys").bind("click", function () {
    Tab.open({
        //因为要传递机构名称，所以URL里要有主键（pkCode)
        "url": "SYS_ORG_INFO_MODIFY.card.do?pkCode=" + _viewer.itemValue("seq_id"),
        "tTitle": "修改机构",
        "menuFlag": 3,
        "params" : {
            "callBackHandler" : _viewer,
            "closeCallBackFunc" : function() {
                _viewer.refresh();
            }
        }
    });

});

//新增机构button
_viewer.getBtn("add_sys").bind("click", function () {
    Tab.open({
        "url": "SYS_ORG_INFO_INSERT.card.do",
        "tTitle": "新增机构",
        "menuFlag": 3,
        "params": {
            "callBackHandler" : _viewer,
            "closeCallBackFunc" : function () {
                _viewer.refresh();
            }
        }
    })
})

//新增用户button
_viewer.getBtn("add_user").bind("click", function () {
    Tab.open({
        "url": "SYS_USER_INFO_ADD.card.do",
        "tTitle": "新增用户",
        "menuFlag": 3,
        "params": {
            "callBackHandler" : _viewer,
            "closeCallBackFunc" : function () {
                _viewer.refresh();
            }
        }
    })
})


//创建日期：精确到时分秒就行、不需要微秒
var create_date = _viewer.getItem("create_date");
create_date.setValue(create_date.getValue().substring(0, 19));

//机构编码
_viewer.getItem("org_code_show").setValue(_viewer.itemValue("org_code"));
