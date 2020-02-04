package com.csdc.portal;

import com.rh.core.base.Bean;
import com.rh.core.serv.CommonServ;
import com.rh.core.serv.ParamBean;
import com.rh.core.serv.ServDao;
import com.rh.core.serv.bean.SqlBean;
import com.rh.core.util.Lang;


public class InsertOrgServ extends CommonServ {


    /**
     * 保存button前的动作，处理paramBean。软虹save方法直接将paramBean存入数据库
     * @param paramBean
     */
    @Override
    protected void beforeSave(ParamBean paramBean) {

        //----step1.org_code----
        String orgCode = Lang.getUUID();
        paramBean.set("org_code", orgCode);

        //----step2.seq_id-----
        //select MAX(id) from tablename
        Bean maxSeqidBean = ServDao.find("SYS_ORG_INFO", new SqlBean().selects("max(seq_id) MAX_"));
        int seqId = maxSeqidBean.getInt("MAX_") + 1;
        paramBean.set("seq_id", seqId);
    }



}
