package com.csdc.test;

import com.rh.core.base.Bean;
import com.rh.core.serv.CommonServ;
import com.rh.core.serv.OutBean;
import com.rh.core.serv.ParamBean;
import com.rh.core.serv.ServDao;
import com.rh.core.serv.bean.SqlBean;

/**
 * 差旅申请单
 * @author CIEL
 *
 */
public class TravelApplyServ extends CommonServ {

	/**
	 * 读取差旅申请表单(TS_TRAVEL_APPLY)的出发日期和返回日期(TA_BEGIN_DATE, TA_END_DATE)
	 * @param paramBean
	 * @return
	 */
	public OutBean getDate(ParamBean paramBean){
		String seqId = paramBean.getStr("TA_ID");
		
		//select TA_BEGIN_DATE, TA_END_DATE from TS_TRAVEL_APPLY where TA_ID=seqId
		Bean travelBean = ServDao.find("TS_TRAVEL_APPLY", new SqlBean().and("TA_ID", seqId).selects("TA_BEGIN_DATA, TA_END_DATE"));
		
		return new OutBean(travelBean);
	}
}
