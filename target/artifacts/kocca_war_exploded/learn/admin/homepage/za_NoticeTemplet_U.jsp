<%
//**********************************************************
//  1. ��      ��: Notice Templet
//  2. ���α׷��� : za_NoticeTemplet_U.jsp
//  3. ��      ��: �������� ����
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 13
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.dunet.common.util.*" %> 
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process  = box.getString("p_process");
    int     v_pageno   = box.getInt("p_pageno");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    String  v_selGubun   = box.getString("p_selGubun");
    int     v_seq        = box.getInt("p_seq");

    int    v_cnt         = 0;            // ��ȸ��
    String v_adtitle     = "";           // ����
    String v_templetfile = "";           // ���ø� ����
    String v_contents    = "";           // ����
    String v_addate      = "";           // �����
    String v_adname      = "";           // �����
	String v_ldate       = "";           // ������
	String v_gubun       = "";           // ���ø� �з��ڵ�
	
	String v_code        = "";
	String v_codenm      = "";

    DataBox dbox = (DataBox)request.getAttribute("selectNotice");
    if (dbox != null) {
        v_adtitle     = dbox.getString("d_adtitle");
        v_templetfile = dbox.getString("d_templetfile");
        v_contents    = dbox.getString("d_contents");
        v_addate      = dbox.getString("d_addate");
        v_adname      = dbox.getString("d_adname");
        v_ldate       = dbox.getString("d_ldate");
        v_gubun       = dbox.getString("d_gubun");
        v_cnt         = dbox.getInt("d_cnt");

        v_addate     = FormatDate.getFormatDate(v_addate,"yyyy/MM/dd");
        v_ldate      = FormatDate.getFormatDate(v_ldate,"yyyy/MM/dd");
		v_contents   = StringManager.replace(v_contents,"&nbsp;", "&amp;nbsp;");
     }

    // ini ���� ����
    String v_server   = conf.getProperty("kocca.url.value");
    String v_tem_url  = conf.getProperty("url.namo.template");
    String v_tem_name = conf.getProperty("name.namo.template.ini");
    String v_tem_url_name = v_server + v_tem_url + v_tem_name;
    
    ArrayList codeList  = (ArrayList)request.getAttribute("codeList");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

    function insert_check() {
        if (document.form1.p_adtitle.value == "") {
            alert("������ �Է��ϼ���");
            document.form1.p_adtitle.focus();
            return;
        }
        if (realsize(document.form1.p_adtitle.value) > 200) {
            alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_adtitle.focus();
            return;
        }

        if(document.form1.p_gubun.value == ""){
            alert("�з��� �����ϼ���.");
            document.form1.p_gubun.focus();
            return;
        }

        document.form1.p_contents.value = document.form1.Wec.MIMEValue;
        document.form1.p_contents.value.replace("&","&amp;");
        
        if (document.form1.Wec.Value.length < 3) {
            alert("������ �Է��ϼ���");
            return;
        }

        document.form1.p_pageno.value = 1;
        document.form1.p_searchtext.value = "";
        document.form1.p_search.value     = "";
        document.form1.action = "/servlet/controller.homepage.NoticeTempletServlet";
        document.form1.p_process.value = "update";
        document.form1.submit();
    }

    function list() {
        document.form1.action = "/servlet/controller.homepage.NoticeTempletServlet";
        document.form1.p_process.value = "select";
        document.form1.submit();
    }

//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post">
    <input type = "hidden" name = "p_process"      value = "<%= v_process %>">
    <input type = "hidden" name = "p_pageno"       value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_search"       value = "<%=v_search %>">
    <input type = "hidden" name = "p_searchtext"   value = "<%=v_searchtext %>">
    <input type = "hidden" name = "p_selGubun"     value = "<%=v_selGubun %>">
    <input type = "hidden" name = "p_seq"          value = "<%=v_seq %>">
    <input type = "hidden" name = "p_contents"     value = "<%=StringUtil.convertHtmlchars(v_contents)%>">
    <input type = "hidden" name = "p_templetfile"  value = "<%=v_templetfile %>">

  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top"> 

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/homepage/tit_noticetem.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        
      <br>


      <!----------------- CNETER ���� ----------------->
      <table class="table_out" cellspacing="1" cellpadding="5">
        <tr> 
          <td colspan="8" class="table_top_line"></td>
        </tr>
        <tr> 
          <td width="17%" class="table_title"><b>����</b></td>
          <td width="83%" height="25" colspan="7" class="table_02_2">
            <input type="text" name="p_adtitle" size = 100 class="input" value='<%= v_adtitle %>'>
          </td>
        </tr>
        <tr> 
          <td width="17%" class="table_title"><b>�з�</b></td>
          <td width="83%" height="25" colspan="7" class="table_02_2">
            <select name="p_gubun">
              <option value="">::����::</option>
              <% 
                if (codeList != null && codeList.size() > 0) {
                    for(int i = 0 ; i < codeList.size() ; i ++ ) {
                        DataBox dbox1   = (DataBox)codeList.get(i);

                        v_code         = dbox1.getString("d_code"); 
                        v_codenm       = dbox1.getString("d_codenm");
              %>
                <option value="<%=v_code %>" <%=v_code.equals(v_gubun) ? "selected" : "" %>><%=v_codenm %></option>
              <%
                    }
                }
              %>
            </select>
          </td>
        </tr>
        <tr> 
          <td align="center" class="table_title">����</td>
          <td colspan="7" class="table_02_2" >
                <!-- ���� ��Ƽ�� ������  ���� -->
                <script language="javascript" src="/script/user_patch.js"></script>
                <script language="javascript" for="Wec" event="OnInitCompleted()">document.form1.Wec.TemplateIniURL = "<%=v_tem_url_name%>";namoActiveInitCompleted("p_contents");</script>
                <script language="javascript">object_namoActivepatch('100%','500');</script>
                <!-- ���� ��Ƽ�� ������  ���� -->
          </td>
        </tr>
      </table>

        <br>
        <!----------------- ����, ��� ��ư ����----------------->
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td align="right" height="20">
            <a href="javascript:insert_check()"><img src="/images/admin/button/btn_modify.gif" border="0"></a>
            <a href="javascript:list()"><img src="/images/admin/button/btn_cancel.gif" border="0"></a>
          </td>
        </tr>
        <tr> 
          <td height="3"></td>
        </tr>
      </table>
        <!----------------- ����, ��� ��ư �� ----------------->
      </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %> 
</form>
</body>
</html>