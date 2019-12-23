package com.rh.core;

import com.rh.core.org.DeptBean;
import com.rh.core.org.mgr.OrgMgr;
import org.junit.Test;

public class TestOrg extends TestEnv {
    @Test
    public void getDept() {
        DeptBean deptBean = OrgMgr.getDept("");
        if (deptBean != null) {
            System.out.println(deptBean.getCode());
        } else {
            System.out.println("没有找到空字符串的部门。");
        }
    }
}
