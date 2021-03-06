<%@page import="java.util.Date"%>
<%@page import="com.ibm.icu.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="kr.co.testbed.concert.service.ConcertMngService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="util" uri="http://www.unp.co.kr/util" %>

<script type="text/javascript" src="/edu/js/concert/Dom.js"></script>
<script type="text/javascript" src="/edu/js/concert/ProgressBar.js"></script>
<script type="text/javascript" src="/edu/js/concert/Form.js"></script>
<script type="text/javascript" src="/edu/js/concert/Number.js"></script>
<script type="text/javascript" src="/edu/js/concert/String.js"></script>
<script type="text/javascript" src="/edu/js/concert/Calendar.js"></script>

<script type="text/javascript" src="/edu/js/concert/concertListMobile.js"></script>

<%
    Calendar gCal = Calendar.getInstance();
	gCal.setTime(new Date());
	int cur_year = gCal.get(Calendar.YEAR);
	int cur_month = gCal.get(Calendar.MONTH)+1;
%>
<script type="text/javascript">

$(function(){
	
	var selectedYear = '${param.selectedYear}';
	var selectedMonth = '${param.selectedMonth}';

    <c:if test="${empty param.selectedYear}">
		selectedYear =  <%= cur_year %>;
	</c:if>
    
    <c:if test="${param.selectedMonth eq '-1' }">
		selectedMonth = <%= cur_month %>;
    </c:if>

	concertList.defaultSetting( '${param.menuNo}', '${param.pageIndex}', 'edumobile', '${param.listType}', selectedYear, selectedMonth, '${param.selectedDate}' );
	
	
	$(".paginationSet").find("li>a").each(function(){
		var url = $(this).attr("href") + "&listType=${param.listType}&selectedYear=${param.selectedYear}&selectedMonth=${param.selectedMonth}&selectedDate=${param.selectedDate}&searchKeyword=${param.searchKeyword}";
		$(this).attr("href", url );
	})
})

</script>


<div class="fontsize0 sub_contents_body sub_board_wrap">



	<!-- ?????? ?????? ?????? ?????? -->
	<!-- ${paramVO.listType} -->
	<div class="movie_plan_calendar_wrap active"> 
        <div class="movie_plan_calendar_con">
            <div class="movie_plan_view_type_select_con">
                <div class="movie_plan_view_type_select" data-concertlist-type="1" role="button" aria-label="??????" ${paramVO.listType eq 1?'title="?????????"':'' }>
                    ??????
                </div>
                <div class="movie_plan_view_type_select type_2" data-concertlist-type="2" role="button" aria-label="???/??????" ${paramVO.listType eq 2?'title="?????????"':'' }>
                    ???/??????
                </div>
            </div>
            <div class="calendar_icon_con">
                <div class="movie_calendar_icon">
                    <img src="/edu/images/bm/movie_calendar_icon.png" alt="CALENDAR">
                </div>
                <div class="movie_calendar_icon_text">
                    CALENDAR
                </div>
            </div>
            <hr class="calendar_seperate_line">
            <div class="movie_calendar_year">
            </div>
            <div class="movie_calendar_date">
                <span class="movie_calendar_date_color">
                </span>
                <span class="movie_calendar_date_text">
                </span>
            </div>
        </div>
        
        <!-- ?????? -->
        <div class="movie_plan_calendar_view_con">
            <div class="mb14 movie_plan_view_select_con mobile_control_short_con">
                <div class="mr-md-10 select_style_2_con testbed_style mobile_control mobile_control_short">
                    <select name="" id="filterDatelyYearSelect" class="select_style_2" title="????????? ?????? ??????">
                        <option value="2018">2018???</option>
                        <option value="2017">2017???</option>
                        <option value="2016">2016???</option>
                    </select>
                    <label for="filterDatelyYearSelect" class="back_label" aria-hidden="false">????????? ?????? ??????</label>
                </div>
                <div class="select_style_2_con testbed_style mobile_control mobile_control_short">
                    <select name="" id="filterDatelyMonthSelect" class="select_style_2" title="????????? ?????? ??????">
                        <option value="12">12???</option>
                        <option value="11">11???</option>
                        <option value="10">10???</option>
                        <option value="9">9???</option>
                        <option value="8">8???</option>
                        <option value="7">7???</option>
                        <option value="6">6???</option>
                        <option value="5">5???</option>
                        <option value="4">4???</option>
                        <option value="3">3???</option>
                        <option value="2">2???</option>
                        <option value="1">1???</option>
                    </select>
                    <label for="filterDatelyMonthSelect" class="back_label" aria-hidden="false">????????? ?????? ??????</label>
                </div>
            </div>
            <div class="view_by_date_calendar_con movie_plan_calendar_datepicker mobile_control_short">
                <span href="javascript:void(0)" class="view_by_date_calendar_icon" aria-hidden="true">
                    <img src="/edu/images/bm/view_by_date_calendar_icon.png" alt="????????? ??????">
                </span>
                <input type="button" class="view_by_date_calendar_text" value="31" readonly="true" title="?????? ??????">
            </div>
            <div class="calendar_style_1_wrap">
                <table class="calendar_style_1 list_style">
                    <caption>(?????????????????????) ???????????? ??????</caption>
                    <colgroup>
                        <col width="14.28%">
                        <col width="14.28%">
                        <col width="14.28%">
                        <col width="14.28%">
                        <col width="14.28%">
                        <col width="14.28%">
                        <col width="14.28%">
                    </colgroup>
                    <thead>
                    <tr>
                    	<th>Su</th>
                        <th>Mo</th>
                        <th>Tu</th>
                        <th>We</th>
                        <th>Th</th>
                        <th>Fr</th>
                        <th>Sa</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="cal_row">
                        <td>
                            <a href="javascript:void(0)" class="calendar_date"></a>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="calendar_date"></a>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="calendar_date">
                            </a>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="calendar_date">
                            </a>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="calendar_date">
                            </a>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="calendar_date">
                            </a>
                        </td>
                        <td>
                            <a href="javascript:void(0)" class="calendar_date">
                            </a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <!-- //?????? -->
        
        <!-- ???/?????? -->
        <div class="movie_plan_calendar_view_con type_2">
	        <div class="mb-md-47 movie_plan_view_select_con">
	            <div class="mr-md-10 select_style_2_con testbed_style mobile_control">
	                <select name="" id="filterMonthlyYearSelect" class="select_style_2" title="?????? ??????">
                        <option value="2018">2018???</option>
                        <option value="2017">2017???</option>
                        <option value="2016">2016???</option>
	                </select>
	                <label for="filterMonthlyYearSelect" class="back_label" aria-hidden="false">?????? ??????</label>
	            </div>
	            <div class="select_style_2_con testbed_style mobile_contents mobile_control">
	                <select name="" id="filterMonthlyMonthSelect" class="select_style_2" title="??? ??????">
	                    <option value="">??????</option>
	                    <option value="12">12???</option>
	                    <option value="11">11???</option>
	                    <option value="10">10???</option>
	                    <option value="9">9???</option>
	                    <option value="8">8???</option>
	                    <option value="7">7???</option>
	                    <option value="6">6???</option>
	                    <option value="5">5???</option>
	                    <option value="4">4???</option>
	                    <option value="3">3???</option>
	                    <option value="2">2???</option>
	                    <option value="1">1???</option>
	                </select>
	                <label for="filterMonthlyMonthSelect" class="back_label" aria-hidden="false">??? ??????</label>
	            </div>
	        </div>
	        <div class="movie_plan_view_select_type_2_con">
	            <div class="movie_plan_view_select_title" data-concertlist-month="0">
	                ??????
	            </div>
	            <div class="movie_plan_view_month_list_con">
	                <div class="movie_plan_view_month_list">
	                    <div class="movie_plan_view_month" data-concertlist-month="1">
	                        1???
	                    </div>
	                </div>
	                <div class="movie_plan_view_month_list">
	                    <div class="movie_plan_view_month" data-concertlist-month="2">
	                        2???
	                    </div>
	                </div>
	                <div class="movie_plan_view_month_list">
	                    <div class="movie_plan_view_month" data-concertlist-month="3">
	                        3???
	                    </div>
	                </div>
	                <div class="movie_plan_view_month_list">
	                    <div class="movie_plan_view_month" data-concertlist-month="4">
	                        4???
	                    </div>
	                </div>
	                <div class="movie_plan_view_month_list">
	                    <div class="movie_plan_view_month" data-concertlist-month="5">
	                        5???
	                    </div>
	                </div>
	                <div class="movie_plan_view_month_list">
	                    <div class="movie_plan_view_month" data-concertlist-month="6">
	                        6???
	                    </div>
	                </div>
	                <div class="movie_plan_view_month_list">
	                    <div class="movie_plan_view_month" data-concertlist-month="7">
	                        7???
	                    </div>
	                </div>
	                <div class="movie_plan_view_month_list">
	                    <div class="movie_plan_view_month" data-concertlist-month="8">
	                        8???
	                    </div>
	                </div>
	                <div class="movie_plan_view_month_list">
	                    <div class="movie_plan_view_month" data-concertlist-month="9">
	                        9???
	                    </div>
	                </div>
	                <div class="movie_plan_view_month_list">
	                    <div class="movie_plan_view_month" data-concertlist-month="10">
	                        10???
	                    </div>
	                </div>
	                <div class="movie_plan_view_month_list">
	                    <div class="movie_plan_view_month" data-concertlist-month="11">
	                        11???
	                    </div>
	                </div>
	                <div class="movie_plan_view_month_list">
	                    <div class="movie_plan_view_month" data-concertlist-month="12">
	                        12???
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
		<!-- //???/?????? -->    
    </div>
	
	
	
	
    
    <!-- ?????? ?????? ?????? ??? -->

	<div class="col-12 movie_plan_orderby_list">
		<div class="col-12 show-table sub_board_header control_board_header">
			<div class="col-5 show-tablecell fn vm board_title">
			    <h4>??? <span class="board_count"><c:out value="${resultCnt}" />???</span>??? ????????????</h4>
			</div>
			<%--<div class="col-7 show-tablecell fn vm tr board_sorting_con">
		        <input type="hidden" name="menuNo" value="700101">
				<input type="hidden" name="pageQueryString" value="searchCnd=&amp;searchWrd=&amp;gubun=&amp;delCode=0&amp;useAt=&amp;replyAt=&amp;menuNo=500045&amp;sdate=&amp;edate=&amp;viewType=&amp;type=&amp;siteId=&amp;option1=&amp;option5=&amp;pageIndex=1">
	            <span class="tl select_box">
	                <select name="searchKey" id="searchKey" class="select_style_0">
	                    <option value="concertTitle" >??????</option>
	                    <option value="concertExplain">????????????</option>
	                </select>
	                <label for=""></label>
	            </span>
	             <span class="tl input_search_con">
	                <input type="text" class="board_search" name="searchWrd" id="searchWrd" title="???????????? ????????? ?????????." placeholder="????????? ??????" value="${param.searchWrd}">
	                <input type="submit" id="input2" name="input2" value="" class="search_summit btn-primary">
	            </span> 
		    </div>--%>
		</div>
		
		
		<div class="col-12" id="cardListView" style="<c:if test="${ ( param.listType == 2 ) && ( param.selectedMonth == 0 ) }">display:none;</c:if>" >
			<div class="col-12 sub_contents_view_calendar">
			    <div class="col-12 calc_wrap25">
			    <c:forEach var="result" items="${resultList}" varStatus="status">
					<c:set value="${fileMap[result.atchFileId] }" var="fileList" />
					<c:set var="file" value=""/>
					<c:forEach var="files" items="${fileList}">
						<c:if test="${files.fileFieldName eq 'posterImg'}">
							<c:set  var="file" value="${files}"/>
						</c:if>
					</c:forEach>
			    	<div class="col-12 col-sm-4 sub_contents_view_calendar_list">
			            <a class="border_box" alt="[<c:out value="${result.concertType}" />] <c:out value="${result.concertTitle}"/> - ??????????????? ????????????" href="/${paramVO.siteName}/concert/info/view.do?concertId=${result.concertId}&${pageQueryString}&listType=${param.listType}&selectedYear=${param.selectedYear}&selectedMonth=${param.selectedMonth}&selectedDate=${param.selectedDate}">
			                <div class="img_box">
			                    <div class="hidden_text_wrap">
			                        <div class="hidden_text_con">
			                            <div class="hidden_text">
			                            	<div class="quick_btn">
		                                    	????????????
		                                    </div>
			                            </div>
			                        </div>
			                    </div>
			                    <c:if test="${not empty file }">
			                    <div class="img_box_inner" style="background-image:url('/cmm/fms/getImage.do?atchFileId=${file.atchFileId}&amp;fileSn=${file.fileSn}'); background-size:cover;">
			                    	<%-- 
			                            <img class="123" src="/cmm/fms/getImage.do?atchFileId=${file.atchFileId}&amp;fileSn=${file.fileSn}" alt="<c:out value="${result.nttSj}"/>" />
			                        
			                            <!-- ???????????? --><img class="" src="" alt="???????????? ???????????? ????????????" />
			                        </c:if> --%>
			                    </div>
			                    </c:if>
			                    <c:if test="${empty file }">
			                    <div class="img_box_inner">
			                    </div>
			                    </c:if>
			                </div>
			                <div class="text_box">
			                    <h5>
			                    	<span class="concert_title">[<c:out value="${result.concertType}" />]</span>
			                        <c:out value="${result.concertTitle}"/>
			                    </h5>
			                    <p class="h_data5">
			                        ??????  :
			                        <span class="point0">${result.concertStartDate} (${result.startDy}) ~<br/><span class="h_enddate5">${result.concertEndDate} (${result.endDy})</span></span>
			                    </p>
			                </div>
		                </a>
			        </div>
			        
		        </c:forEach>
		        
		        <c:if test="${ resultCnt == 0 }">
			        <div class="col-12 col-sm-4 sub_contents_view_calendar_list nodata">
			            <div class="border_box">
			                <div class="img_box">
			                    <div class="img_box_inner">
			                    </div>
			                </div>
			                <div class="text_box">
			                    <h5>
			                    	????????? ??????????????? ????????????.
			                    </h5>
			                    <p class="h_data5">
			                    </p>
			                </div>
			            </div>
			        </div>	
				</c:if>
			        
			    </div>
			</div>
		<c:if test="${fn:length(resultList) > 0}">
			<div class="paging">
				<div class="paginationSet">
					${pageNav}
				</div>
			</div>
		</c:if>
		
		</div>
			
		<div class="col-12 movie_plan_monthly_list" id="monthlyListView" style="<c:if test="${ ( param.listType != 2 ) || ( param.selectedMonth != 0 ) }">display:none;</c:if>">
		    <table class="board_type_0 contents_table">
		        <caption>(?????????????????????) ?????? ?????? ??????</caption>
		        <colgroup>
		            <col width="15%">
		            <col width="30%">
		            <col width="auto">
		        </colgroup>
		        <thead>
		        <tr>
		            <th>
		                ???
		            </th>
		            <th>
		                ?????????
		            </th>
		            <th>
		                ??????
		            </th>
		        </tr>
		        </thead>
		        <tbody>
		        
		        <c:forEach var="result" items="${resultList}" varStatus="status">
					<c:set value="${fileMap[result.atchFileId] }" var="fileList" />
					<c:set var="file" value=""/>
					<c:forEach var="files" items="${fileList}">
						<c:if test="${files.fileFieldName eq 'posterImg'}">
							<c:set  var="file" value="${files}"/>
						</c:if>
					</c:forEach>
					<tr data-concert-month="${result.mm}" data-concert-date="${result.dd}">
			            <td class="monthly_title">${result.mm}???</td>
			            <td>${result.dd }???</td>
			            <td class="monthly_desc">
			            	<a class="quick_btn" style="display:inline;" 
			            	href="/${paramVO.siteName}/concert/info/view.do?concertId=${result.concertId}&${pageQueryString}&listType=${param.listType}&selectedYear=${param.selectedYear}&selectedMonth=${param.selectedMonth}&selectedDate=${param.selectedDate}">
			            		<c:out value="${result.concertTitle }" />
			            	</a>
			            </td>
			        </tr>
					</c:forEach>
					<c:if test="${ resultCnt == 0 }">
					<tr>
						<td colspan="3">
                    		????????? ??????????????? ????????????.
						</td>
					</tr>
				</c:if>
		        </tbody>
		    </table>
		</div>
		
	</div>
</div>




