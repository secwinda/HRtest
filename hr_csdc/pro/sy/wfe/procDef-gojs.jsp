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
<title><%=procName %>流程设计</title>
<link rel="stylesheet" href="./css/bootstrap-combined.min.css">
<script type="text/javascript" src="./js/bootstrap.min.js"></script>
<script type="text/javascript" src="./js/go.js"></script>
<script type="text/javascript" src="./procDefJs-gojs.js"></script>
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
            <a class="brand" href="#">工作流编辑器</a>
            <div class="nav-collapse collapse">
                <ul class="nav" id="menu-layoutit">
                    <li class="divider-vertical"></li>
                    <li>
                    	<div class="btn-group">
                            <button type="button" class="btn btn-primary" id="save">保存</button>
                        </div>
                        <div class="btn-group">
                            <button type="button" class="btn btn-primary" id="downLoadFile">下载</button>
                            <button type="button" class="btn btn-primary" id="uploadFile">上传</button>
                        </div>
                        <div class="btn-group" data-toggle="buttons-radio">
                            <button type="button" class="btn btn-primary" id="leftAlign">左对齐</button>
                            <button type="button" class="btn btn-primary" id="rightAlign">右对齐</button>
                            <button type="button" class="btn btn-primary" id="topAlign">顶部对齐</button>
                            <button type="button" class="btn btn-primary" id="bottomAlign">底部对齐</button>
                        	<button type="button" class="btn btn-primary" id="selectAll">选择全部</button>
                            <button type="button" class="btn btn-primary" id="delete">删除</button>
                        </div>
                        <div class="btn-group">
                            <button type="button" class="btn btn-primary" id="redo">前进</button>
                            <button type="button" class="btn btn-primary" id="undo">后退</button>
                            <button type="button" class="btn btn-primary" id="saveImg">保存图片</button>
                        </div>
                        
                        <div class="btn-group">
                          <!--  <button type="button" class="btn btn-primary" id="autoTest">自动测试</button> -->
                        </div>
                      </li>
                </ul>
            </div>
        </div>
	</div>
</div>
<div>
	<div style="width:100%; white-space:nowrap;margin-top:37px">
		<span style="display: inline-block; vertical-align: top; padding: 5px; width:200px">
	    	<div id="myPaletteDiv" style="border: solid 1px gray; height: 500px"></div>
	   	</span>
		<div id="myOverviewDiv"></div>
	  	<span style="display: inline-block; vertical-align: top; padding: 5px; width:88%">
	    	<div id="myDiagramDiv" style="border: solid 1px gray; height: 500px"></div>
	  	</span>
	</div>
	<div id="svgDiv" style="float: left;position: fixed;top: 0px;visibility:hidden"></div>
	<div id="canvasDiv" style="visibility:hidden"></div>
</div>