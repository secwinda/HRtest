$(document).ready(function() {
	gojs = go.GraphObject.make;
	
	/** 初始化gojs设计器的主要参数*/
	myDiagram = gojs(go.Diagram, "myDiagramDiv",{
		grid: gojs(go.Panel, "Grid",
				gojs(go.Shape, "LineH", { stroke: "lightgray", strokeWidth: 0.5 }),
				gojs(go.Shape, "LineH", { stroke: "gray", strokeWidth: 0.5, interval: 10 }),
				gojs(go.Shape, "LineV", { stroke: "lightgray", strokeWidth: 0.5 }),
				gojs(go.Shape, "LineV", { stroke: "gray", strokeWidth: 0.5, interval: 10 })),
		initialContentAlignment: go.Spot.Center,
		draggingTool: new GuidedDraggingTool(),
		allowMove: false,
        allowCopy: false,
        allowDelete: false,
		"draggingTool.horizontalGuidelineColor": "blue",
        "draggingTool.verticalGuidelineColor": "blue",
        "draggingTool.centerGuidelineColor": "green",
        "draggingTool.guidelineWidth": 1,
		"draggingTool.dragsLink": false,
		"draggingTool.isGridSnapEnabled": true,
		"linkingTool.isUnconnectedLinkValid": false,
		"linkingTool.portGravity": 20,
		"relinkingTool.isUnconnectedLinkValid": true,
		"relinkingTool.portGravity": 20,
		"relinkingTool.fromHandleArchetype": gojs(go.Shape, "Diamond", { segmentIndex: 0, cursor: "pointer", desiredSize: new go.Size(8, 8), fill: "tomato", stroke: "darkred" }),
		"relinkingTool.toHandleArchetype": gojs(go.Shape, "Diamond", { segmentIndex: -1, cursor: "pointer", desiredSize: new go.Size(8, 8), fill: "darkred", stroke: "tomato" }),
		"linkReshapingTool.handleArchetype": gojs(go.Shape, "Diamond", { desiredSize: new go.Size(7, 7), fill: "lightblue", stroke: "deepskyblue" }),
		"rotatingTool.snapAngleMultiple": 15,
		"rotatingTool.snapAngleEpsilon": 15,
		"undoManager.isEnabled": true,
		allowDrop: true,
		"animationManager.duration": 800,
		"undoManager.isEnabled": true,
		"ExternalObjectsDropped": function(e) {
            document.getElementById("myDiagramDiv").focus();  // assume keyboard focus should be on myDiagram
            myDiagram.toolManager.draggingTool.clearGuidelines();  // remove any guidelines
        }
 	});
	
	/** 节点样式及坐标绑定*/
	function nodeStyle() {
		return [ new go.Binding("location", "loc", go.Point.parse).makeTwoWay(go.Point.stringify),
		        {	locationSpot: go.Spot.Center }];
	};
	
	/** 创建节点连接点*/
	function makePort(name, spot, output, input) {
		return gojs(go.Shape, "Circle",
				{
					fill: "transparent",
					stroke: null,
					desiredSize: new go.Size(8, 8),
					alignment: spot, alignmentFocus: spot,
					portId: name,
					fromSpot: spot, toSpot: spot,
					fromLinkable: output, toLinkable: input,
					cursor: "pointer"
				});
	};
	
	/** 显示连接点*/
	function showPorts(node, show) {
		var diagram = node.diagram;
        if (!diagram || diagram.isReadOnly || !diagram.allowLink) return;
        node.ports.each(function(port) {
        	port.stroke = (show ? "white" : null);
        });
	};
	
	/** 双击节点弹出对话框*/
	function dblNodeFunc(e, obj) {
		var clicked = obj.part;
		var thisemp = clicked.data;
		var SERV_ID = servId;
		var SERV_PID = servPid;
		var nodeType = thisemp.category == "start" ? 1 : 2;
		var nodeObj = thisemp.nodeDef;
		nodeObj.NODE_CODE = thisemp.key;
		nodeObj.NODE_TYPE = nodeType;
		nodeObj.NODE_NAME = thisemp.text;
		nodeObj.SERV_ID = SERV_ID;
		nodeObj.SERV_PID = SERV_PID;
		
		//取服务的附件字段上的 文件类型    
		var servDef = FireFly.getServMainData(SERV_ID);
		nodeObj.servDef = servDef;
		openDialog("node.jsp", nodeObj);
	};
	
	function dblLineFunc(e, obj) {
		var clicked = obj.part;
		var thisemp = clicked.data;
		var SERV_ID = servId;
		var SERV_PID = servPid;
		var lineObj = thisemp.lineDef;
		if(!lineObj) {
			lineObj = {};
		}
		lineObj.LINE_CODE = thisemp.labelKeys;
		lineObj.NODE_NAME = "";
		lineObj.SRC_NODE_CODE = thisemp.from;
		lineObj.TAR_NODE_CODE = thisemp.to;
		if(!lineObj.LINE_IF_RETURN) {
			lineObj.LINE_IF_RETURN = 1;
		}
		lineObj.SERV_ID = SERV_ID;
		openDialog("line.jsp", lineObj);
	};
	
	function openDialog(url, dataObj) {
		var self = this;
		
		self.dialog = jQuery("<div style='background:white;overflow:hidden'></div>").addClass("dictDialog").attr("title","");
		var iframe = jQuery("<iframe style='width:100%;height:100%' id='defIframe'></iframe>").attr({"src":url,"dataDef":JSON.stringify(dataObj)}).appendTo(self.dialog);
		
		self.dialog.appendTo(jQuery("body"));
		var hei = 650;
		var wid = 1100;
		
		var scroll = RHWindow.getScroll(parent.window);
	    var viewport = RHWindow.getViewPort(parent.window);
	    var top = scroll.top + viewport.height / 2 - hei / 2 -60;
	    var posArray = ["", top];
	    self.dialog.dialog({
			autoOpen: true,
			height: hei,
			width: wid,
			show: "bounce", 
	        hide: "puff",
			modal: true,
			resizable: false,
			position: posArray
		});
		// 注释掉头部关闭按钮
	    self.dialog.parent().find(".ui-dialog-titlebar-close").hide();
		var btns = jQuery(".ui-dialog-buttonpane button",dialog.parent()).attr("onfocus","this.blur()");
		btns.first().addClass("rh-small-dialog-ok");
		btns.last().addClass("rh-small-dialog-close");
		self.dialog.parent().addClass("rh-small-dialog").addClass("rh-bottom-right-radius");
	    jQuery(".ui-dialog-titlebar").last().css("display","block");//设置标题显示
	};
	
	/** 绿色框 */
	var greengrad = gojs(go.Brush, "Solid", { 0: "#76fa35", 1: "#0eb106" });
	/** 蓝色框 */
    var bluegrad = gojs(go.Brush, "Solid", { 0: "#6bc7f8", 1: "#2e4eca" });
    /** 黄色框 */
    var yellowgrad = gojs(go.Brush, "Solid", { 0: "#fed61d", 1: "#f87b00" });
    /** 红色框 */
    var redgrad = gojs(go.Brush, "Solid", { 0: "#fc439a", 1: "#f80029" });
    
    /** 默认头像图片*/
    function findHeadShot(key) {
    	if(key == 1) {
    		return "./images/level1.png";
    	} else if(key == 2) {
    		return "./images/level2.png";
    	} else if(key == 3) {
    		return "./images/level3.png";
    	} else if(key == 4) {
    		return "./images/level4.png";
    	} else if(key == 5) {
    		return "./images/level5.png";
    	} else if(key == 6) {
    		return "./images/level6.png";
    	} else {
    		return "./images/circle2.png";
    	}
    };
    
    /** 节点选中模版*/
    var nodeSelectionAdornmentTemplate =
	    gojs(go.Adornment, "Auto",gojs(go.Shape, { fill: null, stroke: "deepskyblue", strokeWidth: 1.5, strokeDashArray: [4, 2] }), gojs(go.Placeholder)
    );

    /** 定义开始节点样式*/
    myDiagram.nodeTemplateMap.add("start",
		gojs(go.Node, "Auto", nodeStyle(),
			gojs(go.Shape, "RoundedRectangle", { fill: greengrad, stroke: "#EEEEEE",minSize: new go.Size(130, 60),parameter1: 5}, new go.Binding("fill", "color")),
			new go.Binding("location", "location", go.Point.parse).makeTwoWay(go.Point.stringify),
			{ selectable: true, selectionAdornmentTemplate: nodeSelectionAdornmentTemplate },
			gojs(go.Panel, "Horizontal",
				gojs(go.Picture, { name: 'Picture', desiredSize: new go.Size(35, 35), margin: new go.Margin(6, 3, 6, 6)},
				new go.Binding("source", "level", findHeadShot)),
				gojs(go.TextBlock,{ margin: 5, font: "bold 11px Helvetica, bold Arial, sans-serif",stroke: 'whitesmoke',editable: false, isMultiline: true,maxSize: new go.Size(80,50) },
						new go.Binding("text", "text"))
			),
        makePort("T", go.Spot.Top, true, true),
        makePort("L", go.Spot.Left, true, true),
        makePort("R", go.Spot.Right, true, true),
        makePort("B", go.Spot.Bottom, true, true)
	));
    
    /** 定义审核节点样式*/
    myDiagram.nodeTemplateMap.add("step", 
		gojs(go.Node, "Auto",nodeStyle(), 
			gojs(go.Shape, "RoundedRectangle", { fill: yellowgrad, stroke: "#EEEEEE",minSize: new go.Size(130, 60),parameter1: 5}, new go.Binding("fill", "color")),
			new go.Binding("location", "location", go.Point.parse).makeTwoWay(go.Point.stringify),
			{ selectable: true, selectionAdornmentTemplate: nodeSelectionAdornmentTemplate },
			gojs(go.Panel, "Horizontal",
				gojs(go.Picture, { name: 'Picture', desiredSize: new go.Size(35, 35), margin: new go.Margin(6, 3, 6, 6)},
				new go.Binding("source", "level", findHeadShot)),
				gojs(go.TextBlock,{ margin: 5, font: "bold 11px Helvetica, bold Arial, sans-serif",stroke: 'whitesmoke',editable: false, isMultiline: true,maxSize: new go.Size(80,50) },
						new go.Binding("text", "text"))
			),
        makePort("T", go.Spot.Top, true, true),
        makePort("L", go.Spot.Left, true, true),
        makePort("R", go.Spot.Right, true, true),
        makePort("B", go.Spot.Bottom, true, true)
	));
    
    /** 定义线样式*/
    myDiagram.linkTemplate = gojs(go.Link,
    	{
    		routing: go.Link.AvoidsNodes,
    		curve: go.Link.JumpOver,
    		corner: 5, toShortLength: 4,
    		adjusting: go.Link.Stretch,
    		relinkableFrom: false,
    		relinkableTo: false,
    		reshapable: true,
    		resegmentable: true,
    		mouseEnter: function(e, link) { link.findObject("HIGHLIGHT").stroke = "rgba(30,144,255,0.2)"; },
    		mouseLeave: function(e, link) { link.findObject("HIGHLIGHT").stroke = "transparent"; }
    	},
    	new go.Binding("points").makeTwoWay(),
    	gojs(go.Shape, { isPanelMain: true, strokeWidth: 8, stroke: "transparent", name: "HIGHLIGHT" }),
    	gojs(go.Shape, { isPanelMain: true, strokeWidth: 2, stroke: "#00a4a4" }),
    	gojs(go.Shape, { toArrow: "Standard", stroke: "#00a4a4",fill: "#00a4a4" }),
    	gojs(go.Panel, "Auto", 
    		gojs(go.Shape, "RoundedRectangle", { fill: "rgba(30,144,255,0)", stroke: null }),
    		gojs(go.TextBlock,{ textAlign: "center", font: "bold 10pt helvetica, arial, sans-serif", stroke: "#00c4c4", margin: 2, minSize: new go.Size(10, NaN), editable: false},
    		new go.Binding("text").makeTwoWay())
    	)
    );
    
    /** 初始化预览区 */
    myOverview = gojs(go.Overview, "myOverviewDiv", { observed: myDiagram, contentAlignment: go.Spot.Center });
    
    myDiagram.toolManager.linkingTool.temporaryLink.routing = go.Link.Orthogonal;
    myDiagram.toolManager.relinkingTool.temporaryLink.routing = go.Link.Orthogonal;
    myDiagram.model = gojs(go.GraphLinksModel, { linkLabelKeysProperty: "labelKeys","linkFromPortIdProperty": "fromPort", "linkToPortIdProperty": "toPort"});
    myDiagram.toolManager.linkingTool.archetypeLabelNodeData = { category: "LinkLabel",key: "L1", lineDef: {} };
    
    
    var nodeUser = "";
    
    $("#selectUser").click(function() {
    	var configStr = "SY_ORG_DEPT_USER_ALL,{'rtnLeaf':true}";
		var extendTreeSetting = {'cascadecheck':true,'checkParent':false};
		var options = {"itemCode":"","config" : configStr,"hide":"explode","show":"blind",
		"extendDicSetting":extendTreeSetting,
		"replaceCallBack":function(id,value){
			nodeUser = id;

		}};
		var dictView = new rh.vi.rhDictTreeView(options);
		dictView.show();
    });
    
    $("#start").click(function() {
    	var result = FireFly.doAct("SY_WFE_AUTOTEST_RECORD", "getStartNode", {"servId":servId});
    	console.log(result);
    	var param = {
			"PROC_CODE" : procCode,
			"SERV_ID" : servId,
			"FROM_NODE" : "",
			"FROM_NNAME" : "",
			"TO_NODE" : "",
			"TO_NNAME" : "",
			"DONE_USER" : "",
			"SEND_USER" : "",
			"COND_CONTENT" : "",
			"MIND_CONTENT" : ""
    	};
    });
    
    load();
    /**********************************************************按钮绑定区域-end*************************************************************************/
});

function load() {
	var xmlDoc = $.parseXML(xml);
	var result = "";
	$(xmlDoc).find("jsonDesign").each(function () {  
        result = $(this).text();  
    });
	if (result) {
		myDiagram.model = go.Model.fromJson(result);
	}
};

function updateNodeDef(nodeDef) {
	myDiagram.startTransaction("set all properties");
	myDiagram.selection.each(function(current) {
		if (current instanceof go.Link) return; // skips over go.Link
		myDiagram.model.setDataProperty(current.data, "nodeDef", nodeDef);
		myDiagram.model.setDataProperty(current.data, "text", nodeDef.NODE_NAME);
		myDiagram.model.setDataProperty(current.data, "level", nodeDef.PEOPLE_LEVEL);
		if(nodeDef.PROC_END_FLAG == 1 && nodeDef.NODE_TYPE != 1) {
			myDiagram.model.setDataProperty(current.data, "color", gojs(go.Brush, "Solid", { 0: "#fc439a", 1: "#f80029" }));
		} else if(nodeDef.NODE_TYPE != 1) {
			myDiagram.model.setDataProperty(current.data, "color", gojs(go.Brush, "Solid", { 0: "#fed61d", 1: "#f87b00" }));
		}
	});
	myDiagram.commitTransaction("set all properties");
};

function updateLineDef(lineDef) {
	myDiagram.startTransaction("set all properties");
	myDiagram.selection.each(function(current) {
		if (current instanceof go.Node) return; // skips over go.Node
		myDiagram.model.setDataProperty(current.data, "lineDef", lineDef);
		myDiagram.model.setDataProperty(current.data, "text", lineDef.LINE_COND_NAME);
	});
	myDiagram.commitTransaction("set all properties");
}

function closeDialog() {
	self.dialog.remove();
}