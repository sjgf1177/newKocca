<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<c:set var="rangeAll" value="${empty paramVO.rangeView or paramVO.rangeView eq 'all'}" />
<c:set var="eduGoldCnt" value="${rangeAll ? 5 : fn:length(eduGoldResultList)}" />
<c:set var="eduSubjCnt" value="${rangeAll ? 5 : fn:length(eduSubjResultList)}" />

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
			alert("검색어를 입력하세요.");
			$("#q")[0].focus();
			return false;
		}
		return true;
	}

</script>
<style>
.sub_contents_wrap .sub_contents {padding-left:0 !important;}
</style>

<form name="frmSearch" class="col-12 board_sorting_con alert formLine1 searchSetTp" method="post" action="/edu/search/list.do?menuNo=${param.menuNo}" onsubmit="return checkForm(this);">
	<input type="hidden" id="prevQ" name="prevQ" value="${paramVO.q}" />
	<input type="hidden" id="pageIndex" name="pageIndex" value="1" />
	<input type="hidden" id="rangeView" name="rangeView" value="${paramVO.rangeView}" />
	<input type="hidden" id="q" name="q" value="${paramVO.q}" />
</form>

<div class="over-hidden sub_contents_header">
	<div class="linemap_wrap"> <%-- fl class 삭제 --%>
		<ul class="col-12 linemap_con">
			<li><a href="/edu/main/main.do"><span style="clip: rect(1px, 1px, 1px, 1px); position:absolute;">Home</span></a></li>
			<li><a href="javascript:void(0);" tabindex="-1"><span>통합검색</span></a></li>
			<li><a href="javascript:void(0);" tabindex="-1"><span>검색결과</span></a></li>
		</ul>
	</div>
</div>

<div class="sub_title s_tit02">
	<div class="col-center mw-1280">검색결과</div>
</div>

<%-- 인기검색어 --%>
<div class="col-center mw-1280">
	<div class="mb20">
		<div class="hotkeyword">
			<h2 class="fl">인기검색어</h2>
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
			<li <c:if test="${empty paramVO.rangeView}">class="active"</c:if>>
				<c:if test="${empty paramVO.rangeView}">
					<a href="javascript:void(0);" title="현재탭">
						<%--<span>통합검색(${totalCount})</span>--%>
						<span>통합검색</span>
					</a>
				</c:if>
				<c:if test="${not empty paramVO.rangeView}">
					<a href="javascript:detailView('');">
						<%--<span>통합검색(${totalCount})</span>--%>
						<span>통합검색</span>
					</a>
				</c:if>
			</li>
			<li <c:if test="${paramVO.rangeView eq 'eduGold'}">class="active"</c:if>>
				<c:if test="${paramVO.rangeView eq 'eduGold'}">
					<a href="javascript:void(0);" title="현재탭">
						<%--<span>오프라인교육(${programListCnt})</span>--%>
						<span>바로 수강</span>
					</a>
				</c:if>
				<c:if test="${paramVO.rangeView ne 'eduGold'}">
					<a href="javascript:detailView('eduGold')">
						<%--<span>오프라인교육(${programListCnt})</span>--%>
						<span>바로 수강</span>
					</a>
				</c:if>
			</li>
			<li <c:if test="${paramVO.rangeView eq 'eduSubj'}">class="active"</c:if>>
				<c:if test="${paramVO.rangeView eq 'eduSubj'}">
					<a href="javascript:void(0);" title="현재탭">
						<%--<span>온라인교육/강좌(${onlineEduListCnt})</span>--%>
						<span>로그인 후 수강</span>
					</a>
				</c:if>
				<c:if test="${paramVO.rangeView ne 'eduSubj'}">
					<a href="javascript:detailView('eduSubj');">
						<%--<span>온라인교육/강좌(${onlineEduListCnt})</span>--%>
						<span>로그인 후 수강</span>
					</a>
				</c:if>
			</li>
		</ul>
	</div>

		<c:choose>
			<c:when test="${paramVO.rangeView eq 'eduGold'}"><c:set var="rangeNm" value="바로수강"/><c:set var="cnt" value="${eduGoldListCnt}"/></c:when>
			<c:when test="${paramVO.rangeView eq 'eduSubj'}"><c:set var="rangeNm" value="로그인후수강"/><c:set var="cnt" value="${eduSubjListCnt}"/></c:when>
			<c:otherwise><c:set var="rangeNm" value="전체"/><c:set var="cnt" value="${totalCount}"/></c:otherwise>
		</c:choose>
		<p class="mb10 alert_highlight_title">검색어 <span class="point0">"${paramVO.q}"</span>에 대한 ${rangeNm} <span class="point0" id="searchCnt">"${cnt}"</span>개의 검색 결과를 찾았습니다.</p>

		<div class="searchSet">

		<%-- 바로 수강 --%>
		<c:if test="${rangeAll or paramVO.rangeView eq 'eduGold'}">
			<div class="alert">
				<%--<p class="alert_design_text"> 온라인교육/강좌 (검색결과 ${onlineEduListCnt}건)</p>--%>
				<p class="alert_design_text">바로 수강</p>
				<c:if test="${fn:length(eduGoldResultList)>0}">
					<div class="moreBtn">
						<c:if test="${paramVO.rangeView ne 'eduGold'}">
							<a href="javascript:detailView('eduGold');" class="more"> <span>더 보기 +</span></a>
						</c:if>
					</div>
				</c:if>
			</div>
			<!-- 상세검색 -->
			<jsp:include page="/WEB-INF/jsp/edu/search/detail.jsp" flush="true" />

			<ul class="bull" id="ul_onlineEdu">
				<c:forEach var="result" items="${eduGoldResultList}" varStatus="status">
					<c:if test="${status.count <= eduGoldCnt}">
						<li class="statSet">
							<a href="<c:out value="${result.fullMenuLink}"/>" target="_blank" title="새창열림">
								<div class="sc_tit_box">
									<span>${result.title}</span>
								</div>
								<span class="txt">${result.hl}</span>
							</a>
						</li>
					</c:if>
				</c:forEach>
				<c:if test="${fn:length(eduGoldResultList) == 0}"><li class="statSet">검색 결과가 없습니다.</li></c:if>
			</ul>
		</c:if>

		<%-- 로그인 후 수강 --%>
		<c:if test="${rangeAll or paramVO.rangeView eq 'eduSubj'}">
			<div class="alert">
				<%--<p class="alert_design_text"> 온라인교육/강좌 (검색결과 ${onlineEduListCnt}건)</p>--%>
				<p class="alert_design_text">로그인 후 수강</p>
				<c:if test="${fn:length(eduSubjResultList)>0}">
					<div class="moreBtn">
						<c:if test="${paramVO.rangeView ne 'eduSubj'}">
							<a href="javascript:detailView('eduSubj');" class="more"> <span>더 보기 +</span></a>
						</c:if>
					</div>
				</c:if>
			</div>
			<!-- 상세검색 -->
			<jsp:include page="/WEB-INF/jsp/edu/search/detail.jsp" flush="true" />

			<ul class="bull" id="ul_onlineEdu">
				<c:forEach var="result" items="${eduSubjResultList}" varStatus="status">
					<c:if test="${status.count <= eduSubjCnt}">
						<li class="statSet">
							<a href="<c:out value="${result.fullMenuLink}"/>" target="_blank" title="새창열림">
								<div class="sc_tit_box">
									<span>${result.title}</span>
								</div>
								<span class="txt">${result.hl}</span>
							</a>
						</li>
					</c:if>
				</c:forEach>
				<c:if test="${fn:length(eduSubjResultList) == 0}"><li class="statSet">검색 결과가 없습니다.</li></c:if>
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