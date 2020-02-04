package com.csdc.test;

import com.rh.core.base.Bean;
import com.rh.core.serv.CommonServ;
import com.rh.core.serv.OutBean;
import com.rh.core.serv.ParamBean;
import com.rh.core.serv.ServDao;
import com.rh.core.serv.bean.SqlBean;

/**
 * 采购申请单
 * @author CIEL
 *
 */
public class BuyApplyServ extends CommonServ {

	/**
	 * 读采购申请表的金额字段
	 * @param paramBean
	 * @return
	 */
	public OutBean calculate(ParamBean paramBean) {
		String applyId = paramBean.getStr("AP_ID");
		
		Bean applyBean = ServDao.find("TS_BUY_APPLY", new SqlBean().and("AP_ID", applyId).selects("AP_AMOUNT"));
		
		return new OutBean(applyBean);
	}
}



