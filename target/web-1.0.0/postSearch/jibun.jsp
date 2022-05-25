﻿<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<title>지번검색</title>
<link type="text/css" href="/common/postSearch/css/style.css" rel="stylesheet" />
<script src="/postSearch/common.js"></script>
<script type="text/javascript">
/*
 *  ver  : 1.0
 *  date : 2012-08-07
 *  make : yjkim
 */

	var xmlHttp;
	var mode;
	var dataFrom;
	var dataTo;
	var objFrom;
	var objTo;
	var objClear;
	var areaIdx;
	var bldnm,group_nm,oldaddr_nm,newaddr_nm,livein_cnt,corplist;
	var bbsId = '${param.bbsId}';
	var zipcode1 = "${empty param.zipcode1 ? 'ntcrZipcode1' : param.zipcode1}";
	var zipcode2 = "${empty param.zipcode2 ? 'ntcrZipcode2' : param.zipcode2}";
	var address1 = "${empty param.address1 ? 'ntcrAddr1' : param.address1}";
	var address2 = "${empty param.address2 ? 'ntcrAddr2' : param.address2}";

	function createXMLHttpRequest() {

	  if(xmlHttp != null) {
	  	xmlHttp.Abort();
	  	delete xmlHttp;
	  	xmlHttp = null;
	  }

	  if (window.ActiveXObject) {
	       xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	  }
	  else if (window.XMLHttpRequest) {
	       xmlHttp = new XMLHttpRequest();
	  }
	}


   function changeAreaList(idx, obj){
		if(obj.id == '' || obj.id == 'undefined')
			return;

		areaIdx = idx;
   		mode 	= 'area';

		dataFrom, dataTo, objFrom, objTo, objClear;

		// 통합검색
		if(obj.id == 'city1'){
			dataFrom 	= 'city';
			dataTo 		= 'county';
			objFrom		= 'city1';
			objTo		= 'county1';
			objClear	= 'town1_oldaddr';

			//①세종시예외처리
			document.getElementById("county1").disabled = false;

			if(document.getElementById(obj.id).value =='36'){
				document.getElementById("county1").disabled = true;
				dataTo 		= 'town';
				objTo		= 'town1_oldaddr';
			}
		}
		// 통합검색
		else if(obj.id == 'county1'){
			dataFrom 	= 'county';
			objFrom		= 'county1';
			objClear	= '';
			dataTo 		= 'town';
			objTo		= 'town1_oldaddr';
		}
		else if(obj.id == 'town1_oldaddr'){
			dataFrom 	= 'town';
			objFrom		= 'town1_oldaddr';
			objClear	= '';
			dataTo 		= 'ri';
			objTo		= 'ri1_oldaddr';

		}
		// 통합검색
		else if(obj.id == 'rd_nm_idx1'){
			dataFrom 	= 'county';
			objFrom		= 'county1';
			objClear	= '';

			if(searchType == 'NORMAL1'){		//	새주소검색
				dataTo 		= 'rd_nm';
				objTo		= 'rd_nm1';
			}
		}

		//	update해야 할 select를 초기화
		clearList(objTo);

		//	clear해야 할 select가 설정된 경우 초기화



		// from object 선택값이 없으면 return
		if(document.getElementById(objFrom).value == ''){
			return;
		}

		var url = "/postSearch/AjaxRequestXML.jsp?getUrl=http://www.juso.go.kr/getAreaCode.do?" + escape(createParameter());



	  	createXMLHttpRequest();
	 	xmlHttp.onreadystatechange = handleStateChange;
	  	xmlHttp.open("GET", url, true);
	  	xmlHttp.send(null);
	}


	/*
	 *	행정구역 조회 쿼리에 사용할 파라메터값 설정
	 */
	function createParameter() {

		var rdIndex;

		// 도로명 clear인 경우, 도로명 인덱스 선택 초기화
		if(dataTo.indexOf("rd_nm") != -1){
			var rdIdxName = 'rd_nm_idx'+areaIdx;
			rdIndex = document.getElementById(rdIdxName).value;
		}

		var valFrom		= document.getElementById(objFrom).value;
		var valTo		= document.getElementById(objTo).value;

		//	시군구>도로명, 시군구>지번주소인 경우
		//	시도코드도 가져가야함


		if(dataFrom == 'county' && (areaIdx == 1 || areaIdx == 3)){
			var cityName = 'city'+areaIdx;
			var cityVal = document.getElementById(cityName).value;

			valFrom = cityVal+valFrom;

		}else if(dataFrom == 'town' && (areaIdx == 1 || areaIdx == 3)){
			var cityName	= 'city'+areaIdx;
			var countyName	= 'county'+areaIdx;

			if(document.getElementById(cityName).value=='36'){
				valFrom = '36110'+valFrom;
			}else
				valFrom = document.getElementById(cityName).value+document.getElementById(countyName).value+valFrom;
		}

		var queryString = "from="+encodeURI(dataFrom)+"&to="+encodeURI(dataTo)+"&valFrom="+encodeURI(valFrom)+"&valTo="+encodeURI(valTo)+"&rdIndex="+encodeURI(rdIndex);

	  	return queryString;
	}

	/*
	 *	응답을 받아 리스트를 update
	 */
	function handleStateChange() {

	  if(xmlHttp.readyState == 4) {
	       if(xmlHttp.status == 200)
	           	updateAreaList();
	           	delete xmlHttp;
	           	xmlHttp = null;
	       }
	  }


	function handleStateChangeSearch() {
	      var j = 1;
	      if(xmlHttp.readyState == 2||xmlHttp.readyState == 3)
		 		document.getElementById("formbox").innerHTML="--처리중입니다.--";
		  if(xmlHttp.readyState == 4) {
		       if(xmlHttp.status == 200)
		    	   var siNm 		= xmlHttp.responseXML.getElementsByTagName('siNm');
			       var sggNm 		= xmlHttp.responseXML.getElementsByTagName('sggNm');
			       var emdNm 		= xmlHttp.responseXML.getElementsByTagName('emdNm');
			       var liNm 		= xmlHttp.responseXML.getElementsByTagName('liNm');
			       var rn 			= xmlHttp.responseXML.getElementsByTagName('rn');
			       var rnCd 		= xmlHttp.responseXML.getElementsByTagName('rnCd');
			       var buldMnnm 	= xmlHttp.responseXML.getElementsByTagName('buldMnnm');
			       var buldSlno 	= xmlHttp.responseXML.getElementsByTagName('buldSlno');
			       var lnbrMnnm 	= xmlHttp.responseXML.getElementsByTagName('lnbrMnnm');
			       var lnbrSlno 	= xmlHttp.responseXML.getElementsByTagName('lnbrSlno');
			       var udrtYn  	 	= xmlHttp.responseXML.getElementsByTagName('udrtYn');
			       var mtYn 	 	= xmlHttp.responseXML.getElementsByTagName('mtYn');
			       var bdNm		 	= xmlHttp.responseXML.getElementsByTagName('bdNm');
			       var bdKd		 	= xmlHttp.responseXML.getElementsByTagName('bdkd');
			       var zipCl		= xmlHttp.responseXML.getElementsByTagName('zipCl');
			       var intCurrentPage		= xmlHttp.responseXML.getElementsByTagName('intCurrentPage');
			       var intCountPerPage		= xmlHttp.responseXML.getElementsByTagName('intCountPerPage');
			       var totalCount		= xmlHttp.responseXML.getElementsByTagName('totalCount');

			       var setDetailJuso = '';



			        document.getElementById("formbox").innerHTML="";

			        for(var i = 0; i < sggNm.length; i++) {
					 	var tempLnbr="";
					 	var tempBuld="";
					 	var jibun="";
					 	var newaddr="";
					 	var zip="";
					 	if(lnbrSlno[i].firstChild.nodeValue!="0"){
					 		tempLnbr=lnbrMnnm[i].firstChild.nodeValue+'-'+lnbrSlno[i].firstChild.nodeValue;
					 	}else{
					 		tempLnbr=lnbrMnnm[i].firstChild.nodeValue;
					 	}
					 	if(buldSlno[i].firstChild.nodeValue!="0"){
					 		tempBuld=buldMnnm[i].firstChild.nodeValue+'-'+buldSlno[i].firstChild.nodeValue;
					 	}else{
					 		tempBuld=buldMnnm[i].firstChild.nodeValue;
					 	}

					 	if(siNm[i].firstChild.nodeValue=="세종특별자치시"){
					 		var temp=bdKd[i].firstChild.nodeValue;
						 	if(temp.substring(0,2)=='02'&&bdNm[i].childNodes.length!='0')
						 		setDetailJuso = "("+bdNm[i].firstChild.nodeValue+")";

					 		if(liNm[i].childNodes.length == '0') {
					 			newaddr = siNm[i].firstChild.nodeValue+' '+rn[i].firstChild.nodeValue+' '+tempBuld;
						 		jibun = siNm[i].firstChild.nodeValue+' '+emdNm[i].firstChild.nodeValue+' '+tempLnbr;
					 		}else{
					 			newaddr = siNm[i].firstChild.nodeValue+' '+emdNm[i].firstChild.nodeValue+' '+rn[i].firstChild.nodeValue+' '+tempBuld;
						 		jibun = siNm[i].firstChild.nodeValue+' '+emdNm[i].firstChild.nodeValue+' '+liNm[i].firstChild.nodeValue+' '+tempLnbr;
					 		}

					 	}else{
					 		if(liNm[i].childNodes.length == '0') {
							 	var temp=bdKd[i].firstChild.nodeValue;
							 	if(temp.substring(0,2)=='02'&&bdNm[i].childNodes.length!='0')
							 		setDetailJuso = "("+emdNm[i].firstChild.nodeValue+"，"+bdNm[i].firstChild.nodeValue+")";
							 	else
							 		setDetailJuso = "("+emdNm[i].firstChild.nodeValue+")";
							 	newaddr = siNm[i].firstChild.nodeValue+' '+sggNm[i].firstChild.nodeValue+' '+rn[i].firstChild.nodeValue+' '+tempBuld;
						 		jibun = siNm[i].firstChild.nodeValue+' '+sggNm[i].firstChild.nodeValue+' '+emdNm[i].firstChild.nodeValue+' '+tempLnbr;
						 	}else{
						 		var temp=bdKd[i].firstChild.nodeValue;
						 		if(temp.substring(0,2)=='02'&&bdNm[i].childNodes.length!='0')
							 		setDetailJuso = "("+bdNm[i].firstChild.nodeValue+")";
						 		newaddr = siNm[i].firstChild.nodeValue+' '+sggNm[i].firstChild.nodeValue+' '+emdNm[i].firstChild.nodeValue+' ' +rn[i].firstChild.nodeValue+' '+tempBuld;
						 		jibun = siNm[i].firstChild.nodeValue+' '+sggNm[i].firstChild.nodeValue+' '+emdNm[i].firstChild.nodeValue+' '+liNm[i].firstChild.nodeValue+' '+tempLnbr;
						 	}
					 	}




					 	if(bdNm[i].childNodes.length!='0')
					 		jibun += ' '+bdNm[i].firstChild.nodeValue;

				 		if(zipCl[i].childNodes.length=='0'){
					 		zip = "-";
				 		}else{
				 			zip = zipCl[i].firstChild.nodeValue;
				 		}


						if(i%2=='0'){
							document.getElementById("formbox").innerHTML += "<ul class='item'>";
			 				document.getElementById("formbox").innerHTML += "<li class='road'><a href='javascript:setParentValue(\""+ newaddr+","+setDetailJuso+","+zip+"\")'>"+"[도로명]"+newaddr+"</a></li>";
			 				document.getElementById("formbox").innerHTML += "<li class='road'>"+"[지 번]"+jibun+"</li>";
			 				document.getElementById("formbox").innerHTML += "<li class='road'>"+"[우편번호]"+zipCl[i].firstChild.nodeValue+"</li>";
			 				document.getElementById("formbox").innerHTML += "</ul>";
						}
					 	else{
					 		document.getElementById("formbox").innerHTML += "<ul class='item'>";
					 		document.getElementById("formbox").innerHTML += "<li class='road2'><a href='javascript:setParentValue(\""+ newaddr+","+setDetailJuso+","+zip+"\")'>"+"[도로명]"+newaddr+"</a></li>";
			 				document.getElementById("formbox").innerHTML += "<li class='road2'>"+"[지번]"+jibun+"</li>";
			 				document.getElementById("formbox").innerHTML += "<li class='road2'>"+"[우편번호]"+zipCl[i].firstChild.nodeValue+"</li>";
			 				document.getElementById("formbox").innerHTML += "</ul>";
					 	}


			 	   }
				 	if(siNm.length>0)
				 		document.getElementById("formbox").innerHTML+=getPaging(intCountPerPage[0].firstChild.nodeValue,'5',totalCount[0].firstChild.nodeValue,document.check.currentPage.value,"");

					if(siNm.length=="0")
				 		document.getElementById("formbox").innerHTML="검색된 결과가 없습니다.";
		           	delete xmlHttp;
		           	xmlHttp = null;
		       }
		  }



	/*
	 *	행정구역코드 모든 리스트를 초기화
	 */
	function clearAllList() {

	  	var countyObj = document.getElementById(vCounty);

	  	countyObj.options.length = 0;
   		countyObj.options[0] = new Option('::선택::', '');

	   	clearList(to);
	}

	/*
	 *	지정된 행정구역코드 리스트를 초기화
	 */
	function clearList(obj) {
		if(obj == 'town1_oldaddr'){
			var toObject = document.getElementById(obj);

			toObject.options.length = 0;
			toObject.options[0] = new Option('::선택::', '');

			document.getElementById("ri1_oldaddr").options.length = 0;
			document.getElementById("ri1_oldaddr").options[0] = new Option('::선택::', '');
		}
		else if(obj != '' && obj != 'town1_oldaddr'){

			var toObject = document.getElementById(obj);

			toObject.options.length = 0;
			toObject.options[0] = new Option('::선택::', '');
		}

	}

	/*
	 *	행정구역코드 리스트를 update
	 */
	function updateAreaList() {
	  var toObj 	= document.getElementById(objTo);
	  var values 	= xmlHttp.responseXML.getElementsByTagName('value');
	  var names 	= xmlHttp.responseXML.getElementsByTagName('name');
	  var j = 1;

	  //  리스트 수만큼 option을 달아준다
	  for(var i = 0; i < values.length; i++) {

			if(isExceptArea(names[i].firstChild.nodeValue)){
				j = j - 1;
			}
			else{
				var option = new Option(names[i].firstChild.nodeValue, values[i].firstChild.nodeValue);
				option.title = names[i].firstChild.nodeValue;
	       		toObj.options[i+j] = option;

	       	}
	   }

	  if(values.length=='0'&&toObj=='county1'){
		   alert('네트워크가 원활하지 않습니다.\n\n다시선택하여 주시기를 바립니다.');
		   return;
	   }
	}

	function normalSearch(currentPage){
		var form = document.check;
		var keyword = "";
		var cityText='',countyText='',townText='',riText='',orgCode='166',orgNm='정보통신정책연구원 홈페이지';
		var special_pattern = /['~!@#$%^&*|\\\'\'';:\.?]/gi;
		cityText= form.city1.options[form.city1.selectedIndex].text;
		countyText = form.county1.options[form.county1.selectedIndex].text;
		townText = form.town1_oldaddr.options[form.town1_oldaddr.selectedIndex].text;
		riText = form.ri1_oldaddr.options[form.ri1_oldaddr.selectedIndex].text;

		if(form.city1.value=='') cityText=''
		if(form.county1.value=='') countyText=''
		if(form.town1_oldaddr.value=='')	townText = '';
		if(form.ri1_oldaddr.value=='') riText = '';
		if(form.san.checked) 	form.san1.value = '1';
		else form.san1.value ='0';

		form.engineCtpNm.value =cityText;
		form.engineSigNm.value =countyText;
		form.engineEmdNm.value =townText;
		form.engineLiNm.value = riText;
		form.engineBdMaSn.value= form.bun1.value;
		form.engineBdSbSn.value = form.bun2.value;
		form.engineMtYn.value= form.san1.value;
		form.currentPage.value =currentPage;

		if(cityText == ''){
			alert('시군구를 입력하여 주세요');
			return;
		}

		var url;

		url = "/postSearch/AjaxRequestXML.jsp?getUrl="+escape("http://www.juso.go.kr/link/search.do?extend=false&mode=jibun_search&searchType=location_jibun&topTab=1&engineCtpNm="+encodeURI(cityText)+"&engineSigNm="+encodeURI(countyText)+"&engineEmdNm="+encodeURI(townText)+"&engineLiNm="+encodeURI(riText)+"&engineBdMaSn="+encodeURI(form.bun1.value)+"&engineBdSbSn="+encodeURI(form.bun2.value)+"&engineMtYn="+encodeURI(form.san1.value)+"&currentPage="+currentPage+"&orgCode="+orgCode+"&orgNm="+encodeURI(orgNm));

		createXMLHttpRequest();

	 	xmlHttp.onreadystatechange = handleStateChangeSearch;
	  	xmlHttp.open("GET", url, true);
	  	xmlHttp.send(null);
	}

	function inputNumCom(obj){
		  var keycode = event.keyCode;
		  if(!((48<=keycode&&keycode<=57)||keycode==13||keycode==46)){
			alert('숫자만 입력가능합니다.');
		    event.keyCode=0;
		  }
	}

	function trim(str){
		var temp = str.replaceAll(" ","");
		return temp;
	}

	function normalSearch2(currentPage){
		var url;
		var form = document.check;
		form.currentPage.value =currentPage;
		var orgCode='166',orgNm='정보통신정책연구원 홈페이지';

		currentPage=parseInt((currentPage/10)+1);

		url = "/postSearch/AjaxRequestXML.jsp?getUrl="+escape("http://www.juso.go.kr/link/search.do?extend=false&mode=jibun_search&searchType=location_jibun&topTab=1&engineCtpNm="+encodeURI(form.engineCtpNm.value)+"&engineSigNm="+encodeURI(form.engineSigNm.value)+"&engineEmdNm="+encodeURI(form.engineEmdNm.value)+"&engineLiNm="+encodeURI(form.engineLiNm.value)+"&engineBdMaSn="+form.engineBdMaSn.value+"&engineBdSbSn="+form.engineBdSbSn.value+"&engineMtYn="+form.engineMtYn.value+"&currentPage="+currentPage+"&orgCode="+orgCode+"&orgNm="+encodeURI(orgNm));


		createXMLHttpRequest();

	 	xmlHttp.onreadystatechange = handleStateChangeSearch;
	  	xmlHttp.open("GET", url, true);
	  	xmlHttp.send(null);

	}

	/*
	 fListScale : 한페이지 출력할 게시물수
	 fPageScale : 페이지수를 표시할 갯수
	 fTotal : 전체 게시물수
	 fStart : 리스트를 뿌릴 시작점(최근게시물로 order by 해서 뽑아 내는 자료라면 가장 최근 자료가 0번이 됨
	 fPagingUrl : 클릭시 넘어갈 페이지
	 */

	 function getPaging(fListScale,fPageScale,fTotal,fStart,fPagingUrl) {
		 if(fStart=='1')
			 fStart = fStart-1;
	     var fReturn = "";
	     var fPage;
	     var fPP;
	     var fNP;
	     var fPreStart;
	     var fLn;
	     var fVk;
	     var fNstart;
	     var fLast;
	     if(fTotal > fListScale) {
	         fPage =  Math.floor(fStart/(fListScale*fPageScale));

	         fReturn = fReturn + "<table border='0' cellpadding='0' cellspacing='1'><tr><td align='center' class='paging'> ";

	         fPP=fStart-fListScale;
	         fNP=parseInt(fStart)+parseInt(fListScale);
	         // 처음으로 이동
	         if(fPP>=0) {
	        	 fReturn = fReturn + " <a href='javascript:normalSearch2(1)'>처음</a> ";
	         }

	         // sPageScale 만큼 앞으로 이동
	         if( fStart+1 >  fListScale*fPageScale ) {
	             fPreStart = fListScale*(fPage*fPageScale - 1);
	             if(fPreStart<0)
	            	 fPreStart=-fPreStart;
	             fReturn  = fReturn + "<a href='javascript:normalSearch2(" +fPreStart+ ")'>이전</a> ";

	         }

	         // sPageScale 만큼 출력
	         for(i=0; i < fPageScale ; i++) {
	             fLn = (fPage * fPageScale + i)*fListScale;
	             fVk= fPage * fPageScale + i+1;

	             if(fLn<fTotal) {

						if(fLn!=fStart) {
							fReturn  = fReturn + " <a href='javascript:normalSearch2(" + fLn + ")'>" + fVk + "</a> "; }
						else {
							fReturn  = fReturn + " <span style='color:#FCC600;'>" + fVk + "</span> ";}
		          }
	         }

	         // sPageScale 만큼 뒤로 이동
	         if(fTotal > ((fPage+1)*fListScale*fPageScale)) {
	             fNstart=(fPage+1)*fListScale*fPageScale;
	             fReturn  = fReturn + " <a href='javascript:normalSearch2(" + fNstart+ ")'>다음</a> ";
	         }

	         // 마지막 페이지

	         if(fNP<fTotal) {
	             fLast = (Math.floor(fTotal/fListScale))*fListScale;
	             fReturn  = fReturn + "<a href='javascript:normalSearch2(" + fLast+ ")'>마지막</a> ";
	         }

	         fReturn  = fReturn + "  </td></tr></table>";
	     }
	     return fReturn;
	 }
	/*
		회원가입창으로 파라미터 전송
	*/

	 function setParentValue(newaddr,setDetailJuso){
		var result = newaddr.split(",");

		document.getElementById("formbox").innerHTML ="";
 		document.getElementById("formbox").innerHTML += "<li class='popuproad'>도로명 :&nbsp;&nbsp;&nbsp;<input type='text' style='inputroad' value='"+result[0]+"'></input></li>";
		document.getElementById("formbox").innerHTML += "<li class='popuproad'>상세주소 :&nbsp;<input type='text' id='detail' name ='detail' width='50px' /></li>";
		document.getElementById("formbox").innerHTML += "<li class='popuproad'>참고항목 :&nbsp;<input type='text' value='"+result[1]+"'></input></li>";
		document.getElementById("formbox").innerHTML += "<li class='popuproad'>우편번호 :&nbsp;<input type='text' id='zip' name ='zip' width='50px' value="+result[2]+" /></li>";
		document.getElementById("formbox").innerHTML += "<li class='popuproad'>※상세주소 : 동·층·호</li>";
		document.getElementById("formbox").innerHTML += "<li class='popuproad'>※참고항목 :(법정동,공동주택명)</li>";
		document.getElementById("formbox").innerHTML += "<li class='inputdata'><a href='javascript:setOpenerValue(\""+ newaddr+"\")'><img src='http://www.juso.go.kr/images/link/btn_input.gif' alt='' /></a></li>";
		document.getElementById("formbox").innerHTML += "<li class='inputdata'><img src='http://www.juso.go.kr/images/test.gif' alt='' width='380px' /></li>";
		document.getElementById("formbox").innerHTML += "<li class='inputdata'>자세한 표기법은   <a href='http://www.juso.go.kr' style='font-size: 10px' target='_blank' title='새창열림'>도로명주소안내홈페이지</a> 를 참조하세요</li>";



	 }
	 function setOpenerValue(newaddr){
		 var result = newaddr.split(",");
		 if(bbsId == 'B0000113'){
			 address1 = "option6";
			 address2 = "option16";
			 zipcode1 = "ntcrZipcode3";
			 zipcode2 = "ntcrZipcode4";
		 }else if(bbsId == 'bosUser'){
			 address1 = "newAddr1";
			 address2 = "newAddr2";
			 zipcode1 = "zipcode1";
			 zipcode2 = "zipcode2";
		 }
		 window.opener.document.getElementById(address1).value = result[0];
		 window.opener.document.getElementById(address2).value = document.getElementById("detail").value+" "+result[1];
		 var tempZipcode = result[2];
		 var resultZipcode = tempZipcode.split("-");
		 window.opener.document.getElementById(zipcode1).value = resultZipcode[0];
		 window.opener.document.getElementById(zipcode2).value = resultZipcode[1];
		 window.close();
	 }

	 //
	 function selectSearch(mode) {
		if (mode == 'road'){
			document.location.href = "/postSearch/road.jsp?zipcode1="+zipcode1+"&amp;zipcode2="+zipcode2+"&amp;address1="+address1+"&amp;address2="+address2;
		}else if(mode =='jibun'){
			document.location.href = "/postSearch/jibun.jsp?zipcode1="+zipcode1+"&amp;zipcode2="+zipcode2+"&amp;address1="+address1+"&amp;address2="+address2;
		}else if(mode=='sangho'){
			document.location.href = "/postSearch/sangho.jsp?zipcode1="+zipcode1+"&amp;zipcode2="+zipcode2+"&amp;address1="+address1+"&amp;address2="+address2;
		}
	}

	 function focusItem(obj){

		}


		/*
		 *	key down function (엔터키가 입력되면 검색함수 호출)
		 */
		function checkKeyASearch(){
			if(event.keyCode == KEY_ENTER)
				normalSearch('1');
		}
</script>
</head>
<body>

<div id="wrapper">
	<div id="header">
		<h1> <img src="http://www.juso.go.kr/images/link/h1.jpg" alt="도로명주소찾기(우편번호)"/> </h1>
	</div>
	<div id="container">
		<div id="content">
			<ul class="tab">
				<li><a href="#n" onclick="selectSearch('road');return false;"><img src="http://www.juso.go.kr/images/link/tab1_off.gif" alt="도로명주소"/></a></li>
				<li><a href="#n" onclick="selectSearch('jibun');return false;"><img src="http://www.juso.go.kr/images/link/tab2.gif" alt="지번"/></a></li>
				<li><a href="#n" onclick="selectSearch('sangho');return false;"><img src="http://www.juso.go.kr/images/link/tab3_off.gif" alt="건물명"/></a></li>
			</ul>
			<form name="check" method="post">
				<input type="hidden" name="searchType" id="searchType" value ="" />
				<input type="hidden" name="san1" id="san1"  value="0"/>
				<input type="hidden" name="engineCtpNm" id="engineCtpNm"  value="${engineCtpNm}"/>
				<input type="hidden" name="engineSigNm" id="engineSigNm"  value="${engineSigNm}"/>
				<input type="hidden" name="engineEmdNm" id="engineEmdNm"  value="${engineEmdNm}"/>
				<input type="hidden" name="engineLiNm" id="engineLiNm"  value="${engineLiNm}"/>
				<input type="hidden" name="engineRdNm" id="engineRdNm"  value="${engineRdNm}"/>
				<input type="hidden" name="engineMtYn" id="engineMtYn"  value="${engineMtYn}"/>
				<input type="hidden" name="engineBdMaSn" id="engineBdMaSn"  value="${engineBdMaSn}"/>
				<input type="hidden" name="engineBdSbSn" id="engineBdSbSn"  value="${engineBdSbSn}"/>
				<input type="hidden" name="currentPage" id="currentPage"  value="${currentPage}" />
				<div class="form" id="formbox" on>
					<fieldset>
						<legend>정보 입력</legend>
						<div class="group">
							<p class="input">
								<label for="city1"><strong>시, 도</strong></label>
								<select title="시/도 선택"  name="city1" onchange="javascript:changeAreaList(1, this);" id="city1" style="width:185px">
									<option>선택</option>
									<option value="11" title="서울특별시" >서울특별시</option>
									<option value="42" title="강원도" >강원도</option>
									<option value="41" title="경기도">경기도</option>
									<option value="48" title="경상남도" >경상남도</option>
									<option value="47" title="경상북도" >경상북도</option>
									<option value="46" title="전라남도" >전라남도</option>
									<option value="45" title="전라북도" >전라북도</option>
									<option value="44" title="충청남도" >충청남도</option>
									<option value="43" title="충청북도" >충청북도</option>
									<option value="29" title="광주광역시" >광주광역시</option>
									<option value="27" title="대구광역시" >대구광역시</option>
									<option value="30" title="대전광역시" >대전광역시</option>
									<option value="26" title="부산광역시" >부산광역시</option>
									<option value="31" title="울산광역시" >울산광역시</option>
									<option value="28" title="인천광역시" >인천광역시</option>
									<option value="36" title="세종특별자치시" >세종특별자치시</option>
									<option value="50" title="제주특별자치도" >제주특별자치도</option>
								</select>
							</p>
							<p class="input">
								<label for="county1"><strong>시군구</strong></label>
								<select title="시/군/구 선택"  name="county1" id="county1" style="width:185px" onchange="javascript:changeAreaList(1, this);">
									<option value="">선택</option>
									<c:forEach items="${county}" var="county">
										<option value="${county.countyId}">${county.countyName}</option>
									</c:forEach>
								</select>
							</p>
							<p class="input">
								<label for="town1_oldaddr"><strong>읍&nbsp;&nbsp;면&nbsp;&nbsp;동</strong></label>
								<select id="town1_oldaddr" name="town1_oldaddr" title="지번주소" onchange="javascript:changeAreaList(1, this); " style="width:185px">
									<option value=""> 선택 </option>
									<c:forEach items="${town}" var="county">
										<option value="${town.townId}" >${town.townName }</option>
									</c:forEach>
								</select>
							</p>
							<p class="input">
								<label for="ri1_oldaddr"><strong>리</strong></label>
								<select id="ri1_oldaddr" name="ri1_oldaddr" title="지번주소"  class="small" style="width:130px">
									<option value=""> 선택</option>
								</select>
								<input type="checkbox" value="" id="san" name="san"/>
								<label for="san">산</label>
							</p>
							<p class="input">
								<label for="bun1"><strong>번지</strong></label>
								<input type="text" name="bun1" value="" id="bun1" class="text" style="width:84px" onfocus= "javascript:focusItem(this);" onkeydown="checkKeyASearch();" title="번지 앞자리" />
								-
								<input type="text" name="bun2" value="" id="bun2" class="text" style="width:84px" onfocus= "javascript:focusItem(this);" onkeydown="checkKeyASearch();" title="번지 뒷자리" />
							</p>
						</div>
						<div class="btn"> <a href="#" onclick="normalSearch('1');return false;"><img src="http://www.juso.go.kr/images/link/btn_search.gif" alt="검색"  /></a> </div>
						<div > <img src="http://www.juso.go.kr/images/test.gif" alt="올바른 도로명주소 표기법 예)공동주책 (아파트 등) : 서울특별시 서초구 반포대로 58, 1010동 501호 (서초동, 서초아트자이) / 주택,상가 : 서울특별시 서초구 반포대로23길 6 (서초동)" width="380" /> 자세한 표기법은 <a href="http://www.juso.go.kr" style="font-size: 10px" target="_blank" title="새창열림" >도로명주소안내홈페이지</a> 를 참조하세요 </div>
					</fieldset>
				</div>
			</form>
		</div>
	</div>
</div>

</body>
</html>
