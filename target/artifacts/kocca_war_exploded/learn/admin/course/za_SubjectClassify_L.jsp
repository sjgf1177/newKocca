<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page errorPage="/learn/library/error.jsp"%>
<%@ page import="com.credu.library.RequestBox"%>
<%@ page import="com.credu.library.RequestManager"%>
<%@ page import="com.credu.library.DataBox"%>
<%@ page import="java.util.ArrayList"%>

<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    ArrayList onlineList = (ArrayList)request.getAttribute("onlineList");
    ArrayList categoryList = (ArrayList)request.getAttribute("categoryList");
    ArrayList jobList = (ArrayList)request.getAttribute("jobList");
    ArrayList lvCdList = (ArrayList)request.getAttribute("lvCdList");

    DataBox dbox = null;
    DataBox dbox1 = null;

    String upperClsCd = box.getStringDefault("upperClsCd", "0000");
%>

<html>
<head>
<title>목록 조회 | 과정분류 관리 | 과정 | 관리자 | 한국콘텐츠아카데미</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="/css/admin_style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">

<style type="text/css">
button {
	display: inline-block;
	padding: 2px 4px 0px 4px;
	margin-bottom: 0;
	font-size: 12px;
	font-weight: normal;
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	border-style: solid 1px;
}

button.btn_reg {
	width: 80px;
	height: 20px;
	background-color: #efefef;
	color: #000000;
	border-color: #808080;
	border-width: 1px;
}

input.btn_reg {
	width: 80px;
	height: 20px;
	background-color: #efefef;
	color: #000000;
	border-color: #808080;
	border-width: 1px;
	text-align: center;
}

button.btn_basic {
	width: 80px;
	height: 20px;
	background-color: #efefff;
	color: #000000;
	border-color: #808090;
	border-width: 1px;
}
</style>

<script type="text/javascript" src="/script/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type="text/javascript">
<!--
/**
 * 탭 선택. 인덱스 값을 설정한다.
 */
function fnSelectTab( area ) {
	
	var tab = $('#'+area+'Tab');
	if(tab){
		$(tab).parent().parent().find('table').each(function(){
			$(this).find('td:eq(0)').removeClass("blue_butt_left").addClass("black_butt_left");
	        $(this).find('td:eq(1)').removeClass("blue_butt_top").addClass("black_butt_top");
	        $(this).find('td:eq(2)').removeClass("blue_butt_right").addClass("black_butt_right");
	        $(this).find('td:eq(3)').removeClass("blue_butt_middle").addClass("black_butt_middle");
	        $(this).find('td:eq(4)').removeClass("blue_butt_bottom").addClass("black_butt_bottom");
		});
        
        
		$(tab).find('#Td1').removeClass("black_butt_left").addClass("blue_butt_left");
        $(tab).find('#Td2').removeClass("black_butt_top").addClass("blue_butt_top");
        $(tab).find('#Td3').removeClass("black_butt_right").addClass("blue_butt_right");
        $(tab).find('#Td4').removeClass("black_butt_middle").addClass("blue_butt_middle");
        $(tab).find('#Td5').removeClass("black_butt_bottom").addClass("blue_butt_bottom");
	}
	
	$('#OnlineArea').hide();
	$('#MobileArea').hide();
	$('#JobArea').hide();
	$('#'+area).show();
    $("#oUpperClsCd").val( $(tab).attr('tabidx') );
}

/**
 * 목록을 조회한다.
 */
function fnRetrieveSubjectClassifyList() {
    $("#oSubjClassifyForm").action = "/servlet/controller.course.SubjectClassifyServlet";
    $("#oProcess").val("listPage");
    $("#oSubjClassifyForm").submit();
}

/**
 * 등록 화면으로 이동한다. 선택된 탭의 분류 항목을 등록하게 된다..
 */
function fnGotoRegisterPage() {
    $("#oSubjClassifyForm").action = "/servlet/controller.course.SubjectClassifyServlet";
    $("#oProcess").val("registerPage");
    $("#oSubjClassifyForm").submit();
}

/**
 * 수정 화면으로 이동한다. 선택된 탭의 분류 항목을 등록하게 된다..
 */
function fnGotoModifyPage( clsCd ) {
    $("#oSubjClassifyForm").action = "/servlet/controller.course.SubjectClassifyServlet";
    $("#oProcess").val("updatePage");
    $("#oClsCd").val(clsCd);
    $("#oSubjClassifyForm").submit();
}

/**
 * 온라인 분류 수정화면이동
 */
function fnUpdatePage( gubun1, gubun2, gubun3 ) {
    $("#oSubjClassifyForm").action = "/servlet/controller.course.SubjectClassifyServlet";
    $("#oProcess").val("updatePage");
    $("#gubun1").val(gubun1);
    $("#gubun2").val(gubun2);
    $("#gubun3").val(gubun3);
    $("#oSubjClassifyForm").submit();
}

/**
 * 과정 분류 항목을 삭제한다. 등록된 과정이 있으면 함께 삭제된다.
 */
function fnDeleteSubjClassify(clsCd) {
    if (confirm("삭제를 하게되면 등록된 과정 목록도 함께 삭제됩니다.\n정말 삭제하시겠습니까?")) {
        $("#oSubjClassifyForm").action = "/servlet/controller.course.SubjectClassifyServlet";
        $("#oProcess").val("delete");
        $("#oClsCd").val(clsCd);
        $("#oSubjClassifyForm").submit();
    }
}

/**
 * 온라인 과정분류 항목을 삭제
 */
function fnDeleteOnlineClassify(gubun1, gubun2, gubun3) {
    if (confirm("삭제를 하게되면 등록된 과정 목록도 함께 삭제됩니다.\n정말 삭제하시겠습니까?")) {
        $("#oSubjClassifyForm").action = "/servlet/controller.course.SubjectClassifyServlet";
        $("#oProcess").val("delete");
        $("#gubun1").val(gubun1);
        $("#gubun2").val(gubun2);
        $("#gubun3").val(gubun3);
        $("#oSubjClassifyForm").submit();
    }
}

/**
 * 과정관리 화면으로 이동
 */
function fnGotoManagePage( clsCd, clsNm ) {
    $("#oSubjClassifyForm").action = "/servlet/controller.course.SubjectClassifyServlet";
    $("#oProcess").val("manageSubjectPage");
    $("#oClsCd").val(clsCd);
    $("#oClsNm").val(clsNm);
    $("#oSubjClassifyForm").submit();
}

/**
 * 과정관리 화면으로 이동
 */
function fnOnlineSubjPage( gubun1, gubun2, gubun3, lvcode ) {
    $("#oSubjClassifyForm").action = "/servlet/controller.course.SubjectClassifyServlet";
    $("#oProcess").val("manageSubjectPage");
    $("#gubun1").val(gubun1);
    $("#gubun2").val(gubun2);
    $("#gubun3").val(gubun3);
    $("#hcd").val(lvcode);
    $("#oSubjClassifyForm").submit();
}

/**
 * 난이도설정 화면으로 이동
 */
function fnOnlineLevelPage( gubun1, gubun2, gubun3, lvcode ) {
    $("#oSubjClassifyForm").action = "/servlet/controller.course.SubjectClassifyServlet";
    $("#oProcess").val("courseLevelPage");
    $("#gubun1").val(gubun1);
    $("#gubun2").val(gubun2);
    $("#gubun3").val(gubun3);
    $("#hcd").val(lvcode);
    $("#oSubjClassifyForm").submit();
}

function fnSetLevelType(type){
	$("#" + type + "_2").show();
	
	if(!$("#" + type + "_1").is(':visible')){
		$("#" + type + "_1").hide();	
	}
	
	$("#btn_" + type).hide();
}

function fnLevelTypeCancel(type){
	$("#" + type + "_1").show();
	$("#" + type + "_2").hide();
	$("#btn_" + type).show();
}

function fnLevelTypeSave(type){
	if($("#gubun_" + type).val() == ""){
		alert("난이도 유형을 선택하세요.");
		$("#gubun_" + type).focus();
		return;
	}

    $("#oSubjClassifyForm").action = "/servlet/controller.course.SubjectClassifyServlet";
    $("#oProcess").val("levelCodeUpdate");
    $("#type").val(type);
    $("#lvcd").val($("#gubun_" + type).val());
    $("#oSubjClassifyForm").submit();
}

/**
 * 페이지 로딩할 때 실행할 내용
 */
$(document).ready( function () {
	var upperClsCd = "<%= upperClsCd %>";
	var tab = "OnlineArea";
	if(upperClsCd == "1000"){
		tab = "MobileArea";
	}else if(upperClsCd == "2000"){
		tab = "JobArea";
	}
    fnSelectTab(tab);
});
//-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

	<form id="oSubjClassifyForm" name="subjClassifyForm" method="post">
		<input type="hidden" id="oProcess" name="process" value="" /> 
		<input type="hidden" id="oUpperClsCd" name="upperClsCd" value="<%= upperClsCd %>" /> 
		<input type="hidden" id="oClsCd" name="clsCd" value="" /> 
		<input type="hidden" id="oClsNm" name="clsNm" value="" />
		<input type="hidden" id="gubun1" name="gubun1" value="" />
		<input type="hidden" id="gubun2" name="gubun2" value="" />
		<input type="hidden" id="gubun3" name="gubun3" value="" />
		<input type="hidden" id="type" name="type" value="" />
		<input type="hidden" id="lvcd" name="lvcd" value="" />
		<input type="hidden" id="hcd" name="hcd" value="" />

		<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
			<tr>
				<td align="center" valign="top">
					<!-- title 시작 //-->
					<table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
						<tr>
							<td style="text-align: left;">
								<img src="/images/admin/course/c_title12.gif">
							</td>
							<td align="right"><img src="/images/admin/common/sub_title_tail.gif"></td>
						</tr>
					</table> <!-- title 끝 //--> <br /> <!-- tab 시작 //-->
					<table width="97%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="12%">
								<table cellspacing="0" cellpadding="0" class="s_table" tabidx="0000" id="OnlineAreaTab">
									<tr>
										<td rowspan="3" class="blue_butt_left" id="Td1"></td>
										<td class="blue_butt_top" id="Td2"></td>
										<td rowspan="3" class="blue_butt_right" id="Td3"></td>
									</tr>
									<tr>
										<td class="blue_butt_middle" id="Td4"><a href="javascript:fnSelectTab('OnlineArea')" class="c">온라인 분류별</a></td>
									</tr>
									<tr>
										<td class="blue_butt_bottom" id="Td5"></td>
									</tr>
								</table>
							</td>
							<td width="12%">
								<table cellspacing="0" cellpadding="0" class="s_table" tabidx="1000" id="MobileAreaTab">
									<tr>
										<td rowspan="3" class="black_butt_left" id="Td1"></td>
										<td class="black_butt_top" id="Td2"></td>
										<td rowspan="3" class="black_butt_right" id="Td3"></td>
									</tr>
									<tr>
										<td class="black_butt_middle" id="Td4"><a href="javascript:fnSelectTab('MobileArea')" class="c">모바일 분류별</a></td>
									</tr>
									<tr>
										<td class="black_butt_bottom" id="Td5"></td>
									</tr>
								</table>
							</td>
							<td width="12%">
								<table cellspacing="0" cellpadding="0" class="s_table" tabidx="2000" id="JobAreaTab">
									<tr>
										<td rowspan="3" class="black_butt_left" id="Td1"></td>
										<td class="black_butt_top" id="Td2"></td>
										<td rowspan="3" class="black_butt_right" id="Td3"></td>
									</tr>
									<tr>
										<td class="black_butt_middle" id="Td4"><a href="javascript:fnSelectTab('JobArea')" class="c">직업별</a></td>
									</tr>
									<tr>
										<td class="black_butt_bottom" id="Td5"></td>
									</tr>
								</table>
							</td>
							<td width="75%">&nbsp;</td>
						</tr>
						<tr>
							<td height="2" colspan="4" bgcolor="#6699CC"></td>
						</tr>
					</table> 
					<br /> 
					
					<!--- 추가 버튼 시작 //-->
					<table cellpadding="0" cellspacing="0" class="table1" border="0">
						<tr>
							<td width="480"><span style="font-weight: bold; font-size: 16pt; vertical-align: bottom;">분류별 목록</span></td>
							<td align="right" height="20">
								<button class="btn_reg" onclick="fnGotoRegisterPage();">등록</button>&nbsp;&nbsp;
								<button class="btn_reg" onclick="fnRetrieveSubjectClassifyList();">조회</button>
							</td>
						</tr>
						<tr>
							<td height="3"></td>
						</tr>
					</table> 
					<!-- 추가 버튼 끝 //--> 
					
					<!-- 분류별 목록 시작 //-->
					<div id="OnlineArea" style="display: block;">
						<table cellspacing="1" cellpadding="5" class="table_out">
							<colgroup>
								<col width="8%" />
 								<col width="25%" />
								<col width="20%" />
								<col width="20%" />
								<col width="15%" />
								<col width="20%" />
								<col width="20%" />
								<col width="*" /> 
							</colgroup>
							<tr>
								<td colspan="8" class="table_top_line"></td>
							</tr>
							<tr>
								<td class="table_title">NO</td>
								<td class="table_title">장르</td>
 								<td class="table_title">대분류</td>
								<td class="table_title">소분류</td>
								<td class="table_title">과정수(정/열)</td>
								<td class="table_title">과정관리</td>
								<td class="table_title">난이도관리</td>
								<td class="table_title">수정/삭제</td> 
							</tr>

							<%
						    if (onlineList.size() > 0) {
						    	int row1 = 0;
						    	int row2 = 0;
						    	String v_gubun_tmp1 = "";
						    	String v_gubun_tmp2 = ""; 
						        for ( int i = 0 ;i < onlineList.size() ; i++ ) {
						            dbox = (DataBox)onlineList.get(i);
						            row1 = dbox.getInt("d_gubuncnt1"); 
						            row2 = dbox.getInt("d_gubuncnt2"); 
							%>
									<tr>
										<td class="table_01"><%= (i + 1) %></td>
										<%
										if(!v_gubun_tmp1.equals(dbox.getString("d_gubunnm1"))){
											v_gubun_tmp1 = dbox.getString("d_gubunnm1");
										%>
											<td class="table_02_2" rowspan="<%=row1%>">
												<b><%= dbox.getString("d_gubunnm1") %></b>
												<br/>
					                       	<%
										    if (!"".equals(dbox.getString("d_lvcode"))) {
										    %>
					                       		<div id="<%=dbox.getString("d_gubun1") %>_1" style="color:blue"><b>(<%= dbox.getString("d_lvcdnm") %>)</b></div>
										    <% 
										    } else {
											%>		
												<div id="<%=dbox.getString("d_gubun1") %>_1" style="display:none;"></div>
											<% 
										    }
											%>													
												<div id="<%=dbox.getString("d_gubun1") %>_2" style="display:none;">
							                        <select id="gubun_<%=dbox.getString("d_gubun1") %>" name="gubun_<%=dbox.getString("d_gubun1") %>" style="width:110px;">
							                        	<option value="">선택하세요.</option>
						                       	<%
											    if (lvCdList.size() > 0) {
											        for ( int j = 0 ;j < lvCdList.size() ; j++ ) {
											        	dbox1 = (DataBox)lvCdList.get(j);
											    %>
					                       				<option value="<%=dbox1.getString("d_code")%>"><%=dbox1.getString("d_codenm")%></option>
											    <% 
											        }
											    }
												%>
							                        </select>													
							                        <button type="button" class="btn_reg" onclick="javascript:fnLevelTypeSave('<%=dbox.getString("d_gubun1") %>');" style="width:30px;">저장</button>
							                        <button type="button" class="btn_reg" onclick="javascript:fnLevelTypeCancel('<%=dbox.getString("d_gubun1") %>');" style="width:30px;">취소</button>
												</div>

												
												<button type="button" id="btn_<%=dbox.getString("d_gubun1") %>" class="btn_reg" onclick="javascript:fnSetLevelType('<%=dbox.getString("d_gubun1") %>');" >난이도 유형</button>
											</td>
										<%}%>
 										<%
										if(!v_gubun_tmp2.equals(dbox.getString("d_gubunnm2")) || "".equals(dbox.getString("d_gubunnm2"))){
											v_gubun_tmp2 = dbox.getString("d_gubunnm2");
										%>
											<td class="table_02_2" rowspan="<%=row2%>"><b><%= dbox.getString("d_gubunnm2") %></b> </td>
										<%}%>
										<td class="table_02_2"><b><%= dbox.getString("d_gubunnm3") %></b> </td>
										<td class="table_03_1">(<%= dbox.getInt("d_subjcnt") %> / <%= dbox.getInt("d_goldcnt") %>) 과정</td>
										<td class="table_03_1">
											<button class="btn_basic" onclick="fnOnlineSubjPage('<%= dbox.getString("d_gubun1")%>', '<%= dbox.getString("d_gubun2")%>', '<%= dbox.getString("d_gubun3")%>', '<%= dbox.getString("d_lvcode")%>');">과정연결</button>
										</td>
										<td class="table_03_1">
											<button class="btn_basic" onclick="fnOnlineLevelPage('<%= dbox.getString("d_gubun1")%>', '<%= dbox.getString("d_gubun2")%>', '<%= dbox.getString("d_gubun3")%>', '<%= dbox.getString("d_lvcode")%>');">난이도설정</button>
										</td>										
										<td class="table_03_1">
											<button id="oModBtn" class="btn_basic" onclick="fnUpdatePage('<%= dbox.getString("d_gubun1")%>', '<%= dbox.getString("d_gubun2")%>', '<%= dbox.getString("d_gubun3")%>');return false;">수정</button>&nbsp;&nbsp;
											<button id="oDelBtn" class="btn_basic" onclick="fnDeleteOnlineClassify('<%= dbox.getString("d_gubun1")%>', '<%= dbox.getString("d_gubun2")%>', '<%= dbox.getString("d_gubun3")%>');return false;">삭제</button>
										</td>
									</tr>
							<%
						        }
						    } else {
							%>
								<tr>
									<td class="table_01" colspan="6" style="text-align: center; text-weight: bold;">등록된 분류가 없습니다.</td>
								</tr>
							<%
						    }
							%>
						</table>
					</div> 
					<!-- 분류별 목록 끝 //-->
					
					
					<!-- 분류별 목록 시작 //-->
					<div id="MobileArea" style="display: none;">
						<table cellspacing="1" cellpadding="5" class="table_out">
							<colgroup>
								<col width="8%" />
								<col width="*" />
								<col width="10%" />
								<col width="10%" />
								<col width="14%" />
								<col width="22%" />
							</colgroup>
							<tr>
								<td colspan="6" class="table_top_line"></td>
							</tr>
							<tr>
								<td class="table_title">NO</td>
								<td class="table_title">분류명</td>
								<td class="table_title">사용여부</td>
								<td class="table_title">정렬순서</td>
								<td class="table_title">과정관리</td>
								<td class="table_title">수정/삭제</td>
							</tr>

							<%
						    if (categoryList.size() > 0) {
						        for ( int i = 0 ;i < categoryList.size() ; i++ ) {
						            dbox = (DataBox)categoryList.get(i);
							%>
									<tr>
										<td class="table_01"><%= (i + 1) %></td>
										<td class="table_02_1" style="text-align: left; padding-left: 8px;"><b><%= dbox.getString("d_cls_nm") %></b> (<%= dbox.getInt("d_cnt") %>과정)</td>
										<td class="table_02_1"><%= dbox.getString("d_use_yn") %></td>
										<td class="table_02_1"><%= dbox.getString("d_sort_order") %></td>
										<td class="table_03_1"><button class="btn_basic" onclick="fnGotoManagePage('<%= dbox.getString("d_cls_cd") %>', '<%= dbox.getString("d_cls_nm") %>');">과정관리</button></td>
										<td class="table_03_1">
											<button id="oModBtn" class="btn_basic" onclick="fnGotoModifyPage('<%= dbox.getString("d_cls_cd") %>');">수정</button>&nbsp;&nbsp;
											<button id="oDelBtn" class="btn_basic" onclick="fnDeleteSubjClassify('<%= dbox.getString("d_cls_cd") %>');">삭제</button>
										</td>
									</tr>
							<%
						        }
						    } else {
							%>
								<tr>
									<td class="table_01" colspan="6" style="text-align: center; text-weight: bold;">등록된 분류가 없습니다.</td>
								</tr>
							<%
						    }
							%>
						</table>
					</div> 
					<!-- 분류별 목록 끝 //-->
					
					
					<!-- 직업별 목록 시작 //-->
					<div id="JobArea" style="display: none;">
						<table cellspacing="1" cellpadding="5" class="table_out">
							<colgroup>
								<col width="8%" />
								<col width="*" />
								<col width="10%" />
								<col width="10%" />
								<col width="14%" />
								<col width="22%" />
							</colgroup>
							<tr>
								<td colspan="6" class="table_top_line"></td>
							</tr>
							<tr>
								<td class="table_title">NO</td>
								<td class="table_title">분류명</td>
								<td class="table_title">사용여부</td>
								<td class="table_title">정렬순서</td>
								<td class="table_title">과정관리</td>
								<td class="table_title">수정/삭제</td>
							</tr>

							<%
						    if (jobList.size() > 0) {
						        for ( int i = 0 ;i < jobList.size() ; i++ ) {
						            dbox = (DataBox)jobList.get(i);
							%>
									<tr>
										<td class="table_01"><%= (i + 1) %></td>
										<td class="table_02_1" style="text-align: left; padding-left: 8px;"><b><%= dbox.getString("d_cls_nm") %></b> (<%= dbox.getInt("d_cnt") %>과정)</td>
										<td class="table_02_1"><%= dbox.getString("d_use_yn") %></td>
										<td class="table_02_1"><%= dbox.getString("d_sort_order") %></td>
										<td class="table_03_1"><button class="btn_basic" onclick="fnGotoManagePage('<%= dbox.getString("d_cls_cd") %>', '<%= dbox.getString("d_cls_nm") %>');">과정관리</button></td>
										<td class="table_03_1">
											<button id="oModBtn" class="btn_basic" onclick="fnGotoModifyPage('<%= dbox.getString("d_cls_cd") %>');">수정</button>&nbsp;&nbsp;
											<button id="oDelBtn" class="btn_basic" onclick="fnDeleteSubjClassify('<%= dbox.getString("d_cls_cd") %>');">삭제</button>
										</td>
									</tr>
							<%
						        }
						    } else {
							%>
								<tr>
									<td class="table_01" colspan="6" style="text-align: center; text-weight: bold;">등록된 분류가 없습니다.</td>
								</tr>
							<%
						    }
							%>
						</table>
					</div>
					<!-- 직업별 목록 끝 //-->

				</td>
			</tr>
			<tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>
		</table>
	</form>

</body>
</html>
