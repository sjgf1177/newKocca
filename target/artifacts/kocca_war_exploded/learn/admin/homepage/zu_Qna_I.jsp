<%
//**********************************************************
//  1. ��      ��: �����Խ���
//  2. ���α׷���: zu_StudyBoard_I.jsp
//  3. ��      ��: �����Խ��� ���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.contents.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.common.*" %>


<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    int     v_tabseq   = box.getInt("p_tabseq");
    String  v_process  = box.getString("p_process");
    int     v_pageno   = box.getInt("p_pageno");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    int     v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�
    String  v_subj		 = box.getString("p_subj");        //�����ڵ�
    String  v_year		 = box.getString("p_year");        //�⵵
    String  v_subjseq	 = box.getString("p_subjseq");     //���� ����

    String s_userid    = box.getSession("userid");
    String s_username  = box.getSession("name");    
    
    String v_server   = conf.getProperty("kocca.url.value");
    String v_tem_url  = conf.getProperty("url.namo.template");
    String v_tem_name = conf.getProperty("name.namo.template.ini");
    String v_tem_url_name = v_server + v_tem_url + v_tem_name;

    // editor
    String content      = "";
    String width        = "600";
    String height       = "300";

%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/hhi_lib.js"></script>
<script language="JavaScript">
<!--
// ���
function insert() {

	document.form1.p_content.value = document.form1.Wec.MIMEValue;
	document.form1.p_content.value.replace("&","&amp;");
	
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

    if (document.form1.Wec.TextValue.length < 3) {
        alert("������ �Է��ϼ���");
        return;
    }   


    //if(!limitFile()){
    //    alert("���ε� �������� ���� ������ �����մϴ�.");
    //    return;
    //}  	    	    	    
    
    document.form1.target = "_self";
    document.form1.action = "/servlet/controller.homepage.QnaAdminServlet";
    document.form1.p_search.value     = "";
    document.form1.p_searchtext.value = "";
    document.form1.p_process.value = "insert";
    document.form1.submit();
}

// ��������̵�
function list() {
    document.form1.target = "_self";
    document.form1.action = "/servlet/controller.homepage.QnaAdminServlet";
    document.form1.p_process.value = "selectList";
    document.form1.submit();
}

//-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<form name="form1" method="post" enctype = "multipart/form-data">

	<input type = "hidden" name = "p_process"    value = "<%=v_process %>">
    <input type = "hidden" name = "p_pageno"     value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_search"     value = "<%=v_search %>">
    <input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
    <input type = "hidden" name = "p_tabseq"     value = "7">
    <input type = 'hidden' name = "p_content"     value = "">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="768">
  <tr>
      <td align="center" valign="top"> 
        <!----------------- title ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/homepage/homepage_title12.gif" ></td>
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
				<td width="15%" class="table_title"><strong>������</strong></td>
				<td height="25" class="table_02_2"><%= SelectSubjBean.getSubj2(box)%></td>
		  </tr>
					
			<tr>
				<td width="15%" class="table_title">����</th>
				<td height="25" class="table_02_2"><input type="text" name="p_title" class="inbox" style="width:590px;" /></td>
			</tr>
			<tr>
				<td width="15%" class="table_title">�ۼ���</th>
				<td height="25" class="table_02_2"><%= s_username %></td>
				
			</tr>
			<tr>	
				<td width="15%" class="table_title">�ۼ���</th>
				<td height="25" class="table_02_2"><%= FormatDate.getDate("yyyy.MM.dd") %></td>
			</tr>
			<tr>
				<td class="table_title" class="table_title">���� </td>
              <td height="25" class="table_02_2">
                <!-- ���� ��Ƽ�� ������  ���� -->
                <script language="javascript" src="/script/user_patch.js"></script>
                <script language="javascript" for="Wec" event="OnInitCompleted()">document.form1.Wec.TemplateIniURL = "<%=v_tem_url_name%>";namoActiveInitCompleted('p_content');</script>
                <script language="javascript">object_namoActivepatch('100%','500');</script>
                <!-- ���� ��Ƽ�� ������  ���� -->
    		  </td>
			</tr>
			
					 <tr> 
		              <td class="table_title" class="table_title">����÷�� </td>
		              <td class="table_02_2" colspan="3">		              
		                    <!-- ����÷�� ���� -->
		                    <%
		                    int    i_fileLimit         = HomePageQnaBean.getFILE_LIMIT();             // ���� ÷�� ���ϼ�
		                    %>
		                    
		                    <%//@ include file="/learn/user/portal/include/multiAttach_include.jsp" %>
		                    <%@ include file="/learn/admin/include/za_MultiAttach_I.jsp" %>
		                    <!-- ����÷�� ���� -->
		    		  </td>
		          </tr>
          
					</table>
		          <br>
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="right" class="ms"><a href="javascript:insert()"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
            <td width="1%" align="center" class="ms">&nbsp;</td>
            <td align="left" class="ms"><a href="javascript:list()"><img src="/images/admin/button/btn_cancel.gif" border="0"></a></td>
          </tr>
        </table>
        <br>
        <!----------------- total �� ----------------->
      </td>
  </tr>
</table>

</form>
</body>
</html>