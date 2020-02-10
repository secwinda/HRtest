package com.csdc.portal;

import com.rh.core.base.Bean;
import com.rh.core.serv.CommonServ;
import com.rh.core.serv.OutBean;
import com.rh.core.serv.ParamBean;
import com.rh.core.serv.ServDao;
import com.rh.core.serv.bean.SqlBean;
import com.rh.core.util.Lang;

import java.util.*;

public class UserAddRoleServ extends CommonServ {
    /**
     * 获取用户已关联的角色
     * @param paramBean 前端的参数
     * @return 角色rolecode集合
     */
    public Set<String> getAttachedRole(ParamBean paramBean) {

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

        //返回roleCodeSet
        return roleCodeSet;

    }


    /**
     * 批量保存到SYS_USER_ROLE
     * @param paramBean 前端
     * @return 存入数据库的bean
     */
//    @Override
//    public OutBean batchSave(ParamBean paramBean) {
//
//        //seq_id
//        //select MAX(id) from tablename
//        Bean maxSeqidBean = ServDao.find("SYS_USER_ROLE", new SqlBean().selects("max(seq_id) MAX_"));
//        int seqId = maxSeqidBean.getInt("MAX_") + 1;
//
//        //user_code/user_id
//        String userCode = paramBean.getStr("userCode");
//        Bean userBean = ServDao.find("SYS_USER_INFO",
//                new SqlBean().and("user_code", userCode).and("is_delete", 0)
//                        .selects("user_name"));
//        String userName = userBean.getStr("user_name");
//
//
//        //role_code/role_name
//        //??如何获取批量的role_code???
//
//
//        //org_code
//        String orgCode = paramBean.getStr("orgCode");
//
//        //is_delete:0
//
//        //create_user
//        //??如何获取当前登录的用户account???或者默认sysAdmin
//
//        //create_date/edit_date
//        Date date = new Date();
//    }
}
