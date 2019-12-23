$(document).ready(function() {
	
	gojs = go.GraphObject.make;
	
	/** 初始化gojs设计器的主要参数*/
	myDiagram = gojs(go.Diagram, "myDiagramDiv",{
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
		allowDrop: false,
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
    
    function findUser(imgUrl) {
    	if(imgUrl.USER_CODE) {
    		return FireFly.getContextPath() + "/sy/wfe/images/circle2.png";
    	}
    	return imgUrl;
    }
    
    function updateTokenData(key) {
    	$RuahoPlugin.getUserIconUrl({
            'userCodes': [aniData[key].sendUser.USER_CODE]
        }, function success(arg) {
        	myDiagram.startTransaction("set all properties");
        	myDiagram.parts.each(function(current) {
        		myDiagram.model.setDataProperty(current.data, "doneUser", arg[0]);
        	});
        	myDiagram.commitTransaction("set all properties");
        });
    };
    
    function initTokens() {
    	var oldskips = myDiagram.skipsUndoManager;
        myDiagram.skipsUndoManager = true;
        myDiagram.model.addNodeDataCollection([aniData[0]]);
        myDiagram.skipsUndoManager = oldskips;
        window.requestAnimationFrame(updateTokens);
        updateTokenData(0);
    };
    
    var linkPointEnd = 1;
    var nextNode = 0;
    
    function updateTokens() {
    	$("#wfeTrackTr"+nextNode).show();
    	var oldskips = myDiagram.skipsUndoManager;
    	myDiagram.skipsUndoManager = true;
    	myDiagram.parts.each(function(token) {
    		var data = token.data;
    		var at = data.at;
    		if (at === undefined)
    			return;
    		var from = myDiagram.findNodeForKey(at);
    		if (from === null)
    			return;
    		var frac = data.frac;
    		if (frac === undefined)
    			frac = 0.0;
    		var next = data.next;
    		var to = myDiagram.findNodeForKey(next);
    		if (to === null) {
    			positionTokenAtNode(token, from);
    			if(nextNode <= (aniData.length - 1)) {
    				data.next = aniData[nextNode].next;
				}
    		} else {
    			var link = from.findLinksTo(to).first();
    			var direction = true;
    			if(link === null) {
    				direction = false;
    				link = to.findLinksTo(from).first();
    			}
    			if(direction) {
    				if (link !== null) {
        				var start = link.getPoint(linkPointEnd - 1);
        				var end = link.getPoint(linkPointEnd);
        				var x = start.x + frac * (end.x - start.x);
        				var y = start.y + frac * (end.y - start.y);
        				token.location = new go.Point(x, y);
        			} else {
        				positionTokenAtNode(token, from);
        			}
        			if (frac >= 1.0) {
        				if(link && linkPointEnd < (link.pointsCount - 1)) {
        					linkPointEnd ++;
        					data.frac = 0.0;
        				} else {
        					if(nextNode < (aniData.length - 1)) {
        						nextNode ++;
        						updateTokenData(nextNode);
        					}
        					linkPointEnd = 1;
        					data.frac = 0.0;
            				data.at = next;
            				data.next = undefined;
        				}
        			} else {
        				data.frac = frac + 0.02;
        			}
    			} else {
    				if (link !== null) {
        				var start = link.getPoint(link.pointsCount - 1 - (linkPointEnd - 1));
        				var end = link.getPoint(link.pointsCount - 1 - linkPointEnd);
        				var x = start.x + frac * (end.x - start.x);
        				var y = start.y + frac * (end.y - start.y);
        				token.location = new go.Point(x, y);
        			} else {
        				positionTokenAtNode(token, from);
        			}
        			if (frac >= 1.0) {
        				if(link && linkPointEnd < (link.pointsCount - 1)) {
        					linkPointEnd ++;
        					data.frac = 0.0;
        				} else {
        					if(nextNode < (aniData.length - 1)) {
        						nextNode ++;
        						updateTokenData(nextNode);
        					}
        					linkPointEnd = 1;
        					data.frac = 0.0;
            				data.at = next;
            				data.next = undefined;
        				}
        			} else {
        				data.frac = frac + 0.02;
        			}
    			}
    		}
    	});
    	myDiagram.skipsUndoManager = oldskips;
    	window.requestAnimationFrame(updateTokens);
    };
    
    function createActionTable2() {
    	var tbody = $("#wfeTrackTbody");
    	$.each(aniData,function(j,aniObj){
    		var aniWfeData = jQuery.extend(true, {}, aniObj);
    		$RuahoPlugin.getUserIconUrl({
	            'userCodes': [aniObj.doneUser.USER_CODE,aniObj.sendUser.USER_CODE]
	        }, function success(arg) {
	        	var tr = $("<tr id='wfeTrackTr"+ j +"'></tr>").css({"border-bottom":"1px solid rgb(240,240,240)","display":"none"}).prependTo(tbody);
				$("<td align='center' valign='top'></td>").html(j+1).css({"color":"orange","font-weight":"bold","font-size":"20px","width":"10%","padding-top":"10px"}).appendTo(tr);
				var td = $("<td style='width:90%'></td>").appendTo(tr);
				var table = $("<table width='100%'></table>").css({"margin-top":"10px"}).appendTo(td);
				var childTr = $("<tr></tr>").appendTo(table);
				var childTd = $("<td valign='top'></td>").html(aniWfeData.NODE_NAME).css({"font-weight":"bold","font-size":"16px","height":"30px"}).appendTo(childTr);
				$("<div><div>").html(aniWfeData.endTime ? aniWfeData.endTime.substring(5,16) + "&nbsp;&nbsp;&nbsp;" : '&nbsp;').css({"text-align":"right","font-weight":"normal","float":"right","width":"40%","color":"gray","font-size":"14px"}).appendTo(childTd);
				var childTr = $("<tr></tr>").appendTo(table);
				var childTd = $("<td width='100%'></td>").appendTo(childTr);
				$("<img src='"+ arg[0] +"'/>").css({"float":"left","width":"45px","margin-right":"10px"}).appendTo(childTd);
				$("<div><div>").html(aniWfeData.doneUser.USER_NAME + "&nbsp;&nbsp;<span style='font-weight:normal;font-size:14px;color:gray'>" + aniWfeData.doneUser.USER_POST + "</span>").css({"float":"left","width":"70%","font-weight":"bold","font-size":"16px"}).appendTo(childTd);
				$("<div><div>").html(aniWfeData.doneUser.DEPT_NAME).css({"margin-top":"5px","float":"left","width":"60%","color":"gray"}).appendTo(childTd);
				var childTr = $("<tr></tr>").appendTo(table);
				var childTd = $("<td width='100%'></td>").css({"padding":"10px 0px 10px 0px"}).html("<span style='border-left:7px solid green'>&nbsp;&nbsp;送交人</span>").appendTo(childTr);
				$("<div><div>").html(aniWfeData.beginTime ? aniWfeData.beginTime.substring(5,16) + "&nbsp;&nbsp;&nbsp;" : '&nbsp;').css({"text-align":"right","font-weight":"normal","float":"right","width":"40%","color":"gray","font-size":"14px"}).appendTo(childTd);
				var childTr = $("<tr></tr>").appendTo(table);
				var childTd = $("<td width='100%'></td>").css({"padding-bottom":"10px"}).appendTo(childTr);
				$("<img src='"+ arg[1] +"'/>").css({"float":"left","width":"45px","margin":"0px 10px 0px 10px "}).appendTo(childTd);
				$("<div><div>").html(aniWfeData.sendUser.USER_NAME + "&nbsp;&nbsp;<span style='font-weight:normal;font-size:14px;color:gray'>" + aniWfeData.sendUser.USER_POST + "</span>").css({"float":"left","width":"70%","font-weight":"bold","font-size":"16px"}).appendTo(childTd);
				$("<div><div>").html(aniWfeData.sendUser.DEPT_NAME).css({"margin-top":"5px","float":"left","width":"60%","color":"gray"}).appendTo(childTd);
	        });
    	});
    };
    
    // determine where to position a token when it is resting at a node
    function positionTokenAtNode(token, node) {
    	// these details depend on the node template
    	token.location = node.position.copy().offset(4 + 6, 5 + 6);
    };
    
    /** 节点选中模版*/
    var nodeSelectionAdornmentTemplate =
	    gojs(go.Adornment, "Auto",gojs(go.Shape, { fill: null, stroke: "deepskyblue", strokeWidth: 1.5, strokeDashArray: [4, 2] }), gojs(go.Placeholder)
    );

    /** 定义流经过节点样式*/
    myDiagram.nodeTemplateMap.add("yesterday",
		gojs(go.Node, "Auto", nodeStyle(),
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
    
    myDiagram.nodeTemplateMap.add("token",
    	gojs(go.Part,
    		{ locationSpot: go.Spot.Center, layerName: "Foreground",isClipping: true, scale: 1.5 },
			gojs(go.Shape, "Circle",{ width: 55, strokeWidth: 0 }),
			gojs(go.Picture, { name: 'Picture', width: 55, height: 55},
			new go.Binding("source", "doneUser", findUser))
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
    
    myDiagram.toolManager.linkingTool.temporaryLink.routing = go.Link.Orthogonal;
    myDiagram.toolManager.relinkingTool.temporaryLink.routing = go.Link.Orthogonal;
    myDiagram.model = gojs(go.GraphLinksModel, { linkLabelKeysProperty: "labelKeys","linkFromPortIdProperty": "fromPort", "linkToPortIdProperty": "toPort"});
    myDiagram.toolManager.linkingTool.archetypeLabelNodeData = { category: "LinkLabel",key: "L1", lineDef: {} };
    load();
    myDiagram.zoomToFit();
    setTimeout(function(){
    	initTokens();
    	createActionTable2();
    },1000);
    //loop();
});

function load() {
// for(var i = 0; i < jsonData.nodeDataArray.length; i++) {
//		alert(JsonToStr(jsonData.nodeDataArray[i]));
//	}
	myDiagram.model = go.Model.fromJson(jsonData);
};