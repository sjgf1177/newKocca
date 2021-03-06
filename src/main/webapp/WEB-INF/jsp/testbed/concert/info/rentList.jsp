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

<script type="text/javascript" src="/edu/js/concert/concertRentList.js"></script>

<%
Calendar gCal = Calendar.getInstance();
gCal.setTime(new Date());
int cur_year = gCal.get(Calendar.YEAR);
int cur_month = gCal.get(Calendar.MONTH)+1;
%>

<script type="text/javascript">

$(function(){

	var selectedYear = '${param.selectedYear}';
	var selectedMonth = '${paramVO.selectedMonth}';

	<c:if test="${empty param.selectedYear}">
		selectedYear =  <%= cur_year %>;
	</c:if>

	<c:if test="${param.selectedMonth eq '-1' }">
		selectedMonth = <%= cur_month %>;
	</c:if>

	concertList.defaultSetting( '${param.menuNo}', '${param.pageIndex}', 'testbed', '${paramVO.listType}', selectedYear, selectedMonth, '${param.selectedDate}' );

	$(".paginationSet").find("li>a").each(function(){
		var url = $(this).attr("href") + "&listType=${param.listType}&selectedYear=${param.selectedYear}&selectedMonth=${param.selectedMonth}&selectedDate=${param.selectedDate}&searchKeyword=${param.searchKeyword}";
		$(this).attr("href", url );
	})
	
	$(".hidden_text > .quick_btn").on("focus", function(){
		$(this).parent().parent().parent().addClass("on");
	})
	$(".hidden_text > .quick_btn").on("blur", function(){
		$(this).parent().parent().parent().removeClass("on");
	})
	
	$(window).load(function(){ // ????????? ??????
		var vVal = "";
	
		$(".calendar_date").each(function(){
			if($(this).text() != ""){
				<c:forEach items="${rentDaysList}" var="item">
					vVal = "${item.days}";
					if(vVal == $(this).text()){
						$(this).addClass("skyblue");	
					}
				</c:forEach>				
			}
		});
	});
})

</script>

<div class="over-hidden sub_contents_header">
	<div class="linemap_wrap"> <!-- fl class ?????? -->
		<ul class="col-12 linemap_con">
			<li><a href="/edu/main/main.do"><span style="clip: rect(1px, 1px, 1px, 1px); position:absolute;">Home</span></a></li>
			<li><a href="javascript:void(0);" tabindex="-1"><span>?????????????????????</span></a></li>
			<li><a href="javascript:void(0);" tabindex="-1"><span>?????? ??????</span></a></li>
		</ul>
	</div>
</div>

<div class="sub_title s_tit02">
	<div class="col-center mw-1280">?????? ??????</div>
</div>

<div class="col-center mw-1280 dream_list">

	<div class="tab_style_1_con">
		<ul class="tab_style_1 seven_tab size_24">
			<li id="tab1"><a href="/testbed/bbs/B0000061/list.do?menuNo=700112"><span>????????????</span></a></li>
			<li id="tab2"><a href="/testbed/main/contents.do?menuNo=700101"><span>????????????????????? ??????</span></a></li>
			<li id="tab3"><a href="/testbed/main/contents.do?menuNo=700103"><span>?????? ??????</span></a></li>
			<li id="tab4"><a href="/testbed/main/contents.do?menuNo=700108"><span>?????? ??????</span></a></li>
			<li id="tab5" class="active"><a href="/testbed/concert/info/rentList.do?menuNo=700137&amp;selectedMonth=-1&amp;listType=2"  title="?????????"><span>?????? ??????</span></a></li>
			<li id="tab6"><a href="/testbed/main/contents.do?menuNo=700104"><span>??????????????? ???</span></a></li>
			<li id="tab7"><a href="/testbed/bbs/B0000066/list.do?menuNo=700126"><span>?????????</span></a></li>
		</ul>
	</div>

	<div class="fontsize0 sub_contents_body sub_board_wrap">



		<!-- ?????? ?????? ?????? ?????? -->

		<div class="movie_plan_calendar_wrap active">
			<div class="movie_plan_calendar_con">
				<div class="movie_plan_view_type_select_con">
					<div class="movie_plan_view_type_select" data-concertlist-type="1" tabindex="0">
						??????
					</div>
					<div class="movie_plan_view_type_select type_2" data-concertlist-type="2" tabindex="0">
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
						<select name="" id="filterDatelyYearSelect" class="select_style_2">
							<c:set var="cYear" value="<%= cur_year %>"/>
							<c:forEach var="i" begin="2017" end="${cYear }" step="1">
								<option value="${2017 + (cYear - i)}">${2017 + (cYear - i)}???</option>
							</c:forEach>
						</select>
						<label for="filterDatelyYearSelect" class="back_label" aria-hidden="false">????????? ?????? ??????</label>
					</div>
					<div class="select_style_2_con testbed_style mobile_control mobile_control_short">
						<select name="" id="filterDatelyMonthSelect" class="select_style_2">
							<option value="12">12???</option>
							<option value="11">11???</option>
							<option value="10">10???</option>
							<option value="09">9???</option>
							<option value="08">8???</option>
							<option value="07">7???</option>
							<option value="06">6???</option>
							<option value="05">5???</option>
							<option value="04">4???</option>
							<option value="03">3???</option>
							<option value="02">2???</option>
							<option value="01">1???</option>
						</select>
						<label for="filterDatelyMonthSelect" class="back_label" aria-hidden="false">????????? ?????? ??????</label>
					</div>
				</div>
				<div class="view_by_date_calendar_con movie_plan_calendar_datepicker mobile_control_short">
					<a href="javascript:void(0)" class="view_by_date_calendar_icon">
						<img src="/edu/images/bm/view_by_date_calendar_icon.png" alt="????????? ??????">
					</a>
					<input id="view_by_date_calendar_text" type="text" class="view_by_date_calendar_text" value="31">
					<label for="view_by_date_calendar_text">????????? ??????</label>
				</div>
				<div class="calendar_style_1_wrap">
					<table class="calendar_style_1 list_style">
						<caption>???????????? ?????? ??????</caption>
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
								<a href="javascript:void(0)" class="calendar_date"></a>
							</td>
							<td>
								<a href="javascript:void(0)" class="calendar_date"></a>
							</td>
							<td>
								<a href="javascript:void(0)" class="calendar_date"></a>
							</td>
							<td>
								<a href="javascript:void(0)" class="calendar_date"></a>
							</td>
							<td>
								<a href="javascript:void(0)" class="calendar_date"></a>
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
						<select name="" id="filterMonthlyYearSelect" class="select_style_2">
							<c:set var="cYear" value="<%= cur_year %>"/>
							<c:forEach var="i" begin="2017" end="${cYear }" step="1">
								<option value="${2017 + (cYear - i)}">${2017 + (cYear - i)}???</option>
							</c:forEach>
						</select>
						<label for="filterMonthlyYearSelect">?????? ??????</label>
					</div>
					<div class="select_style_2_con testbed_style mobile_contents mobile_control">
						<select name="" id="filterMonthlyYearSelect_month" class="select_style_2">
							<option value="all">??????</option>
							<option value="12">12???</option>
							<option value="11">11???</option>
							<option value="10">10???</option>
							<option value="09">9???</option>
							<option value="08">8???</option>
							<option value="07">7???</option>
							<option value="06">6???</option>
							<option value="05">5???</option>
							<option value="04">4???</option>
							<option value="03">3???</option>
							<option value="02">2???</option>
							<option value="01">1???</option>
						</select>
						<label for="filterMonthlyYearSelect_month">??? ??????</label>
					</div>
				</div>
				<div class="movie_plan_view_select_type_2_con">
					<div class="movie_plan_view_select_title" data-concertlist-month="0" tabindex="0">
						??????
					</div>
					<div class="movie_plan_view_month_list_con">
						<div class="movie_plan_view_month_list">
							<div class="movie_plan_view_month" data-concertlist-month="1" tabindex="0">
								1???
							</div>
						</div>
						<div class="movie_plan_view_month_list">
							<div class="movie_plan_view_month" data-concertlist-month="2" tabindex="0">
								2???
							</div>
						</div>
						<div class="movie_plan_view_month_list">
							<div class="movie_plan_view_month" data-concertlist-month="3" tabindex="0">
								3???
							</div>
						</div>
						<div class="movie_plan_view_month_list">
							<div class="movie_plan_view_month" data-concertlist-month="4" tabindex="0">
								4???
							</div>
						</div>
						<div class="movie_plan_view_month_list">
							<div class="movie_plan_view_month" data-concertlist-month="5" tabindex="0">
								5???
							</div>
						</div>
						<div class="movie_plan_view_month_list">
							<div class="movie_plan_view_month" data-concertlist-month="6" tabindex="0">
								6???
							</div>
						</div>
						<div class="movie_plan_view_month_list">
							<div class="movie_plan_view_month" data-concertlist-month="7" tabindex="0">
								7???
							</div>
						</div>
						<div class="movie_plan_view_month_list">
							<div class="movie_plan_view_month" data-concertlist-month="8" tabindex="0">
								8???
							</div>
						</div>
						<div class="movie_plan_view_month_list">
							<div class="movie_plan_view_month" data-concertlist-month="9" tabindex="0">
								9???
							</div>
						</div>
						<div class="movie_plan_view_month_list">
							<div class="movie_plan_view_month" data-concertlist-month="10" tabindex="0">
								10???
							</div>
						</div>
						<div class="movie_plan_view_month_list">
							<div class="movie_plan_view_month" data-concertlist-month="11" tabindex="0">
								11???
							</div>
						</div>
						<div class="movie_plan_view_month_list">
							<div class="movie_plan_view_month" data-concertlist-month="12" tabindex="0">
								12???
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- //???/?????? -->
		</div>

		<div class="col-12 show-table sub_board_header control_board_header">
			<div class="col-5 show-tablecell fn vm board_title">
				<h4>??? <span class="board_count"><c:out value="${resultCnt }" />???</span>??? ????????????</h4>
			</div>
		</div>

		<!-- ?????? ?????? ?????? ??? -->
		<div class="col-12 sub_board_body">
			<table class="board_type_0">
				<caption>${masterVO.bbsNm} ??????</caption>
				<colgroup>
					<col width="10%">
					<col width="30%">
					<col width="">
					<col width="20%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">??????</th>
						<th scope="col">?????????</th>
						<th scope="col">??????(??????)??????</th>
						<th scope="col">?????????</th>
						<th scope="col">??????</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="result" items="${resultList}" varStatus="status">
						<tr<c:if test="${result.nttType=='1'}"> class="notice_title"</c:if>>
							<td>
								<c:out value="${result.nttType=='1' ? ' ' : (resultCnt) - (paginationInfo.pageSize * (paramVO.pageIndex-1))}" />
							</td>
							<td>${result.fcltySeNm}</td>
							<td>${result.resveDt}</td>
							<td>${result.resveNm}</td>
							<td>${result.rsts}</td>
						</tr>
						<c:set var="resultCnt" value="${resultCnt-1}" />
					</c:forEach>
					<c:if test="${fn:length(resultList) == 0}"><tr><td colspan="4">???????????? ????????????.</td></tr></c:if>
				</tbody>

			</table>
		</div>

		<!-- paging -->
		<c:if test="${fn:length(resultList) > 0}">
			<div class="paging">${pageNav}</div>
			<!-- paging end //-->
		</c:if>
		<!-- //paging -->
	</div>

</div>