package com.csdc.portal;

import com.rh.core.base.Bean;
import com.rh.core.base.Context;
import com.rh.core.serv.CommonServ;
import com.rh.core.serv.OutBean;
import com.rh.core.serv.ParamBean;
import com.rh.core.serv.ServDao;
import com.rh.core.serv.bean.SqlBean;
import com.rh.core.util.EncryptUtils;
import com.rh.core.util.Lang;
import com.rh.core.util.PinyinUtils;

import java.util.Date;
import java.util.List;

public class InsertOrgServ extends CommonServ {

    /**
     * 根据parent_org_code读数据库，查询parent_org_name并返回
     * @param paramBean 前端传来的bean
     * @return
     */
    public OutBean findParentOrgName(ParamBean paramBean) {
        String parentOrgCode = paramBean.getStr("parent_org_code");

        //select org_name from SYS_ORG_INFO where org_code=parentOrgCode
        Bean parentOrgBean = ServDao.find("SYS_ORG_INFO", new SqlBean().and("org_code", parentOrgCode).selects("org_name"));

        return new OutBean(parentOrgBean);
    }

    /**
     * 新增机构
     * @param paramBean 前端传来的bean
     * @return
     */
    @Override
    protected OutBean add(ParamBean paramBean) {

        OutBean orgBean = new OutBean();

        //org_code
        String orgCode = Lang.getUUID();
        orgBean.set("org_code", orgCode);

        //orgName
        if (paramBean.isNotEmpty("org_name")) {
            String orgName = paramBean.getStr("org_name");
            orgBean.set("org_name", orgName);
        }

        //parentOrgCode
        if (paramBean.isNotEmpty("parent_org_code")) {
            String parentOrgCode = paramBean.getStr("parent_org_code");
            orgBean.set("parent_org_code", parentOrgCode);
        }

        //parent_org_id
        if (paramBean.isNotEmpty("parent_org_id")) {
            String parentOrgId = paramBean.getStr("parent_org_id");
            orgBean.set("parent_org_id", parentOrgId);
        }

        // level
        if (paramBean.isNotEmpty("level")) {
            int parentLevel = Integer.parseInt(paramBean.getStr("level"));
            byte level = (byte) (parentLevel - 1);
            orgBean.set("level", level);
        }

        // is_delete
        byte isDelete = 0;
        orgBean.set("is_delete", isDelete);

        // create_user
        String createUser = "当前登录的用户??";
        orgBean.set("create_user", createUser);

        // create_date
        Date createDate = new Date();
        orgBean.set("create_date", createDate);


//        ??上面这些东西如何传递给outbean,我的写法对么？
        return orgBean;

    }


}
