
        var SOPPlugin;
        var lastClickLongitude;
        var lastClickLatitude;
        var lastRMouseUpLongitude;
        var lastRMouseUpLatitude;
        var lastLMouseUpLongitude;
        var lastLMouseUpLatitude;
        var lastRMouseDownLongitude;
        var lastRMouseDownLatitude;
        var lastAltitude;           //���콺�� Ŭ���� ������ ��

        //���콺 Ŭ���� ��ü�� ����
        var selectedObj;
        //���콺 Ŭ���� ��ü ���� �̺�Ʈ
        var lClickSelectedObj;
        var rClickSelectedObj

        var directTimerID;
        var directValue = 360;

        setTimeout(function() {
            sop.earth.createInstance('VworldMap', initCall, failureCall);
        }, 1);

        function getQuerystring(key, default_)
    	  {
        		if (default_==null) default_=""; 
        		key = key.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
        		var regex = new RegExp("[\\?&]"+key+"=([^&#]*)");
        		var qs = regex.exec(window.location.href);
        		if(qs == null)
        		   return default_;
        		else
        		   return qs[1];
    	  }

        function initCall(obj) {
            var company = getQuerystring("Company");
            if(hex_md5(company) != "27bf04637aece773c6b9ee11645c8152") return;

            SOPPlugin = obj;
            //SOPPlugin.getViewCamera().moveLonLat(127.0405,37.5016); //�ʱ� ���� ���Ÿ��� ���� ����
            SOPPlugin.getViewCamera().moveLonLat(127.092534179821, 37.6063659001898); //�߷���
            SOPPlugin.getViewCamera().setAltitude(7000);

            //Ŭ�� �̺�Ʈ �߰�
            window.sop.earth.addEventListener(SOPPlugin, "click", eventClickListenerCallback);

            //������ ���콺 �� �̺�Ʈ �߰�
            window.sop.earth.addEventListener(SOPPlugin, "rmouseup", eventRMouseUpListenerCallback);

            //���� ���콺 �� �̺�Ʈ �߰�
            window.sop.earth.addEventListener(SOPPlugin, "lmouseup", eventLMouseUpListenerCallback);

            //������ ���콺 �ٿ� �̺�Ʈ �߰�
            window.sop.earth.addEventListener(SOPPlugin, "rmousedown", eventRMouseDownListenerCallback);
            window.sop.earth.addEventListener(SOPPlugin, "mouseover", eventMouseOverListenerCallback);
            window.sop.earth.addEventListener(SOPPlugin, "mouseout", eventMouseOutListenerCallback);

            //���콺 �̵�
            window.sop.earth.addEventListener(SOPPlugin, "mousemove", eventMouseMoveListenerCallback);

            //���콺 ����Ŭ�� �̺�Ʈ
            window.sop.earth.addEventListener(SOPPlugin, "dblclick", eventMouseDoubleListenerCallback);
            
            //���� ��ó ���� ���߱�
            SOPPlugin.getOption().setMetaInfoVisible(sop.cons.enums.SOPVISIBLE_OFF);
        }

        //���� �ʱ�ȭ
        function InitializeMap() {
            try {
                if (SOPPlugin == null) {
                    return -1;
                }
                else return 1;
            }
            catch (e) { }
        }

        //Ŭ���� ��ǥ�� ���Ͽ� ��/�浵�� �����Ѵ�.
        function eventClickListenerCallback(e) {
            try {
                //var point = e.getMapCoordinate();
                //if (point == null) return;

                //lastClickLongitude = point.longitude;
                //lastClickLatitude = point.latitude;

                lastClickLongitude = e.lon;
                lastClickLatitude = e.lat;
                
                //���⼭ �� ���ϸ� UI���� �����̴� ���� �߻�
                //Ŭ�� ������ ���� �� �浵�� ���� ���ҷ��� GetAltitudeByPosition()�� �̿�
                //lastAltitude = SOPPlugin.getView().getTerrHeight(lastRMouseUpLongitude, lastRMouseUpLatitude);

                var markerName = "";
                var eventObject = "Map";

                if (e.getTarget() != null) {
                    if (e.getTarget().getType() == "SOPPoint") {
                        selectedObj = e.getTarget();
                        markerName = selectedObj.getId();
                        eventObject = "Marker";
                    }
                }

                window.external.ScriptCallback_MapClick(eventObject, e.lat, e.lon, markerName, lastAltitude);
            }
            catch (e) { }
        }

        //���콺 �� Ŭ�� �� ��ǥ�� ���Ͽ� ��/�浵�� �����Ѵ�.
        function eventRMouseUpListenerCallback(e) {
            try {
                //var point = e.getMapCoordinate();
                lastRMouseUpLongitude = e.lon;
                lastRMouseUpLatitude = e.lat;

                //���⼭ �� ���ϸ� UI���� �����̴� ���� �߻�
                //Ŭ�� ������ ���� �� �浵�� ���� ���ҷ��� GetAltitudeByPosition()�� �̿�
                //lastAltitude = SOPPlugin.getView().getTerrHeight(lastRMouseUpLongitude, lastRMouseUpLatitude);

                var markerName = "";
                var eventObject = "Map";

                //���콺 �� Ŭ�� �� �� ��Ŀ�� ���õǾ� �ִ��� Ȯ��
                if (e.getTarget() != null) {
                    if (e.getTarget().getType() == "SOPPoint") {
                        selectedObj = e.getTarget();
                        markerName = selectedObj.getId();
                        eventObject = "Marker";
                    }
                }

                window.external.ScriptCallback_MapContextmenu(eventObject, e.lat, e.lon, markerName, lastAltitude);
            }
            catch (e) { }
        }

        //���콺 �� Ŭ�� �� ��ǥ�� ���Ͽ� ��/�浵�� �����Ѵ�.
        function eventLMouseUpListenerCallback(e) {
            try {
            
                //var point = e.getMapCoordinate();
                lastLMouseUpLongitude = e.lon;
                lastLMouseUpLatitude = e.lat;

                //���⼭ �� ���ϸ� UI���� �����̴� ���� �߻�
                //Ŭ�� ������ ���� �� �浵�� ���� ���ҷ��� GetAltitudeByPosition()�� �̿�
                //lastAltitude = SOPPlugin.getView().getTerrHeight(lastLMouseUpLongitude, lastLMouseUpLatitude);

                var markerName = "";
                var eventObject = "Map";

                //���콺 �� Ŭ�� �� �� ��Ŀ�� ���õǾ� �ִ��� Ȯ��
                if (e.getTarget() != null) {
                    if (e.getTarget().getType() == "SOPPoint") {
                        selectedObj = e.getTarget();
                        markerName = selectedObj.getId();
                        eventObject = "Marker";
                    }
                }

                window.external.ScriptCallback_MapMouseup(eventObject, e.lat, e.lon, markerName, lastAltitude);
            }
            catch (e) { }
        }

        function eventRMouseDownListenerCallback(e) {
            try {
                //var point = e.getMapCoordinate();
                lastRMouseDownLongitude = e.lon;
                lastRMouseDownLatitude = e.lat;

                //���⼭ �� ���ϸ� UI���� �����̴� ���� �߻�
                //Ŭ�� ������ ���� �� �浵�� ���� ���ҷ��� GetAltitudeByPosition()�� �̿�
                //lastAltitude = SOPPlugin.getView().getTerrHeight(lastRMouseUpLongitude, lastRMouseUpLatitude);
            }
            catch (e) { }
        }
        
        function eventMouseOverListenerCallback(e) {
            try {
                if (e.getTarget() != null) {
                    if (e.getTarget().getType() == "SOPPoint") {
                        window.external.ScriptCallback_MapMouseOver("Marker", e.lat, e.lon, e.getTarget().getId());
                    }
                }
                else window.external.ScriptCallback_MapMouseOver("Map", e.lat, e.lon, "");
            }
            catch (e) { }
        }
        
        function eventMouseOutListenerCallback(e) {
            try {
                var markerName = "";
                var eventObject = "Map";
                if (e.getTarget() != null) {
                    if (e.getTarget().getType() == "SOPPoint") {
                        selectedObj = e.getTarget();
                        markerName = selectedObj.getId();
                        eventObject = "Marker";
                    }
                }
                window.external.ScriptCallback_MapMouseOut(eventObject, e.lat, e.lon, markerName);
            }
            catch (e) { }
        }
        
        function eventMouseMoveListenerCallback(e) {
            try {
                //window.external.ScriptCallback_MapMousemove(e.lat, e.lon);
                window.external.ScriptCallback_MapMousemove("Map", e.lat, e.lon, "", 0/*��*/);
            }
            catch (e) { }
        }
        
        function eventMouseDoubleListenerCallback(e) {
            try {
                //var point = e.getMapCoordinate();
                lastLMouseUpLongitude = e.lon;
                lastLMouseUpLatitude = e.lat;

                //���⼭ �� ���ϸ� UI���� �����̴� ���� �߻�
                //Ŭ�� ������ ���� �� �浵�� ���� ���ҷ��� GetAltitudeByPosition()�� �̿�
                //lastAltitude = SOPPlugin.getView().getTerrHeight(lastLMouseUpLongitude, lastLMouseUpLatitude);

                var markerName = "";
                var eventObject = "Map";

                //���콺 �� Ŭ�� �� �� ��Ŀ�� ���õǾ� �ִ��� Ȯ��
                if (e.getTarget() != null) {
                    if (e.getTarget().getType() == "SOPPoint") {
                        selectedObj = e.getTarget();
                        //alert(selectedObj.getId());

                        markerName = selectedObj.getId();
                        eventObject = "Marker";
                    }
                }

                window.external.ScriptCallback_MapDblclick(eventObject, e.lat, e.lon, markerName, lastAltitude);
            }
            catch (e) { }
        }

        //��ġ ID, ��Ŀ �̸�, ���浵, terrHeight: ��ġ ����(��)
        function AddMarker(deviceID, markerName, lon, lat, altitide, markerIconURL, widthSize, heightSize) {
            try {
                if (SOPPlugin == null) return -1;

                var vec3_1 = SOPPlugin.createVec3();
                vec3_1.set(lon, lat, altitide);   //���� ��Ȯ�ϰ� �Է����� ������ ������ �����϶� ���� ������

                var vecarray = SOPPlugin.createVec3Array();
                vecarray.push(vec3_1);
                var va = vecarray

                //�Է����� ���� SOPVec3��ü�� ������Ƽ�� ����Ǹ�, ����� SOPVec3��ü�� SOPVec3Array��ü���� ����Ʈ�� �����մϴ�.
                //���� �Է��� �� ù��° �Է��� ������ ��ǥ�� �����մϴ�.
                pt = va.get(0);
                var poi, symbolizdPoi;
                var objId = deviceID;

                // Placemark ��ü�� �����մϴ�.
                poi = SOPPlugin.createPoint(objId);

                // ������ Polygon��ü�� �Է����� �����մϴ�
                poi.Set(pt)

                //Polygon ��ü�� ��Ÿ���� �����մϴ�.
                //��Ÿ�� ������ ���� �ش� ��ü�� �ִ� SOPStyle��ü�� ��ȯ�޾� ��Ÿ���� �����մϴ�.
                //Placemark�� �������� SOPStyle��ü���� SOPIcon��ü�� ��ȯ�޾�, SOPIcon��ü�� �������̹����� �����γ� URL�� �Է��� �� 
                //�Է��� SOPIcon��ü�� SOPStyle��ü�� �����Ͽ� �����մϴ�.
                var sym = poi.getSymbol();
                var icon = sym.getIcon();

                icon.setNormalIcon(markerIconURL);  //TEST URL http://vworld.kr/images/op02/map_point.png

                sym.setIcon(icon);
                poi.setSymbol(sym);

                //Placemark�� �Ʒ��� ǥ���� �ؽ�Ʈ�� �����մϴ�.
                poi.setName(markerName);

                //������ Placemark�� �����մϴ�.
                SOPPlugin.getView().addChild(poi, 8);
                SOPPlugin.getView().setWorkMode(sop.cons.mouseState.SOPMOUSE_MOVEGRAB);
                //window.sop.earth.addEventListener(poi, "mouseover", Event_SOPBalloon);    //����ó�� ��� ����
            }
            catch (e) { }
        }

        function Event_SOPBalloon(event) {
            try {
                if (SOPPlugin != null) {
                    var targetName = event.getTarget().getId();
                    SOPPlugin.closeBalloon();
                    var balloon = SOPPlugin.createHtmlBalloon();
                    balloon.setTarget(event.getTarget());
                    balloon.setMaxWidth(150);
                    balloon.setMaxHeight(20);
                    balloon.setMinWidth(150);
                    balloon.setMinHeight(20);
                    balloon.setCloseButton(true);
                    balloon.setHtmlString(targetName);
                    balloon.setWidth_(150);
                    balloon.setHeight_(20);
                    balloon.show_(true);
                    SOPPlugin.setBalloon(balloon, true);
                }
            }
            catch (e) { }
        }

        //���콺 ������ Ŭ�� �� �̺�Ʈ �߻��� ������Ʈ�� ID
        function GetSelectedID() {
            try {
                if (selectedObj != null) {
                    rClickSelectedObj = "";
                    lClickSelectedObj = "";

                    return selectedObj.getId();
                }
            }
            catch (e) { }
        }

        //���õ� ��Ŀ ����
        function RemoveMarker() {
            try {
                if (SOPPlugin == null || selectedObj == null) return;
                if (selectedObj) {
                    SOPPlugin.getUserLayer().removeAtObject(selectedObj);
                    SOPPlugin.getView().MapRender();
                }
            }
            catch (e) { }
        }

        //Ư�� ��Ŀ ����
        function RemoveMarkerAtID(markerID) {
            try {
                if (SOPPlugin == null) return;

                var SOPObject = SOPPlugin.getUserLayer().keyAtObject(markerID);
                if (SOPPlugin.getUserLayer().keyAtObject(markerID) != null) {
                    SOPPlugin.getUserLayer().removeAtID(markerID);
                }
            }
            catch (e) { }
        }

        //��� ��Ŀ ����
        function RemoveAllMarker() {
            try {
                if (SOPPlugin == null) return;
                SOPPlugin.getUserLayer().removeAll();
            }
            catch (e) { }
        }

        //��Ŀ�� Visible ���� ����
        function SetMarkerVisible(markerID, isVisible) {
            try {
                if (SOPPlugin == null) return;

                if (SOPPlugin.getUserLayer().keyAtObject(markerID) != null) {
                    if (isVisible == true) SOPPlugin.getUserLayer().keyAtObject(markerID).setVisible(SOPPlugin.SOPVISIBLE_ON);
                    else SOPPlugin.getUserLayer().keyAtObject(markerID).setVisible(SOPPlugin.SOPVISIBLE_OFF);
                }
            }
            catch (e) { }
        }

        //���̾� Visible ���� ����
        function SetLayerVisible(name, visibility) {
            try {
                /*
                �ǹ� : facility_build
                ���� : facility_bridge 
                �ֿ�ü� ��Ī : poi_base 
                ���� �� ���νü��� ��Ī : poi_road 
                ���� �� ����������Ī : poi_bound 
                ����: poi_jibun 
                ����(���, ������) : hybrid_road 
                ���� �� ������� : hybrid_bound 
                ������ : hybrid_jijukline 
                ���ε� : bill_tree 
                */

                if (SOPPlugin != null) {
                    if (name == "") name = 'hybrid_road';

                    var str = "";
                    var SOPLayerList = SOPPlugin.getLayerList();
                    var vis = SOPLayerList.getVisible(name);
                    if (visibility == true) {
                        vis = SOPPlugin.SOPVISIBLE_ON;
                    }
                    else {
                        vis = SOPPlugin.SOPVISIBLE_OFF;
                    }

                    SOPLayerList.setVisible(name, vis);
                }
            }
            catch (e) { }
        }

        //���� �ֺ� ��� ���� ����
        function StartGroundLandscape() {
            try {
                if (SOPPlugin == null) return;
                var analysis = SOPPlugin.getAnalysis();
                analysis.startGroundLandscape();
            }
            catch (e) { }
        }

        //�ǹ� �ֺ� ��� ���� ����
        function StartBuildLandscape() {
            try {
                if (SOPPlugin == null) return;
                var analysis = SOPPlugin.getAnalysis();
                analysis.startBuildLandscape();
            }
            catch (e) { }
        }

        //�ǹ� �ֺ� ��� ���� ���� ����
        function SetBuildLandscapeMode(mode) {
            try {
                if (SOPPlugin == null) return;
                var analysis = SOPPlugin.getAnalysis();
                analysis.setBuildLandscapeMode(mode);
            }
            catch (e) { }
        }

        //���� �ֺ� ��� ���� ���� ����
        function SetGroundLandscapeMode(mode) {
            try {
                if (SOPPlugin == null) return;
                var analysis = SOPPlugin.getAnalysis();
                analysis.setGroundLandscapeMode(mode);
            }
            catch (e) { }
        }

        function EventRClickDown() {
            var r = rClickDown;
            rClickDown = "";
            return r;
        }
        //C#���� �������� ���� �Լ�
        function getClickLongitude() {
            return lastClickLongitude;
        }
        //C#���� �������� ���� �Լ�
        function getClickLatitude() {
            return lastClickLatitude;
        }
        //C#���� ���콺 ������ �� �������� ���� �Լ�
        function getRClickUpLongitude() {
            return lastRMouseUpLongitude;
        }
        //C#���� ���콺 ������ �� �������� ���� �Լ�
        function getRClickUpLatitude() {
            return lastRMouseUpLatitude;
        }

        //C#���� ���콺 ���� �� �������� ���� �Լ�
        function getLClickUpLongitude() {
            return lastLMouseUpLongitude;
        }
        //C#���� ���콺 ���� �� �������� ���� �Լ�
        function getLClickUpLatitude() {
            return lastLMouseUpLatitude;
        }

        //C#���� ���콺 ������ Ŭ���� �������� ���� �Լ�
        function getRClickDownLongitude() {
            return lastRMouseDownLongitude;
        }

        //C#���� ���콺 ������ Ŭ���� �������� ���� �Լ�
        function getRClickDownLatitude() {
            return lastRMouseDownLatitude;
        }

        function getTerrHeightOfMouseClick() {
            return lastAltitude;
        }

        function failureCall(msg) {
            alert(msg);
        }

        function Resize(width, height) {
            try {
                if (SOPPlugin == null) return;
                SOPPlugin.width = width;
                SOPPlugin.height = height
            }
            catch (e) { }
        }

        function getCenter() {
            try {
                if (SOPPlugin == null) return null;

                var SOPVec3 = SOPPlugin.getViewCamera().getCenterPoint();

                return SOPVec3.latitude + "," + SOPVec3.longitude;
            }
            catch (e) { }
        }

        //��ġ �̵�
        function MoveLonLat(lon, lat) {
            try {
                if (SOPPlugin != null)
                    SOPPlugin.getViewCamera().moveLonLat(lon, lat);
            }
            catch (e) { }
        }

        //�� ����
        function SetAltitude(altitude) {
            try {
                if (SOPPlugin != null) {
                    var SOPCamera = SOPPlugin.getViewCamera();
                    SOPCamera.setAltitude(altitude); //ī�޶� �� ����
                }
            }
            catch (e) { }
        }

        //�� ��������
        function GetAltitude() {
            try {
                if (SOPPlugin != null) {
                    var SOPCamera = SOPPlugin.getViewCamera();
                    return SOPCamera.getAltitude();
                }
            }
            catch (e) { }
        }
        
        //�� �浵�� �� ��������
        function GetAltitudeByPosition(lon, lat) {
            try {
                if (SOPPlugin != null) {
                    return SOPPlugin.getView().getTerrHeight(lon, lat);
                }
            }
            catch (e) { }
        }

        //ȸ���� ��������
        function GetDirect() {
            try {
                if (SOPPlugin != null) {
                    var SOPCamera = SOPPlugin.getViewCamera();
                    return SOPCamera.getDirect();
                }
            }
            catch (e) { }
        }

        //���� ����
        function SetTilt(tilt) {
            try {
                if (SOPPlugin != null) {
                    var SOPCamera = SOPPlugin.getViewCamera();
                    SOPCamera.setTilt(tilt); //ī�޶� ��������
                }
            }
            catch (e) { }
        }

        //���� ��������
        function GetTilt() {
            try {
                if (SOPPlugin != null) {
                    var SOPCamera = SOPPlugin.getViewCamera();
                    return SOPCamera.getTilt();
                }
            }
            catch (e) { }
        }

        //���� ����
        function setDirect(direct) {
            try {
                if (SOPPlugin != null) {
                    var SOPCamera = SOPPlugin.getViewCamera();
                    SOPCamera.setDirect(direct); //ī�޶� ����(ȸ��)����
                }
            }
            catch (e) { }
        }

        //���� �ٶ󺸱�
        function ViewNorth() {
            try {
                if (SOPPlugin != null) {
                    var SOPCamera = SOPPlugin.getViewCamera();
                    return SOPCamera.viewNorth();
                }
            }
            catch (e) { }
        }

        //����Ʈ
        function Print() {
            try {
                if (SOPPlugin != null) {
                    var SOPUtil = SOPPlugin.getUtil();
                    SOPUtil.printScreen();
                }
            }
            catch (e) { }
        }

        //�̹��� ����
        function SaveImage(fileName) {
            try {
                if (SOPPlugin != null) {
                    var SOPUtil = SOPPlugin.getUtil();
                    SOPUtil.saveScreenImg(fileName);
                }
            }
            catch (e) { }
        }

        function setDirectTimer(interval) {
            try {
                directValue = GetDirect();
                directTimerID = setInterval(DirectTimer, interval);
            }
            catch (e) { }
        }

        function DirectTimer() {
            try {
                if (directValue == 1) directValue = 360;
                directValue = directValue - 1;
                SetDirect(directValue);
            }
            catch (e) { }
        }

        function setDirectTimerStop() {
            clearInterval(directTimerID);
        }

        //�Ÿ�����
        function DistanceMeasure() {
            try {
                /*if (SOPPlugin != null) 
                {
                SOPPlugin.getView().setWorkMode(sop.cons.mouseState.SOPMOUSE_ANAAREA);
                }*/

                if (SOPPlugin != null && SOPPlugin.getView().getWorkMode() != 81) {
                    SOPPlugin.getView().setWorkMode(81);
                }
            }
            catch (e) { }
        }

        //���� ����
        function AreaMeasure() {
            try {
                if (SOPPlugin != null && SOPPlugin.getView().getWorkMode() != sop.cons.mouseState.SOPMOUSE_ANAAREA) {
                    SOPPlugin.getView().setWorkMode(sop.cons.mouseState.SOPMOUSE_ANAAREA);
                }
            }
            catch (e) { }
        }

        //�Ÿ�/�������� ����
        function StopMeasure() {
            try {
                /*if (SOPPlugin != null) 
                {
                SOPPlugin.getView().setWorkMode(sop.cons.mouseState.SOPMOUSE_MOVEGRAB);
                
                SOPPlugin.getAnalysis().clearArea();
                }*/

                if (SOPPlugin != null) {
                    SOPPlugin.getAnalysis().clearArea();
                    SOPPlugin.getAnalysis().clearDist();
                    SOPPlugin.getView().setWorkMode(1);
                }
            }
            catch (e) { }
        }