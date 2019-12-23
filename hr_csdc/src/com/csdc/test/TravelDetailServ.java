package com.csdc.test;

import com.rh.core.base.Bean;
import com.rh.core.serv.CommonServ;
import com.rh.core.serv.OutBean;
import com.rh.core.serv.ParamBean;

public class TravelDetailServ extends CommonServ {

	/*
	 * 想实现：从主表读到出发日期和返回日期，
	 * 子表的开始日期和结束日期必须在这两个值之间*/
	
	
	@Override
	protected void beforeStart(ParamBean paramBean, Bean dataBean) {
		// TODO Auto-generated method stub

		String TDBeginDate = null;
		String TDEndDate = null;
		
		if (paramBean.isNotEmpty("TA_BEGIN_DATE") || paramBean.isNotEmpty("TA_END_DATE")) {
			//外键
			String seqId = dataBean.getStr("TA_ID");
			
			
		}
	}

}
