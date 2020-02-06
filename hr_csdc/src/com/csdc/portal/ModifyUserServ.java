package com.csdc.portal;

import com.rh.core.base.Bean;
import com.rh.core.base.TipException;
import com.rh.core.serv.CommonServ;
import com.rh.core.serv.OutBean;
import com.rh.core.serv.ParamBean;
import com.rh.core.serv.ServDao;
import com.rh.core.serv.bean.SqlBean;
import com.rh.core.util.EncryptUtils;
import com.rh.core.util.Lang;
import org.apache.commons.lang.StringUtils;

public class ModifyUserServ extends CommonServ {
    /**
     * 保存button前的动作，处理paramBean。软虹save方法直接将paramBean存入数据库
     * @param paramBean
     */
    @Override
    protected void beforeSave(ParamBean paramBean) {

        String password = paramBean.getStr("password");
        if (StringUtils.isNotEmpty(password)) {
            //密码用MD5加密，以保证存入数据库的密码是密文
            password = EncryptUtils.encrypt(password, EncryptUtils.MD5);
            System.out.println(password);
            paramBean.set("password", password);
        }

    }

    /**
     * 保存button后的动作
     * @param paramBean 前端页面的bean
     * @param outBean 存入数据库中的bean
     */
    @Override
    protected void afterSave(ParamBean paramBean, OutBean outBean) {
        String userCode = outBean.getStr("user_code");
        String password = paramBean.getStr("password");
        if (StringUtils.isNotEmpty(password)) {
            //update多个字段，用updates
            ServDao.updates("SYS_PASSWORD_RECORD", new Bean().set("password", password),
                    new Bean().set("user_code", userCode));
        }

    }
}
