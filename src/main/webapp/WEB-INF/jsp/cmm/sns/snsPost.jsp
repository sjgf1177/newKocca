<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.TimeZone" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://bibeault.org/tld/ccc" prefix="ccc" %>
<%@ taglib prefix="util" uri="/WEB-INF/tlds/util.tld" %>
<%
org.springframework.context.ApplicationContext context = org.springframework.web.context.support.WebApplicationContextUtils.getWebApplicationContext(getServletContext());
egovframework.rte.fdl.property.EgovPropertyService propertiesService = (egovframework.rte.fdl.property.EgovPropertyService)context.getBean("propertiesService");
request.setAttribute("facebookAppKey", propertiesService.getString("Sns.facebookAppKey"));
request.setAttribute("kakaoJavascriptKey", propertiesService.getString("Sns.kakaoJavascriptKey"));
request.setAttribute("linkedInAppKey", propertiesService.getString("Sns.linkedInAppKey"));

SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd'T'HHmmss'Z'");

Date s = (Date)dateFormat.parse("20150403T000000Z");
Date e = (Date)dateFormat.parse("20151230T230000Z");
dateFormat.setTimeZone(TimeZone.getTimeZone("UTC"));
String sDate = dateFormat.format(s);
String eDate = dateFormat.format(e);



pageContext.setAttribute("sDate", sDate);
pageContext.setAttribute("eDate", eDate);
%>


<script type="text/javascript" src="/js/jquery.cookies.js"></script>
<script type="text/javascript" src="https://connect.facebook.net/ko_KR/all.js"></script>
<!-- <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script> -->
<script type="text/javascript" src="/js/sns/facebook.js"></script>
<script type="text/javascript" src="/js/sns/kakao.min.js"></script>
<script type="text/javascript" src="/js/sns/kakao.js"></script>
<script src="https://apis.google.com/js/plus.js"></script>
<script type="text/javascript" src="/js/sns/linkedIn.js"></script>
<script type="text/javascript" src="http://platform.linkedin.com/in.js">
	api_key:   <c:out value="${linkedInAppKey}" />
	authorize: true
    //onLoad: onLinkedInLoad
</script>



<script type="text/javascript">
//<![CDATA[
var kakaoAuthResponse = false;


$(function() {

	Kakao.init('<c:out value="${kakaoJavascriptKey}" />');

	// ???????????? ?????????
	 $.sFacebook.initialize({
		appId : '<c:out value="${facebookAppKey}" />', // ???????????? App Id ??????.
		me_photo_target : '#profile_photo',
		me_name_target : '#profile_name',
		me_id_target : '#fbSnsId',
		me_image_url : '#image',
		me_fb_login_target : '#fbLoginImg',
		me_sns_name : '#snsName'
	});


	// ???????????? ?????????
	 $.sLinkedIn.initialize({
		me_photo_target : '#profile_photo',
		me_name_target : '#profile_name',
		me_id_target : '#linkedInSnsId',
		me_image_url : '#image',
		me_linkedIn_login_target : '#linkedInLoginImg',
		me_sns_name : '#snsName'
	});


	// ????????? ?????????
	$.sKakao.initialize({
		me_photo_target : '#profile_photo',
		me_name_target : '#profile_name',
		me_id_target : '#kakaoSnsId',
		me_image_url : '#image',
		me_kakao_login_target : '#kakaoLoginImg',
		me_sns_name : '#snsName'
	});


	// facebook ?????????
	$("#fbLoginBtn").click(function() {

		$.sFacebook.login();

		return false;
	});


	// linkedIn ?????????
	$("#linkedInLoginBtn").click(function() {

		$.sLinkedIn.login();

		return false;
	});


	// ????????? ?????????
	$("#kakaoLoginBtn").click(function() {



		$.sKakao.login();

		return false;
	});




	//????????????
	$("#logOutBtn").click(function(){

		// ????????????????????? ??????
		var fbLoginTp = false;
		if ($("#fbSnsId").val() != "")  {
			fbLoginTp = true;
		}

		// ????????? ??????
		var kakaoLoginTp = false;
		if ($("#kakaoSnsId").val() != "")  {
			kakaoLoginTp = true;
		}

		// ???????????? ????????? ??????
		var linkedInLoginTp = false;
		if ($("#linkedInSnsId").val() != "")  {
			linkedInLoginTp = true;
		}


		if (fbLoginTp || kakaoLoginTp || linkedInLoginTp)  {

			// ???????????? ????????????
			if (fbLoginTp) {
				jQuery.sFacebook.logout();
			}

			// ?????????????????? ????????????
			if (kakaoLoginTp) {
				jQuery.sKakao.logout();
			}

			// ???????????? ????????????
			if (linkedInLoginTp) {
				jQuery.sLinkedIn.logout();
			}

		}
		else {
			alert("KAIA?????? ?????? SNS?????? ????????? ??? ????????? ????????? ????????????.");
		}
		return false;
	});

	//?????????
	$("#searchSnsBtn").click(function(){

		// ????????????????????? ??????
		var fbLoginTp = false;
		if ($("#fbSnsId").val() != "")  {
			fbLoginTp = true;
		}

		// ????????? ??????
		var kakaoLoginTp = false;
		if ($("#kakaoSnsId").val() != "")  {
			kakaoLoginTp = true;
		}


		if (fbLoginTp || kakaoLoginTp)  {

			// ???????????? ?????????
			if (fbLoginTp) {
				window.open('/facebookListPop.jsp?type=option1', 'snsListPop', 'width=1000, height=600, scrollbars=yes');
				//jQuery.sFacebook.getPersonalFeed();
			}

			// ?????????????????? ?????????
			if (kakaoLoginTp) {

				window.open('/kakaoListPop.jsp?type=option1', 'snsListPop', 'width=1000, height=600, scrollbars=yes');
				//jQuery.sKakao.getPersonalFeed();
			}
		}
		else {
			alert("KAIA?????? ?????? SNS?????? ????????? ??? ????????? ????????? ????????????.");
		}
		return false;
	});

});


//?????? ?????????
function goPostSns(URL, returnURL){

	// ????????????????????? ??????
	var fbLoginTp = false;
	if ($("#fbSnsId").val() != "")  {
		fbLoginTp = true;
	}

	// ????????? ??????
	var kakaoLoginTp = false;
	if ($("#kakaoSnsId").val() != "")  {
		kakaoLoginTp = true;
	}


	// ???????????? ????????? ??????
	var linkedInLoginTp = false;
	if ($("#linkedInSnsId").val() != "")  {
		linkedInLoginTp = true;
	}


	if (fbLoginTp || kakaoLoginTp || linkedInLoginTp)  {
		if ($("#nttCn").val() == '') {
			window.alert('????????? ????????? ?????????.');
			$("#nttCn")[0].focus();
		    return false;
		}

		var dataToBeSent = $("#cmmnt").serialize();

		var shortUrl = $("#cmmShortUrl").val();

		/* var action = "/portal/cargos/commentInsert.do";
		$.post(
			action,
			dataToBeSent,
			function(data)
			{
				var resultCode = data.resultCode;
				var resultMsg = data.msg;
				var shortUrl = $("#cmmShortUrl").val();

				if( resultCode == 'success' ){

					if (twtLoginTp) {
						jQuery.sTwitter.post_feed('#option1',shortUrl);
					}


					$("#option1").val("");
					$("#ctSeqno").val("0");


				}
			}
		); */

		// ???????????? ?????????
		if (fbLoginTp) {
			jQuery.sFacebook.post_feed('#nttSj', '#nttCn', URL, shortUrl);
		}

		// ????????? ?????????
		if (kakaoLoginTp) {
			jQuery.sKakao.post_feed('#nttSj','#nttCn',URL, shortUrl);
		}

		// ???????????? ?????????
		if (linkedInLoginTp) {
			jQuery.sLinkedIn.post_feed('#nttSj','#nttCn',URL, shortUrl);
		}

		alert("?????? ???????????????.");
		location.href =  returnURL;


	}
	else {
		alert("KAIA?????? ?????? SNS?????? ????????? ??? ????????? ????????? ????????????.");
	}
	return false;
}

//]]>
</script>


<script type="text/javascript">

		$(function() {

			$("#googleCalenderBtn").click(function() {


				var text = $("#nttSj").val();
				var dates = $("#sDate").val()+"/"+$("#eDate").val();
				var location = "?????????";
				var details = $("#nttCn").val();

				var googleCalenderURL = "https://www.google.com/calendar/render?action=TEMPLATE&text="+encodeURI(text)+"&dates="+dates+"&location="+encodeURI(location)+"&sprop=name:FINTECH&details="+encodeURI(details)+"&sf=true&output=xml";


				window.open(googleCalenderURL, "googleCalenderPop");

				return false;
			});
		});




	    </script>



<img id="profile_photo" style="width:45px;height:45px;" src="http://www.kaia.re.kr/portal/images/common/img_reply_none.gif" alt="" />
<a href="#" id="fbLoginBtn"><img id="fbLoginImg" src="/portal/images/facebook.png" alt="Facebook Login" width="45px" height="45px"/></a>
<a href="#" id="linkedInLoginBtn"><img  id="linkedInLoginImg" src="/portal/images/linkedIn.png" alt="LinkedIn Login" width="45px" height="45px" /></a>
<a href="#" id="kakaoLoginBtn"><img  id="kakaoLoginImg" src="/portal/images/kakao_story.png" alt="Kakao Login" width="45px" height="45px"/></a>


<input type="hidden" name="sDate" id="sDate" value="${sDate}" />
<input type="hidden" name="eDate" id="eDate" value="${eDate}" />

<a href="#" id="googleCalenderBtn"><img  id="googleCalenderImg" src="/portal/images/google_calender.png" alt="googleCalender" width="45px" height="45px" /></a>
<input type="button" alt="????????????" id="logOutBtn" class="logOutBtn" value="?????? ????????????"/>
<!-- <input type="button" alt="??????" id="submitBtn" class="snsSubmitBtn" value="??????"/> -->
<!-- <input type="button" alt="??????" id="updateBtn" class="updateBtn" value="??????"/>
<input type="button" alt="??????" id="deleteBtn" class="deleteBtn" value="??????"/> -->

<br />
<input type="hidden" name="shortUrl" id="shortUrl" value="" /><br />
<input type="hidden" id="cmmShortUrl" name="cmmShortUrl" value="" /><br />
<input type="hidden" name="fbSnsId" id="fbSnsId" value="" /><br />
<input type="hidden" name="kakaoSnsId" id="kakaoSnsId" value="" /><br />
<input type="hidden" name="linkedInSnsId" id="linkedInSnsId" value="" /><br />
<input type="hidden" name="snsName" id="snsName" value="" /><br />
<input type="hidden" name="image" id="image" value="" /><br />
<input type="hidden" name="gubun" id="gubun" value="" /><br />

