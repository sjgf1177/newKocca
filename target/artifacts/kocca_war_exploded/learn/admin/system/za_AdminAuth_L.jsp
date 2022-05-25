<%
//**********************************************************
//  1. ��      ��: �޴��� ���Ѽ���(��ں�)
//  2. ���α׷��� : za_AdminAuth_L.jsp
//  3. ��      ��: �޴��� ���Ѽ���(��ں�)
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2004. 11. 15
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process     = box.getString("p_process");
    String  v_searchtext  = box.getString("p_searchtext");
    String  v_search      = box.getString("p_search");
    String 	ss_gadmin     = box.getStringDefault("s_gadmin","ALL");       //gadmin
    String  v_orderType    = box.getStringDefault("p_orderType"," asc");  //���ļ���
    
    String v_userid    = "";
    String v_gadmin    = "";
    String v_comp      = "";
    String v_isdeleted = "";
    String v_fmon      = "";
    String v_tmon      = "";
    String v_commented = "";

    String v_cono       = "";
    String v_name       = "";
    String v_jikwi      = "";
    String v_jikwinm    = "";
    String v_compnm     = "";

    ArrayList list = (ArrayList)request.getAttribute("selectList");
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

    function insert() {
        document.form1.action = "/servlet/controller.system.MenuAuthAdminEachServlet";
        document.form1.p_process.value = "insertPage";
        document.form1.submit();
    }

    function view(userid) {
        document.form1.action = "/servlet/controller.system.MenuAuthAdminEachServlet";
        document.form1.p_userid.value  = userid;
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }

    function search() {
        document.form1.action = "/servlet/controller.system.MenuAuthAdminEachServlet";
        document.form1.p_process.value = "select";
        document.form1.submit();
    }

    function changeGadmin() {
        document.form1.action = "/servlet/controller.system.MenuAuthAdminEachServlet";
        document.form1.p_process.value = "select";
        document.form1.submit();
    }
    
    // ���� ��� ��ũ��Ʈ
    function whenOrder(column) {
	if (document.form1.p_orderType.value == " asc") {
		document.form1.p_orderType.value = " desc";
	} else {
		document.form1.p_orderType.value = " asc";
	}

	document.form1.s_action.value = "go";
    document.form1.p_process.value = "select";   
    document.form1.p_orderColumn.value = column;
    
    document.form1.submit();
    }
//-->
</SCRIPT>

</head>




<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post">
    <input type = "hidden" name = "p_process" value = "<%= v_process %>">
    <input type = "hidden" name = "p_userid"  value = "">
	<input type = "hidden" name = "s_action"  value="">
	<input type = "hidden" name = "p_orderColumn" value = "">
	<input type = "hidden" name = "p_orderType" value="<%=v_orderType%>">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="665">
  <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/system/unite_title06.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>

        <!----------------- �����ڰ˻� ���� ----------------->
        <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="right">
              <select name="p_search">
                <option value='name' <% if (v_search.equals("name")) out.println("selected"); %> >����</option>
                <option value='cono' <% if (v_search.equals("cono")) out.println("selected"); %> >���</option>
              </select>
              <input name="p_searchtext" type="text" class="input" value="<%=v_searchtext%>">
            </td>
            <td width="100" align="right" valign="bottom">
              <a href='javascript:search()'><img src="/images/admin/button/btn_inquiry.gif" border="0"></a>
            </td>
          </tr>
          <tr>
            <td height="3"></td>
          </tr>
        </table>
        <!----------------- �����ڰ˻� �� ----------------->

        <!----------------- ������ ����Ʈ ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="7" class="table_top_line"></td>
          </tr>
          <tr>
            <td width="5%" height="25" class="table_title"><b>NO</b></td>
            <td width="20%" class="table_title"><b>���</b></td>
            <td width="20%" class="table_title"><b>����</b></td>
            <td width="20%" class="table_title"><b>����</b></td>
            <td width="35%" class="table_title"><b>�Ҽ�</b></td>
          </tr>
<%
            for(int i = 0; i < list.size(); i++) {
				DataBox dbox = (DataBox)list.get(i);

                v_userid     = dbox.getString("d_userid");
                v_cono       = dbox.getString("d_cono");
                v_name       = dbox.getString("d_name");
                v_jikwi      = dbox.getString("d_jikwi");
                v_jikwinm    = dbox.getString("d_jikwinm");
                v_comp       = dbox.getString("d_comp");
                v_compnm     = dbox.getString("d_compnm");
                
%>
          <tr>
            <td class="table_01" height="25"><%=i+1%></td>
            <td class="table_02_1"><%=v_userid%></td>
            <td class="table_02_1"><%=v_jikwinm%></td>
            <td class="table_02_1"><a href="javascript:view('<%=v_userid%>')"><%=v_name%></a></td>
            <td class="table_02_1"><%=v_compnm%></td>
          </tr>
<%
        }
%>

        </table>
        <!----------------- ������ ����Ʈ �� ----------------->
       <br>

      </td>
  </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
