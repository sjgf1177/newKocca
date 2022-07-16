<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://bibeault.org/tld/ccc" prefix="ccc"%>
<style>
	.visual_wrap h2{margin-bottom:80px !important;}
	@media all and(min-width:992px){
		.visual_wrap h2{margin-bottom:100px !important;}
	}
	.lnb_wrap {display: none !important;}
	.sub_contents_wrap .sub_contents {padding-left:0 !important;}
</style>

<div class="over-hidden sub_contents_header">
	<div class="linemap_wrap"> <!-- fl class 삭제 -->
		<ul class="col-12 linemap_con">
			<li><a href="/edu/main/main.do"><span style="clip: rect(1px, 1px, 1px, 1px); position:absolute;">Home</span></a></li>
			<li><a href="javascript:void(0);" tabindex="-1"><span>카테고리</span></a></li>
			<li><a href="javascript:void(0);" tabindex="-1"><span>열린강좌</span></a></li>
		</ul>
	</div>
</div>

<div class="sub_title s_tit02">
	<c:forEach items="${realmTabList}" var="item" varStatus="status">
		<c:if test="${item.code eq param.pGubun1}">
			<div class="col-center mw-1280">${item.codenm}</div>
		</c:if>
	</c:forEach>
</div>

<ul class="sub_two_tab_box col-center mw-1280">
	<li class="active"><a href="javascript:void(0);">열린강좌</a></li>
	<li class="after_line"><a href="javascript:void(0);" onclick="fnCmdSearchCateList('${param.pGubun1}', '', '', '', ''); return false;">정규과정</a></li>
</ul>


<div class="d_flex col-12 show-table sub_board_header control_board_header mg_b20 control_board_style2">
	<div class="col-center mw-1280">
		<div>
			<select class="relation_site SL02 gubunBox" ordr="3">
				<option value="">대분류</option>
				<c:if test="${param.pGubun1 ne 'A' or not empty param.pGubun1}">
					<c:forEach items="${gubunList}" var="item" varStatus="status">
						<option value="${item.code}" <c:if test="${param.p_gcd1 eq item.code}">selected="selected"</c:if>>${item.codenm}</option>
					</c:forEach>
				</c:if>
			</select>
			<select class="relation_site SL03">
				<option value="">소분류</option>
			</select>
			<select class="relation_site SL04">
				<option value="">난이도</option>

				<c:if test="${param.pGubun1 ne 'A' or not empty param.pGubun1}">
					<c:forEach items="${levelList}" var="item" varStatus="status">
						<option value="${item.code}" <c:if test="${param.p_level eq item.code}">selected="selected"</c:if>>${item.codenm}</option>
					</c:forEach>
				</c:if>
			</select>

			<div class="show-tablecell fn vm tr board_sorting_con">
				<form id="frm" name="frm" action="/edu/onlineEdu/openLecture/list.do" method="post" class="form-inline col-12 show-tablecell fr tr">
					<input type="hidden" name="pageQueryString" value='<c:out value="${pageQueryString }" escapeXml="false"/>' >
					<input type="hidden" name="menuNo" value='<c:out value="${param.menuNo }" escapeXml="false"/>' >
					<input type="hidden" name="sortOrder" value='<c:out value="${param.sortOrder }" escapeXml="false"/>' >
					<input type="hidden" name="pageIndex" id="pageIndex" value='<c:out value="${param.pageIndex }" escapeXml="false"/>' >
					<input type="hidden" name="gubun" id="gubun" value='<c:out value="${param.gubun }" escapeXml="false"/>' >
					<input type="hidden" name="p_type" id="p_type" value="${param.p_type }" />
					<input type="hidden" name="p_gcd1" id="p_gcd1" value="${param.p_gcd1}" />
					<input type="hidden" name="p_gcd2" id="p_gcd2" value="${param.p_gcd2}" />
					<input type="hidden" name="p_level" id="p_level" value="${param.p_level}" />
					<input type="hidden" name="p_sort" id="p_sort" value="${param.p_sort}" />

					<fieldset class="mo-ta_lt">
						<legend>검색 입력폼</legend>
						<div class="board_sorting_con">
							<select class="relation_site" name="searchCnd" id="searchCnd" title="구분을 선택해 주세요." class="select_style_0">
								<option value="1" <c:if test="${param.searchCnd eq '1' }">selected="selected"</c:if>>제목</option>
								<option value="2" <c:if test="${param.searchCnd eq '2' }">selected="selected"</c:if>>강좌상세</option>
								<option value="3" <c:if test="${param.searchCnd eq '3' }">selected="selected"</c:if>>강사명</option>
							</select>

							<span class="tl input_search_con">
								<c:url var="eduOrder" value="&sortOrder=${param.sortOrder }"/>
								<input type="text" name="searchWrd" id="searchWrd" title="검색어를 입력해 주세요." value="<c:out value="${param.searchWrd}" />" maxlength="30" class="board_search"/>
								<a href="javascript:void(0);" onclick="fnCmdSearchList2('${cateSelect}'); return false;" class="search_summit nav_search_btn">검색</a>
							</span>
						</div>
						<button type="button" class="close_block_btn">닫기</button>
						<button type="button" class="filter_btn">필터</button>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</div>

<c:if test="${fn:length(resultList) > 0}">
	<c:set var="mainTitle" value=""/>
	<c:set var="cardNo" value="1"/>
	<c:forEach items="${resultList }" var="result" varStatus="status">
		<c:url var="url" value="/edu/onlineEdu/openLecture/view.do">
			<c:param name="pSeq" value="${result.seq }"/>
			<c:param name="pageIndex2" value="${param.pageIndex2 }"/>
			<c:param name="pLectureCls" value="${param.pLectureCls }"/>
		</c:url>
		<c:if test="${status.first eq false}">
			<c:if test="${mainTitle ne result.g2nm}">
					</div>
				</div>
				<!-- 방향 버튼 상황에 따라 추가 삭제가능 -->
					<div class="swiper_btn_box">
						<div class="swiper-button-prev"></div>
						<div class="swiper-button-next"></div>
					</div>
				</div>
			</c:if>
		</c:if>
		<c:if test="${mainTitle ne result.g2nm}">
			<div class="photoGallery2 photoLine1 mg_t5 fwo_card_list_box fwo_card0${cardNo} col-center mw-1280">
				<span class="main_title">${result.g2nm}</span>
				<div class="fwo_card swiper-container">
					<div class="swiper-wrapper">
			<c:set var="mainTitle" value="${result.g2nm}"/>
			<c:set var="cardNo" value="${cardNo + 1}"/>
		</c:if>
		<div class="swiper-slide">
			<div class="">
				<a class="show-block" href='<c:out value="${url }" />&amp;${pageQueryString }'>
					<% pageContext.setAttribute("crlf", "\\"); %>
					<div class="fwo_snail_box">
						<c:choose>
							<c:when test="${result.vodimg == null or result.vodimg == '' }">
								<img src="/edu/images/bm/kofac_card_img_001.jpg" style="width:100%" alt="${result.lecnm } 임시 이미지"/>
							</c:when>
							<c:otherwise>
								<img alt="<c:out value='${result.lecnm }' escapeXml="false" /> - 메인 이미지" src="<c:out value="${result.vodimg}" />"/>
							</c:otherwise>
						</c:choose>

						<!-- 설명란 start -->
						<div class="fwo_info_box">
							<h3 class="fwo_tit_box">
								<c:out value='${result.lecnm }' escapeXml="false" />
							</h3>

							<c:if test="${not empty result.lvnm}">
								<c:choose>
									<c:when test="${result.lvcd eq 'L0101' or result.lvcd eq 'L0201'}">
										<span class="tag L1">${result.lvnm}</span>
									</c:when>
									<c:when test="${result.lvcd eq 'L0102' or result.lvcd eq 'L0202'}">
										<span class="tag L2">${result.lvnm}</span>
									</c:when>
									<c:when test="${result.lvcd eq 'L0103' or result.lvcd eq 'L0203'}">
										<span class="tag L3">${result.lvnm}</span>
									</c:when>
								</c:choose>
							</c:if>
							<p>
								온라인교육ㆍ
								<c:if test="${not empty item3.g3nm}">
									${item3.g3nm}
								</c:if>

								<c:if test="${empty item3.g3nm}">
									${item3.g2nm}
								</c:if>
							</p>
						</div>
						<!-- 설명란 start-->
					</div>
				</a>
			</div>
		</div>
	</c:forEach>
</c:if>
				
<script type="text/javascript">
	$(document).ready(function(){
		//과정 조회 enter key
		$("#searchWrd").keydown(function(e) {
		    if (e.keyCode == 13) fnCmdSearchList2('${cateSelect}');
		});
		
		$(".gubunBox").change(function (){
			fnLvCodeList($(this));
		});
		
		$(".sortBox").change(function (){
			fnCmdSearchList2('${cateSelect}');
		});		
		
		if($(".SL01").val() != ""){
			fnLvCodeList($(".SL01"));
		}
		
 		if($(".SL02").val() != ""){
			fnLvCodeList($(".SL02"));
		}		
	});
	
	function fnCmdSearchList(gubun){
		if(gubun){
			$('#gubun').val(gubun == "ALL" ? "" : gubun);
		}
		
		$("#pageIndex").val("1");
		$("#searchWrd").val("");
		$("#p_type").val("");
		$("#p_gcd1").val("");
		$("#p_gcd2").val("");
		$("#p_level").val("");
		$("#p_sort").val("N");
		
		$("#frm").attr({
					action:"/edu/onlineEdu/openLecture/list.do",
					method:"post",
					target:"_self"
					});
		$("#frm").submit();
	}
	
	function fnCmdSearchList2(gubun){
		if(gubun){
			$('#gubun').val(gubun == "ALL" ? "" : gubun);
		}
		
		$("#p_type").val($(".SL01").val());
		$("#p_gcd1").val($(".SL02").val());
		$("#p_gcd2").val($(".SL03").val());
		$("#p_level").val($(".SL04").val());
		$("#p_sort").val($("#s_sort").val());
		
		$("#pageIndex").val("1");
		$("#searchWrd").val($.trim($("#searchWrd").val()));
		
		$("#frm").attr({
					action:"/edu/onlineEdu/openLecture/list.do",
					method:"post",
					target:"_self"
					});
		$("#frm").submit();
	}	
	
	//하위 분류코드 목록
	function fnLvCodeList($this){
		var ordr = $this.attr("ordr");
		var code = $this.val();
		
		$.ajax({
			type:"POST",
			url:"/edu/onlineEdu/openLecture/gubunList.json",
			data:{
				"p_ordr":ordr,
				"p_code":code
				},
			cache:false,
			async:false,
			dataType:"JSON",
			success:function(data){
				if(ordr == 2){
					$(".SL02").empty();
					$(".SL02").append("<option value=''>대분류</option>");
	         		$.each(data.gubunList, function(idx, item) {
	         			if('${param.p_gcd1}' == item.code){
		        			$(".SL02").append("<option value=\""+item.code+"\" selected='selected'>"+ item.codenm +"</option>");
	         			}else{
	         				$(".SL02").append("<option value=\""+item.code+"\">"+ item.codenm +"</option>");
	         			}
		        	});
	         		
					$(".SL03").empty();
					$(".SL03").append("<option value=''>소분류</option>");
					
					$(".SL04").empty();
					$(".SL04").append("<option value=''>난이도</option>");
	         		$.each(data.levelList, function(idx, item) {
	         			if('${param.p_level}' == item.code){
		        			$(".SL04").append("<option value=\""+item.code+"\" selected='selected'>"+ item.codenm +"</option>");
	         			}else{
	         				$(".SL04").append("<option value=\""+item.code+"\">"+ item.codenm +"</option>");
	         			}
		        	});					
				}else if(ordr == 3){
					$(".SL03").empty();
					$(".SL03").append("<option value=''>소분류</option>");
	         		$.each(data.gubunList, function(idx, item) {
	         			if('${param.p_gcd2}' == item.code){
		        			$(".SL03").append("<option value=\""+item.code+"\" selected='selected'>"+ item.codenm +"</option>");
	         			}else{
	         				$(".SL03").append("<option value=\""+item.code+"\">"+ item.codenm +"</option>");
	         			}
		        	});
				}
			},
			error:function(){
				alert("서버와 통신 실패");
			}
		});		
	}		
</script>