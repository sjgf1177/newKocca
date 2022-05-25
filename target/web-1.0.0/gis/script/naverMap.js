        init(37.5010226, 127.0396037); // ���� ��ġ

        var isVisibleMarkerInfo = 0; //��Ŀ�� Visible ���¸� ������
        var EventLatLng = "0,0"; // �̺�Ʈ ��ǥ��
        var EventKey = "";  // �̺�Ʈ Ű
        var EventObject = ""; // �̺�Ʈ ���� (Marker,Polyline,Polygon,Circle,InfoWindow...)

        var mapInfoTestWindow = new nhn.api.map.InfoWindow(); // - info window ����
        mapInfoTestWindow.setVisible(false); // - infowindow ǥ�� ���� ����.
        oMap.addOverlay(mapInfoTestWindow);  // - ������ �߰�.	

        //���콺 ������ ����ϴ� ��
        var oLabel = new nhn.api.map.MarkerLabel(); // - ��Ŀ �� ����.
        oMap.addOverlay(oLabel); // - ��Ŀ �� ������ �߰�. �⺻�� ���� ������ �ʴ�

        //Ư�� ��Ŀ�� ���� ���� �׻� �����ְų� �������� ���� ��쿡 ����ϴ� ��
        var oLabels = new Array();     // ��Ŀ ������

        var oMarkers = new Array();     // ��Ŀ
        var oPolylines = new Array(); // ����
        var oPolygons = new Array(); // ����
        var oCircles = new Array(); 	// ��
        var oInfoWindows = new Array();  // ����â
        
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
    	  
        function init(Lat, Lng) {
            var company = getQuerystring("Company");
            if(hex_md5(company) != "27bf04637aece773c6b9ee11645c8152") return;

            var oPoint;
            if (Lat > 1000) {
                oPoint = new nhn.api.map.TM128(Lat, Lng);
            } else {
                oPoint = new nhn.api.map.LatLng(Lat, Lng);
            }

            nhn.api.map.setDefaultPoint('LatLng');
            oMap = new nhn.api.map.Map('testMap', {
                point: oPoint,
                zoom: 10,
                enableWheelZoom: true,
                enableDragPan: true,
                enableDblClickZoom: false,
                mapMode: 0,
                activateTrafficMap: false,
                activateBicycleMap: false,
                minMaxLevel: [1, 14],
                size: new nhn.api.map.Size(640, 480),
                detectCoveredMarker: false
            });

            //themeMapButton = new nhn.api.map.ThemeMapBtn(); // - ���������� ��ư ����
            //themeMapButton.setPosition({top:10, left:10}); // - ���������� ��ư ��ġ ����
            //oMap.addControl(themeMapButton);

            var mapZoom = new nhn.api.map.ZoomControl(); // - �� ��Ʈ�� ����
            mapZoom.setPosition({ right: 15, top: 5 }); // - �� ��Ʈ�� ��ġ ����.
            mapZoom.setEffectOptions(true);
            oMap.addControl(mapZoom);

            //mapTypeChangeButton = new nhn.api.map.MapTypeBtn(); // - ���� Ÿ�� ��ư ����
            //mapTypeChangeButton.setPosition({ right: 15, top: 5 }); // - ���� Ÿ�� ��ư ��ġ ����
            //oMap.addControl(mapTypeChangeButton);

            //var trafficButton = new nhn.api.map.TrafficMapBtn(); // - �ǽð� �������� ��ư ����
            //trafficButton.setPosition({ right: 15, top: 5 }); // - �ǽð� �������� ��ư ��ġ ����
            //oMap.addControl(trafficButton);                     // - �ǽð� �������� ��ư�� ������ �߰�

            //var oTrafficGuide = new nhn.api.map.TrafficGuide(); // - ���� ���� ����
            //oTrafficGuide.setPosition({ bottom: 20, left: 3 });  // - ���� ���� ��ġ ����.
            //oMap.addControl(oTrafficGuide); // - ���� ���ʸ� ������ �߰�.
            
            var gLabel = new nhn.api.map.GroupOverlay();   ///�������� �׷�Ⱥ��̰�
            gLabel.setVisible(false);
        }

        function setCenter(Lat, Lng) {
            try
            {
                var oPoint;
                if (Lat > 1000) {
                    oPoint = new nhn.api.map.TM128(Lat, Lng);
                }
                else {
                    oPoint = new nhn.api.map.LatLng(Lat, Lng);
                }
                oMap.setCenter(oPoint);
            }
            catch(e) { }
        }

        function getCenter() {
            var pos = oMap.getCenter();
            return pos.getY() + "," + pos.getX();
        }

        function Resize(width, height) {
            var nSize = new nhn.api.map.Size(width, height);
            oMap.setSize(nSize);
        }

        function setLevel(Level) {
            oMap.setLevel(Level);
        }

        function getLevel() {
            return oMap.getLevel();
        }

        function activateTrafficMap(flag) {
            oMap.activateTrafficMap(flag);
        }

        function setMapMode(mapMode) {
            oMap.setMapMode(mapMode);
        }

        function setPolygon(iKey, MapLines, strokeColor, strokeWidth, strokeOpacity, strokeStyle, fillColor, fillOpacity) {
            try
            {
                var sLCnt = oPolygons.length;
    
                // ��ǥ�� �迭�� ����
                var sMap = MapLines.split(";");
                var sLine = new Array();
                for (i = 0; i < sMap.length; i++) {
                    var sGPS = sMap[i].split(",");
                    if (sGPS[0] != 0 && sGPS[1] != 0) {
                        sLine[i] = new nhn.api.map.LatLng(sGPS[0], sGPS[1]);
                    }
                }
    
                // �ߺ� Ű Ȯ��
                var KeyChk = -1;
                if (sLCnt > 0) {
                    for (var i in oPolygons) {
                        if (oPolygons[i] != null && oPolygons[i].Key == iKey) { // ������ Ű�� ������ ��ġ �̵��� ��!
                            KeyChk = i;
                            break;
                        }
                    }
                }
    
                if (KeyChk > -1) {
                    oPolygons[KeyChk].Polygon.setPoints(sLine);
                    //oPolygons[KeyChk].Polygon.setStyle("strokeColor", strokeColor);
                    //oPolygons[KeyChk].Polygon.setStyle("strokeWidth", strokeWidth);
                    //oPolygons[KeyChk].Polygon.setStyle("strokeOpacity", strokeOpacity);
                    //oPolygons[KeyChk].Polygon.setStyle("strokeStyle", strokeStyle);
                    //oPolygons[KeyChk].Polygon.setStyle("fillColor", fillColor);
                    //oPolygons[KeyChk].Polygon.setStyle("fillOpacity", fillOpacity);
                    ////oMap.addOverlay(oPolygons[KeyChk].Polygon);
                }
                else {
                    var tPolygon = new nhn.api.map.Polygon(sLine);
                    var sObj = new Object();
                    sObj.Key = iKey;
                    sObj.Polygon = tPolygon;
    
                    oPolygons[sLCnt] = sObj;
                    oPolygons[sLCnt].Polygon.setStyle("strokeColor", strokeColor);
                    oPolygons[sLCnt].Polygon.setStyle("strokeWidth", strokeWidth);
                    oPolygons[sLCnt].Polygon.setStyle("strokeOpacity", strokeOpacity);
                    oPolygons[sLCnt].Polygon.setStyle("strokeStyle", strokeStyle);
                    oPolygons[sLCnt].Polygon.setStyle("fillColor", fillColor);
                    oPolygons[sLCnt].Polygon.setStyle("fillOpacity", fillOpacity);
                    oMap.addOverlay(oPolygons[sLCnt].Polygon);
                }
            }
            catch(e) { }
        }


        function delPolygon(iKey) {
            try
            {
                if (iKey == "") {
                    for (var i in oPolygons) {
                        if (oPolygons[i] != null && oPolygons[i].Polygon != null) {
                            oMap.removeOverlay(oPolygons[i].Polygon);
                            //oPolygons[i] = null;
                            var result = oPolygons.splice(i, 1);
                            result = null;
                        }
                    }
                }
                else {
                    for (var j in oPolygons) {
                        if (oPolygons[j] != null && oPolygons[j].Key == iKey) 
                        {
                            oMap.removeOverlay(oPolygons[j].Polygon);
                            //oPolygons[j] = null;
                            var result = oPolygons.splice(j, 1);
                            result = null;
                            break;
                        }
                    }
                }
            }
            catch(e) { }
        }

        //�� ���̸� m(����)������ ��ȯ
        function getPolygonLength(iKey) {
            try
            {
                var KeyChk = -1;
                for (var i in oPolygons) {
                    if (oPolygons[i] != null && oPolygons[i].Key == iKey) {
                        KeyChk = i;
                        break;
                    }
                }
    
                if (KeyChk > -1) {
                    return oPolygons[KeyChk].Polygon.getLength();
                }
            }
            catch(e) { }
            
            return 0;
        }

        //������ ���̸� ��(��������)������ ��ȯ
        function getPolygonArea(iKey) {
            try
            {
                var KeyChk = -1;
                for (var i in oPolygons) {
                    if (oPolygons[i] != null && oPolygons[i].Key == iKey) {
                        KeyChk = i;
                        break;
                    }
                }
    
                if (KeyChk > -1) {
                    return oPolygons[KeyChk].Polygon.getSize();
                }
            }
            catch(e) { }
            
            return 0;
        }

        function setLine(iKey, MapLines, strokeColor, strokeWidth, strokeOpacity, strokeStyle) {
            try
            {
                var sLCnt = oPolylines.length;
    
                // ��ǥ�� �迭�� ����
                var sMap = MapLines.split(";");
                var sLine = new Array();
                for (i = 0; i < sMap.length; i++) {
                    var sGPS = sMap[i].split(",");
                    sLine[i] = new nhn.api.map.LatLng(sGPS[0], sGPS[1]);
                }
    
                // �ߺ� Ű Ȯ��
                var KeyChk = -1;
                if (sLCnt > 0) {
                    for (var i in oPolylines) {
                        if (oPolylines[i] != null && oPolylines[i].Key == iKey) {
                            // ������ Ű�� ������ ��ġ �̵��� ��!
                            KeyChk = i;
                            break;
                        }
                    }
                }
    
                if (KeyChk > -1) {
                    oPolylines[KeyChk].Polyline.setPoints(sLine);
                    //oPolylines[KeyChk].Polyline.setStyle("strokeColor", strokeColor);
                    //oPolylines[KeyChk].Polyline.setStyle("strokeWidth", strokeWidth);
                    //oPolylines[KeyChk].Polyline.setStyle("strokeOpacity", strokeOpacity);
                    //oPolylines[KeyChk].Polyline.setStyle("strokeStyle", strokeStyle);
                    ////oMap.addOverlay(oPolylines[KeyChk].Polyline);
                }
                else {
                    var tPolyline = new nhn.api.map.Polyline(sLine);
                    var sObj = new Object();
                    sObj.Key = iKey;
                    sObj.Polyline = tPolyline;
    
                    oPolylines[sLCnt] = sObj; // �迭�� ��ũ �߰�
                    oPolylines[sLCnt].Polyline.setStyle("strokeColor", strokeColor);
                    oPolylines[sLCnt].Polyline.setStyle("strokeWidth", strokeWidth);
                    oPolylines[sLCnt].Polyline.setStyle("strokeOpacity", strokeOpacity);
                    oPolylines[sLCnt].Polyline.setStyle("strokeStyle", strokeStyle);
                    oMap.addOverlay(oPolylines[sLCnt].Polyline);
                }
            }
            catch(e) { }
        }


        // ������ ���� ����
        function delLine(iKey) {
            try
            {
                if (iKey == "") {
                    for (var i in oPolylines) {
                        if (oPolylines[i] != null && oPolylines[i].Polyline != null) {
                            oMap.removeOverlay(oPolylines[i].Polyline); //  oPolylines[i].Polyline.setStyle("strokeOpacity",0);
                            //oPolylines[i] = null;
                            var result = oPolylines.splice(i, 1);
                            result = null;
                        }
                    }
                }
                else {
                    for (var j in oPolylines) {
                        if (oPolylines[j] != null && oPolylines[j].Key == iKey) {
                            if (oPolylines[j].Polyline != null) {
                                oMap.removeOverlay(oPolylines[j].Polyline); //oPolylines[j].Polyline.setStyle("strokeOpacity",0);
                                //oPolylines[j] = null;
                                var result = oPolylines.splice(j, 1);
                                result = null;
                            }
                            break;
                        }
                    }
                }
            }
            catch(e) { }
        }

        function setInfoWindow(iKey, Lat, Lng, Msg) {
            try
            {
                var cPoint;
                if (Lat > 1000) {
                    cPoint = new nhn.api.map.TM128(Lat, Lng);
                }
                else {
                    cPoint = new nhn.api.map.LatLng(Lat, Lng);
                }
    
                // ��ϵ� Ű�� �ִ��� Ȯ��
                var sMCnt = oInfoWindows.length;
                var KeyChk = -1;
                if (sMCnt > 0) {
                    for (var i in oInfoWindows) {
                        if (oInfoWindows[i] != null && oInfoWindows[i].Key == iKey) {
                            // ������ Ű�� ������ ��ġ �̵��� ��!
                            KeyChk = i;
                            break;
                        }
                    }
                }
    
                if (KeyChk > -1) {
                    oInfoWindows[KeyChk].InfoWindow.setPoint(cPoint);
                    oInfoWindows[KeyChk].InfoWindow.setContent(Msg);
                    oInfoWindows[KeyChk].InfoWindow.setVisible(true);
                }
                else {
                    var tInfoWindow = new nhn.api.map.InfoWindow();
                    tInfoWindow.setPoint(cPoint);
                    tInfoWindow.setContent(Msg);
                    tInfoWindow.autoPosition(10);
                    tInfoWindow.setVisible(true);
                    tInfoWindow.setOpacity(0.6);
                    //tInfoWindow.setPosition({ bottom: 20, left: 3 });
                    tInfoWindow.setPosition({ bottom: 5, left: 5 });
    
                    var sObj = new Object();
                    sObj.Key = iKey;
                    sObj.InfoWindow = tInfoWindow;
                    oInfoWindows[sMCnt] = sObj; // �迭�� ��ũ �߰�
    
                    oMap.addOverlay(oInfoWindows[sMCnt].InfoWindow); // ��ũ�� ������ �߰�
                }
            }
            catch(e) { }
        }

        function delInfoWindow(iKey) {
            try
            {
                if (iKey == "") {
                    for (var i in oInfoWindows) {
                        if (oInfoWindows[i] != null && oInfoWindows[i].InfoWindow != null) {
                            oInfoWindows[i].InfoWindow.setVisible(false);
                            //oInfoWindows[i] = null;
                            var result = oInfoWindows.splice(i, 1);
                            result = null;
                        }
                    }
                }
                else {
                    for (var j in oInfoWindows) 
                    {
                        if (oInfoWindows[j] != null && oInfoWindows[j].Key == iKey) 
                        {
                            if (oInfoWindows[j].InfoWindow != null) 
                            {
                                oInfoWindows[j].InfoWindow.setVisible(false);
                                //oInfoWindows[j] = null;
                                var result = oInfoWindows.splice(j, 1);
                                result = null;
                            }
                            break;
                        }
                    }
                }
            }
            catch(e) { }
        }

        function setCircle(iKey, Lat, Lng, radius, strokeColor, strokeWidth, strokeOpacity, fillColor, fillOpacity) {
            try
            {
                var cPoint;
                if (Lat > 1000) {
                    cPoint = new nhn.api.map.TM128(Lat, Lng);
                }
                else {
                    cPoint = new nhn.api.map.LatLng(Lat, Lng);
                }
    
                // ��ϵ� Ű�� �ִ��� Ȯ��
                var sMCnt = oCircles.length;
                var KeyChk = -1;
                if (sMCnt > 0) {
                    for (var i in oCircles) {
                        if (oCircles[i] != null && oCircles[i].Key == iKey) {
                            // ������ Ű�� ������ ��ġ �̵��� ��!
                            KeyChk = i;
                            break;
                        }
                    }
                }
    
                if (KeyChk > -1) {
                    oCircles[KeyChk].Circle.setCenterPoint(cPoint);
                    oCircles[KeyChk].Circle.setRadius(radius);
                    //oCircles[KeyChk].Circle.setStyle("strokeColor", strokeColor);
                    //oCircles[KeyChk].Circle.setStyle("strokeWidth", strokeWidth);
                    //oCircles[KeyChk].Circle.setStyle("strokeOpacity", strokeOpacity);
                    //oCircles[KeyChk].Circle.setStyle("fillColor", fillColor); // ��ũ�� ��ġ �̵�
                    //oCircles[KeyChk].Circle.setStyle("fillOpacity", fillOpacity); // ��ũ�� ��ġ �̵�
                    ////oMap.addOverlay(oCircles[KeyChk].Circle); // ��ũ�� ������ �߰�
                }
                else {
                    var oCircle = new nhn.api.map.Circle();
    
                    oCircle.setCenterPoint(cPoint); // - circle �� �߽����� �����Ѵ�.
                    oCircle.setRadius(radius); // - circle �� �������� �����ϸ� ������ meter�̴�.
    
                    oCircle.setStyle("strokeColor", strokeColor); // - ���� ������ ������.
                    oCircle.setStyle("strokeWidth", strokeWidth); // - ���� �β��� ������.
                    oCircle.setStyle("strokeOpacity", strokeOpacity); // - ���� ������ ������.
                    oCircle.setStyle("fillColor", fillColor); // - ä��� ����. none �̸� �����ϰ� �ȴ�.
                    oCircle.setStyle("fillOpacity", fillOpacity);
    
                    var sObj = new Object();
                    sObj.Key = iKey;
                    sObj.Circle = oCircle;
                    oCircles[sMCnt] = sObj; // �迭�� ��ũ �߰�
    
                    oMap.addOverlay(oCircles[sMCnt].Circle); // ��ũ�� ������ �߰�
                }
            }
            catch(e) { }
        }

        function delCircle(iKey) {
            try
            {
                if (iKey == "") {
                    for (var i in oCircles) {
                        if (oCircles[i] != null && oCircles[i].Circle != null) {
                            oMap.removeOverlay(oCircles[i].Circle);
                            //oCircles[i] = null;
                            var result = oCircles.splice(i, 1);
                            result = null;
                        }
                    }
                }
                else {
                    for (var j in oCircles) {
                        if (oCircles[j] != null && oCircles[j].Key == iKey) {
                            if (oCircles[j].Circle != null) {
                                oMap.removeOverlay(oCircles[j].Circle);
                                //oCircles[j] = null;
                                var result = oCircles.splice(j, 1);
                                result = null;
                            }
                            break;
                        }
                    }
                }
            }
            catch(e) { }
        }

        function setGISMarker(iKey, Lat, Lng, iMsg, markerURL, widthSize, heightSize) {
            try
            {
                if (Lat == null || Lng == null || Lat == "" || Lng == "" || Lat == 0 || Lng == 0) {
                    return;
                }
                var sMCnt = oMarkers.length;
    
                // ��ũ ��ġ
                var oPoint;
                if (Lat > 1000) {
                    oPoint = new nhn.api.map.TM128(Lat, Lng);
                }
                else {
                    oPoint = new nhn.api.map.LatLng(Lat, Lng);
                }
    
                // ��ϵ� Ű�� �ִ��� Ȯ��
                var KeyChk = -1;
                if (sMCnt > 0) {
                    for (var i in oMarkers) {
                        if (oMarkers[i] != null && oMarkers[i].Key == iKey) {
                            // ������ Ű�� ������ ��ġ �̵��� ��!
                            KeyChk = i;
                            break;
                        }
                    }
                }

                if (KeyChk > -1) {
                    oMarkers[KeyChk].Marker.setPoint(oPoint); // ��ũ�� ��ġ �̵�

                    var oOffset = new nhn.api.map.Size(8, 8);
                    var oIcon = new nhn.api.map.Icon(markerURL, new nhn.api.map.Size(widthSize, heightSize), oOffset = new nhn.api.map.Size(widthSize / 2, heightSize / 2));
                    oMarkers[KeyChk].Marker.setIcon(oIcon);
                }
                else {
                    // ��ũ �̹���
                    var oOffset = new nhn.api.map.Size(8, 8);
                    var oIcon = new nhn.api.map.Icon(markerURL, new nhn.api.map.Size(widthSize, heightSize), oOffset = new nhn.api.map.Size(widthSize / 2, heightSize / 2));
                
                    var oMarker = new nhn.api.map.Marker(oIcon, { title: iMsg });
    
                    var sObj = new Object();
                    sObj.Key = iKey;
                    sObj.Marker = oMarker;
                    oMarkers[sMCnt] = sObj; // �迭�� ��ũ �߰�
    
                    oMarkers[sMCnt].Marker.setPoint(oPoint);
                    oMap.addOverlay(oMarkers[sMCnt].Marker); // ��ũ�� ������ �߰�
    
                    if(iKey == "mapClick" || iKey == "����") return;
                    
                    //��Ŀ�� ���� �׻� ���̵��� �� ����
                    var oLabel1 = new nhn.api.map.MarkerLabel(); // - ��Ŀ �� ����
                    var mObj = new Object();
                    mObj.Key = iKey;
                    mObj.MarkerLabel = oLabel1;
                    oLabels[oLabels.length] = mObj;
                    oMap.addOverlay(oLabel1); // - ��Ŀ �� ������ �߰�. �⺻�� ���� ������ �ʴ� ���·� �߰���. 
                    oLabel1.setPosition(true, -20, -21)   //-10: �� oOffset�� width�� ��, -16: oOffset�� height
                    if (isVisibleMarkerInfo == 1) {
                        oLabel1.setVisible(true, oMarker); // ��Ŀ �� ���̱�
                    }
                    else oLabel1.setVisible(false);
                }
            }
            catch(e) { }
        }

        // ������ ��ũ ����
        function delMarker(iKey) {
            try
            {
                if (iKey == "") 
                {
                    for (var i in oMarkers) 
                    {
                        if (oMarkers[i].Marker != null) 
                        {
                            //oMarkers[i].Marker.setVisible(false);
                            
                            oMap.removeOverlay(oMarkers[j].Marker);
                            //oMarkers[i] = null;
                            var result = oMarkers.splice(i, 1);
                            result = null;
                        }
                    }
    
                    //��ϵ� �� ����
                    for (var labelCount in oLabels) 
                    {
                        if (oLabels[labelCount].MarkerLabel != null) {
                            //TODO: ���Ÿ� �ϴ� �ڹٽ�ũ��Ʈ���� ������
                            //oMap.removeOverlay(oLabels[labelCount].MarkerLabel);
    
                            //TODO: ���Ÿ� �ϴ� �ڹٽ�ũ��Ʈ���� ������
                            //oLabels[labelCount] = null;
                            //oLabels[labelCount].MarkerLabel.setVisible(false);
                            
                            oMap.removeOverlay(oLabels[labelCount].MarkerLabel);
                            //oLabels[labelCount] = null;
                            var result = oLabels.splice(labelCount, 1);
                            result = null;
                        }
                    }
                }
                else 
                {
                    for (var j in oMarkers) 
                    {
                        if (oMarkers[j] != null && oMarkers[j].Key == iKey) 
                        {
                            if (oMarkers[j].Marker != null) 
                            {
                                //oMarkers[j].Marker.setVisible(false);
                                
                                oMap.removeOverlay(oMarkers[j].Marker);
                                //oMarkers[j] = null;
                                var result = oMarkers.splice(j, 1);
                                result = null;
                                break;
                            }
                        }
                    }
    
                    //��ϵ� �� ����
                    for (var labelCount2 in oLabels) 
                    {
                        if (oLabels[labelCount2].Key != null && oLabels[labelCount2].Key == iKey) 
                        {
                            if (oLabels[labelCount2].MarkerLabel != null) 
                            {
                                //TODO: ���Ÿ� �ϴ� �ڹٽ�ũ��Ʈ���� ������
                                //oLabels[labelCount2] = null;
                                //oLabels[labelCount2].MarkerLabel.setVisible(false);
                                
                                oMap.removeOverlay(oLabels[labelCount2].MarkerLabel);
                                //oLabels[labelCount2] = null;
                                var result = oLabels.splice(labelCount2, 1);
                                result = null;
                            }
                            break;
                        }
                    }
                }
            }
            catch(e) { }
        }

        //��Ŀ Visible
        function VisibleMarker(visible, iKey) {
            try
            {
                // ��ϵ� Ű�� �ִ��� Ȯ��
                var KeyChk = -1;
                var sMCnt = oMarkers.length;
                if (sMCnt > 0) {
                    for (var i in oMarkers) {
                        if (oMarkers[i] != null && oMarkers[i].Key == iKey) {
                            KeyChk = i;
                            break;
                        }
                    }
                }
    
                if (KeyChk > -1) {
                    oMarkers[KeyChk].Marker.setVisible(visible);
                }
            }
            catch(e) { }
        }

        //��Ŀ �� Visible
        function VisibleMarkerInfo(visible, iKey) {
            try
            {
                isVisibleMarkerInfo = visible
    
                if (visible == 1) {
                    for (var i in oLabels) {
                        //���� ã��
                        if (oLabels[i].Key == iKey) {
                            for (var x in oMarkers) {
                                //��Ŀ�� ã��
                                if (oMarkers[x].Key == iKey) {
                                    if (oMarkers[x].Marker != null) oLabels[i].MarkerLabel.setVisible(true, oMarkers[x].Marker);
                                    return;
                                }
                            }
                        }
                    }
                }
                else {
                    for (var j in oLabels) {
                        if (oLabels[j].Key == iKey)
                            oLabels[j].MarkerLabel.setVisible(false);
                    }
    
                    oLabel.setVisible(false);
                }
            }
            catch(e) { }
        }

        function getTMtoWGS(MapX, MapY) {
            var oPoint = new nhn.api.map.TM128(MapX, MapY);
            return oPoint.toLatLng().toString();
        }

        function getWGStoTM(latDeg, longDeg) {
            var oPoint = new nhn.api.map.LatLng(latDeg, longDeg);
            return oPoint.toTM128().toString();
        }


        // �̺�Ʈ ó��

        /* ��Ŀ �̺�Ʈ ������ ��� �Ұ�.
        function EventMouseEnter()
        {
        var r = mouseenter;
        mouseenter = "";
        return r;
        }
        ��Ŀ �̺�Ʈ ������ ��� �Ұ�.
        function EventMouseLeave()
        {
        var r = mouseleave;
        mouseleave = "";
        return r;
        }
        */

        oMap.attach('click', function(oEvent) {
            try
            {
                setEventObject(oEvent) // �̺�Ʈ�� �߻��� ��ü
                setEventLatLng(oEvent) // �̺�Ʈ�� �߻��� ��ǥ ����
                setEventKey(oEvent); // �̺�Ʈ�� �߻��� Ű ����
                window.external.ScriptCallback_MapClick(EventObject, oEvent.point.getY(), oEvent.point.getX(), EventKey, oMap.getLevel()/*��*/);
            }
            catch(e) { }
        });

        oMap.attach('dblclick', function(oEvent) {
            try
            {
                setEventObject(oEvent) // �̺�Ʈ�� �߻��� ��ü
                setEventLatLng(oEvent) // �̺�Ʈ�� �߻��� ��ǥ ����
                setEventKey(oEvent); // �̺�Ʈ�� �߻��� Ű ����
                window.external.ScriptCallback_MapDblclick(EventObject, oEvent.point.getY(), oEvent.point.getX(), EventKey, oMap.getLevel()/*��*/);
            }
            catch(e) { }
        });

        oMap.attach('mousemove', function(oEvent) {
            try
            {
                setEventObject(oEvent) // �̺�Ʈ�� �߻��� ��ü
                setEventLatLng(oEvent) // �̺�Ʈ�� �߻��� ��ǥ ����
                setEventKey(oEvent); // �̺�Ʈ�� �߻��� Ű ����
                window.external.ScriptCallback_MapMousemove(EventObject, oEvent.point.getY(), oEvent.point.getX(), EventKey, 0/*��*/);
            }
            catch(e) { }
        });


        oMap.attach('contextmenu', function(oEvent) {
            try
            {
                setEventObject(oEvent) // �̺�Ʈ�� �߻��� ��ü
                setEventLatLng(oEvent) // �̺�Ʈ�� �߻��� ��ǥ ����
                setEventKey(oEvent); // �̺�Ʈ�� �߻��� Ű ����
                window.external.ScriptCallback_MapContextmenu(EventObject, oEvent.point.getY(), oEvent.point.getX(), EventKey, oMap.getLevel()/*��*/);
            }
            catch(e) { }
        });

        oMap.attach('mousewheel', function(oEvent) {
            try
            {
                setEventObject(oEvent) // �̺�Ʈ�� �߻��� ��ü
                setEventLatLng(oEvent) // �̺�Ʈ�� �߻��� ��ǥ ����
                setEventKey(oEvent); // �̺�Ʈ�� �߻��� Ű ����
                window.external.ScriptCallback_MapMousewheel(EventObject, oEvent.point.getY(), oEvent.point.getX(), EventKey, oMap.getLevel()/*��*/);
            }
            catch(e) { }
        });

        oMap.attach('mousedown', function(oEvent) {
            try
            {
                setEventObject(oEvent) // �̺�Ʈ�� �߻��� ��ü
                setEventLatLng(oEvent) // �̺�Ʈ�� �߻��� ��ǥ ����
                setEventKey(oEvent); // �̺�Ʈ�� �߻��� Ű ����
                window.external.ScriptCallback_MapMousedown(EventObject, oEvent.point.getY(), oEvent.point.getX(), EventKey, oMap.getLevel()/*��*/);
            }
            catch(e) { }
        });

        oMap.attach('mouseup', function(oEvent) {
            try
            {
                setEventObject(oEvent) // �̺�Ʈ�� �߻��� ��ü
                setEventLatLng(oEvent) // �̺�Ʈ�� �߻��� ��ǥ ����
                setEventKey(oEvent); // �̺�Ʈ�� �߻��� Ű ����
                window.external.ScriptCallback_MapMouseup(EventObject, oEvent.point.getY(), oEvent.point.getX(), EventKey, oMap.getLevel()/*��*/);
            }
            catch(e) { }
        });


        oMap.attach('mouseenter', function(oEvent) {
            try
            {
                if (isVisibleMarkerInfo == 1) return;
    
                var oTarget = oEvent.target;
                if (oTarget instanceof nhn.api.map.Marker) { //��Ŀ���� �ö� ������ Title ����
                    var oMarker = oTarget;
                    oLabel.setVisible(true, oMarker); //Ư�� ��Ŀ�� Title�� ����
                }
            }
            catch(e) { }
        });

        oMap.attach('mouseleave', function(oEvent) {
            try
            {
                if (isVisibleMarkerInfo == 1) return;
    
                var oTarget = oEvent.target;
                if (oTarget instanceof nhn.api.map.Marker) { // ��Ŀ���� ���� ������ Title ����
                    oLabel.setVisible(false); // ��� ��Ŀ�� ����
                }
            }
            catch(e) { }
        });

        function setEventObject(oEvent) {
            try
            {
                if (oEvent.target instanceof nhn.api.map.Map) EventObject = "Map";
                if (oEvent.target instanceof nhn.api.map.Marker) EventObject = "Marker";
                if (oEvent.target instanceof nhn.api.map.GroupOverlay) EventObject = "GroupOverlay";
                if (oEvent.target instanceof nhn.api.map.MarkerLabel) EventObject = "MarkerLabel";
                if (oEvent.target instanceof nhn.api.map.Polyline) EventObject = "Polyline";
                if (oEvent.target instanceof nhn.api.map.Polygon) EventObject = "Polygon";
                if (oEvent.target instanceof nhn.api.map.Circle) EventObject = "Circle";
                if (oEvent.target instanceof nhn.api.map.InfoWindow) EventObject = "InfoWindow";
                if (oEvent.target instanceof nhn.api.map.ZoomControl) EventObject = "ZoomControl";
                if (oEvent.target instanceof nhn.api.map.MapTypeBtn) EventObject = "MapTypeBtn";
                if (oEvent.target instanceof nhn.api.map.TrafficMapBtn) EventObject = "TrafficMapBtn";
                if (oEvent.target instanceof nhn.api.map.ThemeMapBtn) EventObject = "ThemeMapBtn";
                if (oEvent.target instanceof nhn.api.map.TrafficGuide) EventObject = "TrafficGuide";
                if (oEvent.target instanceof nhn.api.map.BicycleGuide) EventObject = "BicycleGuide";
                if (oEvent.target instanceof nhn.api.map.SpriteMarker) EventObject = "SpriteMarker";
            }
            catch(e) { }
        }

        function setEventLatLng(oEvent) {
            EventLatLng = oEvent.point.getY() + "," + oEvent.point.getX();
        }

        function setEventKey(oEvent) {
            try
            {
                if (oEvent.target != null) {
                    for (var j in oMarkers) {
                        if (oMarkers[j] != null && oMarkers[j].Marker == oEvent.target) {
                            EventKey = oMarkers[j].Key;
                            break;
                        }
                    }
                    for (var j in oPolylines) {
                        if (oPolylines[j] != null && oPolylines[j].Polyline == oEvent.target) {
                            EventKey = oPolylines[j].Key;
                            break;
                        }
                    }
                    for (var i in oPolygons) {
                        if (oPolygons[i] != null && oPolygons[i].Polygon == oEvent.target) {
                            EventKey = oPolygons[i].Key;
                            break;
                        }
                    }
                    for (var i in oCircles) {
                        if (oCircles[i] != null && oCircles[i].Circle == oEvent.target) {
                            EventKey = oCircles[i].Key;
                            break;
                        }
                    }
                }
            }
            catch(e) { }
        }