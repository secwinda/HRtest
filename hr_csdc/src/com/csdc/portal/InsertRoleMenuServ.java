package com.csdc.portal;

import com.rh.core.base.Bean;
import com.rh.core.serv.CommonServ;
import com.rh.core.serv.OutBean;
import com.rh.core.serv.ParamBean;
import com.rh.core.serv.ServDao;
import com.rh.core.serv.bean.SqlBean;
import com.rh.core.util.Lang;
import org.apache.commons.lang.StringUtils;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class InsertRoleMenuServ extends CommonServ {
    /**
     * 保存button前的动作，处理paramBean。软虹save方法直接将paramBean存入数据库
     * @param paramBean
     */
    @Override
    protected void beforeSave(ParamBean paramBean) {

        //----seq_id-----
        //select MAX(id) from tablename
        Bean maxSeqidBean = ServDao.find("SYS_ROLE_MENU", new SqlBean().selects("max(seq_id) MAX_"));
        int seqId = maxSeqidBean.getInt("MAX_") + 1;
        paramBean.set("seq_id", seqId);

        //----role_id-----
        String roleCode = paramBean.getStr("role_code");
        Bean roleBean = ServDao.find("SYS_ROLE_INFO",
                new SqlBean().and("role_code", roleCode).and("is_delete", 0)
                        .selects("seq_id"));
        int roleId = roleBean.getInt("seq_id");
        paramBean.set("role_id", roleId);

        //----parent_code, parent_id, menu_id, level-----
        String menuCode = paramBean.getStr("menu_code");
        Bean menuBean = ServDao.find("SYS_MENU_INFO",
                new SqlBean().and("menu_code", menuCode).and("is_delete", 0)
                        .selects("seq_id, parent_code, parent_id, level"));
        String parentCode = menuBean.getStr("parent_code");
        int parentId = menuBean.getInt("parent_id");
        int menuId = menuBean.getInt("seq_id");
        int level = menuBean.getInt("level");
        paramBean.set("parent_code", parentCode);
        paramBean.set("parent_id", parentId);
        paramBean.set("menu_id", menuId);
        paramBean.set("level", level);
    }

    /**
     * 保存button后的动作.将新增的角色-菜单关系插入sys_user_menu
     * @param paramBean 前端页面的bean
     * @param outBean 存入数据库中的bean
     */
    @Override
    protected void afterSave(ParamBean paramBean, OutBean outBean) {

        //------role_code, role_id, menu_code, menu_id,
        //------start_date, end_date, is_delete, create_user, create_date, edit_date
        //上述值同SYS_ROLE_MENU
        String roleCode = paramBean.getStr("role_code");
        int roleId = paramBean.getInt("role_id");
        String menuCode = paramBean.getStr("menu_code");
        int menuId = paramBean.getInt("menu_id");
        String strStartDate = paramBean.getStr("start_date");
        String strEndDate = paramBean.getStr("end_date");
        String createUser = paramBean.getStr("create_user");
        String strCreateDate = paramBean.getStr("create_date");
        String strEditDate = paramBean.getStr("edit_date");

        //step1. 在SYS_USER_ROLE中搜索角色关联的用户
        List<Bean> userList = ServDao.finds("SYS_USER_ROLE",
                new SqlBean().and("role_code", roleCode).and("is_delete", 0));


        //step2. 遍历每个user，插入新的菜单到sys_user_menu
        for (Bean userBean : userList) {
            //-----user_code-----
            String userCode = userBean.getStr("user_code");

            //-----user_id-----
            Bean tmpUserBean = ServDao.find("SYS_USER_INFO",
                    new SqlBean().and("user_code", userCode).and("is_delete", 0)
                            .selects("seq_id"));
            int userId = tmpUserBean.getInt("seq_id");

            //-----seq_id-----
            //select MAX(id) from tablename
            Bean maxSeqidBean = ServDao.find("SYS_USER_MENU", new SqlBean().selects("max(seq_id) MAX_"));
            int seqId = maxSeqidBean.getInt("MAX_") + 1;

            //插入数据
            ServDao.save("SYS_USER_MENU", new Bean().set("seq_id", seqId)
                    .set("user_code", userCode).set("user_id", userId)
                    .set("role_code", roleCode).set("role_id", roleId)
                    .set("menu_code", menuCode).set("menu_id", menuId)
                    .set("start_date", strStartDate).set("end_date", strEndDate)
                    .set("is_delete", 0).set("create_user", createUser)
                    .set("create_date", strCreateDate).set("edit_date", strEditDate));
        }

    }
}
