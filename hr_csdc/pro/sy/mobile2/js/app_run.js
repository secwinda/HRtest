/**
 * 设备初始化
 */

/**
 * 在jqm没有起作用之前进行一个初始化配置
 */
$(document).on('mobileinit', function() {

	// 设置系统级信息
	var
		userCode = orgMapJson["@USER_CODE@"],
		userName = orgMapJson["@USER_NAME@"],
		userImg = orgMapJson["@USER_IMG@"],
		deptCode = orgMapJson["@DEPT_CODE@"],
		deptName = orgMapJson["@DEPT_NAME@"],
		odeptCode = orgMapJson["@ODEPT_CODE@"],
		jianCode = orgMapJson["@JIAN_CODES@"],
		odeptCodePath = orgMapJson["@ODEPT_CODE_PATH@"];
	System.setUser("USER_CODE", userCode);
	System.setUser("USER_NAME", userName);
	System.setUser("USER_IMG", userImg);
	System.setUser("DEPT_CODE", deptCode);
	System.setUser("DEPT_NAME", deptName);
	System.setUser("ODEPT_CODE", odeptCode);
	System.setUser("JIAN_CODES", jianCode);
	System.setUser("ODEPT_CODE_PATH", odeptCodePath);

	// 全局转场效果
	$.mobile.changePage.defaults.transition = 'none'; // 换页效果无
	$.mobile.defaultPageTransition = 'none'; // 页面切换效果无
	$.mobile.defaultDialogTransition = 'none'; // 对话框出现效果无
	$.mobile.buttonMarkup.hoverDelay = 0; // 按钮的反应延时
	
	/**
	 * 查找最近的链接元素
	 */
	function findClosestLink(ele) {
		while (ele) {
			if ((typeof ele.nodeName === 'string') && ele.nodeName.toLowerCase() === 'a') {
				break;
			}
			ele = ele.parentNode;
		}
		return ele;
	};
	/**
	 * 重写-设置活动页高度方法
	 */
	$.mobile.resetActivePageHeight = function(height) {
		var page = $('.' + $.mobile.activePageClass), // 当前活动页
			pageHeight = page.height(),
			pageOuterHeight = page.outerHeight(true);

		height = (typeof height === 'number') ? height : $.mobile.getScreenHeight();

		// 页面高度设定死
		// 注释掉，否则ios系统中页面没加载完就截断了，android设备上的photoSwipe插件图片跟不上页面滚动速度
		//		page.css('min-height', height - (pageOuterHeight - pageHeight));
		//		page.css('max-height', height - (pageOuterHeight - pageHeight));
	};
	/**
	 * 监听a标签点击事件，如果是返回事件，添加返回效果
	 */
	/*$.mobile.document.on('vclick', 'a', function(event) {
		var link = findClosestLink(event.target);
		$link = $(link);
		if ($link.is(":jqmData(rel='back')")) {
			$.mobile.loading('show', {
				text: '返回中...',
				textVisible: true,
				textonly: false
			});
		}
	});*/
	
	
	/**
	 * deskview
	 * 作用1:当做转发的路由,例如:url?page=listview,将会跳转到listview页面
	 * 作用2:deskview初始化
	 */
	$.mobile.document
	.on('pagebeforeshow', '#deskview', function() {
		var href = window.location.href;
		var point = 'deskview';	
		if (href.indexOf('?') > 0) {	// 有参数,解析参数
			var hash = {},
				vars = {};
			var hashes = href.slice(href.indexOf('?') + 1).split('&');
			for (var i = 0; i < hashes.length; i++) {
				hash = hashes[i].split('=');
				vars[hash[0]] = hash[1];
			}
			// 锚点
			point = vars['page'];
		}
		
		// 根据锚点,跳转
		switch (point) {
		case 'listview':
			$.mobile.loadPage('../html/listview.html');	// 加载页面
			$.mobile.document.off('pageinit', '#listview').on('pageinit', '#listview', function() {
				var listView = new mb.vi.listView(vars);
				listView.show();
				
				// 将句柄放入dom中
				$(this).data('handler', listView);
			});
			break;
		case 'cardview':
			$.mobile.loadPage('../html/cardview.html');	// 加载页面
			$.mobile.document.off('pageinit', '#cardview').on('pageinit', '#cardview', function() {
				var cardView = new mb.vi.cardView(vars);
				cardView.show();
				
				// 将句柄放入dom中
				$(this).data('handler', cardView);
			});
			break;
		default:
			if ($('#deskview') && $('#deskview').data('handler')) {	// 页面中存在首页,并且首页的dom元素上有对象句柄
				$('#deskview').data('handler').refresh();
			} else {
				var deskView = new mb.vi.deskView();
					deskView.show();
				$('#deskview').data('handler', deskView);
			}
			break;
		}
	});
	
	/**
	 * search
	 * 查询页面初始化
	 */
	
	/**
	 * listview
	 * 列表页面绑定方法
	 */
	$.mobile.document
	// 页面隐藏
	.on('pagehide', '#listview', function(event, ui) {
		var $self = $(this);
		// 清空挂载的对象
		$self.removeData('handler');
	})
	.on('pageshow', '#listview', function() {
		// 获取对象
		var $self = $(this);
		var handler = $self.data('handler');
		
		// 检测是否有刷新标识,刷新页面
		if (handler && handler.showRefresh == true) {
			handler.refresh();
			handler.showRefresh == false;
		}
	})
	.on('pagebeforeload', '#listview', function() {
		// 添加loading
		$.mobile.loading('show', {text: '加载中...', textVisible: true, textonly: false});
	});
	
	/**
	 * cardview
	 * 卡片页面绑定方法
	 */
	$.mobile.document
	.on('pagehide', '#cardview', function(event, ui) {
		var $self = $(this);
		// 清空挂载的对象
		$self.removeData('handler');
	})
	.on('pagebeforeload', '#cardview', function(event, ui) {
		// 添加loading
		$.mobile.loading('show', {text: '加载中...', textVisible: true, textonly: false});
	});
});

