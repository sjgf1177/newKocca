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
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.dunet.common.util.*" %>  
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%

    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process  = box.getString("p_process");
    String  v_selcomp  = box.getString("p_selcomp");

    int     v_pageno   = box.getInt("p_pageno");
    int     v_pagesize = box.getInt("p_pagesize");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    //String  v_comp    = box.getString("p_comp");
    
    int     v_seq          = box.getInt("p_seq");
    
    String v_clsfcd         = "";
    String v_dtlcd          = "";
    String v_contenttype    = "";
    String v_title          = "";
    String v_content        = "";
    String v_professor      = "";
    String v_pictureurl     = "";
    String v_gubun          = "";
    String v_genre          = "";
    String v_inspector      = "";
    String v_runningtime    = "";
    String v_production     = "";
    String v_analyze        = "";
    String v_usechk         = "";
    String v_splecturenm    = "";
    String v_spcontent      = "";
    String v_mainyn         = "";
    String v_fileDelYn      = "";
    String v_imageurl       = "";
    String v_professorimg   = "";
    String v_upfile         = "";
    String v_svrfile        = "";

    
    DataBox dbox = (DataBox)request.getAttribute("selectOffExpert");
    if (dbox != null) {
    	v_clsfcd         = dbox.getString("d_clsfcd");      
    	v_dtlcd          = dbox.getString("d_dtlcd");       
    	v_contenttype    = dbox.getString("d_contenttype"); 
    	v_title          = dbox.getString("d_title");       
    	v_content        = dbox.getString("d_content");     
    	v_professor      = dbox.getString("d_professor");   
    	v_pictureurl     = dbox.getString("d_pictureurl");  
    	v_gubun          = dbox.getString("d_gubun");       
    	v_genre          = dbox.getString("d_genre");       
    	v_inspector      = dbox.getString("d_inspector");   
    	v_runningtime    = dbox.getString("d_runningtime"); 
    	v_production     = dbox.getString("d_production");  
    	v_analyze        = dbox.getString("d_analyze");     
    	v_usechk         = dbox.getString("d_usechk");      
    	v_splecturenm    = dbox.getString("d_splecturenm"); 
    	v_spcontent      = dbox.getString("d_spcontent");   
    	v_mainyn         = dbox.getString("d_mainyn");      
    	v_fileDelYn      = dbox.getString("d_fileDelYn");   
    	v_imageurl       = dbox.getString("d_imageurl");    
    	v_professorimg   = dbox.getString("d_professorimg");
    	v_upfile         = dbox.getString("d_upfile");        
    	v_svrfile        = dbox.getString("d_svrfile");        
 
    }
    
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
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script language = "javascript" src= "/script/cresys_lib.js"></script>
<script language = "VBScript"   src= "/script/cresys_lib.vbs"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
//����
    function insert_check() {

    document.form1.p_content.value = document.form1.Wec.MIMEValue;                                                                                          
    document.form1.p_content.value.replace("&","&amp;"); 
    
    if (document.form1.p_dtlcd.value == "") {
        alert("���� �з��� �Է��Ͽ��ֽʽÿ�");
        document.form1.p_dtlcd.focus();
        return;
    }

    if (document.form1.p_pictureurl.value == "") {
        alert("���� URL�� �Է��Ͽ��ֽʽÿ�");
        document.form1.p_pictureurl.focus();
        return;
    }

    if (document.form1.p_title.value == "") {
        alert("���¸��� �Է��Ͽ��ֽʽÿ�");
        document.form1.p_title.focus();
        return;
    }

    if (document.form1.p_professor.value == "") {
        alert("������� �Է��Ͽ��ֽʽÿ�");
        document.form1.p_professor.focus();
        return;
    }

    if (document.form1.Wec.Value.length < 3) {
        alert("������ �Է��ϼ���");
        return;
    }

    if (document.form1.p_runningtime.value == "") {
        alert("����Ÿ���� �Է��Ͽ��ֽʽÿ�");
        document.form1.p_runningtime.focus();
        return;
    }

    if (document.form1.p_inspector.value == "") {
        alert("������ �Է��Ͽ��ֽʽÿ�");
        document.form1.p_inspector.focus();
        return;
    }

    if (document.form1.p_genre.value == "") {
        alert("�帣�� �Է��Ͽ��ֽʽÿ�");
        document.form1.p_genre.focus();
        return;
    }

    if (document.form1.p_spcontent.value == "") {
        alert("���³����� �Է��Ͽ��ֽʽÿ�");
        document.form1.p_spcontent.focus();
        return;
    }

    if (document.form1.p_analyze.value == "") {
        alert("��ǰ�ؼ��� �Է��Ͽ��ֽʽÿ�");
        document.form1.p_analyze.focus();
        return;
    }

    if (document.form1.p_production.value == "") {
        alert("������������ �Է��Ͽ��ֽʽÿ�");
        document.form1.p_production.focus();
        return;
    }

    if (document.form1.p_splecturenm.value == "") {
        alert("Ư���������� �Է��Ͽ��ֽʽÿ�");
        document.form1.p_splecturenm.focus();
        return;
    }

        document.form1.p_pageno.value = 1;
        document.form1.p_searchtext.value = "";
        document.form1.p_search.value     = "";
        document.form1.action = "/servlet/controller.infomation.PracticalCourseAdminServlet";
        document.form1.p_process.value = "update";

        document.form1.submit();
    }

    function list() {
        document.form1.action = "/servlet/controller.infomation.PracticalCourseAdminServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }

    function addDtl(){
         document.form1.action = "/servlet/controller.system.CodeAdminServlet";
         document.form1.p_gubun.value   = '0086';
         document.form1.p_levels.value   = 1;
         document.form1.p_process.value = "selectSubList";
         document.form1.submit();
    }

//-->
</SCRIPT>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<div id=minical OnClick="this.style.display='none';" oncontextmenu='return false' ondragstart='return false' onselectstart='return false' style="background : buttonface; margin: 5; margin-top: 2;border-top: 1 solid buttonhighlight;border-left: 1 solid buttonhighlight;border-right: 1 solid buttonshadow;border-bottom: 1 solid buttonshadow;width:155;display:none;position: absolute; z-index: 99"></div>
<form name="form1" method="post" enctype="multipart/form-data">
    <input type = "hidden" name="p_process"    value = "<%= v_process %>">
    <input type = "hidden" name="p_pageno"     value = "<%= v_pageno %>">
    <input type = "hidden" name="p_pagesize"   value = "<%= v_pagesize %>">
    <input type = "hidden" name="p_search"     value = "<%= v_search %>">
    <input type = "hidden" name="p_searchtext" value = "<%= v_searchtext %>">
    <input type = "hidden" name="p_seq"        value = "<%= v_seq %>">
    <input type= "hidden" name= "p_content"   id= "p_content"  value= "<%=StringUtil.convertHtmlchars(v_content)%>">  
    <input type = "hidden" name="p_gubun"      value = "">
    <input type = "hidden" name="p_levels"     value = "">
    
    

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
        <tr>
            <td><img src="/images/admin/portal/s.1_20.gif" ></td>
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
            <td height="25" class="table_title"><strong>���� �з�</strong></td>
            <td height="25" class="table_02_2" >
              <kocca_select:select name="p_dtlcd" sqlNum="0001"  param="0086"              
                onChange="" attr=" " selectedValue="<%=v_dtlcd %>" isLoad="true" all="N" />&nbsp; <a href="javascript:addDtl();">�з� �߰�</a>
            </td>
          </tr>
          <tr>
            <td height="25" class="table_title"><strong>���� ����</strong></td>
            <td height="25" class="table_02_2" >
              <input type="radio" name="p_contenttype" value="A1" <%=v_contenttype.equals("A1") ? "checked" : "" %>>������
              <input type="radio" name="p_contenttype" value="B1" <%=v_contenttype.equals("B1") ? "checked" : "" %>>�����
            </td>
          </tr>
          <tr>
            <td height="25" class="table_title"><strong>���� �̹���</strong></td>
            <td height="25" class="table_02_2" >
              <input type="FILE" name="p_imageurl" size="84" class="input">
              <input type="hidden" name="p_save_imageurl" value="<%=v_imageurl %>"><br>
              <img src="/servlet/controller.library.DownloadServlet?p_savefile=<%=v_imageurl %>" width=152 height=114 border=0>
            </td>
          </tr>
          <tr>
            <td height="25" class="table_title"><strong>���� URL</strong></td>
            <td height="25" class="table_02_2" >
              <input type="text" name="p_pictureurl" size = 100 class="input" maxlength="80" value="<%=v_pictureurl %>">
            </td>
          </tr>
          <tr>
            <td height="25" class="table_title"><strong>���¸�</strong></td>
            <td height="25" class="table_02_2" >
              <input type="text" name="p_title" size = 100 class="input" maxlength="80" value="<%=v_title %>">
            </td>
          </tr>
          <tr>
            <td height="25" class="table_title"><strong>�����</strong></td>
            <td height="25" class="table_02_2" >
              <input type="text" name="p_professor" size = 100 class="input" maxlength="80" value="<%=v_professor %>">
            </td>
          </tr>
          <tr>
            <td height="25" class="table_title"><strong>�������</strong></td>
            <td height="25" class="table_02_2" >
              <input type="FILE" name="p_professorimg" size="84" class="input">
              <input type="hidden" name="p_save_professorimg" value="<%=v_professorimg %>"><br>
              <img src="/servlet/controller.library.DownloadServlet?p_savefile=<%=v_professorimg %>" width=100 height=120 border=0>
            </td>
          </tr>
          <tr>
            <td height="25" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2" >
                <!-- ���� ��Ƽ�� ������  ���� -->
                <script language="javascript" src="/script/user_patch.js"></script>
                <script language="javascript" for="Wec" event="OnInitCompleted()">namoActiveInitCompleted("p_content");</script>
                <script language="javascript">object_namoActivepatch('100%','500');</script>
                <!-- ���� ��Ƽ�� ������  ���� -->
            </td>
          </tr>
          <tr>
            <td height="25" class="table_title"><strong>����Ÿ��</strong></td>
            <td height="25" class="table_02_2" >
              <input type="text" name="p_runningtime" size = 30 class="input" maxlength="30" value="<%=v_professor %>">
            </td>
          </tr>
          <tr>
            <td height="25" class="table_title"><strong>�帣</strong></td>
            <td height="25" class="table_02_2" >
              <input type="text" name="p_genre" size = 30 class="input" maxlength="30" value="<%=v_professor %>">
            </td>
          </tr>
          <tr>
            <td height="25" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2" >
              <input type="text" name="p_inspector" size = 30 class="input" maxlength="30" value="<%=v_professor %>">
            </td>
          </tr>
          <tr>
            <td height="25" class="table_title"><strong>���³���</strong></td>
            <td height="25" class="table_02_2" >
              <textarea name="p_spcontent" cols='80' rows='20' style="width: 100%; height: 200;"><%=v_professor %></textarea>
            </td>
          </tr>
          <tr>
            <td height="25" class="table_title"><strong>��ǰ�ؼ�</strong></td>
            <td height="25" class="table_02_2" >
              <textarea name="p_analyze" cols='80' rows='20' style="width: 100%; height: 200;"><%=v_professor %></textarea>
            </td>
          </tr>
          <tr>
            <td height="25" class="table_title"><strong>����������</strong></td>
            <td height="25" class="table_02_2" >
              <input type="text" name="p_production" size = 30 class="input" maxlength="30" value="<%=v_professor %>">
            </td>
          </tr>
          <tr>
            <td height="25" class="table_title"><strong>Ư�����¸�</strong></td>
            <td height="25" class="table_02_2" >
              <input type="text" name="p_splecturenm" size = 30 class="input" maxlength="30" value="<%=v_professor %>">
            </td>
          </tr>
          <tr>
            <td height="25" class="table_title"><strong>÷������</strong></td>
            <td height="25" class="table_02_2" >
            <%      if(v_svrfile != null && !v_svrfile.equals("")) {        %>
                <a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_upfile%>&p_realfile=<%= v_svrfile%>'><%= v_upfile%></a>&nbsp;
                <input type = "checkbox"  name = "p_file10" value = "1"> (������ üũ) &nbsp;&nbsp;&nbsp;  <font color="blue">    ÷�ε� ������ ������ üũ �����ʾƵ� ���� ÷�ε� ���Ϸ� ����˴ϴ�. </font><br>
              <input type = "hidden" name = "p_up_file"    value = "<%=v_upfile%>">
              <input type = "hidden" name = "p_save_file"  value = "<%=v_svrfile%>">
            <%      }                                                    %>
              <input type="FILE" name="p_file" size="84" class="input">
            </td>
          </tr>
          <tr>
            <td height="25" class="table_title"><strong>��뿩��</strong></td>
            <td height="25" class="table_02_2" >
              <input type="checkbox" name="p_usechk" value="Y" <%=v_usechk.equals("Y") ? "checked" : "" %>>
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
