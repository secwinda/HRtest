var _viewer = this;

//判断：是否有角色列表的授权btn传来的参数
/*if (_viewer.params && _viewer.params.role_code) {
    if (_viewer.IS_FIRST === undefined) {
        _viewer.IS_FIRST = false;

        alert("roleCode:" + _viewer.params.role_code);

        var roleCode = _viewer.params.role_code;
        //SYS_ROLE_MENU只展示当前role_code下的角色-菜单关系
        _viewer.setExtWhere("and role_code = '" + roleCode + "'"
            + "(SELECT menu_code FROM sys_role_menu where role_code='" + roleCode + "')");


        _viewer.refresh();
    }

}*/

//获取角色列表的授权btn传来的参数：role_code
var roleCode = _viewer.params.role_code;

//menu_code：过滤SYS_ROLE_MENU里面已经与role_code关联的menu,只显示没有关联的menu
var menu_code = _viewer.getItem("menu_code");
//对数据字典进行过滤
menu_code._opts.item_input_config =
    'SYS_MENU_INFO,' +
    '{"EXTWHERE":"and menu_code not in (SELECT menu_code FROM sys_role_menu WHERE role_code=\'' + roleCode + '\')"}';

//role_code
_viewer.getItem("role_code").setValue(roleCode, true);

//返回到父界面
_viewer.saveReturn = true;

//取消button：点击按钮关闭卡片
_viewer.getBtn("cancel").unbind("click").click(function () {
    Tab.close();
});
