<%
//**********************************************************
//  1. ��      ��: ���ԡ���� ������ ���
//  2. ���α׷��� : za_CourseStatistics_L.jsp
//  3. ��      ��: ���ԡ���� ������ ���
//  4. ȯ      ��: JDK 1.7
//  5. ��      ��: 1.0
//  6. ��      ��: ����� 2016. 6. 10
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType="text/html;charset=euc-kr"%>
<%@page errorPage="/learn/library/error.jsp"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.text.*"%>
<%@ page import="com.credu.library.DataBox"%>
<%@ page import="com.credu.library.FormatDate"%>
<%@ page import="com.credu.library.RequestBox"%>

<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select"%>

<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String searchCondition = box.getStringDefault("searchCondition", "year");
    String searchGubun = box.getStringDefault("searchGubun", "ALL");
    String searchDateGubun = box.getStringDefault("searchDateGubun", "eduend");
    String searchStartDate = box.getString("searchStartDate");
    String searchEndDate = box.getString("searchEndDate");
    String chkStep = box.getString("chkStep");

    DataBox dbox = null;

    ArrayList<DataBox> selectCourseStatisticList = (ArrayList<DataBox>)request.getAttribute("selectCourseStatisticList");
    
    int tot_studentCnt = 0;
    int tot_stoldCnt = 0;
    
    int studentCnt_G0 = 0;
    int studentCnt_B0 = 0;
    int studentCnt_K0 = 0;
    int stoldCnt_G0 = 0;
    int stoldCnt_B0 = 0;
    int stoldCnt_K0 = 0;
    
    int studentCnt = 0;
    int stoldCnt = 0;
%>
<html>
<head>
<title>�������� ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<link rel="stylesheet" type="text/CSS" href="/css/jquery-ui-1.10.4.css">
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type="text/javascript" src="/script/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/script/jquery-ui-1.10.4.js"></script>
<script type="text/javascript">
    /**
     * ������ �ʱ�ȭ �Լ�
     */
    $(document).ready( function() {

        $(document).title = "�˻��� ��� | ��� | �ѱ���������ī���� ������";

        $("#oSearchStartDate").datepicker({
            showOn: "both", // ��ư�� �ؽ�Ʈ �ʵ� ��� Ķ������ �����ش�.
            buttonImage: "/images/portal/ico/ico_calendar.gif", // ��ư �̹���
            buttonText: "�˻� ��������",
            buttonImageOnly: true, // ��ư�� �ִ� �̹����� ǥ���Ѵ�.
            changeMonth: true, // ���� �ٲܼ� �ִ� ����Ʈ �ڽ��� ǥ���Ѵ�.
            changeYear: true, // ���� �ٲ� �� �ִ� ����Ʈ �ڽ��� ǥ���Ѵ�.
            // minDate: "-7d", // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
            maxDate: "0d", // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
            nextText: "���� ��", // next �������� ����.
            prevText: "���� ��", // prev �������� ����.
            numberOfMonths: [1,1], // �ѹ��� �󸶳� ���� ���� ǥ���Ұ��ΰ�. [2,3] �� ���, 2(��) x 3(��) = 6���� ���� ǥ���Ѵ�.
            stepMonths: 1, // next, prev ��ư�� Ŭ�������� �󸶳� ���� ���� �̵��Ͽ� ǥ���ϴ°�.
            yearRange: "-5:", // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
            showButtonPanel: true, // Ķ���� �ϴܿ� ��ư �г��� ǥ���Ѵ�.
            currentText: "����" , // ���� ��¥�� �̵��ϴ� ��ư �г�
            closeText: "�ݱ�",  // �ݱ� ��ư �г�
            dateFormat: "yymmdd", // �ؽ�Ʈ �ʵ忡 �ԷµǴ� ��¥ ����.
            showAnim: "slideDown", //�ִϸ��̼��� �����Ѵ�.
            showMonthAfterYear: true , // ��, ����� ����Ʈ �ڽ��� ��,�� ������ �ٲ��ش�.
            dayNamesMin: ["��", "��", "ȭ", "��", "��", "��", "��"], // ������ �ѱ� ����.
            monthNamesShort: ["1��","2��","3��","4��","5��","6��","7��","8��","9��","10��","11��","12��"], // ���� �ѱ� ����.

            onClose: function( selectedDate ) {
                $("#oSearchEndDate" ).datepicker( "option", "minDate", selectedDate );
            }
        });

        $("#oSearchEndDate").datepicker({
            showOn: "both", // ��ư�� �ؽ�Ʈ �ʵ� ��� Ķ������ �����ش�.
            buttonImage: "/images/portal/ico/ico_calendar.gif", // ��ư �̹���
            buttonText: "�˻� ��������",
            buttonImageOnly: true, // ��ư�� �ִ� �̹����� ǥ���Ѵ�.
            changeMonth: true, // ���� �ٲܼ� �ִ� ����Ʈ �ڽ��� ǥ���Ѵ�.
            changeYear: true, // ���� �ٲ� �� �ִ� ����Ʈ �ڽ��� ǥ���Ѵ�.
            // minDate: "-7d", // ���糯¥�κ��� 100���������� ���� ǥ���Ѵ�.
            maxDate: "0d",
            nextText: "���� ��", // next �������� ����.
            prevText: "���� ��", // prev �������� ����.
            numberOfMonths: [1,1], // �ѹ��� �󸶳� ���� ���� ǥ���Ұ��ΰ�. [2,3] �� ���, 2(��) x 3(��) = 6���� ���� ǥ���Ѵ�.
            stepMonths: 1, // next, prev ��ư�� Ŭ�������� �󸶳� ���� ���� �̵��Ͽ� ǥ���ϴ°�.
            yearRange: "-15:", // �⵵ ���� ����Ʈ�ڽ��� ���� �⵵���� ����, ���ķ� ���� ������ ǥ���Ұ��ΰ�.
            showButtonPanel: true, // Ķ���� �ϴܿ� ��ư �г��� ǥ���Ѵ�.
            currentText: "����" , // ���� ��¥�� �̵��ϴ� ��ư �г�
            closeText: "�ݱ�",  // �ݱ� ��ư �г�
            dateFormat: "yymmdd", // �ؽ�Ʈ �ʵ忡 �ԷµǴ� ��¥ ����.
            showAnim: "slideDown", //�ִϸ��̼��� �����Ѵ�.
            showMonthAfterYear: true , // ��, ����� ����Ʈ �ڽ��� ��,�� ������ �ٲ��ش�.
            dayNamesMin: ["��", "��", "ȭ", "��", "��", "��", "��"], // ������ �ѱ� ����.
            monthNamesShort: ["1��","2��","3��","4��","5��","6��","7��","8��","9��","10��","11��","12��"], // ���� �ѱ� ����.

            onClose: function( selectedDate ) {
                $("#oSearchStartDate" ).datepicker( "option", "maxDate", selectedDate );
            }
        });
    });

    /**
     * �˻����ǿ� ������ ���غ��� ����ڷ� ����� ��ȸ�Ѵ�.
     */
    function fnOpenClassStatisticsList() {
        var searchCondtion = $("#oSearchCondition").val();
        if ( searchCondtion != "year" ) {
            if ( $("#oSearchStartDate").val() == "" ) {
                alert("��ȸ �������� �Է� Ȥ�� �����ϼ���");
                $("#oSearchStartDate").focus();
                return;
            } else if ( $("#oSearchEndDate").val() == "" ) {
                alert("��ȸ �������� �Է� Ȥ�� �����ϼ���");
                $("#oSearchEndDate").focus();
                return;
            }
        }

        $("#oAction").val("go");
        $("#oProcess").val("selectCourseStatisticList");
        $('#oOpenClassSearchForm').attr({
        	action : '?',
        	target : '_self'
        }).submit();
    }
    
    function goExcel(){
    	var searchCondtion = $("#oSearchCondition").val();
        if ( searchCondtion != "year" ) {
            if ( $("#oSearchStartDate").val() == "" ) {
                alert("��ȸ �������� �Է� Ȥ�� �����ϼ���");
                $("#oSearchStartDate").focus();
                return;
            } else if ( $("#oSearchEndDate").val() == "" ) {
                alert("��ȸ �������� �Է� Ȥ�� �����ϼ���");
                $("#oSearchEndDate").focus();
                return;
            }
        }

        $("#oAction").val("go");
        $("#oProcess").val("selectCourseStatisticExcel");
        $('#oOpenClassSearchForm').attr({
        	action : '?',
        	target : '_self'
        }).submit();
    }
    //goExcelLowData
    function goExcelLowData(){
    	var searchCondtion = $("#oSearchCondition").val();
        if ( searchCondtion != "year" ) {
            if ( $("#oSearchStartDate").val() == "" ) {
                alert("��ȸ �������� �Է� Ȥ�� �����ϼ���");
                $("#oSearchStartDate").focus();
                return;
            } else if ( $("#oSearchEndDate").val() == "" ) {
                alert("��ȸ �������� �Է� Ȥ�� �����ϼ���");
                $("#oSearchEndDate").focus();
                return;
            }
        }

        $("#oAction").val("go");
        $("#oProcess").val("selectCourseStatisticExcelLowData");
        $('#oOpenClassSearchForm').attr({
        	action : '?',
        	target : '_self'
        }).submit();
    }
    

</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">


	<table width="1000" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="center" valign="top">
				<!-- title ���� //-->
				<table width="97%" border="0" cellspacing="0" cellpadding="0" class="">
					<tr>
						<td><h3>B2C���԰��� ������� - 2017.07.28</h3></td>
						<td align="right"><img src="/images/admin/common/sub_title_tail.gif" /></td>
					</tr>
				</table> 
				<!-- title �� //--> 
				
				<!-- �˻� ���� ���� //-->
				<form id="oOpenClassSearchForm" name="openClassSearchForm" method="get">
					<input type="hidden" id="oProcess" name="p_process" value="" />
					<input type="hidden" id="oAction" name="p_action" value="" />
					<table cellspacing="0" cellpadding="1" class="form_table_out">
						<tr>
							<td bgcolor="#C6C6C6" align="center">

								<table cellspacing="0" cellpadding="0" class="form_table_bg">
									<tr>
										<td height="7"></td>
									</tr>
									<tr>
										<td align="center">

											<table border="0" cellspacing="0" cellpadding="0" width="99%" class="form_table">
												<colgroup>
													<col width="10%" /></col>
													<col width="*" /></col>
												</colgroup>
												<tr>
													<th style="display:none">����</th>
													<td style="display:none">
														<select id="searchGubun" name="searchGubun">
															<option value="B2C" selected >B2C</option>
														</select>
													</td>
													<th style="display:none">�Ⱓ����</th>
													<td style="display:none">
														<select id="searchDateGubun" name="searchDateGubun">
															<option value="edustart" <%=searchDateGubun.equals("edustart") ? "selected" : ""%>>�н�������</option>
															<option value="eduend" <%=searchDateGubun.equals("eduend") ? "selected" : ""%>>�н�������</option>
														</select>
													</td>
													<th>������</th>
													<td>
														<label style="cursor:pointer;">
														0% ���� <input name="chkStep" <%= (!"".equals(chkStep)?"checked":"") %> type="checkbox" value="null">
														</label>
													</td>
													<th>�������� �н����� ������ ����</th>
													<td>
														<input type="text" id="oSearchStartDate" name="searchStartDate" value="<%= box.getString("searchStartDate") %>" class="input" maxlength="10" size="12" /> 
														~ 
														<input type="text" id="oSearchEndDate" name="searchEndDate" value="<%= box.getString("searchEndDate") %>" class="input" maxlength="10" size="12" />
													</td>
													<td width="10%" align="right"><a href="javascript:fnOpenClassStatisticsList('go')"><img src="/images/admin/button/b_go.gif" border="0" align="absmiddle"></a></td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td height="9"></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</form> 
				<!-- �˻� ���� �� //--> 
				
				
				<!----------------- ������� ��ư ���� ----------------->
                <table cellpadding="0" cellspacing="0" class="table1">
	                <tr>
                 		<td align="right">
                 			<a href="javascript:goExcel('go')" class="c blueArrowBtn" style="vertical-align: middle; display: inline-block;"><img src="/images/admin/button/btn_excelprint.gif"  border="0"></a>
                 			<a href="javascript:goExcelLowData('go')" class="c blueArrowBtn" style="color:#666;display: inline-block;vertical-align: middle; padding: 1px 2px; margin: 3px; border: 1px solid #cccccc; border-radius: 2px;">
                 				<span style="display:inline-block; width: 8px; height: 8px; overflow: hidden; position: relative; vertical-align: middle;">
                 					<img src="/images/admin/button/btn_excelprint.gif"  border="0" style="position:absolute; display: block; z-index: -1; margin-left: -4px; margin-top: -7px;">
                 				</span>
                 				<span style=" vertical-align: middle;">
                 					�������LowData
                 				</span>
               				</a>
               			</td>
	                </tr>
	                <tr>
                  		<td height="3"></td>
	                </tr>
                </table>
                <!----------------- ������� ��ư �� ----------------->
				
				
				<table class="table_out" cellspacing="1" cellpadding="5" style="margin-left:15px;">
	                <tr>
	                    <td colspan="17" class="table_top_line"></td>
	                </tr>
	                <tr>
	                    <td class="table_title" width="20%"><b>�о�</b></td>
	                    <td class="table_title" width="15%"><b>�����ڵ�</b></td>
	                    <td class="table_title" width="*"><b>������</b></td>
	                    <td class="table_title" width="10%"><b>�����ο�</b></td>
	                    <!-- <td class="table_title" width="10%"><b>����</b></td>  -->
	                </tr>
                
                
<%
        if ( selectCourseStatisticList != null && selectCourseStatisticList.size() > 0 ) {
            dbox = null;
            for(int i = 0; i < selectCourseStatisticList.size(); i++) {
                dbox = (DataBox)selectCourseStatisticList.get(i);
                if("K0".equals( dbox.getString("d_area") )){
                	if(searchGubun.equals("ALL")){
	                	studentCnt_K0 += (dbox.getInt("d_student_cnt_b2b") + dbox.getInt("d_student_cnt_b2c"));
	                	stoldCnt_K0 += (dbox.getInt("d_isgraduated_b2b") + dbox.getInt("d_isgraduated_b2c"));
                	}else{
	                	studentCnt_K0 += dbox.getInt("d_student_cnt_"+searchGubun.toLowerCase());
	                	stoldCnt_K0 += dbox.getInt("d_isgraduated_"+searchGubun.toLowerCase());
                	}
                }
                
                if("B0".equals( dbox.getString("d_area") )){
                	if(searchGubun.equals("ALL")){
	                	studentCnt_B0 += (dbox.getInt("d_student_cnt_b2b") + dbox.getInt("d_student_cnt_b2c"));
	                	stoldCnt_B0 += (dbox.getInt("d_isgraduated_b2b") + dbox.getInt("d_isgraduated_b2c"));
                	}else{
	                	studentCnt_B0 += dbox.getInt("d_student_cnt_"+searchGubun.toLowerCase());
	                	stoldCnt_B0 += dbox.getInt("d_isgraduated_"+searchGubun.toLowerCase());
                	}
                }
                
                if("G0".equals( dbox.getString("d_area") )){
                	if(searchGubun.equals("ALL")){
	                	studentCnt_G0 += (dbox.getInt("d_student_cnt_b2b") + dbox.getInt("d_student_cnt_b2c"));
	                	stoldCnt_G0 += (dbox.getInt("d_isgraduated_b2b") + dbox.getInt("d_isgraduated_b2c"));
                	}else{
	                	studentCnt_G0 += dbox.getInt("d_student_cnt_"+searchGubun.toLowerCase());
	                	stoldCnt_G0 += dbox.getInt("d_isgraduated_"+searchGubun.toLowerCase());
                	}
                }
                
                
                tot_studentCnt += (dbox.getInt("d_student_cnt_b2b") + dbox.getInt("d_student_cnt_b2c"));
                tot_stoldCnt += (dbox.getInt("d_isgraduated_b2b") + dbox.getInt("d_isgraduated_b2c"));
                
                
            }
%>
			<tr>
                <td class="table_02" colspan="3">�� ��</td>
                <td class="table_02" ><%= tot_studentCnt %></td>
                <!-- <td class="table_02" ><%= tot_stoldCnt %> </td> -->
            </tr>
			<tr>
                <td class="table_02" colspan="2">��ۿ���</td>
                <td class="table_02" >��ۿ��� �հ�</td>
                <td class="table_02" ><%= studentCnt_B0 %></td>
                <!-- <td class="table_02" ><%= stoldCnt_B0 %> </td> -->
            </tr>
			<tr>
                <td class="table_02" colspan="2">���Ӱ���</td>
                <td class="table_02" >���Ӱ��� �հ� </td>
                <td class="table_02" ><%= studentCnt_G0 %></td>
                <!-- <td class="table_02" ><%= stoldCnt_G0 %> </td> -->
            </tr>
			<tr>
                <td class="table_02" colspan="2">��ȭ������</td>
                <td class="table_02" >��ȭ������ �հ� </td>
                <td class="table_02" ><%= studentCnt_K0 %></td>
                <!-- <td class="table_02" ><%= stoldCnt_K0 %> </td> -->
            </tr>
<%            
        } else {
%>
                <tr>
                    <td class="table_02" colspan="17">��ȸ�� �ڷᰡ �����ϴ�.</td>
                </tr>
<%
        }
%>
            </table>
            
<%
        if ( selectCourseStatisticList != null && selectCourseStatisticList.size() > 0 ) {
%>
			<table class="table_out" cellspacing="1" cellpadding="5" style="margin-left:15px;">
				<colgroup>
					<col width="20%"/>
					<col width="15%"/>
					<col width="*"/>
					<col width="10%"/>
					<!-- <col width="10%"/> -->
				</colgroup>
<%
            dbox = null;
            for(int i = 0; i < selectCourseStatisticList.size(); i++) {
                dbox = (DataBox)selectCourseStatisticList.get(i);
              	if(searchGubun.equals("ALL")){
	               	studentCnt = (dbox.getInt("d_student_cnt_b2b") + dbox.getInt("d_student_cnt_b2c"));
	               	stoldCnt = (dbox.getInt("d_isgraduated_b2b") + dbox.getInt("d_isgraduated_b2c"));
              	}else{
	               	studentCnt = dbox.getInt("d_student_cnt_"+searchGubun.toLowerCase());
	               	stoldCnt = dbox.getInt("d_isgraduated_"+searchGubun.toLowerCase());
              	}
%>
				<tr>
	                <td class="table_02_1" ><%=dbox.getString("d_areanm")%></td>
	                <td class="table_02_1" ><%=dbox.getString("d_subj")%></td>
	                <td class="table_02_2" >
	                	<%=dbox.getString("d_subjnm")%>
	                	<!-- 
	                	<a href="/servlet/controller.statistics.CourseStatisticNewServlet?p_process=selectCourseStatisticView" target="_blank"><button style="cursor:pointer;">����ȸ</button></a>
	                	 -->
                	</td>
	                <td class="table_02_1" ><%= studentCnt %></td>
	                <!-- <td class="table_02_1" ><%= stoldCnt %> </td> -->
	            </tr>
<%
                
            }
%>
            </table>
<%            
        }
%>

<%@ include file="/learn/library/getJspName.jsp"%>
</body>
</html>
