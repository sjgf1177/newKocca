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
<%@ page import = "com.credu.infomation.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.dunet.common.util.*" %>  
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%

    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process  = box.getString("p_process");

    int     v_pageno   = box.getInt("p_pageno");
    int     v_pagesize = box.getInt("p_pagesize");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    
    String  v_selClsfCd   = box.getString("p_selClsfCd");
    String  v_selDtlCd    = box.getString("p_selDtlCd");
    
    int     v_num          = box.getInt("p_num");
    
    String s_username  = box.getSession("name");
    
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
    
	if (document.form1.p_clsfcd.value == "") {
        alert("�ڷ� �з��� �Է��Ͽ��ֽʽÿ�");
        document.form1.p_clsfcd.focus();
        return;
    }

	/*if (document.form1.p_dtlcd.value == "") {
        alert("���� �з��� �Է��Ͽ��ֽʽÿ�");
        document.form1.p_dtlcd.focus();
        return;
    }*/

	if (document.form1.p_professor.value == "") {
	    alert("�������� �Է��Ͽ��ֽʽÿ�");
	    document.form1.p_professor.focus();
	    return;
	}

	   if (document.form1.p_title.value == "") {
	        alert("������ �Է��Ͽ��ֽʽÿ�");
	        document.form1.p_title.focus();
	        return;
	    }

	if (document.form1.Wec.Value.length < 3) {
        alert("������ �Է��ϼ���");
        return;
    }

        document.form1.p_pageno.value = 1;
        document.form1.p_searchtext.value = "";
        document.form1.p_search.value     = "";
        document.form1.p_selClsfCd.value     = "";
        document.form1.p_selDtlCd.value     = "";
        document.form1.action = "/servlet/controller.infomation.SpecialCourseAdminServlet";
        document.form1.p_process.value = "insert";

        document.form1.submit();
    }

    function list() {
        document.form1.action = "/servlet/controller.infomation.SpecialCourseAdminServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }

    function addClsf(){
        document.form1.action = "/servlet/controller.system.CodeAdminServlet";
        document.form1.p_gubun.value   = '0087';
        document.form1.p_levels.value   = 1;
        document.form1.p_process.value = "selectSubList";
        document.form1.submit();
   }

    function addDtl(){
        if (document.form1.p_clsfcd.value == "") {
            alert("�ڷ� �з� �� �������ּ���");
            return;
        }
    	 document.form1.action = "/servlet/controller.system.CodeAdminServlet";
         document.form1.p_gubun.value   = '0087';
         document.form1.p_levels.value   = 2;
         document.form1.p_upper.value    = document.form1.p_clsfcd.value;
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
    <input type = "hidden" name="p_num"        value = "<%= v_num %>">
    <input type = "hidden" name="p_selClsfCd"  value = "<%=v_selClsfCd%>">
    <input type = "hidden" name="p_selDtlCd"   value = "<%=v_selDtlCd%>">
    <input type = "hidden" name="p_content"    value = "">
    <input type = "hidden" name="p_gubun"      value = "">
    <input type = "hidden" name="p_upper"      value = "">
    <input type = "hidden" name="p_levels"     value = "">
    
    

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
        <tr>
          <td><img src="/images/admin/portal/s.1_21.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->

        <br>
        <br>
        <!----------------- �������� ���� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="4" class="table_top_line"></td>
          </tr>
          <tr>
            <td width="15%" height="25" class="table_title"><strong>�ۼ���</strong></td>
            <td width="35%" height="25" class="table_02_2" >
              <%=s_username %>
            </td>
            <td width="15%" height="25" class="table_title" ><strong>�����</strong></td>
            <td width="35%" height="25" class="table_02_2"><%= FormatDate.getDate("yyyy/MM/dd") %></td>
          </tr>
          <tr>
            <td width="15%" height="25" class="table_title"><strong>�з�</strong></td>
            <td width="35%" height="25" class="table_02_2" >
              <kocca_select:select name="p_clsfcd" sqlNum="0003"  param="0087" param3="1"             
                onChange="changep_dtlcd('0087', this.value, 2)" attr=" " selectedValue="" isLoad="true" all="N" />&nbsp; <!--a href="javascript:addClsf();">�з� �߰�</a-->
            </td>
            <td width="15%" height="25" class="table_title"><strong>���� �з�</strong></td>
            <td width="35%" height="25" class="table_02_2" >
              <kocca_select:select name="p_dtlcd" sqlNum="0004"  param="0087" param2="" param3="2"            
                onChange="" attr=" " selectedValue="" isLoad="true" all="N" />&nbsp; <!--a href="javascript:addDtl();">�з� �߰�</a-->
            </td>
          </tr>
          <tr>
            <td height="25" class="table_title"><strong>������</strong></td>
            <td height="25" class="table_02_2" colspan="3">
              <input type="text" name="p_professor" size = 50 class="input" maxlength="80">
            </td>
          </tr>
          <tr>
            <td height="25" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2" colspan="3">
              <input type="text" name="p_title" size = 100 class="input" maxlength="80">
            </td>
          </tr>
          <tr>
            <td height="25" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2" colspan="3">
                <!-- ���� ��Ƽ�� ������  ���� -->
                <script language="javascript" src="/script/user_patch.js"></script>
                <script language="javascript">object_namoActivepatch('100%','500');</script>
                <!-- ���� ��Ƽ�� ������  ���� -->
            </td>
          </tr>
          <tr>
            <td height="25" class="table_title"><strong>������ ���</strong></td>
            <td height="25" class="table_02_2" colspan="3">
              <input type="text" name="p_pictureurl" size="84" class="input">
            </td>
          </tr>
          
          <tr>
              <td width="16%" class="table_title"><b>÷������</b></td>
              <td id="sTd" width="81%" class="table_02_2" colspan="3">
                  <%
                  int    i_fileLimit         = SpecialCourseBean.getFILE_LIMIT();              // ���� ÷�� ���ϼ�
                  %>
                  <%@ include file="/learn/admin/include/za_MultiAttach_I.jsp" %> 
                
               
              </td>
          </tr>
          <tr>
            <td height="25" class="table_title"><strong>��뿩��</strong></td>
            <td height="25" class="table_02_2" colspan="3">
              <input type="checkbox" name="p_useyn" value="Y">
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
