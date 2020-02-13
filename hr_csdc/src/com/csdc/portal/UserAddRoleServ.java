package com.csdc.portal;

import com.rh.core.base.Bean;
import com.rh.core.base.Context;
import com.rh.core.serv.CommonServ;
import com.rh.core.serv.OutBean;
import com.rh.core.serv.ParamBean;
import com.rh.core.serv.ServDao;
import com.rh.core.serv.bean.SqlBean;
import com.rh.core.util.JsonUtils;
import com.rh.core.util.Lang;

import java.util.*;

public class UserAddRoleServ extends CommonServ {
    /**
     * 获取用户已关联的角色
     * @param paramBean 前端的参数
     * @return 角色rolecode集合
     */
    public OutBean getAttachedRole(ParamBean paramBean) {

        //step1. 在SYS_USER_ROLE中搜索用户关联的角色
        String userCode = paramBean.getStr("userCode");
        List<Bean> roleList = ServDao.finds("SYS_USER_ROLE",
                new SqlBean().and("user_code", userCode).and("is_delete", 0));

        Set<String> roleCodeSet = new HashSet<>();
        for (Bean bean : roleList) {
            roleCodeSet.add(bean.getStr("role_code"));
        }

        //-----测试遍历----
        for (String str : roleCodeSet) {
            System.out.println(str);
        }



        OutBean roleBean = new OutBean();
        roleBean.set("roleCodeSet", roleCodeSet);

        //roleBean
        return roleBean;

    }


    /**
     * 批量保存到SYS_USER_ROLE
     * @param paramBean 前端
     * @return 存入数据库的bean
     */
    public OutBean doBatchSave(ParamBean paramBean) {

        //前端勾选的角色集合
        List<Bean> dataList = JsonUtils.toBeanList(paramBean.getStr("dataList"));

        for (Bean bean : dataList) {

            //role_code
            String roleCode = bean.getStr("role_code");

            //role_name
            Bean roleBean = ServDao.find("SYS_ROLE_INFO",
                    new SqlBean().and("role_code", roleCode).and("is_delete", 0).selects("role_name"));
            String roleName = roleBean.getStr("role_name");

            //user_code/user_id
            String userCode = bean.getStr("user_code");
            Bean userBean = ServDao.find("SYS_USER_INFO",
                    new SqlBean().and("user_code", userCode).and("is_delete", 0).selects("seq_id"));
            String userId = userBean.getStr("seq_id");

            //org_code
            String orgCode = bean.getStr("org_code");

            //is_delete:0

            //create_user: 获取当前登录的用户account
            String createUser = Context.getUserBean().getLoginName();

            //create_date/edit_date
            Date createDate = new Date();
            Date editDate = new Date();

            //seq_id
            //select MAX(id) from tablename
            Bean maxSeqidBean = ServDao.find("SYS_USER_ROLE", new SqlBean().selects("max(seq_id) MAX_"));
            int seqId = maxSeqidBean.getInt("MAX_") + 1;

            //在SYS_USER_ROLE中插入用户-角色关系
            ServDao.create("SYS_USER_ROLE", new Bean().set("seq_id", seqId).set("user_id", userId)
                    .set("user_code", userCode).set("role_name", roleName).set("role_code", roleCode)
                    .set("org_code", orgCode).set("is_delete", 0).set("create_user", createUser)
                    .set("create_date", createDate).set("edit_date", editDate));
        }

        return new OutBean();

    }
}
