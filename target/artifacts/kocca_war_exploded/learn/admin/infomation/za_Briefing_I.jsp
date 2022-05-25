<%
//**********************************************************
//  1. ��      ��: ������������������
//  2. ���α׷���: za_SubjGong_I.jsp
//  3. ��      ��: ������������������ �������������
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 11. 23
//  7. ��      ��:
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.infomation.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process  = box.getString("p_process");
    int v_tabseq   = box.getInt("p_tabseq");
    
    int  v_pageno      = box.getInt("p_pageno");
    
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    
    String s_username  = box.getSession("name");
    String v_compcd = "";
    
    //���ø� ���� ����
    String v_server   = conf.getProperty("kocca.url.value");
    String v_tem_url  = conf.getProperty("url.namo.template");
    String v_tem_name = conf.getProperty("name.namo.template.ini");
    String v_tem_url_name = v_server + v_tem_url + v_tem_name;
    
    String  s_gadmin    = box.getSession("gadmin");
    String v_gadmin ="";
    if(!s_gadmin.equals("")){
      v_gadmin = s_gadmin.substring(0,1);
    }
    
    String content  = "";
    String width    = "540";
    String height   = "300";

%>

<html>
<head>
<title>::: ȫ����� :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript"><!--

    // ����
    function insert_check() {
        if(blankCheck(document.form1.p_title.value)){
            alert("������ �Է��ϼ���");
            document.form1.p_title.focus();
            return;
        }
        if (document.form1.p_title.value == "") {
            alert("������ �Է��ϼ���");
            document.form1.p_title.focus();
            return;
        }
        if (realsize(document.form1.p_title.value) > 200) {
            alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_title.focus();
            return;
        }

		/*
       if (document.form1.p_position.value == "") {
            alert("�Ҽ�/�̸��� �Է��ϼ���");
            document.form1.p_position.focus();
            return;
        }
        
        if (realsize(document.form1.p_position.value) > 200) {
            alert("�Ҽ�/�̸��� �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_position.focus();
            return;
        }*/

        if(document.form1.p_file1.value == ""){
            alert("����� ������ ������ �ּ���.");
        	return;
        }
        
        if (document.form1.p_url.value == "") {
            alert("���� ��� �ּҸ� �Է��ϼ���");
            document.form1.p_url.focus();
            return;
        }
        if (realsize(document.form1.p_url.value) > 200) {
            alert("���� ��� �ּҴ� ���� ���� 200�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_url.focus();
            return;
        }
        document.form1.p_content.value = document.form1.Wec.MIMEValue;

        document.form1.p_content.value.replace("&","&amp;");

        if (document.form1.Wec.TextValue.length < 3) {
            alert("������ �Է��ϼ���");
            return;
        }
        /*
        if (realsize(document.form1.p_adcontent.value) > 2000) {
            alert("������ �ѱ۱��� 1000�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_adcontent.focus();
            return;
        }*/

        document.form1.action = "/servlet/controller.infomation.BriefingAdminServlet";
        document.form1.p_process.value = "insert";
        document.form1.submit();
    }

    // ��ü������� �̵�
    function list() {
        document.form1.action = "/servlet/controller.infomation.BriefingAdminServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }

    // �������� ����
    function selectCategory() {
        document.form1.action = "/servlet/controller.infomation.BriefingAdminServlet";
        document.form1.p_process.value = "insertPage";
        document.form1.submit();
    }
//
--></SCRIPT>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post" enctype="multipart/form-data" >
    <input type = "hidden" name="p_process"    value = "<%= v_process %>">
    <input type = "hidden" name="p_pageno"     value = "<%=v_pageno %>">
    <input type = "hidden" name="p_search"     value = "<%=v_search %>">
    <input type = "hidden" name="p_searchtext" value = "<%=v_searchtext %>">
    <input type = "hidden" name="p_tabseq"     value = "<%=v_tabseq %>">
    <input type = "hidden" name="p_content"    value = "">

  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top"> 

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/portal/s.1_12.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->
        <br>

        <!----------------- ��ü���� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2"><input type="text" name="p_title" size = 100 class="input" maxlength="80"></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>�ۼ���</strong></td>
            <td height="25" class="table_02_2"><%=s_username%></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>���ο���</strong></td>
            <td height="25" class="table_02_2">
              <select name="p_flagYn">
                  <option value='Y'>Yes</option>
                  <option value='N'>No</option>
              </select>
            </td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2">
                <!-- ���� ��Ƽ�� ������  ���� -->
                <script language="javascript" src="/script/user_patch.js"></script>
                <script language="javascript" for="Wec" event="OnInitCompleted()">document.form1.Wec.TemplateIniURL = "<%=v_tem_url_name%>";</script>
                <script language="javascript">object_namoActivepatch('100%','500');</script>
                <!-- ���� ��Ƽ�� ������  ���� -->
            </td>
          </tr>
          <tr>
              <td width="16%" class="table_title"><b>�����(160*100)<br/>-<br/>÷������</b></td>
              <td width="81%" class="table_02_2">
                  <%
                  int    i_fileLimit         = BriefingBean.getFILE_LIMIT();              // ���� ÷�� ���ϼ�
                  %>
                  <%@ include file="/learn/admin/include/za_MultiAttach_I.jsp" %> 
              </td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>����URL</strong></td>
            <td height="25" class="table_02_2"><input type="text" name="p_url" size = 118 class="input"></td>
          </tr>

        </table>
        <!----------------- ��ü���� �� ----------------->


        <br>
        <!----------------- ����, ��� ��ư ���� ----------------->
        <table  border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="center"><a href='javascript:insert_check()'><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
            <td width=8></td>
            <td align="center"><a href='javascript:list()'><img src="/images/admin/button/btn_cancel.gif" border="0"></a></td>
          </tr>
        </table>
        <!----------------- ����, ��� ��ư �� ----------------->

        <br>
      </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
