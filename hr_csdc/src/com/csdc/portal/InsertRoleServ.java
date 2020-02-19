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

import javax.print.attribute.standard.OrientationRequested;
import java.util.Date;

public class InsertRoleServ extends CommonServ {
    /**
     * 保存button前的动作，处理paramBean。软虹save方法直接将paramBean存入数据库
     * @param paramBean 前端数据
     */
    @Override
    protected void beforeSave(ParamBean paramBean) {

        //----step1.role_code----
        String roleCode = Lang.getUUID();
        paramBean.set("role_code", roleCode);

        //----step2.seq_id-----
        //select MAX(id) from tablename
        Bean maxSeqidBean = ServDao.find("SYS_ROLE_INFO", new SqlBean().selects("max(seq_id) MAX_"));
        int seqId = maxSeqidBean.getInt("MAX_") + 1;
        paramBean.set("seq_id", seqId);

        //----step3.org_id && parent_org_code && parent_id----
        String orgCode = paramBean.getStr("org_code");
        if (StringUtils.isNotEmpty(orgCode)) {
            Bean orgBean = ServDao.find("SYS_ORG_INFO",
                    new SqlBean().and("org_code", orgCode).and("is_delete", 0)
                            .selects("seq_id, parent_org_code, parent_org_id"));

            int orgId = orgBean.getInt("seq_id");
            String parentOrgCode = orgBean.getStr("parent_org_code");
            int parentOrgId = orgBean.getInt("parent_org_id");

            paramBean.set("org_id", orgId);
            paramBean.set("parent_org_code", parentOrgCode);
            paramBean.set("parent_org_id", parentOrgId);
        }
    }
}
