<!DOCTYPE html>
<%@page import="com.rh.core.serv.ServDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
<%@ include file= "../../sy/base/view/inHeader.jsp" %>
<%
	String procCode = RequestUtils.getStr(request, "procCode");
	String procEnName = RequestUtils.getStr(request, "procEnName");
	String procName = URLDecoder.decode(RequestUtils.getStr(request, "procName"));
	String cmpy = RequestUtils.getStr(request, "cmpy");
	String servId = RequestUtils.getStr(request, "servId");
	String servPid = RequestUtils.getStr(request, "servPid"); 
%>
<script type="text/javascript">
	var procCode = "<%=procCode%>";
	var procEnName = "<%=procEnName%>";
	var procName = "<%=procName%>";
	var cmpy = "<%=cmpy%>";
	var servId = "<%=servId%>";
	var servPid = "<%=servPid%>";
	var wfe = FireFly.doAct("SY_WFE_PROC_DEF","byid",{"_PK_":procCode});
	var xml = wfe.PROC_XML;
</script>
<title><%=procName %>流程自动化测试</title>
<link rel="stylesheet" href="./css/bootstrap-combined.min.css">
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/go.js"></script>
<script type="text/javascript" src="./viewWfe.js"></script>
<script type="text/javascript" src="./js/GuidedDraggingTool.js"></script>
<script type="text/javascript" src="<%=urlPath%>/sy/base/frame/coms/file/swfupload.js"></script>
<script type="text/javascript" src="<%=urlPath%>/sy/base/frame/coms/file/js/swfupload.queue.js"></script>
<script type="text/javascript" src="<%=urlPath%>/sy/base/frame/coms/file/js/fileprogress.js"></script>
<script type="text/javascript" src="<%=urlPath%>/sy/base/frame/coms/file/js/handlers.js"></script>
<style type="text/css">
  #myOverviewDiv {
    position: absolute;
    width:200px;
    height:100px;
    top: 43px;
    right: 9px;
    background-color: aliceblue;
    z-index: 300; /* make sure its in front */
    border: solid 1px blue;
  }
</style>
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-inner">
        <div class="container-fluid">
            <button data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar" type="button"> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
            <a class="brand" href="#"><%=procName%>流程自动化测试</a>
            <div class="nav-collapse collapse">
                <ul class="nav" id="menu-layoutit">
                    <li class="divider-vertical"></li>
                    <li>
                    	<div class="btn-group">
                            <button type="button" class="btn btn-primary" id="selectUser">选择起草人</button>
                        </div>
                    	<div class="btn-group">
                            <button type="button" class="btn btn-primary" id="start">开始</button>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
	</div>
</div>
<div>
    <div style="width:100%; white-space:nowrap;margin-top:10px">
		<div id="myOverviewDiv"></div>
	  	<span style="display: inline-block; vertical-align: top; padding: 5px; width:99%">
	    	<div id="myDiagramDiv" style="border: solid 1px gray; height: 500px"></div>
	  	</span>
	</div>
</div>