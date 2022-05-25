<%
//**********************************************************
//  1. ��      ��: Notice
//  2. ���α׷��� : za_Notice_I.jsp
//  3. ��      ��: �������� ���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ��â�� 2005. 8. 1
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>

<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process  = box.getString("p_process");
    
    //����Ʈ ������ �˻� ���� �� ����¡ ó�� ����
    int  v_pageno      = box.getInt("p_pageno");
    int  v_pagesize      = box.getInt("p_pagesize");

    String          v_selGroup     = box.getString("p_selGroup");
    String          v_selGubun     = box.getString("p_selGubun");
    String          v_propstart    = box.getString("p_propstart");
    String          v_propend      = box.getString("p_propend");
    String          v_selSeminarNm = box.getString("p_selSeminarNm");
    
    
    String s_username  = box.getSession("name");

    String v_server   = conf.getProperty("kocca.url.value");
    String v_tem_url  = conf.getProperty("url.namo.template");
    String v_tem_name = conf.getProperty("name.namo.template.ini");
    
    String v_tem_url_name = v_server + v_tem_url + v_tem_name;

    String  s_gadmin    = box.getSession("gadmin");
    String v_gadmin ="";
    if(!s_gadmin.equals("")){
      v_gadmin = s_gadmin.substring(0,1);
    }
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">
<link rel="stylesheet" type="text/css" href="/css/ui-lightness/ui.all.css" />
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/ui.core.js"></script>
<script type="text/javascript" src="/script/effects.core.js"></script>
<script type="text/javascript" src="/script/effects.blind.js"></script>
<script type="text/javascript" src="/script/effects.drop.js"></script>
<script type="text/javascript" src="/script/effects.explode.js"></script>
<script type="text/javascript" src="/script/ui.datepicker.js"></script>
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
$(document).ready(function(){
	$("#p_sdate1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_edate1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_propsdate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
	$("#p_propedate").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
});
<!--
//����
    function insert_check() {

        document.form1.p_content.value = document.form1.Wec.MIMEValue;
        document.form1.p_content.value.replace("&","&amp;");

        if (document.form1.p_seminargubun.options[0].selected) {
            alert("��ũ�� �з��� �����ϼ���");
            document.form1.p_seminargubun.focus();
            return;
        }


        if (document.form1.p_sdate1.value == "") {
            alert("��ũ�� ������ �Է��ϼ���");
            document.form1.p_sdate.focus();
            return;
        }

        if (document.form1.p_edate1.value == "") {
            alert("��ũ�� ������ �Է��ϼ���");
            document.form1.p_edate.focus();
            return;
        }

        if (document.form1.p_shour.value == "") {
            alert("��ũ�� ���� �ð��� �Է��ϼ���");
            document.form1.p_shour.focus();
            return;
        }

        if (document.form1.p_ehour.value == "") {
            alert("��ũ�� ���� �ð��� �Է��ϼ���");
            document.form1.p_ehour.focus();
            return;
        }

        if (document.form1.p_propsdate.value == "") {
            alert("��ũ�� ��û ������ �Է��ϼ���");
            document.form1.p_propsdate.focus();
            return;
        }

        if (document.form1.p_propedate.value == "") {
            alert("��ũ�� ��û ������ �Է��ϼ���");
            document.form1.p_propedate.focus();
            return;
        }

        var regNum = /^[0-9]+$/;
        
        if (document.form1.p_limitmember.value == "") {
            alert("�ο��� �Է��ϼ���");
            document.form1.p_limitmember.focus();
            return;
        } else if(!regNum.test(document.form1.p_limitmember.value)){
        	alert("�ο��� ���ڸ� �Է� �����մϴ�.");
            document.form1.p_limitmember.focus();
            return;
        }


        if (document.form1.p_target.options[0].select) {
            alert("����� �����ϼ���");
            document.form1.p_target.focus();
            return;
        }

        if (document.form1.p_tname.value == "") {
            alert("��米���� �Է��ϼ���");
            document.form1.p_tname.focus();
            return;
        }

        if (realsize(document.form1.p_seminarnm.value) > 200) {
            alert("���Ǹ��� �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_seminarnm.focus();
            return;
        }

        if (document.form1.Wec.Value.length < 3) {
            alert("������ �Է��ϼ���");
            return;
        }

        var st_date = make_date(document.form1.p_sdate1.value);
        var ed_date = make_date(document.form1.p_edate1.value);

        var st_hour = document.form1.p_shour.value;
        var ed_hour = document.form1.p_ehour.value;

        if(st_date > ed_date){
            alert("��ũ�� �������� �����Ϻ��� Ů�ϴ�.");
            return;
        }
        
        st_date = st_date + st_hour;
        ed_date = ed_date + ed_hour

        var prop_st_date = make_date(document.form1.p_propsdate.value);
        var prop_ed_date = make_date(document.form1.p_propedate.value);

        if(prop_st_date > prop_ed_date){
            alert("��ũ�� ��û�� �������� �����Ϻ��� Ů�ϴ�.");
            return;
        }

        
        document.form1.p_startdate.value  = st_date;
        document.form1.p_enddate.value    = ed_date;
        document.form1.p_propstart.value  = prop_st_date;
        document.form1.p_propend.value    = prop_ed_date;

        // ����� ����ũ �˻� ���� ����(��� �� ����Ʈ ù �������� ������ �մϴ�.)
        document.form1.p_pageno.value     = 1;
        document.form1.p_sdate.value      = "";
        document.form1.p_edate.value      = "";
        document.form1.p_selGubun.value   = "";
        document.form1.p_selSeminarNm.value = "";
        
        document.form1.action = "/servlet/controller.homepage.SeminarAdminServlet";
        document.form1.p_process.value = "insert";

        document.form1.submit();
    }

    function list() {
        document.form1.action = "/servlet/controller.homepage.SeminarAdminServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }


//-->
</SCRIPT>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<form name="form1" method="post" enctype="multipart/form-data">
    <input type = "hidden" name="p_process"      value = "<%= v_process %>">
    <input type = "hidden" name="p_pageno"       value = "<%= v_pageno %>">
    <input type = "hidden" name="p_pagesize"     value = "<%= v_pagesize %>">
    <input type = "hidden" name="p_sdate"        value = "<%= v_propstart %>">
    <input type = "hidden" name="p_edate"        value = "<%= v_propend %>">
    <input type = "hidden" name="p_selGubun"     value = "<%= v_selGroup %>">
    <input type = "hidden" name="p_selSeminarNm" value = "<%= v_selSeminarNm %>">
    
    <input type = "hidden" name="p_startdate"    value = "">
    <input type = "hidden" name="p_enddate"      value = "">
    <input type = "hidden" name="p_propstart"    value = "">
    <input type = "hidden" name="p_propend"      value = "">
    <input type = "hidden" name="p_grocdecd"     value = "">
    <input type = "hidden" name="p_content"      value = "">
    

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
        <tr>
          <td><img src="/images/admin/portal/s.1_16.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->

        <br>
        <br>
        <!----------------- �������� ���� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>�ۼ���</strong></td>
            <td width="85%" height="25" class="table_02_2"><%=s_username%></td>
          </tr>
          <tr class="table_02_2">
            <td height="25" class="table_title" ><strong>��ũ�� �з�</strong></td>
            <td height="25" class="table_02_2">
              <kocca_select:select name="p_seminargubun" sqlNum="seminar.list1"  param=" "              
                onChange="" attr=" " selectedValue="" isLoad="true" all="Y" />
            </td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>��ũ�� �Ⱓ</strong></td>
            <td height="25" class="table_02_2">
              <input name="p_sdate1" id="p_sdate1" class="datepicker_input1" type="text" size="10" value=''>
              <select name="p_shour">
                <option value="">����</option>
                <% for(int i = 1 ; i <=24 ; i++) { %>
                      <option value="<%=i < 10 ? "0"+i : i %>"><%=i %></option>
                <%   }%>
               </select>
               ��
              ~
              <input name="p_edate1" id="p_edate1" class="datepicker_input1" type="text" size="10" value=''>
              <select name="p_ehour">
                <option value="">����</option>
                <% for(int i = 1 ; i <=24 ; i++) { %>
                      <option value="<%=i < 10 ? "0"+i : i %>"><%=i %>��</option>
                <%   }%>
               </select>
               ��
            </td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>��ũ�� ��û�Ⱓ</strong></td>
            <td height="25" class="table_02_2">
              <input name="p_propsdate" id="p_propsdate" class="datepicker_input1" type="text" size="10" value=''>
              ~
              <input name="p_propedate" id="p_propedate" class="datepicker_input1" type="text" size="10" value=''>
            </td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>�ο�</strong></td>
            <td height="25" class="table_02_2">
              <input type="text" name="p_limitmember" size = 3 class="input" maxlength="3">��
            </td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>���</strong></td>
            <td height="25" class="table_02_2">
              <kocca_select:select name="p_target" sqlNum="seminar.list3"  param=" "              
                onChange="" attr=" " selectedValue="" isLoad="true" all="Y" />  
            </td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>���Ǹ�</strong></td>
            <td height="25" class="table_02_2"><input type="text" name="p_seminarnm" size = 100 class="input" maxlength="80"></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>��米��</strong></td>
            <td height="25" class="table_02_2"><input type="text" name="p_tname" size = 10 class="input" maxlength="80"></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong></strong></td>
            <td height="25" class="table_02_2">
                <!-- ���� ��Ƽ�� ������  ���� -->
                <script language="javascript" src="/script/user_patch.js"></script>
                <script language="javascript" for="Wec" event="OnInitCompleted()">document.form1.Wec.TemplateIniURL = "<%=v_tem_url_name%>";</script>
                <script language="javascript">object_namoActivepatch('100%','500');</script>
                <!-- ���� ��Ƽ�� ������  ���� -->
            </td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>�������</strong></td>
            <td height="25" class="table_02_2">
              <input type="radio" name="p_use" value='Y' class="input" checked>���&nbsp;
              <input type="radio" name="p_use" value='N' class="input">�̻��&nbsp;
            </td>
          </tr>
        </table>
        <!----------------- �������� ���� �� ----------------->

        <br>
        <!----------------- ����, ��� ��ư ����----------------->
        <table width="11%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="center"><a href="javascript:insert_check()"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
            <td align="center"><a href="javascript:list()"><img src="/images/admin/button/btn_cancel.gif" border="0"></a></td>
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
