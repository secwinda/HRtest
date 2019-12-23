package com.csdc.test;

import com.rh.core.base.Bean;
import com.rh.core.serv.CommonServ;
import com.rh.core.serv.OutBean;
import com.rh.core.serv.ParamBean;
import com.rh.core.serv.ServDao;
import com.rh.core.serv.bean.SqlBean;

/**
 * 报销申请单
 * @author CIEL
 *
 */
public class ExpenseServ extends CommonServ {
	
	/**
	 * 读报销申请单表（TS_EXPENSE_APPLY）的金额字段和单据数字段（EA_AMOUNT，EA_PAPER_COUNT）
	 * @param paramBean
	 * @return
	 */
	public OutBean calculate(ParamBean paramBean) {
		String seqId = paramBean.getStr("EA_ID");
		
		//select EA_PAPER_COUNT, EA_AMOUNT from TS_EXPENSE_APPLY where EA_ID=seqId
		Bean expenseBean = ServDao.find("TS_EXPENSE_APPLY", new SqlBean().and("EA_ID", seqId).selects("EA_PAPER_COUNT, EA_AMOUNT"));
	
		return new OutBean(expenseBean);
	}
}
