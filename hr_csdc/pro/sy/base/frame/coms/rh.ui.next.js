/**
 * 下一环节UI组件
 * @param window
 * @param $
 */
(function(window, $){
	
	// UI类型常量
	var UIType = {
		"Text":"text",
		"Radio":"radio",
		"Check":"check",
		"Select":"select",
		"Input":"input",
		"Textarea":"textarea",
		"Tree":"tree",
		"Next":"next",
		"Hidden":"hidden"
	};
	
	/**
	 * 基类
	 */
	var __RhBase = function(opts) {
	};
	__RhBase.prototype.init = function(template, opts, args) {
		this.$dom = $(template);
		
		// 解析参数并渲染
		this.render(opts);
		// 设置必填
		this.setNotNull(opts.notnull, true);
		// 正则校验相关{'exp':'正则表达式', 'hint':'提示语句'}
		this.regular = opts.regular;
		// 是否是FormData
		this.formData = !!opts.formData;
		
		// 构造函数可以传递第二个参数，该参数为本组件的容器
		var argsArr = Array.prototype.slice.call(args);
		if (argsArr.length >= 2) {
			var container = argsArr[1];
			if (container) {
				this.appendTo(container);
			}
		}
	};
	__RhBase.prototype.setNotNull = function(notnull, init) {
		var _self = this;
		var _set = function(){
			var requireDom = _self.$dom.find(".space").first();
			var normalDom = _self.$dom.find(".space").last();
			if (notnull) {
				requireDom.show();
				normalDom.hide();
				_self.notnull = true; // 是否必填
			} else {
				requireDom.hide();
				normalDom.show();
				_self.notnull = false;
			}
		};
		if (init) {
			_set();
		} else { //解决在手机上原生select元素绑定onchange事件后，回调中操作dom经常出现影响原生select切换值的渲染
			setTimeout(_set, 0);
		}
	};
	__RhBase.prototype.render = function(opts) {
	};
	__RhBase.prototype.showError = function(msg) {
		this.removeError();
		this.$error = $('<li class="rh-error">'
				+ '<label class="rh-label"></label>'
				+ '<span class="space">&nbsp;&nbsp;</span><span class="errorMsg">' + msg + '</span>'
				+ '</li>');
		this.$dom.after(this.$error);
	};
	__RhBase.prototype.removeError = function() {
		if (this.$error) { // 校验通过
			this.$error.remove();
		}
	};
	__RhBase.prototype.get$Dom = function() {
		return this.$dom;
	};
	__RhBase.prototype.appendTo = function(container) {
		this.$dom.appendTo(container);
	};
	/**
	 * 添加到指定组件的后面
	 * @param other 目标组件
	 */
	__RhBase.prototype.insertAfter = function(other) {
		if (other.$chooseLi) { // 树形组件$dom下面还有一行li
			other.$chooseLi.after(this.$dom);
		} else {
			other.$dom.after(this.$dom);
		}
	};
	/**
	 * 添加到指定组件的前面
	 * @param other 目标组件
	 */
	__RhBase.prototype.insertBefore = function(other) {
		other.$dom.first().before(this.$dom);
	};
	__RhBase.prototype.setLabel = function(label){
		this.$dom.find(".rh-label").text(label);
	};
	__RhBase.prototype.getLabel = function() {
		return this.$dom.find(".rh-label").text();
	};
	__RhBase.prototype.setName = function(name) {
	};
	__RhBase.prototype.getName = function() {
		return;
	};
	__RhBase.prototype.setValue = function(value) {
	};
	__RhBase.prototype.getValue = function() {
		return;
	};
	/**
	 * 存储的值可能会有额外的数据
	 */
	__RhBase.prototype.getStoreValue = function() {
		return this.getValue();
	};
	/**
	 * 设置值，该值来自本地存储
	 */
	__RhBase.prototype.setValueFromStore = function (value) {
		this.setValue(value);
	};
	__RhBase.prototype.validate = function() {
		var val = this.getValue();
		
		// 必填校验未通过
		if (this.notnull && (!val || val.length == 0)) {
			this.showError('该项必填');
			return false;
		}
		
		// 正则校验
		if (this.regular) {
			if (!new RegExp(this.regular.exp).test(val)) {
				this.showError(this.regular.hint);
				return false;
			}
		}
		
		this.removeError();
		return true;
	};
	/**
	 * event可能为undefined
	 */
	__RhBase.prototype.valueChanged = function(value, event) {
//		alert(value);
	};
	__RhBase.prototype.toString = function() {
		return jQuery('<div></div>').append(this.$dom).clone().remove().html();
	};
	
	
	/**
	 * 简单文本
	 * @param opts {'type':'text', 'id':'', 'label':'', 'name':'', 'value':'', 'notnull':true, 'regular':{'exp':'', 'hit':''}}
	 */
	var __RhText = function(opts) {
		var template = '<li class="rh-text">'
			+ '<label class="rh-label"></label>'
			+ '<span class="space require">*</span><span class="space">&nbsp;&nbsp;</span><span class="rh-text-name"></span><input type="hidden" class="rh-text-value" />'
			+ '</li>';
		
		this.init(template, opts, arguments);
	};
	//Tools.extend(__RhText, __RhBase); // 继承__RhBase
	__RhText.prototype.render = function(opts) {
		this.$dom.attr('id', '__RhText_' + opts.id);
		this.id = opts.id;
		this.setLabel(opts.label);
		this.setName(opts.name);
		this.setValue(opts.value);
	};
	__RhText.prototype.setName = function(name) {
		this.$dom.find(".rh-text-name").text(name);
	};
	__RhText.prototype.getName = function() {
		return this.$dom.find(".rh-text-name").text();
	};
	__RhText.prototype.setValue = function(value) {
		this.$dom.find(".rh-text-value").val(value);
		this.valueChanged(value);
	};
	__RhText.prototype.getValue = function() {
		return this.$dom.find(".rh-text-value").val();
	};
	__RhText.prototype.setValueFromStore = function(value) {
		if (value && value.indexOf('@@') >= 0) {
			var valArr = value.split('@@');
			this.setName(valArr[0]);
			this.setValue(valArr[1]);
		} else {
			this.setName(value);
			this.setValue(value);
		}
	};
	__RhText.prototype.getStoreValue = function() {
		return this.getName() + '@@' + this.getValue();
	};
	
	
	/**
	 * 单选框
	 * @param opts {'type':'radio', 'id':'', 'label':'', 'value':'', 'options':[{'name':'', 'value':'1'}, {'name':'', 'value':'2'}], 'notnull':true, 'regular':{'exp':'', 'hit':''}}
	 */
	var __RhRadio = function(opts) {
		var template = '<li class="rh-radio">'
			+ '<label class="rh-label"></label>'
			+ '<span class="space require">*</span><span class="space">&nbsp;&nbsp;</span><span class="rh-radio-container"></span>'
			+ '</li>';
		this.init(template, opts, arguments);
	};
	Tools.extend(__RhRadio, __RhBase); // 继承__RhBase
	__RhRadio.prototype.render = function(opts) {
		var that = this;
		this.id = opts.id;
		this.$dom.attr('id', '__RhRadio_' + opts.id);
		this.setLabel(opts.label);
		this.setOptions(opts.options);
		this.$dom.find(".rh-radio-container :radio").change(function(event){
			that.valueChanged(that.getValue(), event);
		});
		this.setValue(opts.value);
	};
	__RhRadio.prototype.setOptions = function(options) {
		var that = this;
		var $container = this.$dom.find(".rh-radio-container");
		$container.empty();
		$.each(options, function(index, option){
			var tmpDom = $('<span class="radio-container"><input type="radio" value="' + option["value"] + '" name="' + that.id + '" /><span class="label">' + option["name"] + '</span></span>');
			$container.append(tmpDom);
			
			var $radio = tmpDom.find(":radio");
			
			tmpDom.find(".label").click(function(event){
				if (!$radio.attr("checked")) {
					var val = $radio.val();
					that.setValue(val, event);
				}
			});
		});
	};
	__RhRadio.prototype.setValue = function(value) {
		this.$dom.find(":radio").removeAttr("checked");
		this.$dom.find(":radio[value='" + value + "']").attr("checked", true);
		
		var args = Array.prototype.slice.call(arguments); 
		if (args.length >= 2) { // 第二个参数为事件event
			this.valueChanged(value, args[1]);
		} else {
			this.valueChanged(value);
		}
	};
	__RhRadio.prototype.getValue = function() {
		return this.$dom.find(":radio[checked]").val();
	};
	
	/**
	 * 多选框
	 * @param opts {'type':'check', 'id':'', 'label':'', 'value':'', 'options':[{'name':'', 'value':'1'}, {'name':'', 'value':'2'}], 'notnull':true, 'regular':{'exp':'', 'hit':''}}
	 */
	var __RhCheck = function(opts) {
		var template = '<li class="rh-check">'
			+ '<label class="rh-label"></label>'
			+ '<span class="space require">*</span><span class="space">&nbsp;&nbsp;</span><span class="rh-check-container"></span>'
			+ '</li>';
		this.init(template, opts, arguments);
	};
	Tools.extend(__RhCheck, __RhBase); // 继承__RhBase
	__RhCheck.prototype.render = function(opts) {
		var that = this;
		this.id = opts.id;
		this.$dom.attr('id', '__RhCheck_' + this.id);
		this.setLabel(opts.label);
		this.setOptions(opts.options);
		this.$dom.find(".rh-check-container :checkbox").change(function(event){	
			that.valueChanged(that.getValue(), event);
		});
		this.setValue(opts.value);
	};
	__RhCheck.prototype.setOptions = function(options) {
		var that = this;
		var $container = this.$dom.find(".rh-check-container");
		$container.empty();
		$.each(options, function(index, option){
			var tmpDom = $('<span class="check-container"><input type="checkbox" value="' + option["value"] + '" name="' + that.id + '" /><span class="label">' + option["name"] + '</span></span>');
			$container.append(tmpDom);
			
			var $check = tmpDom.find(":checkbox");
			
			tmpDom.find(".label").click(function(event){
				var val = that.getValue(); // 当前值
				var valArr = [];
				if (val && val.length > 0) {
					valArr = that.getValue().split(',');
				}
				var theVal = $check.val();
				if ($check.attr("checked")) {
					valArr.splice(valArr.indexOf(theVal), 1);
				} else {
					valArr.push(theVal);
				}
				that.setValue(valArr.join(','), event);
			});
		});
	};
	__RhCheck.prototype.setValue = function(value) {
		var that = this;
		this.$dom.find(":checkbox").removeAttr("checked");
		$.each(value.split(','), function(index, val){
			that.$dom.find(":checkbox[value='" + val + "']").attr("checked", true);
		});
		
		var args = Array.prototype.slice.call(arguments); 
		if (args.length >= 2) { // 第二个参数为事件event
			this.valueChanged(value, args[1]);
		} else {
			this.valueChanged(value);
		}
	};
	__RhCheck.prototype.getValue = function() {
		var value = [];
		$.each(this.$dom.find(":checkbox[checked]"), function(index, checked){
			value.push($(checked).val());
		});
		return value.join(',');
	};
	
	
	/**
	 * 下拉框
	 * @param opts {'type':'select', 'id':'', 'label':'', 'value':'', 'options':[{'name':'', 'value':'1'}, {'name':'', 'value':'2'}], 'notnull':true, 'regular':{'exp':'', 'hit':''}, 'store_option':true}
	 * store_option 配置是否存储整个option
	 */
	var __RhSelect = function(opts) {
		var template = '<li class="rh-select">'
			+ '<label class="rh-label"></label>'
			+ '<span class="space require">*</span><span class="space">&nbsp;&nbsp;</span>'
			+ '</li>';
		this.init(template, opts, arguments);
		this.storeOption = opts.store_option;
		this.id = opts.id;
	};
	Tools.extend(__RhSelect, __RhBase); // 继承__RhBase
	__RhSelect.prototype.render = function(opts) {
		var that = this;
		this.$dom.attr('id', '__RhSelect_' + opts.id);
		this.setLabel(opts.label);
		this.setOptions(opts.options);
		this.setValue(opts.value);
	};
	__RhSelect.prototype.setOptions = function(options) {
		var that = this;
		var $select = this.$dom.find(".rh-next-select-container");
		if ($select.length > 0) {
			$select.remove();
		}
		$select = $('<select class="rh-next-select-container"></select>');
		$.each(options, function(index, option){
			var $option = $('<option value="' + option["value"] + '">' + option["name"] + '</option>');
			$select.append($option);
			
		});
		$select.change(function(event){
			that.valueChanged(that.getValue(), event);
		});
		this.$dom.append($select);
	};
	__RhSelect.prototype.setValue = function(value) {
		this.$dom.find("option[selected]").removeAttr("selected");
		this.$dom.find("option[value='" + value + "']").attr("selected", true);
		
		var args = Array.prototype.slice.call(arguments); 
		if (args.length >= 2) { // 第二个参数为事件event
			this.valueChanged(value, args[1]);
		} else {
			this.valueChanged(value);
		}
	};
	__RhSelect.prototype.getValue = function() {
		var val = this.$dom.find("select").val();
		if (val) {
			return val;
		}
		return "";
	};
	__RhSelect.prototype.getName = function() {
		return this.$dom.find("option[selected]").first().text();
	};
	/**
	 * 重载该方法，根据是否存储option来决定获取哪些信息需要存储
	 */
	__RhSelect.prototype.getStoreValue = function() {
		if (this.storeOption) {
			return this.getValue() + "@@" + $.toJSON(this.getOptions());
		} else {
			return this.getValue();
		}
	};
	__RhSelect.prototype.getOptions = function() {
		var options = this.$dom.find("option");
		var optArr = [];
		options.each(function(index, option){
			var $opt = $(option);
			optArr.push({"name":$opt.text(), "value":$opt.val()});
		});
		return optArr;
	};
	/**
	 * 判断如果有短号则存储的是整个option
	 */
	__RhSelect.prototype.setValueFromStore = function(value) {
		if (value && value.indexOf('@@') >= 0) {
			var valArr = value.split('@@');
			this.setOptions($.parseJSON(valArr[1]));
			this.setValue(valArr[0]);
		} else {
			this.setValue(value);
		}
	};
	
	
	/**
	 * 单行文本
	 * @param opts {'type':'input', 'id':'', 'label':'', 'value':'', 'notnull':true, 'regular':{'exp':'', 'hit':''}}
	 */
	var __RhInput = function(opts) {
		var template = '<li class="rh-input">'
			+ '<label class="rh-label"></label>'
			+ '<span class="space require">*</span><span class="space">&nbsp;&nbsp;</span><input type="text" class="rh-input-value" />'
			+ '</li>';
		this.init(template, opts, arguments);
	};
	Tools.extend(__RhInput, __RhBase); // 继承__RhBase
	__RhInput.prototype.render = function(opts) {
		var that = this;
		this.id = opts.id;
		this.$dom.attr('id', '__RhInput_' + opts.id);
		this.setLabel(opts.label);
		this.setValue(opts.value);
		this.$dom.find(".rh-input-value").change(function(event){
			that.valueChanged($(this).val(), event);
		});
	};
	__RhInput.prototype.setValue = function(value) {
		this.$dom.find(".rh-input-value").val(value);
		this.valueChanged(value);
	};
	__RhInput.prototype.getValue = function() {
		return this.$dom.find(".rh-input-value").val();
	};
	
	
	/**
	 * 隐藏文本
	 * @param opts {'type':'hidden', 'id':'', 'label':'', 'value':''}
	 */
	var __RhHidden = function(opts) {
		var template = '<li class="rh-hidden">'
			+ '<label class="rh-label"></label>'
			+ '<span class="space">&nbsp;&nbsp;</span><input type="hidden" class="rh-hidden-value" />'
			+ '</li>';
		this.init(template, opts, arguments);
	};
	Tools.extend(__RhHidden, __RhBase); // 继承__RhBase
	__RhHidden.prototype.render = function(opts) {
		var that = this;
		this.$dom.attr('id', '__RhHidden_' + opts.id);
		this.setLabel(opts.label);
		this.setValue(opts.value);
		this.$dom.find(".rh-hidden-value").change(function(event){
			that.valueChanged($(this).val(), event);
		});
	};
	__RhHidden.prototype.setValue = function(value) {
		this.$dom.find(".rh-hidden-value").val(value);
		this.valueChanged(value);
	};
	__RhHidden.prototype.getValue = function() {
		return this.$dom.find(".rh-hidden-value").val();
	};
	
	
	/**
	 * 多行文本
	 * @param opts {'type':'textarea', 'id':'', 'label':'', 'value':'', 'notnull':true, 'regular':{'exp':'', 'hit':''}}
	 */
	var __RhTextarea = function(opts) {
		var template = '<li class="rh-textarea">'
			+ '<label class="rh-label"></label>'
			+ '<span class="space require">*</span><span class="space">&nbsp;&nbsp;</span><textarea cols="5" class="rh-textarea-value" />'
			+ '</li>';
		this.init(template, opts, arguments);
	};
	Tools.extend(__RhTextarea, __RhBase); // 继承__RhBase
	__RhTextarea.prototype.render = function(opts) {
		var that = this;
		this.$dom.attr('id', '__RhTextarea_' + opts.id);
		this.setLabel(opts.label);
		this.setValue(opts.value);
		this.$dom.find(".rh-textarea-value").change(function(event){
			that.valueChanged($(this).val(), event);
		});
	};
	__RhTextarea.prototype.setValue = function(value) {
		this.$dom.find(".rh-textarea-value").val(value);
		this.valueChanged(value);
	};
	__RhTextarea.prototype.getValue = function() {
		return this.$dom.find(".rh-textarea-value").val();
	};
	
	/**
	 * 树形选择
	 * @param opts {'type':'tree', 'dictConfig':'', 'id':'', 'label':'', 'name':'', 'value':'', 'notnull':true, 'regular':{'exp':'', 'hit':''}}
	 * dictConfig: SY_ORG_DEPT_USER,{'TYPE':'multi','CHECKBOX':true,'extendDicSetting':{'rhexpand':false,'expandLevel':1,'cascadecheck':true,'checkParent':false,'childOnly':true}}
	 */
	var __RhTree = function(opts) {
		var that = this;
		this._itemCode = new Date().getTime() + "_" + opts.id; // 随机生成树取默认值的隐藏域的id
		var template = '<li class="rh-tree">'
			+ '<label class="rh-label"></label>'
			+ '<span class="space require">*</span><span class="space">&nbsp;&nbsp;</span><textarea type="text" class="rh-tree-name" readonly></textarea><input type="hidden" class="rh-tree-value" />' 
			+ '<input type="hidden" id="' + this._itemCode + '" /><input type="hidden" id="' + this._itemCode + '__NAME" />'
			+ '</li>';
		this.$chooseLi = $('<li class="rh-tree-choose"><label class="rh-label"></label><span class="space">&nbsp;&nbsp;</span><a href="javascript:void(0);" class="reader-man-group">查找人员</a></li>');
		this.init(template, opts, arguments);
		this.$dom.after(this.$chooseLi);
		this.$chooseDom = this.$chooseLi.find(".reader-man-group");
		this.$chooseDom.click(function(){
//			var configStr = "@com.rh.core.serv.send.SimpleFenfaDict,{'TYPE':'multi','CHECKBOX':true,'extendDicSetting':{'rhexpand':false,'expandLevel':1,'cascadecheck':true,'checkParent':false,'childOnly':true}}";
			var configStr = "SY_ORG_DEPT_USER,{'TYPE':'multi','CHECKBOX':true,'extendDicSetting':{'rhexpand':false,'expandLevel':1,'cascadecheck':true,'checkParent':false,'childOnly':true}}";
			if (opts.dictConfig) { // 可以从外部传入字典的配置
				configStr = opts.dictConfig;
			}
			var params = { // 传递给后台的额外处理参数
//				"userSelectDict":"SY_ORG_DEPT_USER_SUB", // 用户字典
//				"displaySendSchm":false, // 是否显示分发方案
//				"includeSubOdept":true // 是否机构内用户
			};
			if (opts.params) { // 可以从外部传入
				params = opts.params;
			}
			var options = {
				"config":configStr,
				"hide":"explode",
				"show":"blind",
				"itemCode":that._itemCode,
				"replaceCallBack":function(value, name){
					that.setValue(value);
					that.setName(name);
					that.setDefault(name, value);
				},
				"replaceData" : opts.treeData, // 外部传进来的树的数据
				"dialogName":opts.name,
				"params":params
			};
			if (System.getMB("mobile")) {
				var dictView = new mb.vi.selectList(options);
				dictView._bldWin(event);
			} else {
				var dictView = new rh.vi.rhDictTreeView(options);
			}
			dictView.show(event);
		});
	};
	Tools.extend(__RhTree, __RhBase); // 继承__RhBase
	__RhTree.prototype.render = function(opts) {
		var that = this;
		this.$dom.attr('id', '__RhTree_' + opts.id);
		this.setLabel(opts.label);
		this.initValue(opts.name, opts.value);
		this.$dom.find(".rh-tree-value").change(function(event){
			that.valueChanged($(this).val(), event);
		});
	};
	__RhTree.prototype.initValue = function(name, value) {
		this.setName(name);
		this.setValue(value);
		this.setDefault(name, value);
	};
	/**
	 * 设置树的默认显示值
	 */
	__RhTree.prototype.setDefault = function(name, value) {
		this.$dom.find('#' + this._itemCode).val(value);
		this.$dom.find('#' + this._itemCode + "__NAME").val(name);
	};
	__RhTree.prototype.appendTo = function(container) {
		this.$dom.appendTo(container);
		this.$chooseLi.appendTo(container);
	};
	__RhTree.prototype.setValue = function(value) {
		this.$dom.find(".rh-tree-value").val(value);
		this.valueChanged(value);
	};
	__RhTree.prototype.getValue = function() {
		return this.$dom.find(".rh-tree-value").val();
	};
	__RhTree.prototype.setName = function(name) {
		this.$dom.find(".rh-tree-name").val(name);
	};
	__RhTree.prototype.getName = function() {
		return this.$dom.find(".rh-tree-name").val();
	};
	__RhTree.prototype.getStoreValue = function() {
		return this.getName() + '@@' + this.getValue();
	};
	__RhTree.prototype.setValueFromStore = function(value) {
		if (value && value.indexOf('@@') >= 0) {
			var valArr = value.split('@@');
			this.initValue(valArr[0], valArr[1]);
		} 
	};
	/**
	 * 由于RhTree的dom结构和RhBase不同，所以addError需要重载
	 */
	__RhTree.prototype.addError = function() {
		this.$error.hide();
		this.$chooseLi.after(this.$error);
	};
	
	
	/**
	 * 送下一环节
	 * @param opts 每一项的配置 [{}, {}]
	 * @param 第二个参数是需要添加到的容器jQuery对象，第三个参数是额外的配置
	 */
	var __RhNext = function(opts){
		var that = this;
		var template = '<ul></ul>';
		this._items = {};
		
		// 构造函数可以传递第三个参数，该参数为额外配置
		var args = Array.prototype.slice.call(arguments); 
		if (args.length >= 3) {
			var extra = args[2];
			this.dataId = extra.dataId; // 数据ID
			this.nodeId = extra.nodeId; // 节点ID
			this.storeKey = this.dataId + "_" + this.nodeId;
		} else {
			this.storeKey = "default_key";
		}
		
		this.init(template, opts, arguments);
		this.placeholder();
//		this.$dom.prepend('<li class="buttons"><label class="rh-label"></label><span class="space">&nbsp;&nbsp;</span><button id="save">保存</button><button id="confirm">确定</button><button id="cancel">取消</button></li>');
		this.$dom.append('<li class="mind"></li>');
		
		// 注册保存事件
		opts.diaFuns.save = function(){
			if (!store.enabled) {
	            alert('Local storage is not supported by your browser. Please disable "Private Mode", or upgrade to a modern browser.')
	            return;
	        }
	        that.save();
		};
//		this.$dom.find("#save").click(opts.diaFuns.save);
		
		// 注册确定事件
		opts.diaFuns.confirm = function(){
			if (!store.enabled) {
	            alert('Local storage is not supported by your browser. Please disable "Private Mode", or upgrade to a modern browser.')
	            return;
	        }
			if (that.validate()) {
				that.confirm().then(function(){
			        	store.remove(that.storeKey);
			        	opts.diaFuns.cancel(opts.dialog);
				}, function(){ // 送下一环节失败
					
				});
			} 
		};
//		this.$dom.find("#confirm").click(opts.diaFuns.confirm);
		
		// 注册取消事件
		opts.diaFuns.cancel = function(dialog){
			// 查找最近的一个class为ui-dialog的父节点元素，然后查找ui-icon-closethick，模拟点击
			dialog.remove();
//			that.$dom.closest(".ui-dialog").find(".ui-icon-closethick").click();
//			if (!store.enabled) {
//	            alert('Local storage is not supported by your browser. Please disable "Private Mode", or upgrade to a modern browser.')
//	            return
//	        }
//	        	store.remove(that.storeKey);
		};
//		this.$dom.find("#cancel").click(opts.diaFuns.cancel);
	};
	Tools.extend(__RhNext, __RhBase); // 继承__RhBase
	__RhNext.prototype.render = function(options) {
		var that = this;
		$.each(options, function(index, option){
			if (that._items[option.id]) { // 避免id重复
				alert("已经存在组件：" + option.name);
				return;
			}
			
			var item = that.createItem(option, that.$dom);
			if (item) {
				that._items[option.id] = item;
			}			
		});
		this.initWithStore();
	};
	__RhNext.prototype.createItem = function(option, container) {
		
		if (!option.id || option.id.length == 0) {
			alert("组件的id必须提供！");
			return;
		}
		
		var item;
		switch (option.type) {
			case UIType.Text:
				item = new __RhText(option, container);
				break;
			case UIType.Radio:
				item = new __RhRadio(option, container);
				break;
			case UIType.Check:
				item = new __RhCheck(option, container);
				break;
			case UIType.Select:
				item = new __RhSelect(option, container);
				break;
			case UIType.Input:
				item = new __RhInput(option, container);
				break;
			case UIType.Textarea:
				item = new __RhTextarea(option, container);
				break;
			case UIType.Tree:
				item = new __RhTree(option, container);
				break;
			case UIType.Hidden:
				item = new __RhHidden(option, container);
				break;
			default:
				alert("错误UI类型，" + option.type);
		}
		return item;
	};
	__RhNext.prototype.initWithStore = function() {
		// 取本地缓存里的值
		if (!store.enabled) {
            alert('Local storage is not supported by your browser. Please disable "Private Mode", or upgrade to a modern browser.')
            return
        }
        	var values = store.get(this.storeKey);
        	if (values) {
        		this.setValue(values);
        	}
	};
	__RhNext.prototype.setValue = function(values) {
		if (!values) {
			return;
		}
		$.each(this._items, function(key, item){
			item.setValueFromStore(values[key]);
		});
	};
	__RhNext.prototype.getStoreValueById = function(id) {
		var values = store.get(this.storeKey);
		var returnVal = "";
	    	if (values) {
	    		$.each(this._items, function(key, item){
	    			if (key == id) {
	    				returnVal = values[key];
	    			}
	    		});
	    	}
	    	
	    	return returnVal;
	};
	__RhNext.prototype.getValue = function() {
		var values = {};
		$.each(this._items, function(key, item){
			values[key] = item.getValue();
		});
		return values;
	};
	__RhNext.prototype.getStoreValue = function() {
		var values = {};
		$.each(this._items, function(key, item){
			values[key] = item.getStoreValue();
		});
		return values;
	};
	__RhNext.prototype.validate = function() {
		var pass = true;
		for (var key in this._items) {
			if (!this._items[key].validate()) { // 只要一个校验没通过就整个不通过
				pass = false;
			}
		}
		return pass;
	};
	__RhNext.prototype.setItem = function(id, item) {
		this._items[id] = item;
	};
	__RhNext.prototype.getItem = function(id) {
		return this._items[id];
	};
	
	/**
	 * 获取属性formData为True的Item，并以数组形式返回。
	 */
	__RhNext.prototype.getFormDataItem = function() {
		var results = new Array();
		for (var key in this._items) {
			var item = this._items[key];
			if(item.formData) {
				results.push(item);
			}
		}
		
		return results;
	}
	/**
	 * 动态添加一个组件
	 * 以下的参数after和before都可以不传递，如果不传递的话则往后面添加
	 * @param option 组件配置参数
	 * @param insertAfterItemId 创建的新组件添加到id为insertAfterItemId组件的后面
	 * @param insertBeforeItemId 创建的新组件添加到id为insertBeforeItemId组件的前面
	 */
	__RhNext.prototype.addItem = function(option, insertAfterItemId, insertBeforeItemId) {
		var item = this.createItem(option);
		if (!item) { // 创建组件失败
			return;
		}
		if (insertAfterItemId) {
			var insertAfterItem = this.getItem(insertAfterItemId);
			if (insertAfterItem) {
				item.insertAfter(insertAfterItem);
			} else {
				alert("id为" + insertAfterItemId + "的组件不存在！");
			}
		} else if (insertBeforeItemId) {
			var insertBeforeItem = this.getItem(insertBeforeItemId);
			if (insertBeforeItem) {
				item.insertBefore(insertBeforeItem);
			} else {
				alert("id为" + insertBeforeItemId + "的组件不存在！");
			}
		} else {
			item.appendTo(this.$dom);
		}
		this.setItem(option.id, item); // 该元素添加到RhNext里统一管理
	};
	__RhNext.prototype.placeholder = function() {
		var that = this;
		// ie8下设置placeholder
		if(!('placeholder' in document.createElement('input'))) {   
			this.$dom.find('input[placeholder], textarea[placeholder]').each(function(){    	
				var that = $(this), text = that.attr('placeholder');    
				if(that.val() === ""){    
					that.val(text).addClass('placeholder');    
				}    
				that.focus(function(){    
					if(that.val() === text){    
						that.val("").removeClass('placeholder');    
					}    
				}).blur(function(){    
					if(that.val() === ""){    
						that.val(text).addClass('placeholder');    
					}    
				})     
			});    
		}
	};
	__RhNext.prototype.save = function() {
        	store.set(this.storeKey, this.getStoreValue());
        	this.$dom.find("#cancel").click();
	};
	__RhNext.prototype.confirm = function() { // 返回的必须是promise
		var deferred = $.Deferred();
		if (confirm("确定送下一环节")) {
			deferred.resolve();
		} else {
			deferred.reject();
		}
        	return deferred.promise();
	};
	__RhNext.prototype.getMindCon = function(){
		return this.$dom.find(".mind").first();
	};
	__RhNext.prototype.setNotNull = function() { // RhNext不用setNotNull
	};
	
	// 暴露全局变量
	$.each(UIType, function(key, value){
		window["Rh" + key] = eval("__Rh" + key);
	});
})(window, jQuery);

