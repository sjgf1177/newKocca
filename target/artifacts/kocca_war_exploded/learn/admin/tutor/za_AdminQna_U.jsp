<%
//**********************************************************
//  1. ��      ��: ���� ������
//  2. ���α׷��� : za_AdminQna_U.jsp
//  3. ��      ��: ���� ������ ����
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 9. 20
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.tutor.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = " com.dunet.common.util.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process  = box.getString("p_process");
    int  v_pageno      = box.getInt("p_pageno");
    int     v_pagesize = box.getInt("p_pagesize");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    int     v_tabseq     = box.getInt("p_tabseq");               // �Խ��� ID
    int     v_seq        = box.getInt("p_seq");                  // �Խù� ID

    int    v_cnt     = 0;
    String v_userid  = "";
    String v_name    = "";
    String v_indate  = "";
    String v_title   = "";
    String v_content = "";

    DataBox dbox = (DataBox)request.getAttribute("selectQna");
    if (dbox != null ) {
        v_seq         	 = dbox.getInt("d_seq");
        v_userid      	 = dbox.getString("d_userid");
        v_name        	 = dbox.getString("d_name");
        v_title       	 = dbox.getString("d_title");
        v_content     	 = dbox.getString("d_content");
        v_cnt         	 = dbox.getInt("d_cnt");
        v_indate      	 = dbox.getString("d_indate");
        v_title = StringManager.replace(v_title, "`", "'");
    }
	
    String s_userid    = box.getSession("userid");
    String s_username  = box.getSession("name");
    
    //���ø� ���� 
    String v_server   = conf.getProperty("kocca.url.value");
    String v_tem_url  = conf.getProperty("url.namo.template");
    String v_tem_name = conf.getProperty("name.namo.template.ini");
    String v_tem_url_name = v_server + v_tem_url + v_tem_name;
	
%>
<html>
<head>
<title>Ȯ�����������ý���</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/hhi_lib.js"></script>
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
        document.form1.action = "/servlet/controller.tutor.AdminQnaServlet";
        document.form1.p_process.value = "update";
        document.form1.submit();
    }
	
   //������� ��ȸȭ������
   function cancel() {
        document.form1.action = "/servlet/controller.tutor.AdminQnaServlet";
        document.form1.p_process.value = "";
        document.form1.submit();
   }

//-->
</SCRIPT>


</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post" enctype = "multipart/form-data">
    <input type = "hidden" name = "p_process"    value = "<%=v_process %>">
    <input type = "hidden" name = "p_pageno"     value = "<%=v_pageno %>">
    <input type= "hidden" name= "p_pagesize"   value= "<%=v_pagesize %>">
    <input type = "hidden" name = "p_search"     value = "<%=v_search %>">
    <input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
    <input type = "hidden" name = "p_tabseq"     value = "<%=v_tabseq%>">
    <input type = "hidden" name = "p_seq"        value = "<%= v_seq %>">
    <input type = "hidden" name = "p_content"    value = "<%=StringUtil.convertHtmlchars(v_content)%>">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="768">
  <tr>
      <td align="center" valign="top"> 
        <!----------------- title ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
          <tr> 
            <td><img src="/images/admin/tutor/tit_tutor_quest.gif"></td>
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
                <!-- ���� ��Ƽ�� ������  ���� -->
                <script language="javascript" src="/script/user_patch.js"></script>
                <script language="javascript" for="Wec" event="OnInitCompleted()">document.form1.Wec.TemplateIniURL = "<%=v_tem_url_name%>"; namoActiveInitCompleted('p_content');</script>
                <script language="javascript">object_namoActivepatch('100%','500');</script>
                <!-- ���� ��Ƽ�� ������  ���� -->
            <br></td>
          </tr>
          <tr> 
            <td height="25" class="table_title"><b>��������</b></td>
            <td class="table_02_2">
              <%
                  Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
                  Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
                  Vector i_fileseqVector     = (Vector)dbox.getObject("d_fileseq");         // ���� �Ϸù�ȣ
                  
                  int    i_fileLimit         = NoticeAdminBean.getFILE_LIMIT();              // ���� ÷�� ���ϼ�
                   
                  %>
                  <%@ include file="/learn/admin/include/za_MultiAttach.jsp" %> 
           </td>
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
