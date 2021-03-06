<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<c:set var="rangeAll" value="${empty paramVO.rangeView or paramVO.rangeView eq 'all'}" />
<c:set var="progrmCnt" value="${rangeAll ? 5 : fn:length(progrmResultList)}" />
<c:set var="menuCnt" value="${rangeAll ? 5 : fn:length(menuResultList)}" />
<c:set var="bbsCnt" value="${rangeAll ? 5 : fn:length(bbsResultList)}" />
<c:set var="webpageCnt" value="${rangeAll ? 5 : fn:length(webpageResultList)}" />
<c:set var="filesCnt" value="${rangeAll ? 5 : fn:length(filesResultList)}" />
<c:set var="onlineEduCnt" value="${rangeAll ? 5 : fn:length(onlineEduResultList)}" />

<script type="text/javascript" src="/js/jquery-ui-1.9.2.custom.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('.lnb_wrap').addClass('dn');
});

	$(function() {
		$(":checkbox[name=category]").click(function(){
			if(this.value == "all" && this.checked){
				$(":checkbox[name=category]").attr("checked", true);
			}
			else if(this.value == "all" && !this.checked){
				$(":checkbox[name=category]").attr("checked", false);
			}
			else{
				if(!this.checked){
					$("#sr_chk0").attr("checked", false);
				}
				else{
					if( $(":checkbox:checked:not(#sr_chk0)").length == 8 ){
						$("#sr_chk0").attr("checked", true);
					}
				}
			}
		});
		$(":radio[name=range]").click(function(){
			$(":checkbox[name=category]").attr("disabled", false);
		});
		$("#sr_radio_4").click(function(){
			$(":checkbox[name=category]").attr("checked", false);
			$(":checkbox[name=category]").attr("disabled", true);
		});

	    $('#q').autocomplete({
	        source: function(request, response) {
	        	$.getJSON("/edu/search/suggest.json",
	        	{
	        		q: encodeURIComponent(request.term)
	        	},
	        	function(data) {
		        	response(
		            	$.map(data.resultList, function(item) {
		                	return {
		                    	label: item,
		                        value: item
		                    }
		                })
		        	);
	        	});
	        },
	        minLength: 1,
	        select: function( event, ui ) {
	        	console.log( ui.item ?
	            "Selected: " + ui.item.label :
	            "Nothing selected, input was " + this.value);
	        },
	        open: function() {
	          	$( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
	        },
	        close: function() {
	          	$( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
	        }
	    });

		$('#con_more_${paramVO.rangeView}').hide();
		$('#more_${paramVO.rangeView}').click(function() {
			$('#con_more_${paramVO.rangeView}').toggle();
		});

		jQuery.fn.extend({
			toggle: function() {
			    return this.each(function() {
				    var el = jQuery(this);
				    if (el.css('display') == 'none') {
						$('#con_more_${paramVO.rangeView}').show();
				    }
				    else {
						$('#con_more_${paramVO.rangeView}').hide();
					}
				});
			}
		});

		$('#detailBtn').click(function() {
			$('#ul_${paramVO.rangeView}').hide();
		});

	});

	function detail(range){
		$(":input[name=range]").each(function(){
			if( $(this).val() == range ){
				$(this).attr("checked", true);
			}
			else{
				$(this).attr("checked", false);
			}
		});
		document.frmSearch.submit();
	}

	function detailView(v){
		if( !checkForm(document.frmSearch) ){
			return;
		}
		document.frmSearch.rangeView.value = v;
		document.frmSearch.submit();
	}

	function search(q){
		$("#q").val(q);
		document.frmSearch.submit();
	}

	function paging(pageIndex){
		$("#pageIndex").val(pageIndex);
		document.frmSearch.submit();
	}

	function checkForm(form){
		if(!form.q.value){
			alert("???????????? ???????????????.");
			$("#q")[0].focus();
			return false;
		}
		return true;
	}

</script>
<style>
.sub_contents_wrap .sub_contents {padding-left:0 !important;}
</style>

<div class="over-hidden sub_contents_header">
	<div class="linemap_wrap"> <!-- fl class ?????? -->
		<ul class="col-12 linemap_con">
			<li><a href="/edu/main/main.do"><span style="clip: rect(1px, 1px, 1px, 1px); position:absolute;">Home</span></a></li>
			<li><a href="javascript:void(0);" tabindex="-1"><span>????????????</span></a></li>
			<li><a href="javascript:void(0);" tabindex="-1"><span>????????????</span></a></li>
		</ul>
	</div>
</div>

<div class="sub_title s_tit02">
	<div class="col-center mw-1280">????????????</div>
</div>

<!-- ??????????????? -->
<div class="col-center mw-1280">
	<div class="mb20">
		<div class="hotkeyword">
			<h2 class="fl">???????????????</h2>
			<div class="over-hidden hotkeyword_list_con">
				<ul>
					<c:forEach var="result" items="${psList}" varStatus="status">
						<li class="ico_${status.count}"><a href="javascript:search('${result.srchwrd}');"><span class="num">${status.count}.</span><span class="txt">${result.srchwrd}</span></a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

	<div class="tab_style_1_con">
		<ul class="tab_style_1 four_tab size_24">
			<li <c:if test="${empty paramVO.rangeView}">class="active"</c:if>><a href="javascript:detailView('');" <c:if test="${empty paramVO.rangeView}">title="?????????"</c:if>><span>????????????(${totalCount})</span></a><c:if test="${empty paramVO.rangeView}"></c:if></li>
			<li <c:if test="${paramVO.rangeView eq 'progrm'}"></c:if>><a href="javascript:detailView('progrm');" <c:if test="${paramVO.rangeView eq 'progrm'}">title="?????????"</c:if>><span>??????????????????(${programListCnt})</span></a><c:if test="${paramVO.rangeView eq 'progrm'}"></c:if></li>
			<li <c:if test="${paramVO.rangeView eq 'onlineEdu'}"></c:if>><a href="javascript:detailView('onlineEdu');" <c:if test="${paramVO.rangeView eq 'onlineEdu'}">title="?????????"</c:if>><span>???????????????/??????(${empty onlineEduResultList[0] ? 0 : onlineEduResultList[0].numFound})</span></a><c:if test="${paramVO.rangeView eq 'onlineEdu'}"></c:if></li>
		</ul>
	</div>

		<c:choose>
			<c:when test="${paramVO.rangeView eq 'progrm'}"><c:set var="rangeNm" value="??????????????????"/><c:set var="cnt" value="${programListCnt}"/></c:when>
			<c:when test="${paramVO.rangeView eq 'onlineEdu'}"><c:set var="rangeNm" value="???????????????/??????"/><c:set var="cnt" value="${empty onlineEduResultList[0] ? 0 : onlineEduResultList[0].numFound}"/></c:when>
			<c:when test="${paramVO.rangeView eq 'webpage'}"><c:set var="rangeNm" value="????????????"/><c:set var="cnt" value="${empty webpageResultList[0] ? 0 : webpageResultList[0].numFound}"/></c:when>
			<c:when test="${paramVO.rangeView eq 'bbs'}"><c:set var="rangeNm" value="?????????"/><c:set var="cnt" value="${empty bbsResultList[0] ? 0 : bbsResultList[0].numFound}"/></c:when>
			<c:when test="${paramVO.rangeView eq 'menu'}"><c:set var="rangeNm" value="??????"/><c:set var="cnt" value="${empty menuResultList[0] ? 0 : menuResultList[0].numFound}"/></c:when>
			<c:when test="${paramVO.rangeView eq 'files'}"><c:set var="rangeNm" value="????????????"/><c:set var="cnt" value="${empty filesResultList[0] ? 0 : filesResultList[0].numFound}"/></c:when>
			<c:otherwise><c:set var="rangeNm" value="??????"/><c:set var="cnt" value="${totalCount}"/></c:otherwise>
		</c:choose>
		<p class="mb10 alert_highlight_title">????????? <span class="point0">"${paramVO.q}"</span>??? ?????? ${rangeNm} <span class="point0" id="searchCnt">"${cnt}"</span>?????? ?????? ????????? ???????????????.</p>

		<div class="searchSet">

		<!-- ?????????????????? -->
		<c:if test="${rangeAll or paramVO.rangeView eq 'progrm'}">

			<div class="alert">
				<p class="alert_design_text"> ?????????????????? (???????????? ${programListCnt}???)</p>
				<c:if test="${fn:length(progrmResultList)>0}">
					<div class="moreBtn">
						<c:if test="${paramVO.rangeView eq 'progrm'}">
							<a href="#self" class="more" id="more_${paramVO.rangeView}"> <span><i class="fa fa-search-plus"></i> ????????????</span></a>
						</c:if>
					</div>
				</c:if>
			</div>
			<!-- ???????????? -->
			<jsp:include page="/WEB-INF/jsp/edu/search/detail.jsp" flush="true" />

			<ul class="bull" id="ul_progrm">
				<c:forEach var="result" items="${progrmResultList}" varStatus="status">
					<c:if test="${status.count <= progrmCnt}">
						<li class="statSet">
							<%--<a href="<c:out value="${result.fullMenuLink}"/>" target="_blank" title="????????????">--%>
							<a href="<c:out value="/edu/progrm/master/view.do?prgSn=${result.prgSn}&prgSe=${result.prgSe}&prgCl=${result.prgCl}&menuNo=500216"/>" target="_blank" title="????????????">
								<span class="tit">
									<span class="status">
										<c:choose>
											<c:when test="${result.progrsSttus eq 'W'}">??????</c:when>
											<c:when test="${result.progrsSttus eq 'P'}">?????????</c:when>
											<c:when test="${result.progrsSttus eq 'F'}">??????</c:when>
										</c:choose>
									</span>
								</span>
								<div class="sc_tit_box"><span class="fcBlue">[${result.prgSeNm}-${result.prgClNm}]</span> <span>${result.prgNm}</span></div>
								<span class="txt">
									(???????????? : ${result.reqstMthdNm} / ?????? : ${empty result.psncpa ? '-' : result.psncpa} ??? / ???????????? : ${result.beginDt}~${result.endDt})
									${result.hl}
								</span>
							</a>
						</li>
					</c:if>
				</c:forEach>
				<c:if test="${fn:length(progrmResultList) == 0}"><li class="statSet">?????? ????????? ????????????.</li></c:if>
			</ul>
		</c:if>

		<!-- ???????????????/?????? -->
		<c:if test="${rangeAll or paramVO.rangeView eq 'onlineEdu'}">
			<div class="alert">
				<p class="alert_design_text"> ???????????????/?????? (???????????? ${empty onlineEduResultList[0] ? 0 : onlineEduResultList[0].numFound}???)</p>
				<c:if test="${fn:length(onlineEduResultList)>0}">
					<div class="moreBtn">
						<c:if test="${paramVO.rangeView eq 'onlineEdu'}">
							<a href="#self" class="more" id="more_${paramVO.rangeView}"> <span><i class="fa fa-search-plus"></i> ????????????</span></a>
						</c:if>
						<c:if test="${paramVO.rangeView ne 'onlineEdu'}">
							<a href="javascript:detailView('onlineEdu');" class="more"> <span>??? ?????? +</span></a>
						</c:if>
					</div>
				</c:if>
			</div>
			<!-- ???????????? -->
			<jsp:include page="/WEB-INF/jsp/edu/search/detail.jsp" flush="true" />

			<ul class="bull" id="ul_onlineEdu">
				<c:forEach var="result" items="${onlineEduResultList}" varStatus="status">
					<c:if test="${status.count <= onlineEduCnt}">
						<li class="statSet">
							<a href="<c:out value="${result.fullMenuLink}"/>" target="_blank" title="????????????">
							<span class="tit">
								<span class="status">
									<c:choose>
										<c:when test="${result.gubunSe eq '01'}">????????????</c:when>
										<c:when test="${result.gubunSe eq '02'}">????????????</c:when>
										<c:when test="${result.gubunSe eq '03'}">????????????</c:when>
									</c:choose>
								</span>
								<span class="fcBlue">
									<c:choose>
										<c:when test="${result.gubunSe eq '01'}">
											<c:choose>
												<c:when test="${result.gubun eq 'realm'}">[?????????</c:when>
												<c:when test="${result.gubun eq 'occp'}">[?????????</c:when>
											</c:choose>
											- ${result.categoryNm}]
										</c:when>
										<c:otherwise>[${result.categoryNm}]</c:otherwise>
									</c:choose>
								</span> ${result.title}
							</span>
							<span class="txt">${result.hl}</span>
							</a>
						</li>
					</c:if>
				</c:forEach>
				<c:if test="${fn:length(onlineEduResultList) == 0}"><li class="statSet">?????? ????????? ????????????.</li></c:if>
			</ul>
		</c:if>

		</div>

		<c:if test="${not empty paramVO.rangeView}">
			<div class="paging">${pageNav}</div>
		</c:if>
</div>

<style>
	.tab_style_1_con{margin: 40px 0 50px 0;}
	.tab_style_1_con .tab_style_1{display: flex; justify-content: space-around;}
	.alert{margin-top: 30px;}
	.searchSet .statSet .txt{margin-left: 0; margin-top: 5px;}
	.searchSet .tit{margin-bottom: 10px;}
	.sc_tit_box span{font-size: 20px;}
	.hotkeyword li .num{width:auto; height: auto; background: transparent; color: #222;}

	@media all and (max-width:640px) {
		.tab_style_1_con .tab_style_1 > li span{font-size: 1.37rem;}
		.tab_style_1_con .tab_style_1 > li.active a span{border-bottom: 3px solid #222222;}
		.alert_highlight_title{font-size: 15px; text-align: center;}
		.hotkeyword h2{padding-left: 0; width: 100%;}
		.hotkeyword .hotkeyword_list_con{padding-top: 0; padding-left: 1px;}
		.hotkeyword li{line-height: 2em; font-size: 14px;}
		.sc_tit_box span{font-size: 15px;}
		.searchSet .statSet .txt{font-size: 13px;}
	}
</style>