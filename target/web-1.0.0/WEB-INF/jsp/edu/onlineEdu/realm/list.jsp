<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://bibeault.org/tld/ccc" prefix="ccc" %>

<ccc:constantsMap className="kr.co.unp.bbs.vo.SearchVO" var="SearchVO"/>
<style>
    .visual_wrap h2 {
        margin-bottom: 80px !important;
    }

    @media all and(min-width: 992px) {
        .visual_wrap h2 {
            margin-bottom: 100px !important;
        }
    }

    .lnb_wrap {
        display: none !important;
    }

</style>

<!--content-->

<%-- <div class="board_util_btn_con left">
<a href="/upload/onlineEdu/kocca_subj.xlsx" class="btn_style_0 full down">한국 콘텐츠 아카데미 과정 리스트 다운로드</a>
</div> --%>
<div class="over-hidden sub_contents_header">
    <div class="linemap_wrap"> <%-- fl class 삭제 --%>
        <ul class="col-12 linemap_con">
            <li><a href="/edu/main/main.do"><span style="clip: rect(1px, 1px, 1px, 1px); position:absolute;">Home</span></a></li>
            <li><a href="javascript:void(0);" tabindex="-1"><span>카테고리</span></a></li>
            <li><a href="javascript:void(0);" tabindex="-1"><span>로그인 후 수강</span></a></li>
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
    <li><a href="javascript:void(0);" onclick="fnCmdGoldSearchList('${param.pGubun1}')">바로 수강</a></li>
    <li class="after_line active"><a href="javascript:void(0);">로그인 후 수강</a></li>
</ul>

<div class="col-center mw-1280 all_view_btn_box">
    <button type="button" class="all_list_btn"><span>전체보기</span></button>
    <button type="button" class="category_list_btn"><span>카테고리로 보기</span></button>
</div>

<div class="d_flex col-12 show-table sub_board_header control_board_header mg_b20">
    <div class="col-center mw-1280">
        <div>
            <c:if test="${param.pGubun1 eq 'A' or empty param.pGubun1}">
                <select class="relation_site SL01 gubunBox" ordr="2" title="장르를 선택해주세요">
                    <option value="" title="장르">장르</option>
                    <c:forEach items="${realmTabList}" var="item" varStatus="status">
                        <c:if test="${fn:length(item.code) < 3 and item.code ne 'T0' and item.code ne 'A' and item.code ne 'O0'}">
                            <option value="${item.code}" title="${item.codenm}" <c:if test="${param.p_type eq item.code}">selected="selected"</c:if> >${item.codenm}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </c:if>

            <select class="relation_site SL02 gubunBox" ordr="3" title="대분류를 선택해주세요">
                <option value="" title="대분류">대분류</option>

                <c:if test="${param.pGubun1 ne 'A' or not empty param.pGubun1}">
                    <c:forEach items="${gubunList}" var="item" varStatus="status">
                        <option value="${item.code}" title="${item.codenm}" <c:if test="${param.p_gcd1 eq item.code}">selected="selected"</c:if> >${item.codenm}</option>
                    </c:forEach>
                </c:if>
            </select>
            <select class="relation_site SL03" title="소분류를 선택해주세요">
                <option value="" title="소분류">소분류</option>
            </select>
            <select class="relation_site SL04" title="난이도를 선택해주세요">
                <option value="" title="난이도">난이도</option>

                <c:if test="${param.pGubun1 ne 'A' or not empty param.pGubun1}">
                    <c:forEach items="${levelList}" var="item" varStatus="status">
                        <option value="${item.code}" title="${item.codenm}" <c:if test="${param.p_level eq item.code}">selected="selected"</c:if> >${item.codenm}</option>
                    </c:forEach>
                </c:if>
            </select>

            <div class="show-tablecell fn vm tr board_sorting_con">
                <form id="frm" name="frm" action="/edu/onlineEdu/${paramVO.programId}/list.do?menuNo=<c:out value='${paramVO.menuNo }'/>" method="post">
                    <input type="hidden" name="pGubun1" id="pGubun1" value='<c:out value="${not empty param.pGubun1?param.pGubun1:param.gubun }" />'/>
                    <input type="hidden" name="pGubun2" id="pGubun2" value='<c:out value="${not empty param.pGubun2?param.pGubun2:param.option1 }" />'/>
                    <input type="hidden" name="pGubun3" id="pGubun3" value='<c:out value="${not empty param.pGubun3?param.pGubun3:param.option5 }" />'/>
                    <input type="hidden" name="p_ordersnm" id="p_ordersnm" value='<c:out value="${param.p_ordersnm }"/>'/>
<%--                    <input type="hidden" name="p_orders" id="p_orders" value='<c:out value="${param.p_orders }"/>'/>--%>
                    <input type="hidden" name="p_subj" id="p_subj" value=""/>
                    <input type="hidden" name="p_subjnm" id="p_subjnm" value=""/>
                    <input type="hidden" name="p_isonoff" id="p_isonoff" value=""/>
<%--                    <input type="hidden" name="p_scupperclass" id="p_scupperclass" value=""/>--%>
                    <input type="hidden" name="p_uclassnm" id="p_uclassnm" value=""/>
                    <input type="hidden" name="p_year" id="p_year" value=""/>
                    <input type="hidden" name="p_subjseq" id="p_subjseq" value=""/>
                    <input type="hidden" name="s_subj" id="s_subj" value=""/>
                    <input type="hidden" name="s_year" id="s_year" value=""/>
                    <input type="hidden" name="s_subjseq" id="s_subjseq" value=""/>
                    <input type="hidden" name="p_type" id="p_type" value="${param.p_type }"/>
                    <input type="hidden" name="p_gcd1" id="p_gcd1" value="${param.p_gcd1}"/>
                    <input type="hidden" name="p_gcd2" id="p_gcd2" value="${param.p_gcd2}"/>
                    <input type="hidden" name="p_level" id="p_level" value="${param.p_level}"/>
                    <input type="hidden" name="p_sort" id="p_sort" value="${param.p_sort}"/>
                    <input type="hidden" name="menuNo" id="menuNo" value=""/>

                    <%-- paging s --%>
                    <input type="hidden" name="gubun" id="gubun" value="<c:out value='${param.gubun }' />"/>
                    <input type="hidden" name="pageIndex" id="pageIndex" value="<c:out value='${param.pageIndex }' />"/>
                    <%-- paging e --%>

                    <fieldset class="mo-ta_lt">
                        <legend>검색 입력폼</legend>
                        <%--<span class="process_icon_wrap">
                            <span class="icon_con">
                                <img src="/edu/images/bm/online_pc_icon.png" alt="pc과정">
                            </span>
                            <span class="icon_text">
                                PC과정
                            </span>
                        </span>
                        <span class="process_icon_wrap">
                            <span class="icon_con">
                                <img src="/edu/images/bm/online_mobile_icon.png" alt="모바일과정">
                            </span>
                            <span class="icon_text">
                                모바일과정
                            </span>
                        </span>--%>
                        <span class="tl input_search_con">
								<input type="text" name="p_searchtext" id="p_searchtext" placeholder="검색어를 입력해 주세요."
                                       title="검색어를 입력해 주세요." value="${param.p_searchtext }" maxlength="30"
                                       class="board_search"/>
								<a href="javascript:void(0);"
                                   onclick="fnCmdSearchList2('${empty param.pGubun1 ? 'A':param.pGubun1}', '${param.pGubun2 }', '${param.pGubun3 }', '', ''); return false;"
                                   class="search_summit nav_search_btn">검색</a>
							</span>
                        <button type="button" class="close_block_btn">닫기</button>
                        <button type="button" class="filter_btn">필터</button>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</div>

<div class="bg_gray_slide_box">
    <%-- 추천 클래스 start --%>
    <div class="fwo_card_list_box fwo_card01 col-center mw-1280">
        <span class="main_title" style="width: auto">추천 클래스</span>
        <sec:authorize ifAnyGranted="ROLE_USER">
            <button type="button"  class="gnb_menu myset" title="추천 클래스 설정" style="padding:5px 10px; font-size: 13px; margin-left: 10px; margin-bottom: 10px; font-weight: 600; background-color: #303030;">추천설정👆</button>
        </sec:authorize>
        <div class="fwo_card swiper-container">
            <ul class="swiper-wrapper">
                <c:forEach  items="${eduSubjList }" var="result" >
                    <li class="swiper-slide">
                            <%-- 썸네일 start --%>
                        <div class="fwo_snail_box">
                            <%--<a href="javascript:void(0);" onclick="fnSubjViewPage('${result.subj }', '${result.subjnm }', '${result.isonoff }', '${result.scupperclass }', '${result.uclassnm }', '${result.scyear }', '${result.subjseq }'); return false;">--%>
                                <c:choose>
                                    <c:when test="${result.introducefilenamenew == null or result.introducefilenamenew == '' }">
                                        <img src="/edu/images/renew2022/fwo_snail01.png" alt="이미지 설명들어가는 곳">
                                    </c:when>
                                    <c:otherwise>
                                        <img alt="${result.subjnm } - 메인 이미지" src="<c:out value="${result.introducefilenamenew}" />"  />
                                        <%--<img src="	https://edu.kocca.kr/upload/renewsnail/CB21005.png" alt="이미지 설명들어가는 곳">--%>
                                    </c:otherwise>
                                </c:choose>
                            <%--</a>--%>
                                <%-- 설명란 start--%>
                            <div class="fwo_info_box">
                                <h3 class="fwo_tit_box">
                                    <a href="javascript:void(0);" onclick="fnSubjViewPage('${result.subj }', '${result.subjnm }', '${result.isonoff }', '${result.scupperclass }', '${result.uclassnm }', '${result.scyear }', '${result.subjseq }'); return false;">
                                            ${result.subjnm }
                                    </a>
                                </h3>

                                <!-- 신규과정 일때 사용할 것 2주뒤 자동제거 기능 필요-->
                                <%--<span class="tag new">NEW</span>--%>

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
                                <p>${result.g2nm }ㆍ${result.g3nm }</p>
                                <a href="javascript:void(0);" onclick="fnSubjViewPage('${result.subj }', '${result.subjnm }', '${result.isonoff }', '${result.scupperclass }', '${result.uclassnm }', '${result.scyear }', '${result.subjseq }'); return false;" class="go_page_a"></a>
                                    <%-- <button type="button" class="fwo_like_box"><img src="/edu/images/renew2022/ico_like_off.png" alt="좋아요"></button>  --%>
                            </div>
                                <%-- 설명란 start--%>
                            <button type="button" class="jim-btn" title="찜하기">찜하기</button>
                        </div>
                            <%-- 썸네일 end --%>
                    </li>
                </c:forEach>
            </ul>

        </div>
        <%-- 방향 버튼 상황에 따라 추가 삭제가능 --%>
        <div class="swiper_btn_box">
            <div><button type="button" class="swiper-button-prev" title="이전 클래스보기"></button></div>
            <div><button type="button" class="swiper-button-next" title="다음 클래스보기"></button></div>
        </div>
    </div>
    <%-- 추천 클래스 end --%>

    <%-- 인기 클래스 start --%>
    <div class="fwo_card_list_box fwo_card02 col-center mw-1280">
        <span class="main_title">인기 클래스</span>
        <div class="fwo_card swiper-container">
            <ul class="swiper-wrapper">
                <c:forEach  items="${eduSubjPopularList }" var="result" >
                    <li class="swiper-slide">
                            <%-- 썸네일 start --%>
                        <div class="fwo_snail_box">
                            <%--<a href="javascript:void(0);" onclick="fnSubjViewPage('${result.subj }', '${result.subjnm }', '${result.isonoff }', '${result.scupperclass }', '${result.uclassnm }', '${result.scyear }', '${result.subjseq }'); return false;">--%>
                                <c:choose>
                                    <c:when test="${result.introducefilenamenew == null or result.introducefilenamenew == '' }">
                                        <img src="/edu/images/renew2022/fwo_snail01.png" alt="이미지 설명들어가는 곳">
                                    </c:when>
                                    <c:otherwise>
                                        <img alt="${result.subjnm } - 메인 이미지" src="<c:out value="${result.introducefilenamenew}" />"  />
                                    </c:otherwise>
                                </c:choose>
                            <%--</a>--%>
                                <%-- 설명란 start--%>
                            <div class="fwo_info_box">
                                <h3 class="fwo_tit_box">
                                    <a href="javascript:void(0);" onclick="fnSubjViewPage('${result.subj }', '${result.subjnm }', '${result.isonoff }', '${result.scupperclass }', '${result.uclassnm }', '${result.scyear }', '${result.subjseq }'); return false;">
                                            ${result.subjnm }
                                    </a>
                                </h3>

                                <!-- 신규과정 일때 사용할 것 2주뒤 자동제거 기능 필요-->
                                <%--<span class="tag new">NEW</span>--%>

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
                                <p>${result.g2nm }ㆍ${result.g3nm }</p>
                                <a href="javascript:void(0);" onclick="fnSubjViewPage('${result.subj }', '${result.subjnm }', '${result.isonoff }', '${result.scupperclass }', '${result.uclassnm }', '${result.scyear }', '${result.subjseq }'); return false;" class="go_page_a"></a>
                                    <%-- <button type="button" class="fwo_like_box"><img src="/edu/images/renew2022/ico_like_off.png" alt="좋아요"></button>  --%>
                            </div>
                                <%-- 설명란 start --%>
                            <button type="button" class="jim-btn" title="찜하기">찜하기</button>
                        </div>
                            <%-- 썸네일 end --%>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <%-- 방향 버튼 상황에 따라 추가 삭제가능 --%>
        <div class="swiper_btn_box">
            <div><button type="button" class="swiper-button-prev" title="이전 클래스보기"></button></div>
            <div><button type="button" class="swiper-button-next" title="다음 클래스보기"></button></div>
        </div>

    </div>
    <%-- 인기 클래스 end --%>
</div>

<div class="mo-ta_lt mo-mb_20 show-tablecell fn vm board_title online_edu_board_title col-center mw-1280">
    <%--<h4 class="display_IB pd_t12">
        검색 건 수 :  <span class="board_count">${resultCnt}</span> 건
    </h4>--%>
    <select class="relation_site sortBox mg_t20" id="s_sort" name="s_sort" title="정렬순서">
        <option value="N" title="최신순" <c:if test="${param.p_sort eq 'N'}">selected="selected"</c:if>>최신순</option>
        <option value="O" title="오래된순" <c:if test="${param.p_sort eq 'O'}">selected="selected"</c:if>>오래된순</option>
        <option value="V" title="시청많은순" <c:if test="${param.p_sort eq 'V'}">selected="selected"</c:if>>시청많은순</option>
    </select>
</div>

<%-- 전체보기 일때--%>
<div class="photoGallery2 photoLine1 mg_t5 fwo_card_list_box col-center mw-1280 all-list-wrap off">
    <div class="all-list-box">
        <c:forEach  items="${subjList }"  var="result" >
            <div class="fwo_card">
                <%--<a class="show-block" href="javascript:void(0);" onclick="fnCmdViewPage('${result.subj }', '${result.subjnm }', '${result.isonoff }', '${result.scupperclass }', '${result.uclassnm }', '${result.scyear }', '${result.subjseq }'); return false;">--%>
                    <% pageContext.setAttribute("crlf", "\\"); %>
                    <div class="fwo_snail_box">
                        <c:choose>
                            <c:when test="${result.introducefilenamenew == null or result.introducefilenamenew == '' }">
                                <img src="/edu/images/renew2022/fwo_snail01.png" alt="이미지 설명들어가는 곳">
                            </c:when>
                            <c:otherwise>
                                <img alt="${result.subjnm } - 메인 이미지" src="<c:out value="${result.introducefilenamenew}" />" onerror="this.src='/edu/images/renew2022/non_img.png'"/>
                            </c:otherwise>
                        </c:choose>
                            <%-- 설명란 start--%>
                        <div class="fwo_info_box">
                            <h3 class="fwo_tit_box">
                                <a href="javascript:void(0);" onclick="fnCmdViewPage('${result.subj }', '${result.subjnm }', '${result.isonoff }', '${result.scupperclass }', '${result.uclassnm }', '${result.scyear }', '${result.subjseq }'); return false;">${result.subjnm }</a>
                            </h3>

                            <!-- 신규과정 일때 사용할 것 2주뒤 자동제거 기능 필요-->
                            <%--<span class="tag new">NEW</span>--%>

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
                                <c:if test="${not empty result.g3nm}">
                                    ${result.g3nm}
                                </c:if>

                                <c:if test="${empty result.g3nm}">
                                    ${result.g2nm}
                                </c:if>
                            </p>
                        </div>
                            <%-- 설명란 end--%>
                        <button type="button" class="jim-btn" title="찜하기">찜하기</button>
                    </div>
                <%--</a>--%>
            </div>
        </c:forEach>
    </div>
    <c:if test="${fn:length(subjList) > 0}">
        <div class="paging">${pageNav}</div>
    </c:if>
</div>

<%-- 대분류 --%>
<div class="col-center mw-1280 dae-list-box">
<c:if test="${fn:length(resultList) > 0}">
    <c:set var="mainTitle" value=""/>
    <c:set var="cardNo" value="3"/>
    <c:forEach items="${resultList }" var="item3" varStatus="status3">
        <c:if test="${status3.first eq false}">
            <c:if test="${mainTitle ne item3.g2nm}">
                </div>
                </div>
                <%-- 방향 버튼 상황에 따라 추가 삭제가능 --%>
                <div class="swiper_btn_box">
                    <div><button type="button" class="swiper-button-prev" title="이전 클래스보기"></button></div>
                    <div><button type="button" class="swiper-button-next" title="다음 클래스보기"></button></div>
                </div>
                </div>
            </c:if>
        </c:if>
        <c:if test="${mainTitle ne item3.g2nm}">
            <div class="photoGallery2 photoLine1 mg_t5 fwo_card_list_box fwo_card0${cardNo}">
            <span class="main_title">${item3.g2nm}</span>
            <div class="fwo_card swiper-container">
            <div class="swiper-wrapper">
            <c:set var="mainTitle" value="${item3.g2nm}"/>
            <c:set var="cardNo" value="${cardNo + 1}"/>
        </c:if>
        <div class="swiper-slide">
            <div class="">
                <%--<a class="show-block" href="javascript:void(0);"
                   onclick="fnCmdViewPage('${item3.subj }', '${item3.subjnm }', '${item3.isonoff }', '${item3.scupperclass }', '${item3.uclassnm }', '${item3.scyear }', '${item3.subjseq }'); return false;">--%>
                    <% pageContext.setAttribute("crlf", "\\"); %>
                    <div class="fwo_snail_box">
                        <c:choose>
                            <c:when test="${item3.introducefilenamenew == null or item3.introducefilenamenew == '' }">
                                <img src="/edu/images/renew2022/fwo_snail01.png" alt="이미지 설명들어가는 곳">
                            </c:when>
                            <c:otherwise>
                                <img alt="${item3.subjnm } - 메인 이미지" src="<c:out value="${item3.introducefilenamenew}" />" onerror="this.src='/edu/images/renew2022/non_img.png'"/>
                            </c:otherwise>
                        </c:choose>
                            <%-- 설명란 start --%>
                        <div class="fwo_info_box">
                            <h3 class="fwo_tit_box">
                                <a href="javascript:void(0);"
                                   onclick="fnCmdViewPage('${item3.subj }', '${item3.subjnm }', '${item3.isonoff }', '${item3.scupperclass }', '${item3.uclassnm }', '${item3.scyear }', '${item3.subjseq }'); return false;">${item3.subjnm }</a>
                            </h3>

                            <!-- 신규과정 일때 사용할 것 2주뒤 자동제거 기능 필요-->
                            <%--<span class="tag new">NEW</span>--%>

                            <c:if test="${not empty item3.lvnm}">
                                <c:choose>
                                    <c:when test="${item3.lvcd eq 'L0101' or item3.lvcd eq 'L0201'}">
                                        <span class="tag L1">${item3.lvnm}</span>
                                    </c:when>
                                    <c:when test="${item3.lvcd eq 'L0102' or item3.lvcd eq 'L0202'}">
                                        <span class="tag L2">${item3.lvnm}</span>
                                    </c:when>
                                    <c:when test="${item3.lvcd eq 'L0103' or item3.lvcd eq 'L0203'}">
                                        <span class="tag L3">${item3.lvnm}</span>
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

                            <%-- <button type="button" class="fwo_like_box"><img src="/edu/images/renew2022/ico_like_off.png" alt="좋아요"></button>  --%>
                        </div>
                        <%-- 설명란 start --%>
                        <button type="button" class="jim-btn" title="찜하기">찜하기</button>
                    </div>
                    <%--<c:if test="${item3.isnew eq 'Y' }">
                        <c:if test="${ item3.ishit eq 'N'}">
                            <c:if test="${ item3.isrecom eq 'Y'}">
                                <span style="color: #3B85FF;">[New]</span>
                                &lt;%&ndash;
                                <img src="http://mail2.kocca.kr:8090/template/template/20180703152920/561/New_2_2.jpg" alt="New" >
                                &ndash;%&gt;
                            </c:if>
                        </c:if>
                    </c:if>
                    ${item3.subjnm }--%>
                <%--</a>--%>
            </div>
        </div>

        <c:if test="${status3.last eq true}">
            </div>
            </div>
            <%-- 방향 버튼 상황에 따라 추가 삭제가능 --%>
            <div class="swiper_btn_box">
                <div><button type="button" class="swiper-button-prev" title="이전 클래스보기"></button></div>
                <div><button type="button" class="swiper-button-next" title="다음 클래스보기"></button></div>
            </div>
            </div>
        </c:if>
    </c:forEach>
</c:if>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        var tabNavControl = $('#tabNavCtrl>li>a').not(':first');
        var subNavLayer = $('.tabSubNav')
        $(tabNavControl).each(function (index, el) {
            $(this).click(function (event) {
                $(this).parent().addClass('active').siblings().removeClass('active');
                $(subNavLayer).hide();
                $(this).next('.tabSubNav').show();
                return false;
            });
        });
        var subNavLayer = $('.tabSubNav')
        $('.tabSubClose').each(function (index, el) {
            $(this).click(function (event) {
                $(subNavLayer).hide();
            });
        });

        //과정 조회 enter key
        $("#p_searchtext").keydown(function (e) {
            if (e.keyCode == 13) fnCmdSearchList2('${empty param.pGubun1 ? "A":param.pGubun1}', '${param.pGubun2 }', '${param.pGubun3 }', '', '');
        });

        $(".item2Tab").change(function () {
            $(this).parent(".tabSubNav").find(".subList").hide();
            $("#" + $(this).val()).show();
        });

        $('#option1').change(fnComChangeGubun);
        $('#option5').change(fnComChangeGubun);

        $(".gubunBox").change(function () {
            fnLvCodeList($(this));
        });

        $(".sortBox").change(function () {
            fnCmdSearchList2('${param.pGubun1}', '', '', '', '');
        });

        if ($(".SL01").val() != "") {
            fnLvCodeList($(".SL01"));
        }

        if ($(".SL02").val() != "") {
            fnLvCodeList($(".SL02"));
        }

        if('${param.p_list_type}' == 'C') {
            $(".all-list-wrap").toggleClass('on'); //전체 리스트 보기
            $(".dae-list-box").toggleClass('off'); // 슬라이드 숨기기
            $(".category_list_btn").toggleClass('on'); // 카테고리로 버튼 보기
            $(".all_list_btn").toggleClass('off'); //전체보기 버튼 보기
        } else {
/*           if('${param.p_list_type}'.length > 0) {
               $("#frm").attr({
                   action: "/edu/onlineEdu/realm/list.do?menuNo=<c:out value='${paramVO.menuNo }'/>",
                   method: "post",
                   target: "_self"
               });
               $("#frm").submit();
           }*/
        }
    });

    //하위 분류코드 목록
    function fnLvCodeList($this) {
        var ordr = $this.attr("ordr");
        var code = $this.val();

        $.ajax({
            type: "POST",
            url: "/edu/onlineEdu/realm/gubunList.json",
            data: {
                "p_ordr": ordr,
                "p_code": code
            },
            cache: false,
            async: false,
            dataType: "JSON",
            success: function (data) {
                if (ordr == 2) {
                    $(".SL02").empty();
                    $(".SL02").append("<option value=''>대분류</option>");
                    $.each(data.gubunList, function (idx, item) {
                        if ('${param.p_gcd1}' == item.code) {
                            $(".SL02").append("<option value=\"" + item.code + "\" selected='selected'>" + item.codenm + "</option>");
                        } else {
                            $(".SL02").append("<option value=\"" + item.code + "\">" + item.codenm + "</option>");
                        }
                    });

                    $(".SL03").empty();
                    $(".SL03").append("<option value=''>소분류</option>");

                    $(".SL04").empty();
                    $(".SL04").append("<option value=''>난이도</option>");
                    $.each(data.levelList, function (idx, item) {
                        if ('${param.p_level}' == item.code) {
                            $(".SL04").append("<option value=\"" + item.code + "\" selected='selected'>" + item.codenm + "</option>");
                        } else {
                            $(".SL04").append("<option value=\"" + item.code + "\">" + item.codenm + "</option>");
                        }
                    });
                } else if (ordr == 3) {
                    $(".SL03").empty();
                    $(".SL03").append("<option value=''>소분류</option>");
                    $.each(data.gubunList, function (idx, item) {
                        if ('${param.p_gcd2}' == item.code) {
                            $(".SL03").append("<option value=\"" + item.code + "\" selected='selected'>" + item.codenm + "</option>");
                        } else {
                            $(".SL03").append("<option value=\"" + item.code + "\">" + item.codenm + "</option>");
                        }
                    });
                }
            },
            error: function () {
                alert("서버와 통신 실패");
            }
        });
    }

    //과정 조회
    function fnCmdSearchList(gubun1, gubun2, gubun3, ordersnm, orders) {
        $("#pGubun1").val(gubun1);
        $("#pGubun2").val(gubun2);
        $("#pGubun3").val(gubun3);
        $("#option1").val(gubun2);
        $("#option5").val(gubun3);
        $("#p_ordersnm").val(ordersnm);
        $("#p_orders").val(orders);

        $("#pageIndex").val("1");
        $("#p_searchtext").val("");
        $("#p_type").val("");
        $("#p_gcd1").val("");
        $("#p_gcd2").val("");
        $("#p_level").val("");
        $("#p_sort").val("N");

        $("#frm").attr({
            action: "/edu/onlineEdu/realm/list.do?menuNo=<c:out value='${paramVO.menuNo }'/>",
            method: "post",
            target: "_self"
        });
        $("#frm").submit();
    }

    //과정 조회
    function fnCmdSearchList2(gubun1, gubun2, gubun3, ordersnm, orders) {
        $("#pGubun1").val(gubun1);
        $("#pGubun2").val(gubun2);
        $("#pGubun3").val(gubun3);
        $("#option1").val(gubun2);
        $("#option5").val(gubun3);
        $("#p_ordersnm").val(ordersnm);
        $("#p_orders").val(orders);

        $("#p_type").val($(".SL01").val());
        $("#p_gcd1").val($(".SL02").val());
        $("#p_gcd2").val($(".SL03").val());
        $("#p_level").val($(".SL04").val());
        $("#p_sort").val($("#s_sort").val());

        $("#pageIndex").val("1");
        $("#p_searchtext").val($.trim($("#p_searchtext").val()));

        $("#frm").attr({
            action: "/edu/onlineEdu/realm/list.do?menuNo=<c:out value='${param.menuNo }'/>",
            method: "post",
            target: "_self"
        });
        $("#frm").submit();
    }

    function fnComChangeGubun() {
        $("#pGubun1").val("${empty param.pGubun1 ? 'A' : param.pGubun1}");
        $("#pGubun2").val($('#option1').val());
        $("#pGubun3").val($('#option5').val());
        $("#p_ordersnm").val('');
        $("#p_orders").val('');

        $("#pageIndex").val("1");
        $("#p_searchtext").val($.trim($("#p_searchtext").val()));
        $("#frm").attr({
            action: "/edu/onlineEdu/realm/list.do?menuNo=<c:out value='${paramVO.menuNo }'/>",
            method: "post",
            target: "_self"
        });
        $("#frm").submit();
    }

    //과정 상세화면
    function fnCmdViewPage(subj, subjnm, isonoff, scupperclass, uclassnm, year, subjseq) {
        $("#p_subj").val(subj);
        $("#p_subjnm").val(subjnm);
        $("#p_isonoff").val(isonoff);
        $("#p_scupperclass").val(scupperclass);
        $("#p_uclassnm").val(uclassnm);
        $("#p_year").val(year);
        $("#p_subjseq").val(subjseq);

        $("#s_subj").val(subj);
        $("#s_year").val(year);
        $("#s_subjseq").val(subjseq);

        $("#frm").attr({
            action: "/edu/onlineEdu/realm/view.do?menuNo=<c:out value='${param.menuNo }'/>&p_subj=" + subj + "&p_subjseq=" + subjseq + "&p_year=" + year + "&gubun=" + $("#pGubun1").val() + "&option1=" + $("#pGubun2").val() + "&option5=" + $("#pGubun3").val() + "&pageIndex=<c:out value='${param.pageIndex}' />",
            method: "post",
            target: "_self"
        });
        $("#frm").submit();
    }

    function fnCmdGoldSearchList(gubun){
        if(gubun){
            $("#gubun").val(gubun == "ALL" ? "" : gubun);
        }

        $("#pageIndex").val("1");
        $("#searchWrd").val("");
        $("#p_type").val("");
        $("#p_gcd1").val("");
        $("#p_gcd2").val("");
        $("#p_level").val("");
        $("#p_sort").val("N");
        $("#menuNo").val("500085");

        $("#frm").attr({
            action:"/edu/onlineEdu/openLecture/list.do",
            method:"post",
            target:"_self"
        });
        $("#frm").submit();
    }
</script>
