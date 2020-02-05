package com.csdc.portal;

import com.rh.core.base.Bean;
import com.rh.core.serv.CommonServ;
import com.rh.core.serv.ParamBean;
import com.rh.core.serv.ServDao;
import com.rh.core.serv.bean.SqlBean;
import com.rh.core.util.Lang;

public class ModifyUserServ extends CommonServ {
    /**
     * 保存button前的动作，处理paramBean。软虹save方法直接将paramBean存入数据库
     * @param paramBean
     */
    @Override
    protected void beforeSave(ParamBean paramBean) {
        //----判断两次输入的password是否一致----
        String password = paramBean.getStr("password");
        String confimPassword = paramBean.getStr("confirm_password");
        if (!password.equals(confimPassword)) {  //两次输入的密码不一致
            //前端弹出警告，如何做到？？？
        }
    }
}
