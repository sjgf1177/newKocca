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
    

</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">


	�˾�������

</body>
</html>
