package com.csdc.test;

import java.util.List;

import com.rh.core.base.Bean;
import com.rh.core.serv.CommonServ;
import com.rh.core.serv.OutBean;
import com.rh.core.serv.ParamBean;
import com.rh.core.serv.ServDao;
import com.rh.core.serv.bean.SqlBean;

/**
 * 采购申请明细
 * @author CIEL
 *
 */
public class BuyDetailServ extends CommonServ {

	@Override
	protected void afterSave(ParamBean paramBean, OutBean outBean) {
		// TODO Auto-generated method stub

		double amount = 0.0;
		
		if(paramBean.isNotEmpty("DT_COUNT") || paramBean.isNotEmpty("DT_AMOUNT")){
			//外键
			String applyId = outBean.getStr("AP_ID");
			
			//step1. 从采购申请明细中读取每张明细的采购金额
			List<Bean> lists = ServDao.finds("TS_BUY_APPLY_DETAIL", new SqlBean().and("AP_ID", applyId));
			for (Bean bean : lists) {
				amount += bean.getDouble("DT_AMOUNT");
			}
			
			//step2. 将全部明细的总金额返回给采购申请单
			ServDao.save("TS_BUY_APPLY", new Bean(applyId).set("AP_AMOUNT", amount));
		}
		
	}
	
}
