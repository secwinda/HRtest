/*
 * Copyright (c) 2011 Ruaho All rights reserved.
 */
package com.rh.core;

import javax.sql.DataSource;

import org.apache.commons.logging.LogFactory;
import org.apache.log4j.LogManager;
import org.junit.AfterClass;
import org.junit.BeforeClass;

import com.mchange.v2.c3p0.DataSources;
import com.rh.core.base.Bean;
import com.rh.core.base.Context;
import com.rh.core.base.BaseContext.APP;
import com.rh.core.base.BaseContext.DB_TYPE;
import com.rh.core.base.BaseContext.DS;
import com.rh.core.base.start.LogMgr;
import com.rh.core.org.mgr.UserMgr;

/**
 * 初始化测试环境及恢复测试环境的公共方法
 * 
 * @author Jerry Li
 */
public class TestEnv {
	/** 单数据源 */
	private static DataSource cpds = null;
    static {
		try { 
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) { 
			e.printStackTrace();
		}
    }
    
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		start();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		stop();
	}

	/**
	 * 启动数据库连接和log日志
	 * @throws Exception 例外
	 */
	private static void start() throws Exception {
	    Bean param = new Bean();
	    param.set(Context.SYS_PARAM_LOG, "log4j.properties");
	    param.set(APP.CONTEXTPATH, "");
	    param.set(APP.WEBINF, "D:\\rh\\product\\hr_csdc/pro/WEB-INF/");
	    param.set(APP.SYSPATH, "D:\\rh\\product\\hr_csdc/pro/");
	    param.set("DEBUG_MODE", true);
		Context.start(param);
		
		LogMgr logMgr = new LogMgr();
		logMgr.start();
		String jdbcUrl = "jdbc:mysql://127.0.0.1:3306/hr?useOldAliasMetadataBehavior=true";

		cpds = DataSources.unpooledDataSource(jdbcUrl, "root", "root");
		Bean dsBean = new Bean();
		dsBean.set(DS.DB_TYPE, DB_TYPE.MYSQL);
		dsBean.set(DS.DS, cpds);
		Context.setDSBean("", dsBean); //设为系统缺省连接池
		Context.setThreadUser(UserMgr.getUserState("1uC1Uh7sNx4tWqcVsNp6cM5G"));
	}
	

	/**
	 * 关闭数据库连接和日志
	 * @throws Exception 例外
	 */
	private static void stop() throws Exception {
		DataSources.destroy(cpds);
        LogManager.shutdown();
        LogFactory.releaseAll();
	}
}
