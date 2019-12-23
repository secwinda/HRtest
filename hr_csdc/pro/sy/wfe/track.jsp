<!DOCTYPE html>
<%@page import="com.rh.core.serv.OutBean"%>
<%@page import="com.rh.core.serv.ServDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
<%@ include file= "../../sy/base/view/inHeader.jsp" %>
<%
	OutBean outBean = (OutBean) request.getAttribute(Constant.RTN_DISP_DATA);
	String wfXMLStr = outBean.getStr("WF_XML");
	String wfJsonStr = outBean.getStr("WF_JSON");
%>
<script type="text/javascript">
	var jsonData = <%=wfJsonStr%>;
</script>
<title>图形化流程跟踪</title>
<link rel="stylesheet" href="<%=urlPath %>/sy/wfe/css/bootstrap-combined.min.css">
<script type="text/javascript" src="<%=urlPath %>/sy/wfe/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=urlPath %>/sy/wfe/js/go.js"></script>
<script type="text/javascript" src="<%=urlPath %>/sy/wfe/track.js"></script>
<script type="text/javascript" src="<%=urlPath %>/sy/wfe/js/GuidedDraggingTool.js"></script>
<style type="text/css">
  #myOverviewDiv {
    position: absolute;
    width:200px;
    height:100px;
    top: 15px;
    right: 9px;
    background-color: aliceblue;
    z-index: 300; /* make sure its in front */
    border: solid 1px blue;
  }
</style>
<div>
	<div style="width:100%; white-space:nowrap;margin-top:10px">
		<div id="myOverviewDiv"></div>
	  	<span style="display: inline-block; vertical-align: top; padding: 5px; width:99%">
	    	<div id="myDiagramDiv" style="border: solid 1px gray; height: 400px"></div>
	  	</span>
	  	<div style="vertical-align: top; padding: 5px; width:99%">
			<table width="100%" class="rhGrid">
    			<thead class="rhGrid-thead">
      				 <tr>
      				 	<th class="rhGrid-thead-th" style="width:20%">发送部门</th>
            			<th class="rhGrid-thead-th" style="width:15%">发送人</th>
            			<th class="rhGrid-thead-th" style="width:15%">发送时间</th>
            			<th class="rhGrid-thead-th" style="width:20%">办理部门</th>
            			<th class="rhGrid-thead-th" style="width:15%">办理人</th>
           				<th class="rhGrid-thead-th" style="width:15%">办理时间</th>
       				</tr>
    			</thead>
   				<tbody class="rhGrid-tbody" id="wfeTrackTbody">
    			</tbody>
			</table>
	  	</div>
	</div>
</div>