<!DOCTYPE html>
<%@page import="com.rh.core.serv.OutBean"%>
<%@page import="com.rh.core.serv.ServDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
<%@ include file= "../../sy/base/view/inHeader.jsp" %>
<%
	OutBean outBean = (OutBean) request.getAttribute(Constant.RTN_DISP_DATA);
	String wfXMLStr = outBean.getStr("WF_XML");
	String aniXMLStr = outBean.getStr("ANI_XML");
	String wfJsonStr = outBean.getStr("WF_JSON");
%>
<script type="text/javascript">
	var jsonData = <%=wfJsonStr%>;
	var aniData = <%=aniXMLStr%>;
</script>
<title>动画回放流转过程</title>
<link rel="stylesheet" href="<%=urlPath %>/sy/wfe/css/bootstrap-combined.min.css">
<script type="text/javascript" src="<%=urlPath %>/sy/wfe/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=urlPath %>/sy/wfe/js/go.js"></script>
<script type="text/javascript" src="<%=urlPath %>/sy/wfe/trackAni.js"></script>
<script type="text/javascript" src="<%=urlPath %>/sy/wfe/js/GuidedDraggingTool.js"></script>
<script>
	var userAgent = navigator.userAgent;
	var isIOS = userAgent.indexOf('cochat:ios') !== -1;
	var isAndroid = userAgent.indexOf('cochat:android') !== -1;
	var isCochat = userAgent.indexOf("cochat") != -1;
	var cordovaScript = document.createElement('script');
	if (isIOS) {
        cordovaScript.src = "<%=urlPath %>/sy/wfe/js/ruahoMobileSdk_ios.min.js";
    } else if (isAndroid) {
        cordovaScript.src = "<%=urlPath %>/sy/wfe/js/ruahoMobileSdk_android.min.js";
    } else {
        alert("请使用众信客户端打开！");
    }

    if (isCochat) {
        var head = document.getElementsByTagName('head')[0];
        head.appendChild(cordovaScript);
    }
</script>
<div style="margin-left: -21px;margin-right: -19px;">
	<div style="width:100%;height:350px;position:fixed;z-index:9999;top:0px"></div>
	<div style="width:100%; white-space:nowrap;">
	  	<span style="display: inline-block; vertical-align: top; padding: 1px; width:100%">
	    	<div id="myDiagramDiv" style="border: solid 1px gray; height: 250px;background-color:#000000"></div>
	  	</span>
	</div>
	<div style="vertical-align: top; padding-top: 5px; width:100%">
		<table width="100%">
  			<tbody id="wfeTrackTbody">
   			</tbody>
		</table>
  	</div>
</div>