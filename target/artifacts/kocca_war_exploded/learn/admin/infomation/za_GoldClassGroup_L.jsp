<%
//**********************************************************
//  1. ��      ��: �������� �ϰ�����
//  2. ���α׷��� : za_GoldClassGroup_L.jsp
//  3. ��      ��: �������� �ϰ�����
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ����� 2016.12.07
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType="text/html;charset=euc-kr" %>
<%@page errorPage="/learn/library/error.jsp" %>
<%@ page import="java.util.ArrayList" %>

<%@ page import="com.credu.library.DataBox" %>
<%@ page import="com.credu.library.FormatDate" %>
<%@ page import="com.credu.library.RequestBox" %>
<%@ page import="com.credu.library.PageUtil" %>
<%@ page import="com.credu.library.StringManager" %>

<jsp:useBean id="conf" class="com.credu.library.ConfigSet"  scope="page" />
<%

    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process = box.getString("p_process");

    String v_grcode = "";
    String v_grcodenm = "";
    String v_domain = "";
    int v_goldclassCnt = 0;

    DataBox dbox = null;
    ArrayList<DataBox> list = (ArrayList<DataBox>)request.getAttribute("list");
%>
<html>
<head>
<title>�������� �����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<link rel="stylesheet" type="text/CSS" href="/css/jquery-ui-1.10.4.css">
<script type="text/javascript" src = "/script/cresys_lib.js"></script>
<script type="text/javascript" src="/script/jquery-1.10.2.js"></script>
<script type="text/javascript" src="/script/jquery-ui-1.10.4.js"></script>
<script type="text/javascript">
    $(document).ready( function() {

    });
    
    
    /**
    * ���°��� �������� �̵�
    */
    function fnInsertPage(grcode){
    	$('#p_grcode').val(grcode);
    	$('#p_process').val('insertPage');
    	$("#form1").attr({
    		action : '/servlet/controller.infomation.GoldClassGroupServlet',
    		target : '_self'
    	}).submit();
    }
    
    /**
    * ���� ���ε� ������ �̵�
    */
    function excelUpload(){
    	$('#p_process').val('uploadPage');
    	$("#form1").attr({
    		action : '/servlet/controller.infomation.GoldClassGroupServlet',
    		target : '_self'
    	}).submit();
    }

</script>
</head>

<body bgcolor="#ffffff" text="#000000" topmargin="0" leftmargin="0">
<form id="form1" name="form1" >
    <input type="hidden" id="p_process" name="p_process" value="<%= v_process %>" />
    <input type="hidden" id="p_grcode" name="p_grcode" value="" />


	<table width="1000" border="0" cellspacing="0" cellpadding="0">
	    <tr>
	        <td align="center" valign="top">
	            <!-- title ���� //-->
	            <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
	                <tr>
	                    <td><img src="/images/admin/portal/s.1_19.gif" /></td>
	                    <td align="right"><img src="/images/admin/common/sub_title_tail.gif" /></td>
	                </tr>
	            </table>
	            <!-- title �� //-->
	
	            <br />
	            <!-- form ���� //-->
	            <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
	                <tr>
	                    <td width="240" align="right" valign="middle">
	                        <a href="javascript:excelUpload()"><img src="/images/admin/button/btn_fileplus.gif" alt="���Ϸ��߰�" /></a>
	                    </td>
	                </tr>
	                <tr>
	                    <td height="3"></td>
	                </tr>
	            </table>
	            <!-- form �� //-->
	
	
	            <!-- �������� ���� ���� //-->
	            <table class="table_out" cellspacing="1" cellpadding="5">
	                <tr>
	                    <td colspan="7" class="table_top_line"></td>
	                </tr>
	                <tr>
	                    <td class="table_title" width="10%"><b>�׷��ڵ�</b></td>
	                    <td class="table_title"><b>�����׷�</b></td>
	                    <td class="table_title" width="30%"><b>������</b></td>
	                    <td class="table_title" width="10%"><b>��밭��</b></td>
	                    <td class="table_title" width="10%"><b>���°���</b></td>
	                </tr>
					<%
		            for(int i = 0; i < list.size(); i++) {
		
		                dbox = (DataBox)list.get(i);
						v_grcode = dbox.getString("d_grcode");
						v_grcodenm = dbox.getString("d_grcodenm");
						v_domain = dbox.getString("d_domain");
						v_goldclassCnt = dbox.getInt("d_goldclass_cnt");
					%>
						<tr>
							<td class="table_02_1"><%=v_grcode%></td>
							<td class="table_02_2"><%=v_grcodenm%></td>
							<td class="table_02_2"><a href="<%=v_domain%>" target="blank"><%=v_domain%></a></td>
							<td class="table_02_1"><%=v_goldclassCnt%></td>
							<td class="table_02_1">
								<button class="btn_basic" onclick="fnInsertPage('<%=v_grcode%>');">���°���</button>
							</td>
						</tr>
					<%
		        	}
					%>
	            </table>
	            <!-- �������� ��� �� //-->
	
	            <br />
	        </td>
	    </tr>
	</table>
</form>

<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
