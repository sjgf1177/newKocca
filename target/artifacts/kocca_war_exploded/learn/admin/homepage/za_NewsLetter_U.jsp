<%
//**********************************************************
//  1. ��      ��: ��� ��������
//  2. ���α׷��� : za_NewsLetter_U.jsp
//  3. ��      ��: ��� �������� ����
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 9. 2
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process  = box.getString("p_process");
    int  v_pageno      = box.getInt("p_pageno");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");

    String v_type    = box.getStringDefault("p_type","HR");
    int     v_tabseq     = box.getInt("p_tabseq");               // �Խ��� ID
    int     v_seq        = box.getInt("p_seq");                  // �Խù� ID
    int     v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�

    int    v_cnt     = 0;
    String v_userid  = "";
    String v_name    = "";
    String v_indate  = "";
    String v_title   = "";
    String v_content = "";

    Vector v_realfileVector = null;          //      �����ϸ� �迭
    Vector v_savefileVector = null;          //      ������ ������ִ� ���ϸ� �迭
    Vector v_fileseqVector  = null;          //      ����� ���Ϲ�ȣ �迭


    DataBox dbox = (DataBox)request.getAttribute("selectBoard");
    if (dbox != null ) {
        v_seq         = dbox.getInt("d_seq");
        v_userid      = dbox.getString("d_userid");
        v_name        = dbox.getString("d_name");
        v_title       = dbox.getString("d_title");
        v_content     = dbox.getString("d_content");
        v_cnt         = dbox.getInt("d_cnt");
        v_indate      = dbox.getString("d_indate");
        v_realfileVector = (Vector)dbox.getObject("d_realfile");
        v_savefileVector = (Vector)dbox.getObject("d_savefile");
        v_fileseqVector  = (Vector)dbox.getObject("d_fileseq");
        v_title = StringManager.replace(v_title, "`", "'");
    }
	
	String content     = v_content;
    String s_userid    = box.getSession("userid");
    String s_username  = box.getSession("name");
	
	content = StringManager.replace(content,"&nbsp;","&amp;nbsp;");

    String v_server   = conf.getProperty("autoever.url.value");
    String v_tem_url  = conf.getProperty("url.namo.template");
    String v_tem_name = conf.getProperty("name.namo.template.ini");
    String v_tem_url_name = v_server + v_tem_url + v_tem_name;
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

	//���� ����
    function insert() {
    	document.form1.p_content.value = document.form1.Wec.MIMEValue;
    	form1.p_content.value.replace("&","&amp;");
    	
        if (blankCheck(document.form1.p_title.value)) {
            alert("������ �Է��ϼ���!");
            document.form1.p_title.focus();
            return;
        }
        if (realsize(document.form1.p_title.value) > 200) {
            alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_title.focus();
            return;
        }
        if (document.form1.Wec.Value.length < 3) {
			alert("������ �Է��ϼ���");
			return;
		}

        document.form1.p_search.value     = "";
        document.form1.p_searchtext.value = "";
        document.form1.action = "/servlet/controller.homepage.NewsAdminServlet";
        document.form1.p_process.value = "update";
        document.form1.submit();
    }
	
   //������� ��ȸȭ������
   function cancel() {
        document.form1.action = "/servlet/controller.homepage.NewsAdminServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
   }

    // onload �� ini ���� �ε�, ������ ���� ���� 
    function initPage() {
        document.form1.Wec.TemplateIniURL = "<%=v_tem_url_name%>";
        document.form1.Wec.Value = document.form1.p_contents.value;
    }

//-->
</SCRIPT>


</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0" onload="initPage()">
<form name="form1" method="post" >
    <input type = "hidden" name = "p_process"    value = "<%=v_process %>">
    <input type = "hidden" name = "p_pageno"     value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_search"     value = "<%=v_search %>">
    <input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">

    <input type = "hidden" name = "p_type"       value = "<%=v_type%>">
    <input type = "hidden" name = "p_tabseq"     value = "<%=v_tabseq%>">
    <input type = "hidden" name = "p_seq"        value = "<%= v_seq %>">
    <input type = "hidden" name = "p_upfilecnt"  value = "<%= v_upfilecnt %>">
    <input type = "hidden" name = "conText"      value = "<%=content%>">
    <input type = "hidden" name = "p_content"    value = "<%=v_content%>">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="768">
  <tr>
      <td align="center" valign="top"> 
        <!----------------- title ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
          <tr> 
            <td><img src="/images/admin/homepage/tit_news.gif"></td>
            <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
          </tr>
        </table>
        <!----------------- title �� ----------------->

      <br>
        <!----------------- FORM ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>�ۼ���</strong></td>
            <td height="25" class="table_02_2"><%=v_name%></td>
          </tr>
          <tr >
            <td height="25" class="table_title"><strong>�����</strong></td>
            <td height="25" class="table_02_2"><%= FormatDate.getFormatDate(v_indate, "yyyy/MM/dd") %></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2"><input type="text" name="p_title" size = 135 class="input" value = `<%= v_title %>`></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2">
                <!-- ���� Editor  -->
                <p align="left">
							<script language = "javascript" src = "/script/user_patch.js"></script>
							<script language='javascript'>object_namopatch('600','600');</script>
                <!--OBJECT WIDTH=0 HEIGHT=0 CLASSID="clsid:5220cb21-c88d-11cf-b347-00aa00a28331">
                   <PARAM NAME="LPKPath" VALUE="/namo/NamoWec5_Bobs_Consulting.lpk">
                </OBJECT>
                <OBJECT ID="Wec" WIDTH="600" HEIGHT="600"
                CLASSID="CLSID:DB1A8D98-97E8-4a42-9624-0E4BCD77F109" CODEBASE="/namo/NamoWec.cab#version=5,0,0,69">
                <param name="InitFileURL" value="/namo/namowec.env">
                <param name="InitFileVer" value="1.0">
                </OBJECT-->
                <!-- ���� Editor  -->
            <br></td>
          </tr>
        </table>
        <br>
        <!----------------- FORM �� ----------------->

        <!----------------- total ���� ----------------->

        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="right" class="ms"><a href="javascript:insert()"><img src="/images/admin/button/btn_save.gif"border="0"></a>&nbsp;</td>
            <td align="left" class="ms"><a href="javascript:cancel()"><img src="/images/admin/button/btn_cancel.gif" border="0"></a>&nbsp;</td>
          </tr>
        </table>
        <br>
        <!----------------- total �� ----------------->
      </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>

</form>
</body>
</html>
