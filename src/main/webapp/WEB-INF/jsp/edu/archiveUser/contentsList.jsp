<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://bibeault.org/tld/ccc" prefix="ccc"%>
<ccc:constantsMap className="kr.co.unp.bbs.vo.SearchVO" var="SearchVO" />

<style>
.visual_wrap h2{margin-bottom:80px !important;}
@media all and(min-width:992px){
	.visual_wrap h2{margin-bottom:100px !important;}
}
@media all and (min-width: 576px){
	.control_board_header .board_title{position: sticky;}
}
.lnb_wrap {display: none !important;}
.sub_contents_wrap .sub_contents {padding-left:0 !important;}
</style>

<link rel="stylesheet" type="text/css" href="/archive/css/archive.css" /><!-- 성과아카이브 css-->

<div class="over-hidden sub_contents_header">
	<div class="linemap_wrap"> <!-- fl class 삭제 -->
		<ul class="col-12 linemap_con">
			<li><a href="/edu/main/main.do"><span style="clip: rect(1px, 1px, 1px, 1px); position:absolute;">Home</span></a></li>
			<li><a href="javascript:void(0);" tabindex="-1"><span>사업안내</span></a></li>
			<c:choose>
				<c:when test="${param.menuNo eq '500261'}">
					<li><a href="javascript:void(0);" tabindex="-1"><span>콘텐츠임팩트</span></a></li>
				</c:when>
				<c:when test="${param.menuNo eq '500259'}">
					<li><a href="javascript:void(0);" tabindex="-1"><span>창의인재동반</span></a></li>
				</c:when>
				<c:when test="${param.menuNo eq '500262'}">
					<li><a href="javascript:void(0);" tabindex="-1"><span>실감콘텐츠창작</span></a></li>
				</c:when>
				<c:when test="${param.menuNo eq '500264'}">
					<li><a href="javascript:void(0);" tabindex="-1"><span>AI콘텐츠창작</span></a></li>
				</c:when>
				<c:when test="${param.menuNo eq '500260'}">
					<li><a href="javascript:void(0);" tabindex="-1"><span>콘텐츠원캠퍼스</span></a></li>
				</c:when>
			</c:choose>
			<li><a href="javascript:void(0);" tabindex="-1"><span>성과아카이브</span></a></li>
		</ul>
	</div>
</div>
<div class="sub_title s_tit02">
	<div class="col-center mw-1280">${param.menuNm}</div>
</div>
<div class="col-center mw-1280 dream_list">

	<div class="tab_style_1_con">
		<ul class="tab_style_1 four_tab size_24" style="display: flex; justify-content: center;">
			<c:choose>
				<c:when test="${param.menuNo eq '500261'}">
					<li><a href="/edu/main/contents.do?menuNo=500213" ><span>사업소개</span></a></li>
				</c:when>
				<c:when test="${param.menuNo eq '500259'}">
					<li><a href="/edu/dream/mainRsltManage/list.do?menuNo=500040"><span>사업소개</span></a></li>
					<li><a href="/edu/dream/pltfomList/list.do?menuNo=500117"><span>플랫폼기관</span></a></li>
					<li><a href="/edu/bbs/B0000041/list.do?menuNo=500211"><span>창의현장</span></a></li>
				</c:when>
				<c:when test="${param.menuNo eq '500262'}">
					<li><a href="/edu/main/contents.do?menuNo=500110" ><span>사업소개</span></a></li>
				</c:when>
				<c:when test="${param.menuNo eq '500264'}">
					<li><a href="/edu/main/contents.do?menuNo=500263" ><span>사업소개</span></a></li>
				</c:when>
				<c:when test="${param.menuNo eq '500260'}">
					<li><a href="/edu/main/contents.do?menuNo=500179"><span>사업소개</span></a></li>
					<li><a href="/edu/bbs/B0000072/list.do?menuNo=500212"><span>지원현황</span></a></li>
				</c:when>
			</c:choose>
			<li class="active"><a href="/edu/archiveUser/contentsList.do?menuNo=500259&amp;workField=1" title="현재탭"><span>성과아카이브</span></a></li>
		</ul>
	</div>

     <div class="sub_contents_body archive">
     <!-- archive 클래스 추가. kmy -->
        <!--content-->
		<div class="col-12 show-table sub_board_header control_board_header">
		<div class="col-3 show-tablecell fn vm board_title online_edu_board_title">
			<h4>
				총 <span class="board_count">${resultCnt}</span> 건의 검색 결과가 있습니다.
			</h4>
		</div>
         <div class="col-7 show-tablecell fn vm tr board_sorting_con">
             <form action="/edu/archiveUser/contentsList.do?menuNo=${param.menuNo}&workField=${param.workField }" class="form-inline" method="post">
             <input type="hidden" name="workField" id="workField" value="${param.workField }" />
                 <fieldset>
                     <legend></legend>
                     <div class="sch_wrap">
                         <dl>
                            <dt>연도</dt>
					  		<dd>
					  			<span class="t1 select_box">
					  				<select id="year" name="year" title="연도" style="width:100px" class="select_style_0">
					  			    	<option value="" <c:if test="${result.year eq ''}">selected</c:if>>전체</option>
					  				    
					  				    <!-- 현재년도를 가져온다 -->
					  				    <c:set var="today" value="<%=new java.util.Date()%>" />
					  				    <!-- 형병환 : date to String -->
					  				    <fmt:formatDate value="${today}" pattern="yyyy" var="nowY"/> 
					  				    <!-- 시작년도 고정 [2020년] -->
					  			        <c:set var="sYear" value="2020" />
					  			        <!-- 반복문 개수 -->
					  			        <c:set var="endNum" value="${nowY + 3 - sYear}" />
					  				   <!-- 년도를 노출시킨다. -->
					  				    <c:forEach var="i" begin="0" end="${endNum}">
					  				    	<c:set var="yearOption" value="${sYear + i}" />
					  				    	<option value="${yearOption}" <c:if test="${param.year eq yearOption}">selected</c:if>>${yearOption}</option>
					  					</c:forEach>
					  					
					  				</select>
					  			</span>
					  		</dd>
					  	</dl>
					  	<dl>
                        	<dt>주관기관명</dt>
                            <dd>
                                <span class="tl input_search_con">
                                    <input type="text" name="organNm" id="organNm" value="${param.organNm}" class="board_search"/>
                                </span>
                            </dd>
                        </dl>
                        <dl>
                             <dt>분야</dt>
                             <dd>
                           	    <span class="t1 select_box">
								<select id="archiveField1" name="archiveField1" class="select_style_0">
									<option value="">전체</option>
									<option value='1' <c:if test="${param.archiveField1 == '1'}">selected="selected"</c:if>>영화</option>
									<option value='2' <c:if test="${param.archiveField1 == '2'}">selected="selected"</c:if>>애니메이션</option>
									<option value='3' <c:if test="${param.archiveField1 == '3'}">selected="selected"</c:if>>음악</option>
									<option value='4' <c:if test="${param.archiveField1 == '4'}">selected="selected"</c:if>>게임</option>
									<option value='5' <c:if test="${param.archiveField1 == '5'}">selected="selected"</c:if>>캐릭터</option>
									<option value='6' <c:if test="${param.archiveField1 == '6'}">selected="selected"</c:if>>만화/웹툰</option>
									<option value='7' <c:if test="${param.archiveField1 == '7'}">selected="selected"</c:if>>출판/웹소설</option>
									<option value='8' <c:if test="${param.archiveField1 == '8'}">selected="selected"</c:if>>방송/영상</option>
									<option value='9' <c:if test="${param.archiveField1 == '9'}">selected="selected"</c:if>>스토리</option>
									<option value='10' <c:if test="${param.archiveField1 == '10'}">selected="selected"</c:if>>공연</option>
									<option value='11' <c:if test="${param.archiveField1 == '11'}">selected="selected"</c:if>>VR · AR</option>
									<option value='12' <c:if test="${param.archiveField1 == '12'}">selected="selected"</c:if>>인공지능</option>
								</select>
								</span>
							  </dd>
						</dl>
						<dl>
                           <dt>과제명</dt>
                              <dd>
                                  <span class="tl input_search_con">
                                      <input type="text" name="taskNm" id="taskNm" value="${param.taskNm}" class="board_search"/>
                                      <input type="submit" class="search_summit btn-primary nav_search_btn" id="input2" name="input2" value="" title="검색">
                                  </span>
                              </dd>
                        </dl>
                     </div>
                 </fieldset>
             </form>
         </div>
     </div>
	
	<div class="photoGallery2 photoLine1">
	
		<div class="col-12 calc_wrap20">
			<c:forEach items="${resultList }" var="item3" varStatus="status">
				<div class="col-12 col-md-3 online_edu_card_wrap">
					<div class="col-12 online_edu_card_list">
						<a class="show-block" href="/edu/archiveUser/contentsDeptList.do?menuNo=${param.menuNo}&taskSeq=${item3.archiveTaskSeq}">
							<div class="img_box">
								<c:set var="files" value="${fileMap[item3.atchFileId] }"/>
								<c:if test="${fn:length(files) gt 0}">
									<c:forEach var="x" begin="0" end="${fn:length(files)-1}">
										<c:if test="${files[x].fileFieldName eq 'logImage'}">
											<c:set var="file" value="${files[x]}" />
										</c:if>
									</c:forEach>
								</c:if>
								 <c:choose>
									<c:when test="${item3.atchFileId == null or item3.atchFileId == '' }">
										<img src="/edu/images/bm/kofac_card_img_001.jpg" style="width:100%" alt="${item3.atchFileId } 임시 이미지"/>
									</c:when>
									<c:otherwise>
										<img alt="${item3.atchFileId } - 메인 이미지" src='/cmm/fms/getImage.do?atchFileId=<c:out value="${item3.atchFileId}&fileSn=1 "/>'  />
									</c:otherwise>
								</c:choose> 
							</div>
							<div class="text_box">
								<div class="online_edu_card_title">
									<h4>${item3.taskNm}</h4>
								</div>
								<div class=" online_edu_desc">
									${item3.organNm}
								</div>
								<div class=" online_edu_desc">
									${item3.archiveFieldFullNm}
								</div>
								<div class=" online_edu_desc">
									${item3.year }
								</div>
							</div>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<c:if test="${fn:length(resultList) > 0}">
		<div class="paging">${pageNav}</div>
	</c:if>


</div>
<script type="text/javascript">

</script>