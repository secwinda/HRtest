var _viewer = this;

//为流程里用到的“审批按钮”添加方法
try {
    //wfCard表示流程卡片里出现
    _viewer.wfCard._getBtn("BTN_PASS").layoutObj.unbind("click").bind("click", function (event) {
        FireFly.doAct("TS_BUY_APPLY", "save", {
                _PK_: _viewer.getPKCode(),
                AP_STATUS: "2"
            },
            false, true, function (data) {
                _viewer.refresh();
            });
    });
} catch (e) {
    //
}