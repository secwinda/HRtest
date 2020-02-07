package com.csdc.portal;

import com.rh.core.base.Bean;
import com.rh.core.serv.CommonServ;
import com.rh.core.serv.OutBean;
import com.rh.core.serv.ParamBean;
import com.rh.core.serv.ServDao;
import com.rh.core.serv.bean.SqlBean;
import com.rh.core.util.EncryptUtils;
import com.rh.core.util.Lang;
import org.apache.commons.lang.StringUtils;

import java.util.Date;

public class InsertUserServ extends CommonServ {
    /**
     * 保存button前的动作，处理paramBean。软虹save方法直接将paramBean存入数据库
     * @param paramBean
     */
    @Override
    protected void beforeSave(ParamBean paramBean) {

        //----step1.user_code----
        String userCode = Lang.getUUID();
        paramBean.set("user_code", userCode);

        //----step2.seq_id-----
        //select MAX(id) from tablename
        Bean maxSeqidBean = ServDao.find("SYS_USER_INFO", new SqlBean().selects("max(seq_id) MAX_"));
        int seqId = maxSeqidBean.getInt("MAX_") + 1;
        paramBean.set("seq_id", seqId);

        //----step3.user_type----
        int userType = paramBean.getInt("user_type");
        if (userType == 1) {  //机构管理员
            paramBean.set("user_type", userType);
        } else {  //业务用户
            int businessUserType = paramBean.getInt("businessUserType");
            paramBean.set("user_type", businessUserType);
        }

        //----step4.password----
        String password = paramBean.getStr("password");
        if (StringUtils.isNotEmpty(password)) {
            //密码用MD5加密，以保证存入数据库的密码是密文
            password = EncryptUtils.encrypt(password, EncryptUtils.MD5);
            System.out.println(password);
            paramBean.set("password", password);
        }
    }

    /**
     * 保存button后的动作.将新增用户的密码插入sys_password_record
     * @param paramBean 前端页面的bean
     * @param outBean 存入数据库中的bean
     */
    @Override
    protected void afterSave(ParamBean paramBean, OutBean outBean) {
        String recordId = Lang.getUUID();
        String userCode = outBean.getStr("user_code");
        String password = paramBean.getStr("password");
        int status = 0;

        if (StringUtils.isNotEmpty(password) && StringUtils.isNotEmpty(userCode)) {
            //插入数据
            ServDao.save("SYS_PASSWORD_RECORD", new Bean().set("record_id", recordId).
                    set("user_code", userCode).set("password", password).set("status", status).
                    set("create_date", new Date()));
        }
    }
}
