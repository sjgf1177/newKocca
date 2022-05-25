<%
//**********************************************************
//  1. ��      ��: �н���ȣȸ ��������
//  2. ���α׷���: za_CommunityNotice_U.jsp
//  3. ��      ��: �������� ����
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: mscho 2003. 9. 6
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/jsp/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.community.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String v_subjnm = box.getString("p_subjnm");
    int v_commid    = 0;
    String  v_process  = box.getString("p_process");
    int     v_pageno   = box.getInt("p_pageno");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    int     v_seq        = box.getInt("p_seq");                  // �Խù� ID
    int     v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�

    int    v_cnt     = 0;
    String v_userid  = "";
    String v_name    = "";
    String v_indate  = "";
    String v_title   = "";
    String v_content = "";

    DataBox dbox = (DataBox)request.getAttribute("selectCommunityNotice");
    if (dbox != null ) {
        v_seq         = dbox.getInt ("d_seq");
        v_userid      = dbox.getString("d_userid");
        v_name        = dbox.getString("d_name");
        v_title       = dbox.getString("d_title");
        v_content     = dbox.getString("d_content");
        v_cnt         = dbox.getInt("d_cnt");
        v_indate      = dbox.getString("d_indate");

        v_title = StringManager.replace(v_title, "`", "'");
    }

    String s_userid    = box.getSession("userid");
    String s_username  = box.getSession("name");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    function insert() {
        moveContent();

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
        if (blankCheck(document.form1.p_content.value)) {
            alert("������ �Է��ϼ���!");
            document.form1.p_content.focus();
            return;
        }
/*
        document.forms[0].p_content.editorApplet = DHTMLEdit.tbContentElement;
        document.forms[0].p_content.value = DHTMLEdit.getDocumentHTML();
        document.forms[0].InitHTML.value="";
        document.forms[0].addBody.value="";
*/

        document.form1.p_search.value     = "";
        document.form1.p_searchtext.value = "";
        document.form1.action = "/servlet/controller.community.CommunityAdminNoticeServlet";
        document.form1.p_process.value = "update";
        document.form1.submit();
    }

   function cancel() {
        document.form1.action = "/servlet/controller.community.CommunityAdminNoticeServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
   }

    //namo editor �ۼ� ���밪 �ű��
    function moveContent(){
        document.form1.p_content.value = document.form1.we.BodyValue;
    }

//-->
</SCRIPT>

<!-- SCRIPT FOR NAMO EDITOR -->
<SCRIPT LANGUAGE="VBScript">
<!--
    Function Load_Content()
            document.form1.we.BodyValue = document.form1.p_content.value
            document.form1.we.focus
    End Function

    Sub we_OnInitCompleted
        call Load_Content()
    End Sub

    Function Move_Content()
            document.form1.p_content.value = document.form1.we.BodyValue
    End Function
-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post" enctype = "multipart/form-data">
    <input type="hidden" name="p_commId" value='0'>
    <input type = "hidden" name = "p_subjnm"    value = "<%=v_subjnm %>">    
    <input type = "hidden" name = "p_process"    value = "<%=v_process %>">
    <input type = "hidden" name = "p_pageno"     value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_search"     value = "<%=v_search %>">
    <input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
    <input type = "hidden" name = "p_seq"        value = "<%= v_seq %>">
    <input type = "hidden" name = "p_upfilecnt"  value = "<%= v_upfilecnt %>">

  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
      <td align="center" valign="top"> 
        <!----------------- title ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
          <tr> 
            <td><img src="../../../images/admin/community/tit_comm_02.gif"></td>
            <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
          </tr>
        </table>
        <!----------------- title �� ----------------->
        <br>
        <br>


        <!----------------- �ڷ��� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="12%" height="25" class="table_title"><b>�ۼ���</b></td>
            <td class="table_02_2" width="88%"><%=v_name%></td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>����</b></td>
            <td class="table_02_2"> 
              <input size="80" maxlength="20" name="p_title" class="input" value = `<%= v_title %>`>
            </td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>����</b></td>
            <td class="table_02_2"> 
				<script language = "javascript" src = "/script/user_patch.js"></script>
                <script language='javascript'>object_namopatch('580','300');</script>
                <!--OBJECT WIDTH=0 HEIGHT=0 CLASSID="clsid:5220cb21-c88d-11cf-b347-00aa00a28331">
                <PARAM NAME="LPKPath" VALUE="/jsp/namo/NamoWec4_Namo.lpk">
                </OBJECT>
                <OBJECT ID="we" WIDTH="580" HEIGHT="300" CLASSID="CLSID:C5AC95C0-C873-445B-BA1F-3A430A4DEA42" CODEBASE="/jsp/namo/NamoWec.cab#version=4,0,0,17">
                  <param name="InitFileURL" value="/jsp/namo/namowec.env">
                </OBJECT-->
                <DIV id="tmpHTML" style="visibility:hidden; display:none">
                    <TEXTAREA NAME="p_content" type=hidden ><%= v_content%></TEXTAREA>
                </DIV>
            </td>
          </tr>
        </table>
        <!----------------- �ڷ��� �� ----------------->
        <br>

        <!----------------- ���, ��� ��ư ���� ----------------->
        <table width="11%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="center">
            <a href="javascript:insert()"><img src="/images/admin/study/record1_butt.gif" width="37" height="18" border="0"></a>
            </td>
            <td align="center">
            <a href="javascript:cancel()"><img src="/images/admin/study/cancel1_butt.gif" width="37" height="18" border="0"></a>
            </td>
          </tr>
        </table>
        <!----------------- ���, ��� ��ư �� ----------------->
        <br>

      </td>
  </tr>
</table>

<%@ include file = "/jsp/library/getJspName.jsp" %>
</form>
</body>
</html>
