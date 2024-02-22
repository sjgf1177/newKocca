<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://bibeault.org/tld/ccc" prefix="ccc"%>

<style>
    .bg_gray_slide_box, .sub_title.s_tit02{padding-top: 0;}
</style>

<form id="frm" name="frm" action="/edu/onlineEdu/${paramVO.programId}/viewEdu.do?menuNo=<c:out value='${paramVO.menuNo }'/>" method="post" class="form-inline">
	<input type="hidden" name="pGubun1" id="pGubun1" value="${param.pGubun1 }" />
	<input type="hidden" name="pGubun2" id="pGubun2" value="${param.pGubun2 }" />
	<input type="hidden" name="pGubun3" id="pGubun3" value="${param.pGubun3 }" />

	<input type="hidden" name="p_subj" id="p_subj" value="${param.p_subj }" />
	<input type="hidden" name="p_subjnm" id="p_subjnm" value="${param.p_subjnm }" />
	<input type="hidden" name="p_isonoff" id="p_isonoff" value="${param.p_isonoff }" />
	<input type="hidden" name="p_scupperclass" id="p_scupperclass" value="${param.p_scupperclass }" />
	<input type="hidden" name="p_uclassnm" id="p_uclassnm" value="${param.p_uclassnm }" />
	<input type="hidden" name="p_year" id="p_year" value="${param.p_year }" />
	<input type="hidden" name="p_subjseq" id="p_subjseq" value="${param.p_subjseq }" />

	<input type="hidden" name="p_searchtext" id="p_searchtext" value="${param.p_searchtext }" />
	<input type="hidden" name="p_orders" id="p_orders" value="<c:out value="${param.p_orders }"/>" />
	<input type="hidden" name="p_ordersnm" id="p_ordersnm" value="<c:out value="${param.p_ordersnm }"/>" />

	<input type="hidden" name="p_tabselect" id="p_tabselect" value="<c:out value="${param.p_tabselect }"/>" />

	<!-- paging s -->
	<input type="hidden" name="gubun" id="gubun" value="<c:out value='${param.gubun }' />" />
	<input type="hidden" name="option1" id="option1" value="<c:out value='${param.option1 }' />" />
	<input type="hidden" name="option5" id="option5" value="<c:out value='${param.option5 }' />" />
	<input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${param.pageIndex }' />" />
	<!-- paging e -->

	<!-- 학습하기 파라미터 s -->
	<input type="hidden" name="s_year" id="s_year" value="${param.s_year }" />
	<input type="hidden" name="s_cpsubj" id="s_cpsubj" value="${param.s_cpsubj }" />
	<input type="hidden" name="s_cpsubjseq" id="s_cpsubjseq" value="${param.s_cpsubjseq }" />
	<input type="hidden" name="s_company" id="s_company" value="${param.s_company }" />
	<input type="hidden" name="s_contenttype" id="s_contenttype" value="${param.s_contenttype }" />
	<input type="hidden" name="s_subj" id="s_subj" value="${param.s_subj }" />
	<input type="hidden" name="s_subjseq" id="s_subjseq" value="${param.s_subjseq }" />
	<input type="hidden" name="s_lesson" id="s_lesson" value="${param.s_lesson }" />
	<!-- 학습하기 파라미터 e -->
</form>

<div class="bg_gray_slide_box">
	<!-- 차시제목 -->
	<div class="sub_title s_tit02">
		<div class="">
			<div class="col-12 mb30 alert big_box" style="background-color: #222;">
				<!-- 수업진도율 -->
				<div class="lectProgressSet">
					<div class="lecProgress"></div>
					<div class="lectProBar mt5">
						<div class="progress-bar progress-bar-success" style="width:<fmt:parseNumber integerOnly="true" value="${myProgress }" type="number" />%" title="<fmt:parseNumber integerOnly="true" value="${myProgress }" type="number" />% 진도율">
						</div>
					</div>
					<p class="point" align="left"><strong>진도율 : <fmt:parseNumber integerOnly="true" value="${myProgress }" type="number" />%</strong></p>
				</div>
				<!-- //수업진도율 -->

				<a href="javascript:void(0);" onclick="fnCmdSubjList('${paramVO.menuNo }', '${param.pGubun1 }', '${param.pGubun2 }', '${param.pGubun3 }'); return false;" class="return_list_box gnb_close">
					<img src="/edu/img/gnb_close.png" alt="학습 종료하기" style="padding: 0px; display: inline-block;">
				</a>
			</div>
		</div>
	</div>

	<div class="col-center mw-1280">
		<!-- step 영역 s -->
		<jsp:include page="/WEB-INF/jsp/edu/onlineEdu/realm/eduStep.jsp" flush="true" />
		<!-- step 영역 e -->

		<!-- 차시목록 -->
		<div class="col-12 lectListSet" style="min-height:auto;">
			<!-- Movie Player -->
			<div class="lectMovSet" style="background:#ffffff; width:100%; overflow:hidden; position:relative; display: flex;">
				<!-- 차시내용 -->
				<div id="lectListTemp" style="display:none">
					<jsp:include page="lectList.jsp"></jsp:include>
				</div>

				<div class="video_box">
					<iframe name="openstudy"
						id="openstudy"
						class=reactiveiframe"
						src="${p_url }"
						<%--src="http://localhost:8088/servlet/controller.contents.EduStart?p_subj=X%2BGGTQB1wo6qsNNedjQabg==&p_year=VVj%2B9yp%2Bizuv%2BKTF49C/2A==&p_subjseq=Ecq%2B4W18wKX28DqXrtnFfA==&contenttype=cgnP5O2PLTpOTYNAlJAOBQ==&p_lesson=IhkJAApFvExYKK9UUNdt7Q==&p_userid=l0oE6hZ7uvOwLjE1OavcTg==&p_iurl=0&p_tobeyn=zuI1d8ZJ6SHvmAqI8pme9g=="--%>
						<%--src="http://localhost:8088/servlet/controller.contents.EduStart?p_subj=qmr1isgSyRWhDXa8kslESA==&p_year=QWR/Fc9qQUN6z0oqOcFnFg==&p_subjseq=H%2BqVKvySCgirf9FfXCHzxQ==&contenttype=cgnP5O2PLTpOTYNAlJAOBQ==&p_lesson=IhkJAApFvExYKK9UUNdt7Q==&p_userid=l0oE6hZ7uvOwLjE1OavcTg==&p_iurl=0&p_tobeyn=zuI1d8ZJ6SHvmAqI8pme9g=="--%>
						<%--src="http://localhost:8088/servlet/controller.contents.EduStart?p_subj=kpCjpVsLVyYBNy0/dZl5QQ==&p_year=QWR/Fc9qQUN6z0oqOcFnFg==&p_subjseq=ifRkRa3v2x%2BLqJ0FNWyh6g==&contenttype=cgnP5O2PLTpOTYNAlJAOBQ==&p_lesson=IhkJAApFvExYKK9UUNdt7Q==&p_userid=l0oE6hZ7uvOwLjE1OavcTg==&p_iurl=0&p_tobeyn=zuI1d8ZJ6SHvmAqI8pme9g=="--%>
						<%--src="http://localhost:8088/servlet/controller.contents.EduStart?p_subj=S1/E97AbHxNT9BDwphpJ6g==&p_year=QWR/Fc9qQUN6z0oqOcFnFg==&p_subjseq=ifRkRa3v2x%2BLqJ0FNWyh6g==&contenttype=cgnP5O2PLTpOTYNAlJAOBQ==&p_lesson=IhkJAApFvExYKK9UUNdt7Q==&p_userid=aLtG%2BIhoU01ryS6inu8bbA==&p_iurl=0&p_tobeyn=zuI1d8ZJ6SHvmAqI8pme9g=="--%>
						<%--src="http://localhost:8088/servlet/controller.contents.EduStart?p_subj=3pLnz47zsdoNLGWWQvrzyw==&p_year=I1krJlcZ6FCrORdmQeh3vQ==&p_subjseq=ifRkRa3v2x%2BLqJ0FNWyh6g==&contenttype=cgnP5O2PLTpOTYNAlJAOBQ==&p_lesson=IhkJAApFvExYKK9UUNdt7Q==&p_userid=l0oE6hZ7uvOwLjE1OavcTg==&p_iurl=0&p_tobeyn=zuI1d8ZJ6SHvmAqI8pme9g=="--%>
						frameborder="0"
						title="본 프레임은 동영상 강의 정보를 제공합니다."
						scrolling="no"
						allowfullscreen="true"
						style="width:100%; height:100%;"
						>
					</iframe>
				</div>

				<!-- //차시내용 -->
				<div class="lectListBox eduR_lt45" style="position:relative; width:20%; height:auto; z-index:1000; display: inline-block;" class="v_list_box">
					<iframe id="lectFrame" style="width:100%;height:100%;" scrolling="yes" title="본 프레임은 강의 목차 정보를 제공합니다."></iframe>
				</div>
			</div>

			<!-- Movie Player -->
			<script type="text/javascript">
				document.getElementById("lectFrame").contentWindow.document.write("<div class='col-12 sub_section'>"+$('#lectListTemp').html()+"</div>");
			</script>

			<!-- movDescTxt -->
			<div class="mt15 board_util_btn_con" style="max-width:100%; margin-left:auto; margin-right:auto; margin-bottom: 10px;">
				<a href="javascript:void(0);" class="btn_style_0 blue openlecture_eye close_w eye_off" style="display:none; margin-right:0; margin-bottom:0;">
                    자막닫기
                </a>
				<%--<a href="javascript:void(0);" class="${(fn:length(fn:replace(lessonView.subtitle,' ','')) == 0 ? 'hidden':'') } btn_style_0 blue openlecture_eye eye_on" style="margin-right:0; margin-bottom:0;">--%>
				<a href="javascript:void(0);" class="btn_style_0 blue openlecture_eye eye_on" style="margin-right:0; margin-bottom:0;">
                    자막보기
				</a>
			</div>
			<!-- movDescTxt -->
			<div class="movDescTxt" tabindex="0" style="display: none; max-width:1000px; margin-left:auto; margin-right:auto; box-sizing:border-box;
			font-size: 14.5px; font-size: 1.45rem; line-height: 26px; line-height: 2.6rem; color: #313131; letter-spacing: -0.025em;
			padding-top:20px; padding-left:25px; padding-right:25px; padding-bottom:20px; border:2px solid #5ac9b7; text-align: left; max-height:300px; overflow-y: auto;
			-ms-user-select:none; -moz-user-select:-moz-none; -khtml-user-select:none; -webkit-user-select:none; user-select:none;">
				<% pageContext.setAttribute("crlf", "\n"); %>
				${fn:replace(lessonView.subtitle, crlf, "<br />")}
			</div>

			<!-- 과정명 box -->
			<div class="edu_info_box">
				<!-- 과정 썸네일 -->
				<div class="edu_tnail_box">
                    <%-- 작업필요 --%>
					<%--<img src="/edu/images/renew2022/fwo_snail01.png" alt="썸네일">--%>
				</div>
				<div class="edu_txt_box">
					<p class="edu_tit">과정명 : ${param.p_subjnm }</p>
                    <%-- 작업필요 --%>
					<%--<p class="edu_add_txt">Adobe Premiere Pro CC 2020의 기능 활용 및 Adobe Premiere Pro CC 2020의 사용방법 숙지</p>--%>

					<p class="jindo_box">
						<span class="jd_span01_box"><span>진도율</span> ${myProgress }%</span>
						<span class="jd_span02_box"><span>수료기준</span> 70%</span>
					</p>
				</div>
				<!--  과정 정보 -->
			</div>
		</div>

		<!-- consumer_seq = 1077 /  -->
		<!-- 아카데미이야기 24725 : MTA3Ny8yNDcyNS8xNTA5  livere_seq = 24892  / 강좌 24892 : MTA3Ny8yNDg5Mi8xNTA5   livere_seq = 1509 -->

		<div id="lv-container" data-id="kocca" data-uid="MTA3Ny8yNDg5Mi8xNTA5" data-site="">
			<script type="text/javascript">
				// 제목을 과정명으로 변경
				//$(function(){
				document.title = "<c:out value="${view.subjnm }" escapeXml="false" /> - "+document.title;
				//});
				var viewUrl = window.location.hostname + window.location.pathname;
				$("#lv-container").attr("data-site", viewUrl.replace("http://","") + "?menuNo=<c:out value="${param.menuNo}" />"+"&p_subj=<c:out value="${param.p_subj}" />&p_year=<c:out value="${param.p_year}" />&p_subjseq=<c:out value="${param.p_subjseq}" />");
				/* 라이브리 프리미엄 설치코드 */

				window.livereOptions = {
					refer: viewUrl.replace("http://","") + "?menuNo=<c:out value="${param.menuNo}" />"+"&p_subj=<c:out value="${param.p_subj}" />&p_year=<c:out value="${param.p_year}" />&p_subjseq=<c:out value="${param.p_subjseq}" />"
					, title : "<c:out value="${view.subjnm }" escapeXml="false" />"
					, description : "<c:out value="${view.subjnm }" escapeXml="false" />"
				};
				(function(d,s) {
					var j, e=d.getElementsByTagName(s)[0];

					if (typeof LivereTower === 'function') {return;}

					j=d.createElement(s);
					j.src='https://cdn-city.livere.com/js/embed.dist.js';
					j.async=true;

					e.parentNode.insertBefore(j,e);
				})(document,'script');
			</script>
		</div>
	</div>
	<%--
		<!-- liveRe Solution -->
		<div class="lectLiveReSet">
			<!-- 라이브리 설치 코드 -->
			<div id="lv-container" data-id="kocca">
				<script type="text/javascript">
					(function(d, s) {
						var j, e = d.getElementsByTagName(s)[0];
						if (typeof LivereTower === 'function') {
							return;
						}
						j = d.createElement(s);
						j.src = 'https://cdn-city.livere.com/js/embed.dist.js';
						j.async = true;
						e.parentNode.insertBefore(j, e);
					})
					(document, 'script');
				</script>
				<noscript>라이브리 댓글 작성을 위해 JavaScript를 활성화 해주세요.</noscript>
			</div>
			<!-- 설치 코드 끝 -->
	<!-- 		<img src="/edu/images/edupro/_030205_info.jpg" width="1080" height="851"  alt=""/> -->
		</div>
		<!-- //liveReSolution -->
	--%>




<!--
<div class="mb20 pt40" style="clear:left;">
	<input type="radio" name="livere_ImgCheckBtn" id="livere_choiceBtn_1" value="[알려주세요]"  class="livere_choiceImg">
	<label for="livere_choiceBtn_1">과정질문</label>
	<input type="hidden" id="livere_description_1" value=""/>

	<input type="radio" name="livere_ImgCheckBtn" id="livere_choiceBtn_2" value="[좋아요]"  class="livere_choiceImg">
	<label for="livere_choiceBtn_2">[칭찬]</label>
	<input type="hidden" id="livere_description_2" value=""/>

	<input type="radio" name="livere_ImgCheckBtn" id="livere_choiceBtn_3" value="[이건 어때요?]"  class="livere_choiceImg">
	<label for="livere_choiceBtn_3">[의견]</label>
	<input type="hidden" id="livere_description_3" value=""/>

	<input type="radio" name="livere_ImgCheckBtn" id="livere_choiceBtn_4" value="[불편해요]"  class="livere_choiceImg">
	<label for="livere_choiceBtn_4">[오류]</label>
	<input type="hidden" id="livere_description_4" value=""/>

	<input type="radio" name="livere_ImgCheckBtn" id="livere_choiceBtn_5" value="[기타]"  class="livere_choiceImg">
	<label for="livere_choiceBtn_5">[기타]</label>
	<input type="hidden" id="livere_description_5" value=""/>
</div>
<div id="livereContainer">
<script type="text/javascript">
// 	jQuery.noConflict();

	var consumer_seq = "1077";
	var livere_seq = "24892";  //말머리 : 24892 , 기본 : 24725
	var smartlogin_seq = "1509";
	var title = "<c:out value="${view.subjnm }" escapeXml="false" />";
	var viewUrl = window.location.hostname + window.location.pathname;
	var param = "&p_subj=<c:out value="${param.p_subj}" />&p_year=<c:out value="${param.p_year}" />&p_subjseq=<c:out value="${param.p_subjseq}" />";
	var refer= viewUrl + "?menuNo=<c:out value="${param.menuNo}" />";
	var vote_image = true;
	refer = refer.replace("https://","");
	var site = "http://"+refer + param;
	$(':hidden').each(function(){
		if(null != $(this).attr('name') && $(this).val() != "" && $(this).attr('name').indexOf("s_") >= 0){
			site += "&"+$(this).attr('name')+"="+$(this).val();
		}
	});
	livereReply = new Livere( livere_seq , refer + param, title );
	livereReply.site = site;
	livereLib.start();
</script>
</div>
 -->
</div>
<!-- //차시목록 -->
<style>
	.lectMovSet{height: 576px;}

	/* 태블릿 */
	@media screen and (min-width:1081px) and (max-width:1180px) {
		.lectMovSet{
			height: 900px !important;
		}
	}
	@media screen and (min-width:961px) and (max-width:1080px) {
		.lectMovSet{
			height: 110vh !important;
		}
	}
	@media screen and (min-width:641px) and (max-width:960px) {
		.lectMovSet{
			height: 100vh !important;
		}
	}

	/* 모바일 */
	@media screen and (min-width:280px) and (max-width:640px) {

		.lectMovSet{
			height: 600px !important;
		}
	}

</style>
<script type="text/javascript">
	$('.three_tab li:first-child a').attr('id', 'ContentBox');
	$('.return_list_box.gnb_close').attr('id', 'GnbBox');

	$(".eye_off").click(function (e) {
		$(this).hide();
		$(".movDescTxt").hide();
		$(".eye_on").show();
		$(".eye_on").focus();
	});

	$(".eye_on").click(function (e) {
		$(this).hide();
		$(".movDescTxt").show();
		$(".eye_off").show();
		$(".eye_off").focus();
	});

	$('header').remove();

	$('.wrapper, .bg_gray_slide_box, .sub_title.s_tit02').css('padding-top','0');

	//과정 조회
	function fnCmdSearchList(gubun1, gubun2, gubun3, ordersnm, orders){
		$("#p_gubun1").val(gubun1);
		$("#p_gubun2").val(gubun2);
		$("#p_gubun3").val(gubun3);
		$("#p_ordersnm").val(ordersnm);

		if($("#p_orders").val() == "asc"){
			$("#p_orders").val("desc");
		}else{
			$("#p_orders").val("asc");
		}

		$("#p_searchtext").val($.trim($("#p_searchtext").val()));
		$("#frm").attr({
					action:"/edu/onlineEdu/realm/list.do?menuNo=<c:out value='${paramVO.menuNo }'/>&gubun="+gubun1+"&option1="+gubun2+"&option5="+gubun3,
					method:"post",
					target:"_self"
					});
		$("#frm").submit();
	}

	//학습하기
	function fnCmdLrnAction(lesson){
		$("#s_lesson").val(lesson);
		$("#frm").attr({
					action:"/edu/onlineEdu/realm/viewEdu.do?menuNo=<c:out value='${paramVO.menuNo }'/>&gubun="+$("#pGubun1").val()+"&option1="+$("#pGubun2").val()+"&option5="+$("#pGubun3").val()+"&pageIndex=<c:out value='${param.pageIndex}' />",
					method:"post",
					target:"_self"
					});
		$("#frm").submit();
	}

	//다음 차시 넘어가는 기능 추가 rsg20171011
	function receiveMessage(event){
		if (event.origin.indexOf("edulms.kocca.kr") == -1 )//LMS 도메인 확인
			return;
		//console.log( "receiveMessage" );
		var curLesson = $("#s_lesson").val();
		fnCmdLrnAction( pad(parseInt(curLesson) + 1, curLesson.length) ); //다음 차시로 이동
	}

	function pad(n, width) {//정수 자릿수 변경
		n = n + '';
		return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
	}

	window.addEventListener("message", receiveMessage, false);
</script>

