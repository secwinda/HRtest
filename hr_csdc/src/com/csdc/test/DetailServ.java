package com.csdc.test;

import java.util.List;

import com.rh.core.base.Bean;
import com.rh.core.serv.CommonServ;
import com.rh.core.serv.OutBean;
import com.rh.core.serv.ParamBean;
import com.rh.core.serv.ServDao;
import com.rh.core.serv.bean.SqlBean;

/**
 * 报销费用明细
 * @author CIEL
 * 注：有对应的数据库表提供增删改查服务，继承自CommonServ.java(详见《平台后端开发说明》)
 */
public class DetailServ extends CommonServ {
	@Override
	protected void afterSave(ParamBean paramBean, OutBean outBean) {
		// TODO Auto-generated method stub
		
		int count = 0;
		double amount = 0.0;
		
		if(paramBean.isNotEmpty("ED_PAPER_COUNT") || paramBean.isNotEmpty("ED_AMOUNT")) {
			//外键（主表与子表共有的字段）
			String seqId = outBean.getStr("EA_ID");
			
			//step1. 从报销费用明细表（TS_EXPENSE_DETAIL）中读取每张明细的单据数和金额，并求和
			//ServDao：系统封装一个常用的数据库处理类（com.rh.core.serv.ServDao）
			//select * from TS_EXPENSE_DETAIL where EA_ID=seqId
			List<Bean> lists = ServDao.finds("TS_EXPENSE_DETAIL", new SqlBean().and("EA_ID", seqId));
			for(Bean bean : lists) {
				count = count + bean.getInt("ED_PAPER_COUNT");
				amount = amount + bean.getDouble("ED_AMOUNT");
			}
			
			//step2. 将全部明细的总单据数和总金额返回给报销申请单（TS_EXPENSE_APPLY）
			//update TS_EXPENSE_APPLY set EA_PAPER_COUNT=count, EA_AMOUNT=amout
			ServDao.save("TS_EXPENSE_APPLY", new Bean(seqId).set("EA_PAPER_COUNT", count).set("EA_AMOUNT", amount));
		}
	}
}
