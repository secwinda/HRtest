<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="com.rh.core.util.var.VarMgr" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.rh.core.org.mgr.UserMgr" %>
<%@ page import="com.rh.core.org.UserBean" %>
<%@ page import="com.rh.core.base.Context" %>
<%@ page import="com.rh.core.util.JsonUtils" %>
<%@ page import="com.rh.core.org.auth.login.LoginHelper" %>
<%
	String realUrl = request.getRequestURI() + "?" + request.getQueryString();
	UserBean userBean = Context.getUserBean(request);

	String orgMapJson = "";
	if (userBean == null) { // 如果没取到用户编码
		String redirectUrl = LoginHelper.getCurrentUrl(request, null);
		// 强制退出
		response.sendRedirect(redirectUrl);
		return;
	} else {
		orgMapJson = JsonUtils.mapsToJson(VarMgr.getOrgMap());
	}
%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta name="viewport"
		content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	<title>图标化首页</title>
	<script>
		var 
			FireFlyContextPath, // ajax请求路径
			ZhbxImgPath;			// 图片加载路径
			// OA系统地址
			FireFlyContextPath = "";
			// 门户系统地址
			//ZhbxImgPath = "http://portal.cic.cn:8888";
			
		var userCode 	= "<%=userBean.getId()%>",
			orgMapJson 	= <%=orgMapJson%>, // 是一个json，不能加双引号
			homeUrl 	= window.location.href;
	</script>
	<!-- *****************开发模式--start**************** -->
	
	<!-- 设计版 -->
	<link rel="stylesheet" type="text/css"
		href="/sy/mobile2/style/themes/Bootstrap.css">
	<link rel="stylesheet" type="text/css"
		href="/sy/mobile2/style/jquery.mobile-1.4.0/jquery.mobile.structure-1.4.0.css">
		
	<!-- jquerymobile版 -->
	<!-- 
	<link rel="stylesheet" type="text/css"
		href="/sy/mobile2/plugins/themes/Bootstrap.css">	
	<link rel="stylesheet" type="text/css"
		href="/sy/mobile2/plugins/jquery.mobile-1.4.0/jquery.mobile.structure-1.4.0.css">
	 -->
	
	<link rel="stylesheet" type="text/css"
		href="/sy/mobile2/plugins/themes/jquery.mobile.icons.min.css">
	
	<!-- custom样式 -->
	<link rel="stylesheet" type="text/css"
		href="/sy/mobile2/js/tree/style.css" />
	<link rel="stylesheet" type="text/css"
		href="/sy/mobile2/css/mbCustom.css" />
	<script type="text/javascript" src="/sy/mobile2/plugins/cordova.js"></script>
	<!-- jquery相关脚本 -->
	<script type="text/javascript"
		src="/sy/mobile2/plugins/jquery/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="/sy/mobile2/js/q.js"></script>
	<script type="text/javascript" src="/sy/mobile2/js/tree/jquery.tree.js"></script>
	
	<!-- 平台相关脚本    @TODO 这三个文件也不一样？ 是否可以兼容？ -->
	<script type="text/javascript" src="/sy/mobile2/js/platform2.js"></script>
	<script type="text/javascript" src="/sy/mobile2/js/tools.js"></script>
	<script type="text/javascript" src="/sy/mobile2/js/constant.js"></script>
	
	<!-- 各组件相关脚本 -->
	<script type="text/javascript" src="/sy/mobile2/js/mbDeskView.js"></script>
	<script type="text/javascript" src="/sy/mobile2/js/mbListView.js"></script>
	<script type="text/javascript" src="/sy/mobile2/js/mb.ui.grid.js"></script>
	<script type="text/javascript" src="/sy/mobile2/js/mbNewsView.js"></script>
	<script type="text/javascript" src="/sy/mobile2/js/mbCardView.js"></script>
	<script type="text/javascript" src="/sy/mobile2/js/mbCardView2.js"></script>
	<script type="text/javascript" src="/sy/mobile2/js/mb.ui.form.js"></script>
	<script type="text/javascript" src="/sy/mobile2/js/mb.ui.form2.js"></script>
	<script type="text/javascript" src="/sy/mobile2/js/mbWfCardView.js"></script>
	<!-- <script type="text/javascript" src="/sy/mobile2/js/mbMind.js"></script> -->
	<script type="text/javascript" src="/sy/mobile2/js/mbMind2.js"></script>
	<script type="text/javascript" src="/sy/mobile2/js/mbCardToCardView.js"></script>
	
	<!-- costom脚本 -->
	<script type="text/javascript" src="/sy/mobile2/js/app_run.js"></script>
	<!-- 因为需要在jqm初始化之前执行，所以引用的顺序要往前放 -->
	<script type="text/javascript"
		src="/sy/mobile2/plugins/jquery.mobile-1.4.0/jquery.mobile-1.4.0.js"></script>
	
<!-- *****************开发模式-- end **************** -->
</head>
<body>
	<!-- deskview page -->
	<div id="deskview" data-role="page" data-dom-cache="true">
		<div id="deskview_content" role="main" class="ui-content">
			<div id="deskview_grid" class="ui-grid-b">
				<!-- deskview content -->
			</div>
		</div>
	</div>
</body>
</html>