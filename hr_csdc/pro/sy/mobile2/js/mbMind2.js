GLOBAL.namespace('mb.vi');
mb.vi.mind = function(options) {
	var defaults = {
		'parHandler': null,
		'wfCard': null,
		'servId': null,
		'dataId': null,
		'pCon': null
	};
	this.opts = $.extend(defaults, options);
	this._mind = this.opts.mind;				// mindDatas, mindInput
	this._servId = this.opts.servId;			// servId
	this._dataId = this.opts.dataId;			// dataId
	this._parHandler = this.opts.parHandler;	// 句柄
	this._wfCard = this.opts.wfCard;			// wfCard
	this._pCon = this.opts.pCon;				// mindfieldcontain
	this._mindInput = '';
	this._mindList = '';							
	this._odeptList = '';						// 填写过意见的所有机构
	this.oldMindText = '';
	
	// 意见是否已修改,包括意见内容
	this.isModify = function() {
		return this._textIsModify();
	};
	// 意见内容是否已修改
	this._textIsModify = function() {
		var newVal = $('#mind-content').val() || '';
		if (newVal == this.oldMindText	|| newVal == '') {
			return false;
		}
		return true;
	};
};
mb.vi.mind.prototype.show = function() {
	this._renderMindList();
	this._getUseMindData();
	this._bindEvent();
};
mb.vi.mind.prototype._renderMindList = function() {
	var _self = this;
	
	var params = {
			'_isMobile': true,
			'CAN_COPY': false,
			'userDoInWf': true, 	// 此用户是否正在当前节点
			'SERV_ID': _self._servId,
			'DATA_ID': _self._dataId
	};
	var resultData = FireFly.doAct('SY_COMM_MIND', 'displayMindTitle', params, false, false);
	$(this._pCon[1]).html('').append(resultData['MIND_TITLE']);
	console.debug(resultData['_DATA_']);
	if (resultData['_DATA_'].length > 0) {
		_self.curMind = resultData['_DATA_'][0];
		_self.curMindCon = _self.curMind['MIND_CONTENT'];
	} else {
		_self.curMindCon = '';
	}
};
mb.vi.mind.prototype._bindEvent = function() {
	var _self = this;
	
	// 给添加按钮绑定事件
	$(this._pCon[0]).off('click').on('click', function() {
		alert('---调原生---');
		var params = {
				customMindList: _self.useMindDatas,
				updateUrl: "updateUrl?SERV_ID='" + _self._servId + "'&DATA_ID='" + _self._dataId + "'",
				content: _self.curMindCon,
				placeholder: '请添加意见...',
				files: []
		};
		rh.displayMindInputDialog(params, function(outBean) {
			
		}, function(outBean) {
			
		});
	});
};
/**
 * 获取常用意见
 */
mb.vi.mind.prototype._getUseMindData = function() {
	var _self = this;
	
	var params = {
			'_NOPAGE_': true
	};
	
	FireFly.doAct('SY_COMM_USUAL', 'query', params).then(function(result) {
		_self.useMindDatas = result['_DATA_'];
	});
};






























