<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://bibeault.org/tld/ccc" prefix="ccc"%>

<%-- <ccc:constantsMap className="kr.co.unp.bbs.vo.SearchVO" var="SearchVO" /> --%>

	<style>
		/* 	.lnb_con{display: none} */
		/* 	.sub_contents_wrap .sub_contents {padding-left: 0;} */
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


	<!-- ???????????? ???????????? s -->
	<input type="hidden" name="s_year" id="s_year" value="${param.s_year }" />
	<input type="hidden" name="s_cpsubj" id="s_cpsubj" value="${param.s_cpsubj }" />
	<input type="hidden" name="s_cpsubjseq" id="s_cpsubjseq" value="${param.s_cpsubjseq }" />
	<input type="hidden" name="s_company" id="s_company" value="${param.s_company }" />
	<input type="hidden" name="s_contenttype" id="s_contenttype" value="${param.s_contenttype }" />
	<input type="hidden" name="s_subj" id="s_subj" value="${param.s_subj }" />
	<input type="hidden" name="s_subjseq" id="s_subjseq" value="${param.s_subjseq }" />
	<input type="hidden" name="s_lesson" id="s_lesson" value="${param.s_lesson }" />
	<!-- ???????????? ???????????? e -->

</form>
<div class="bg_gray_slide_box">
	<%--<div class="over-hidden sub_contents_header">
		<div class="linemap_wrap"> <!-- fl class ?????? -->
			<ul class="col-12 linemap_con">
				<li><a href="/edu/main/main.do"><span style="clip: rect(1px, 1px, 1px, 1px); position:absolute;">Home</span></a></li>
				<li><a href="javascript:void(0);" tabindex="-1"><span>????????????</span></a></li>
				<li><a href="javascript:void(0);" tabindex="-1"><span>??????</span></a></li>
			</ul>
		</div>
	</div>--%>
	<!-- ???????????? -->
	<div class="sub_title s_tit02">
		<div class="">
			<div class="col-12 mb30 alert big_box">
				<!-- ??????????????? -->
				<div class="lectProgressSet">
					<div class="lecProgress"></div>
					<div class="lectProBar mt5">
						<div class="progress-bar progress-bar-success" style="width:<fmt:parseNumber integerOnly="true" value="${myProgress }" type="number" />%" title="<fmt:parseNumber integerOnly="true" value="${myProgress }" type="number" />% ?????????">
							<%--<span class="icon progressInfo"><fmt:parseNumber integerOnly="true" value="${myProgress }" type="number" /><span class="sr-only">% ?????????</span></span>--%>
						</div>
						<%--<c:choose>
							<c:when test="${p_subj eq 'CK20010'}">
								<div class="progress-bar progressIng" style="width: 100%;" title="???????????? ??????100%">
									<span class="sr-only">???????????? ??????100%</span>
								</div>
							</c:when>
							<c:otherwise>
								<div class="progress-bar progressIng" style="width: 70%;" title="???????????? ??????70%">
									<span class="sr-only">???????????? ??????70%</span>
								</div>
							</c:otherwise>
						</c:choose>--%>

					</div>
					<p class="point" align="left"><strong>????????? : <fmt:parseNumber integerOnly="true" value="${myProgress }" type="number" />%</strong></p>
					<%--<c:choose>
						<c:when test="${p_subj eq 'CK20010'}">
							<div class="row">
								<div class="col-md-6">???????????? ?????? 100%</div>
								<c:if test="${myProgress ge 100.0 }">
									<div class="col-md-6 tar"><span class="icon icoSm lectCheck"></span> ?????????</div>
								</c:if>
							</div>
						</c:when>
						<c:otherwise>
							<div class="row">
								<div class="col-md-6">???????????? ?????? 70%</div>
								<c:if test="${myProgress ge 70.0 }">
									<div class="col-md-6 tar"><span class="icon icoSm lectCheck"></span> ?????????</div>
								</c:if>
							</div>
						</c:otherwise>
					</c:choose>--%>
				</div>
				<!-- //??????????????? -->
				<%--<p class="alert_title" style="margin-bottom:0;">${view.subjnm }</p>--%>
				<%-- <c:set var="arrayofedumans" value="${fn:split(view.edumans,'-')}"/>
				<c:forEach var="i" begin="0" end="${fn:length(arrayofedumans)-1 }" varStatus="status">
					- ${arrayofedumans[i] } <c:if test="${not status.last }"> <br /></c:if>
				</c:forEach> --%>
				<a href="javascript:void(0);" onclick="fnCmdSubjList('${paramVO.menuNo }', '${param.pGubun1 }', '${param.pGubun2 }', '${param.pGubun3 }'); return false;" class="return_list_box gnb_close">
					<img src="/edu/img/gnb_close.png" alt="GNB ?????? ??????" style="padding: 0px; display: inline-block;">
					<%--<input type="image" src="/edu/img/gnb_close.png" class="gnb_close" alt="GNB ?????? ??????" style="padding: 0px; display: inline-block;">--%>
				</a>
			</div>
		</div>
	</div>

	<div class="col-center mw-1280">

		<!-- step ?????? s -->
		<jsp:include page="/WEB-INF/jsp/edu/onlineEdu/realm/eduStep.jsp" flush="true" />
		<!-- step ?????? e -->

		<!-- ???????????? -->
		<div class="col-12 lectListSet" style="min-height:auto;">
			<%--<div class="lectMenu">
				<a href="javascript:void(0);" class="icon lectToggle eduR_lt45" onclick="return false;"></a>
			</div>--%>

			<!-- Movie Player -->
			<div class="lectMovSet" style="background:#ffffff; width:100%; overflow:hidden; position:relative; display: flex; height: 600px !important;">
				<!-- ???????????? -->
				<div id="lectListTemp" style="display:none">
					<jsp:include page="lectList.jsp"></jsp:include>
				</div>


				<%-- <div style="width: ${view.prewidth }px; height:${view.preheight }px; margin: 0 auto; overflow:hidden; z-index:-10; " > --%>
				<div style="position:relative; padding-bottom:60%; height:0; max-width:870px; overflow:hidden; z-index:999; display: inline-block;" class="video_box">
					<iframe name="openstudy"
						id="openstudy"
						<%--src="${p_url }"--%>
						src="http://172.30.1.1:8088/servlet/controller.contents.EduStart?p_subj=X%2BGGTQB1wo6qsNNedjQabg==&p_year=VVj%2B9yp%2Bizuv%2BKTF49C/2A==&p_subjseq=Ecq%2B4W18wKX28DqXrtnFfA==&contenttype=cgnP5O2PLTpOTYNAlJAOBQ==&p_lesson=IhkJAApFvExYKK9UUNdt7Q==&p_userid=l0oE6hZ7uvOwLjE1OavcTg==&p_iurl=0&p_tobeyn=zuI1d8ZJ6SHvmAqI8pme9g=="
						<%--src="http://edu_kocca.ecn.cdn.infralab.net/kocca/mp4/onlineclass/CK22007/01_01.mp4"--%>
						<%--width="${view.prewidth }"
						height="${view.preheight }"--%>
						width="870"
						height="768"
						frameborder="0"
						title="??? ???????????? ????????? ?????? ????????? ???????????????."
						scrolling="no"
						allowfullscreen="true"
						>
					</iframe>
				</div>

				<!-- //???????????? -->
				<div class="lectListBox eduR_lt45" style="position:relative; width:373px; height:auto; z-index:1000; display: inline-block;" class="v_list_box">
					<iframe id="lectFrame" style="width:100%;height:100%;" scrolling="yes" title="??? ???????????? ?????? ?????? ????????? ???????????????."></iframe>
				</div>
			</div>
			<!-- Movie Player -->
			<script type="text/javascript">
				document.getElementById("lectFrame").contentWindow.document.write("<div class='col-12 sub_section'>"+$('#lectListTemp').html()+"</div>");//rsg20171010
				//lectFrame.document.write($('#lectListTemp').html());
				//$('#lectFrame').write($('#lectListTemp').html());
			</script>

			<!-- movDescTxt -->
			<div class="mt15 board_util_btn_con" style="max-width:1000px; margin-left:auto; margin-right:auto;">
				<a href="javascript:void(0);" class="btn_style_0 green openlecture_eye close_w eye_off" style="display:none; margin-right:0; margin-bottom:0;">
					????????????
				</a>
				<a href="javascript:void(0);" class="${(fn:length(fn:replace(lessonView.subtitle,' ','')) == 0 ? 'hidden':'') } btn_style_0 green openlecture_eye eye_on" style="margin-right:0; margin-bottom:0;">
					????????????
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

			<!-- ????????? box -->
			<div class="edu_info_box">
				<!-- ?????? ????????? -->
				<div class="edu_tnail_box">
					<img src="/edu/images/renew2022/fwo_snail01.png" alt="?????????">
				</div>
				<div class="edu_txt_box">
					<p class="edu_tit">????????? : [????????????]???????????? ??????????????? ????????????</p>
					<p class="edu_add_txt">??????????????? ???????????????.??????????????? ???????????????.??????????????? ???????????????.??????????????? ???????????????.??????????????? ???????????????.??????????????? ???????????????.</p>

					<p class="jindo_box">
						<span class="jd_span01_box"><span>?????????</span> 60%</span>
						<span class="jd_span02_box"><span>????????????</span> 60%</span>
					</p>
				</div>

				<!--  ?????? ?????? -->
			</div>

		</div>
	</div>
	<%--
		<!-- liveRe Solution -->
		<div class="lectLiveReSet">
			<!-- ???????????? ?????? ?????? -->
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
				<noscript>???????????? ?????? ????????? ?????? JavaScript??? ????????? ????????????.</noscript>
			</div>
			<!-- ?????? ?????? ??? -->
	<!-- 		<img src="/edu/images/edupro/_030205_info.jpg" width="1080" height="851"  alt=""/> -->
		</div>
		<!-- //liveReSolution -->
	--%>


<!-- consumer_seq = 1077 /  -->
<!-- ????????????????????? 24725 : MTA3Ny8yNDcyNS8xNTA5  livere_seq = 24892  / ?????? 24892 : MTA3Ny8yNDg5Mi8xNTA5   livere_seq = 1509 -->
<!--
<div class="mb20 pt40" style="clear:left;">
	<input type="radio" name="livere_ImgCheckBtn" id="livere_choiceBtn_1" value="[???????????????]"  class="livere_choiceImg">
	<label for="livere_choiceBtn_1">????????????</label>
	<input type="hidden" id="livere_description_1" value=""/>

	<input type="radio" name="livere_ImgCheckBtn" id="livere_choiceBtn_2" value="[?????????]"  class="livere_choiceImg">
	<label for="livere_choiceBtn_2">[??????]</label>
	<input type="hidden" id="livere_description_2" value=""/>

	<input type="radio" name="livere_ImgCheckBtn" id="livere_choiceBtn_3" value="[?????? ??????????]"  class="livere_choiceImg">
	<label for="livere_choiceBtn_3">[??????]</label>
	<input type="hidden" id="livere_description_3" value=""/>

	<input type="radio" name="livere_ImgCheckBtn" id="livere_choiceBtn_4" value="[????????????]"  class="livere_choiceImg">
	<label for="livere_choiceBtn_4">[??????]</label>
	<input type="hidden" id="livere_description_4" value=""/>

	<input type="radio" name="livere_ImgCheckBtn" id="livere_choiceBtn_5" value="[??????]"  class="livere_choiceImg">
	<label for="livere_choiceBtn_5">[??????]</label>
	<input type="hidden" id="livere_description_5" value=""/>
</div>
<div id="livereContainer">
<script type="text/javascript">
// 	jQuery.noConflict();

	var consumer_seq = "1077";
	var livere_seq = "24892";  //????????? : 24892 , ?????? : 24725
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
<!-- //???????????? -->

<script type="text/javascript">
//<![CDATA[

	/*$(document).ready(function(){
		$('.lnb_wrap').addClass('dn');

		$(".lectListBox").show();
		setTimeout(function(){$(".lectListBox").animate({width: 'hide'});}, 3000);

		$('.lectToggle').click(function() {
			$(".lectListBox").slideToggleWidth();
		});

		jQuery.fn.extend({
		  slideRight: function() {
		    return this.each(function() {
		      jQuery(this).animate({width: 'show', height:'100%'});
		    });
		  },
		  slideLeft: function() {
		    return this.each(function() {
		      jQuery(this).animate({width: 'hide', height:'600'});
		    });
		  },
		  slideToggleWidth: function() {
		    return this.each(function() {
		      var el = jQuery(this);
		      if (el.css('display') == 'none') {
		        el.slideRight();
		        $('.lectToggle').attr({"title":"???????????? ??????"});
				//console.log("open");
		      } else {
		        el.slideLeft();
		        $('.lectToggle').attr({"title":"???????????? ??????"});
				//console.log("close");
		      }
		    });
		  }
		});

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
	});*/

	//?????? ??????
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


	//????????????
	function fnCmdLrnAction(lesson){

		$("#s_lesson").val(lesson);
		$("#frm").attr({
					action:"/edu/onlineEdu/realm/viewEdu.do?menuNo=<c:out value='${paramVO.menuNo }'/>&gubun="+$("#pGubun1").val()+"&option1="+$("#pGubun2").val()+"&option5="+$("#pGubun3").val()+"&pageIndex=<c:out value='${param.pageIndex}' />",
					method:"post",
					target:"_self"
					});
		$("#frm").submit();
	}

	//?????? ?????? ???????????? ?????? ?????? rsg20171011
	function receiveMessage(event){
		if (event.origin.indexOf("edulms.kocca.kr") == -1 )//LMS ????????? ??????
			return;
		//console.log( "receiveMessage" );
		var curLesson = $("#s_lesson").val();
		fnCmdLrnAction( pad(parseInt(curLesson) + 1, curLesson.length) ); //?????? ????????? ??????
	}
	function pad(n, width) {//?????? ????????? ??????
		n = n + '';
		return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
	}
	window.addEventListener("message", receiveMessage, false);
//]]>
</script>

