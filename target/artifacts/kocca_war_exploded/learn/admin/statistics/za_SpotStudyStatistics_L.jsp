<%
//**********************************************************
//  1. ��      ��: Notice
//  2. ���α׷��� : za_Notice_L.jsp
//  3. ��      ��: �������� ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 13
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType="text/html;charset=euc-kr" %>
<%@page errorPage="/learn/library/error.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Calendar" %>
<%@ page import = "java.text.*" %>
<%@ page import="com.credu.library.DataBox" %>
<%@ page import="com.credu.library.FormatDate" %>
<%@ page import="com.credu.library.RequestBox" %>

<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>

<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String searchCondition = box.getStringDefault("searchCondition", "year");
    String searchStartDate = box.getString("searchStartDate");
    String searchEndDate = box.getString("searchEndDate");

    DataBox dbox = null;

    // ArrayList<DataBox> viewCountTotalList = (ArrayList<DataBox>)request.getAttribute("selectViewCountTotList");
    ArrayList<DataBox> selectAppplyCountList = (ArrayList<DataBox>)request.getAttribute("selectAppplyCountList");
    ArrayList<DataBox> viewCountTotalListInPeriod = (ArrayList<DataBox>)request.getAttribute("selectGraduatedCountList");

    Calendar oCalendar = Calendar.getInstance( );

    int currentYear = oCalendar.get(Calendar.YEAR);
    int cnt_G0 = 0;
    int cnt_B0 = 0;
    int cnt_K0 = 0;
    
    String v_area = "";

    double grad_rate = 0.0d;  
    double v_mrate   = 0.0d;
    double v_frate   = 0.0d;
    
%>
<html>
<head>
<title>�������� ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<link rel="stylesheet" type="text/CSS" href="/css/jquery-ui-1.10.4.css">
<script type="text/javascript" src = "/script/cresys_lib.js"></script>
<script type="text/javascript" src="/script/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/script/jquery-ui-1.10.4.js"></script>
<script type="text/javascript">
<!--
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
            dayNamesMin: ["��", "ȭ", "��", "��", "��", "��", "��"], // ������ �ѱ� ����.
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
            dayNamesMin: ["��", "ȭ", "��", "��", "��", "��", "��"], // ������ �ѱ� ����.
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

        $("#oProcess").val("selectSpotStudyStatisticList");
        $("#oOpenClassSearchForm").attr("action", "/servlet/controller.statistics.SpotStudyStatisticServlet").submit();
    }

//-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">


<table width="1000" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td align="center" valign="top">
            <!-- title ���� //-->
            <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
                <tr>
                    <td><h3>����н� ���</h3></td>
                    <td align="right"><img src="/images/admin/common/sub_title_tail.gif" /></td>
                </tr>
            </table>
            <!-- title �� //-->

            <!-- �˻� ���� ���� //-->
            <form id="oOpenClassSearchForm" name="openClassSearchForm" method="get">
                <input type="hidden" id="oProcess" name="p_process" value="" />
            <table cellspacing="0" cellpadding="1" class="form_table_out">
                <tr>
                    <td bgcolor="#C6C6C6" align="center">

                        <table cellspacing="0" cellpadding="0" class="form_table_bg" >
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
                                            <th>��ȸ�Ⱓ</th>
                                                        <td>
                                                            <input type="text" id="oSearchStartDate" name="searchStartDate" value="<%= box.getString("searchStartDate") %>" class="input" maxlength="10" size="12" /> ~
                                                            <input type="text" id="oSearchEndDate" name="searchEndDate" value="<%= box.getString("searchEndDate") %>" class="input" maxlength="10" size="12" />
                                                        </td>
                                            <td width="10%" align="right">
                                                <a href = "javascript:fnOpenClassStatisticsList('go')"><img src = "/images/admin/button/b_go.gif" border = "0" align="absmiddle"></a>
                                            </td>
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

<%
    if ( searchCondition.equals("year") || searchCondition.equals("period") ) {
%>
            <table class="table_out" cellspacing="1" cellpadding="5" style="margin-left:15px;">
                <tr>
                    <td colspan="17" class="table_top_line"></td>
                </tr>
                <tr>
                    <td colspan="17" style="font-weight:bold; font-size:15pt; background-color:#abcdef;">��û��Ȳ:��ȸ�Ⱓ ���� �н��� ������ �ο�</td>
                </tr>
                <tr>
                    <td class="table_title" width="3%"><b>�о�</b></td>
                    <td class="table_title" width="10%"><b>��û�ο�</b></td>
                    <td class="table_title" width="8%"><b>��������(%)</b></td>
                </tr>
                
                
<%
        if ( selectAppplyCountList != null && selectAppplyCountList.size() > 0 ) {
            dbox = null;
            
            for(int i = 0; i < selectAppplyCountList.size(); i++) {
                dbox = (DataBox)selectAppplyCountList.get(i);
                if("K0".equals( dbox.getString("d_area") )){
                	cnt_K0 = dbox.getInt("d_total");
                	v_area = "��ȭ";
                }
                
                if("B0".equals( dbox.getString("d_area") )){
                	cnt_B0 = dbox.getInt("d_total");
                	v_area = "���";
                }
                
                if("G0".equals( dbox.getString("d_area") )){
                	cnt_G0 = dbox.getInt("d_total");
                	v_area = "����";
                }
                
                v_mrate = (double)Math.round( (double)dbox.getInt("d_msum") *100 / dbox.getInt("d_total")  ) ;
                v_frate = (double)Math.round( (double)dbox.getInt("d_fsum") *100 / dbox.getInt("d_total")  ) ;
                
                
                
                
                
%>
                <tr>
                    <td class="table_01" ><%= v_area %></td>
                    <td class="table_01" ><%= dbox.getString("d_total") %></td>
                    <td class="table_01" ><%= v_mrate %> / <%= v_frate %></td>
                </tr>
                
<%
            }
%>
			<tr>
                <td class="table_01" > 	��ü </td>
                <td class="table_01" ><%= cnt_K0 + cnt_B0 + cnt_G0 %></td>
                <td class="table_01" > </td>
            </tr>
<%            
        } else {
%>
                <tr>
                    <td class="table_01" colspan="17">��ȸ�� �ڷᰡ �����ϴ�.</td>
                </tr>
<%
        }
%>
            </table>
            <br />
<br />
<br />
<br />
            <table class="table_out" cellspacing="1" cellpadding="5" style="margin-left:15px;">
                <tr>
                    <td colspan="17" class="table_top_line"></td>
                </tr>
                <tr>
                    <td colspan="17" style="font-weight:bold; font-size:15pt; background-color:#abcdef;">������Ȳ: ��ȸ�Ⱓ ���� �н��� ����� �ο� �� ���� �ο�</td>
                </tr>
                <tr>
                    <td class="table_title" width="3%"><b>�о�</b></td>
                    <td class="table_title" width="10%"><b>�����ο�</b></td>
                    <td class="table_title" width="8%"><b>�����ο�</b></td>
                    <td class="table_title" width="8%"><b>��������(%)</b></td>
                    <td class="table_title" width="4%"><b>������(%)</b></td>
                </tr>
<%
		if ( viewCountTotalListInPeriod != null && viewCountTotalListInPeriod.size() > 0 ) {
            dbox = null;
            int grad_cnt = 0;
            int totalCnt = 0; 
            for(int i = 0; i < viewCountTotalListInPeriod.size(); i++) {
                dbox = (DataBox)viewCountTotalListInPeriod.get(i);
                int cnt = 0;
                if("K0".equals( dbox.getString("d_area") )){
                	cnt = dbox.getInt("d_total");
                	if (cnt > 0) 
                		grad_rate = (double)Math.round((double)dbox.getInt("d_graduatedcnt")/cnt*100*100)/100;
                	else
                		grad_rate = 0; 
                	v_area = "��ȭ";
                }
                
                if("B0".equals( dbox.getString("d_area") )){
                	cnt = dbox.getInt("d_total"); 
                	if (cnt > 0) 
                		grad_rate = (double)Math.round((double)dbox.getInt("d_graduatedcnt")/cnt*100*100)/100;
                	else
                		grad_rate = 0;
                	v_area = "���";
                }
                
                if("G0".equals( dbox.getString("d_area") )){
                	cnt = dbox.getInt("d_total");
                	if (cnt > 0) 
                		grad_rate = (double)Math.round((double)dbox.getInt("d_graduatedcnt")/cnt*100*100)/100;
                	else
                		grad_rate = 0;
                	v_area = "����";
                }
                
                if(dbox.getInt("d_graduatedcnt") > 0){
                	v_mrate = (double)Math.round( (double)dbox.getInt("d_msum") *100 / dbox.getInt("d_graduatedcnt")  ) ;
                	v_frate = (double)Math.round( (double)dbox.getInt("d_fsum") *100 / dbox.getInt("d_graduatedcnt")  ) ;
                } else {
                	v_mrate = 0;
                	v_frate = 0;
                }
                
                grad_cnt += dbox.getInt("d_graduatedcnt");
                totalCnt += dbox.getInt("d_total");
                
%>
                <tr>
                    <td class="table_01" > 	<%= v_area %> </td>
                    <td class="table_01" ><%= new java.text.DecimalFormat("##,###,##0").format(dbox.getInt("d_total"))%></td>
                    <td class="table_01" ><%= new java.text.DecimalFormat("##,###,##0").format(dbox.getInt("d_graduatedcnt")) %></td>
                    <td class="table_01" ><%= v_mrate %> / <%= v_frate %></td>
                    <td class="table_01" ><%= grad_rate%></td>
                </tr>
<%
            }
%>
				<tr>
                    <td class="table_01" > 	��ü</td>
                    <td class="table_01" ><%= totalCnt%></td>
                    <td class="table_01" ><%= grad_cnt %></td>
                    <td class="table_01" ></td>
                    <td class="table_01" ><%= new java.text.DecimalFormat("0.00").format(grad_cnt * 100 / totalCnt )%></td>
                </tr>
<%            
        } else {
%>
                <tr>
                    <td class="table_01" colspan="17">��ȸ�� �ڷᰡ �����ϴ�.</td>
                </tr>
<%
        }
%>
            </table>            

<%
    }

    
%>
    
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
