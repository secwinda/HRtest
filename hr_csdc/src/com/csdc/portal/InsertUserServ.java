package com.csdc.portal;

import com.rh.core.base.Bean;
import com.rh.core.serv.CommonServ;
import com.rh.core.serv.ParamBean;
import com.rh.core.serv.ServDao;
import com.rh.core.serv.bean.SqlBean;
import com.rh.core.util.Lang;

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
        int userType = paramBean.getInt("businessUserType");
        paramBean.set("user_type", userType);

        //----step4.password----
        String password = paramBean.getStr("password");
        String confimPassword = paramBean.getStr("confirm_password");
        if (!password.equals(confimPassword)) {  //两次输入的密码不一致
            //前端弹出警告，如何做到？？？
        }
    }
}
