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
	
	/** 节点样式及坐标绑定*/
	function nodeStyle2() {
		return [ new go.Binding("location", "loc", go.Point.parse).makeTwoWay(go.Point.stringify),
		        {	locationSpot: go.Spot.Center,name:"TODAY" }];
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
	var flag = 1;
	function loop() {
		setTimeout(function() { updateStates(); loop(); }, 500);
    };
    
    function updateStates() {
    	var oldskip = myDiagram.skipsUndoManager;
    	myDiagram.skipsUndoManager = true;
    	myDiagram.nodes.each(function(node) {
    		switch (node.category) {
    			case "today": changeNode(node); break;
    		}
    	});
    	myDiagram.skipsUndoManager = oldskip;
    };
    
    function changeNode(node) {
    	myDiagram.startTransaction("set all properties");
    	if(flag == 1) {
    		myDiagram.model.setDataProperty(node.data, "color", greengrad);
    		flag = 2;
    	} else {
    		myDiagram.model.setDataProperty(node.data, "color", redgrad);
    		flag = 1;
    	}
    	myDiagram.commitTransaction("set all properties");
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
    		return FireFly.getContextPath() + "/sy/wfe/images/level1.png";
    	} else if(key == 2) {
    		return FireFly.getContextPath() + "/sy/wfe/images/level2.png";
    	} else if(key == 3) {
    		return FireFly.getContextPath() + "/sy/wfe/images/level3.png";
    	} else if(key == 4) {
    		return FireFly.getContextPath() + "/sy/wfe/images/level4.png";
    	} else if(key == 5) {
    		return FireFly.getContextPath() + "/sy/wfe/images/level5.png";
    	} else if(key == 6) {
    		return FireFly.getContextPath() + "/sy/wfe/images/level6.png";
    	} else {
    		return FireFly.getContextPath() + "/sy/wfe/images/circle2.png";
    	}
    };
    
    function createActionTable(e, obj) {
    	var clicked = obj.part;
		var thisemp = clicked.data;
		var nodeDef = eval(thisemp.actionMap);
		$("tr[id='wfeTrackTr']").remove();
		var tbody = $("#wfeTrackTbody");
		if (nodeDef && nodeDef.length > 0) {
			for(var i = 0; i < nodeDef.length; i++){
				var tmpData = eval("(" + nodeDef[i] + ")");
				var tr = $("<tr id='wfeTrackTr' class='tBody-tr'></tr>").appendTo(tbody);
				$("<td class='rhGrid-td-left' style='width:20%'></td>").html(tmpData.SendDept).appendTo(tr);
				$("<td class='rhGrid-td-left' style='width:15%'></td>").html(tmpData.SendUser).appendTo(tr);
        		$("<td class='rhGrid-td-left' style='width:15%'></td>").html(tmpData.BeginTime).appendTo(tr);
        		$("<td class='rhGrid-td-left' style='width:20%'></td>").html(tmpData.DoneDept).appendTo(tr);
        		$("<td class='rhGrid-td-left' style='width:15%'></td>").html(tmpData.DoneUser).appendTo(tr);
        		$("<td class='rhGrid-td-left' style='width:15%'></td>").html(tmpData.EndTime).appendTo(tr);
			}
		}
    };
    
    /** 节点选中模版*/
    var nodeSelectionAdornmentTemplate =
	    gojs(go.Adornment, "Auto",gojs(go.Shape, { fill: null, stroke: "deepskyblue", strokeWidth: 1.5, strokeDashArray: [4, 2] }), gojs(go.Placeholder)
    );

    /** 定义流经过节点样式*/
    myDiagram.nodeTemplateMap.add("yesterday",
		gojs(go.Node, "Auto", nodeStyle(),
			{click: createActionTable},
			gojs(go.Shape, "RoundedRectangle", { fill: bluegrad, stroke: "#EEEEEE",minSize: new go.Size(130, 60),parameter1: 5}, new go.Binding("fill", "color")),
			new go.Binding("location", "location", go.Point.parse).makeTwoWay(go.Point.stringify),
			{ selectable: true, selectionAdornmentTemplate: nodeSelectionAdornmentTemplate },
			gojs(go.Panel, "Horizontal",
				gojs(go.Picture, { name: 'Picture', desiredSize: new go.Size(35, 35), margin: new go.Margin(6, 3, 6, 10)},
				new go.Binding("source", "level", findHeadShot)),
				gojs(go.TextBlock,{ margin: 5, font: "bold 11px Helvetica, bold Arial, sans-serif",stroke: 'whitesmoke',editable: false, isMultiline: true,maxSize: new go.Size(80,50) },
						new go.Binding("text", "text"))
			),
        makePort("T", go.Spot.Top, true, true),
        makePort("L", go.Spot.Left, true, true),
        makePort("R", go.Spot.Right, true, true),
        makePort("B", go.Spot.Bottom, true, true)
	));
    
    /** 定义当前节点样式*/
    myDiagram.nodeTemplateMap.add("today", 
		gojs(go.Node, "Auto",nodeStyle2(),
			{click: createActionTable},
			gojs(go.Shape, "RoundedRectangle", { fill: redgrad, stroke: "#EEEEEE",minSize: new go.Size(130, 60),parameter1: 5}, new go.Binding("fill", "color")),
			new go.Binding("location", "location", go.Point.parse).makeTwoWay(go.Point.stringify),
			{ selectable: true, selectionAdornmentTemplate: nodeSelectionAdornmentTemplate },
			gojs(go.Panel, "Horizontal",
				gojs(go.Picture, { name: 'Picture', desiredSize: new go.Size(35, 35), margin: new go.Margin(6, 3, 6, 10)},
				new go.Binding("source", "level", findHeadShot)),
				gojs(go.TextBlock,{ margin: 5, font: "bold 11px Helvetica, bold Arial, sans-serif",stroke: 'whitesmoke',editable: false, isMultiline: true,maxSize: new go.Size(80, 50) },
						new go.Binding("text", "text"))
			),
        makePort("T", go.Spot.Top, true, true),
        makePort("L", go.Spot.Left, true, true),
        makePort("R", go.Spot.Right, true, true),
        makePort("B", go.Spot.Bottom, true, true)
	));
    
    /** 定义未流经节点样式*/
    myDiagram.nodeTemplateMap.add("tomorrow", 
		gojs(go.Node, "Auto",nodeStyle(),
			{click: createActionTable},
			gojs(go.Shape, "RoundedRectangle", { fill: yellowgrad, stroke: "#EEEEEE",minSize: new go.Size(130, 60),parameter1: 5}, new go.Binding("fill", "color")),
			new go.Binding("location", "location", go.Point.parse).makeTwoWay(go.Point.stringify),
			{ selectable: true, selectionAdornmentTemplate: nodeSelectionAdornmentTemplate },
			gojs(go.Panel, "Horizontal",
				gojs(go.Picture, { name: 'Picture', desiredSize: new go.Size(35, 35), margin: new go.Margin(6, 3, 6, 10)},
				new go.Binding("source", "level", findHeadShot)),
				gojs(go.TextBlock,{ margin: 5, font: "bold 11px Helvetica, bold Arial, sans-serif",stroke: 'whitesmoke',editable: false, isMultiline: true,maxSize: new go.Size(80, 50) },
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
    		reshapable: false,
    		resegmentable: true,
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
    
    load();
    
    //loop();
});

function load() {
//	for(var i = 0; i < jsonData.nodeDataArray.length; i++) {
//		alert(JsonToStr(jsonData.nodeDataArray[i]));
//	}
	myDiagram.model = go.Model.fromJson(jsonData);
};