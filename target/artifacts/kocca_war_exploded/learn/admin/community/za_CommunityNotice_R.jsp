<%
//**********************************************************
//  1. ��      ��: �н���ȣȸ ��������
//  2. ���α׷���: za_CommunityNotice_R.jsp
//  3. ��      ��: �������� ����
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: mscho 2004. 02. 17
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.community.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String v_subjnm = box.getString("p_subjnm");
    int v_commid    = 0;
    String  v_process  = box.getString("p_process");
    int     v_pageno   = box.getInt("p_pageno");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    int     v_seq        = box.getInt("p_seq");                  // �Խù� ID
    int     v_orgseq     = v_seq;
    int     v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�

    int v_levels = 0;
    int v_dispnum   = 0;
    int v_totalpage = 0;
    int v_rowcount  = 0;

    int    i         = 0;
    int    v_cnt     = 0;
    String v_userid  = "";
    String v_name    = "";
    String v_indate  = "";
    String v_title   = "";
    String v_content = "";

    DataBox dbox = (DataBox)request.getAttribute("selectCommunityNotice");
    if (dbox != null ) {
        v_seq         = dbox.getInt("d_seq");
        v_userid      = dbox.getString("d_userid");
        v_name        = dbox.getString("d_name");
        v_title       = dbox.getString("d_title");
        v_content     = dbox.getString("d_content");
        v_cnt         = dbox.getInt ("d_cnt");
        v_indate      = dbox.getString("d_indate");

       // v_content = StringManager.replace(v_content,"\r\n","<br>");
//        v_content = BoardBean.convertBody(v_content);
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

    function reply_CommunityNotice() {
        document.form1.action = "/servlet/controller.community.CommunityAdminNoticeServlet";
        document.form1.p_process.value = "replyPage";
        document.form1.submit();
    }

    function modify_CommunityNotice() {
        document.form1.action = "/servlet/controller.community.CommunityAdminNoticeServlet";
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }

    function delete_CommunityNotice() {
        if (confirm("������ �����Ͻðڽ��ϱ�?")) {
            document.form1.action = "/servlet/controller.community.CommunityAdminNoticeServlet";
            document.form1.p_process.value = "delete";
            document.form1.submit();
        }
        else {
            return;
        }
    }

    function list_CommunityNotice() {
        document.form1.action = "/servlet/controller.community.CommunityAdminNoticeServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }


    function selectList() {
        document.form1.action = "/servlet/controller.community.CommunityAdminNoticeServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }

    function select(seq, upfilecnt, userid) {
        document.form1.action = "/servlet/controller.community.CommunityAdminNoticeServlet";
        document.form1.p_process.value = "select";
        document.form1.p_seq.value = seq;
        document.form1.p_upfilecnt.value = upfilecnt;
        document.form1.p_userid.value    = userid;
        document.form1.submit();
    }
    function insertPage() {
        document.form1.action = "/servlet/controller.community.CommunityAdminNoticeServlet";
        document.form1.p_process.value = "insertPage";
        document.form1.submit();
    }
//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post">
    <input type="hidden" name="p_commId" value='0'>
    <input type = "hidden" name = "p_subjnm"    value = "<%=v_subjnm %>">
    <input type = "hidden" name = "p_process"    value = "<%=v_process %>">
    <input type = "hidden" name = "p_pageno"     value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_search"     value = "<%=v_search %>">
    <input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
    <input type = "hidden" name = "p_seq"        value = "<%= v_seq %>">
    <input type = "hidden" name = "p_upfilecnt"  value = "<%= v_upfilecnt %>">
    <input type = "hidden" name = "p_userid"     value = "<%= v_userid %>">



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
            <td width="12%" class="table_title"><b>�ۼ���</b></td>
            <td class="table_02_2" width="88%"><%=v_name%></td>
          </tr>
          <tr>
            <td class="table_title" height="25"><b>����</b></td>
            <td class="table_02_2"><%= v_title %></td>
          </tr>
          <tr>
            <td class="table_title" height="25"><b>�����</b></td>
            <td class="table_02_2"><%= FormatDate.getFormatDate(v_indate, "yyyy/MM/dd") %></td>
          </tr>
          <tr>
            <td class="table_title" height="25"><b>��ȸ��</b></td>
            <td class="table_02_2"><%=v_cnt%></td>
          </tr>
          <tr>
            <td class="table_title" height="25"><b>����</b></td>
            <td class="table_02_2"><%= v_content %></td>
          </tr>
        </table>
        <!----------------- �ڷ��� �� ----------------->



        <br>

        <!----------------- ���, ��� ��ư ���� ----------------->
        <table width="11%" border="0" cellspacing="0" cellpadding="0">
          <tr>
<%  if(BulletinManager.isAuthority(box, box.getString("p_canModify"))) {    //    ���� ���� %>
            <td align="center">
            <a href="javascript:modify_CommunityNotice()"><img src="/images/admin/button/btn_modify.gif" border="0"></a>
            </td>
<%
    }

    if(BulletinManager.isAuthority(box, box.getString("p_canDelete"))) {    //    ���� ����
%>
            <td align="center">
            <a href="javascript:delete_CommunityNotice()"><img src="/images/admin/button/btn_del.gif"  border="0"></a>
            </td>
<%  }  %>
          </tr>
        </table>
        <!----------------- ���, ��� ��ư �� ----------------->

        <br>
        <!----------------- ����Ʈ, �߰� ��ư ���� ----------------->
        <table width="97%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="right" height="3">
                <%  if(BulletinManager.isAuthority(box, box.getString("p_canAppend"))) {    //    ���� ���� %>
                    <a href = "javascript:insertPage();"><img src="/images/admin/button/btn_addplus.gif" align="absmiddle"  border="0"></a>
                <%  }   %>
            </td>
            <td align="right" width="50">
            <a href = "javascript:list_CommunityNotice();"><img src="/images/admin/button/btn_list.gif" align="absmiddle" border="0"></a>
            </td>
          </tr>
        </table>
        <!----------------- ����Ʈ, �߰� ��ư �� ----------------->


<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
