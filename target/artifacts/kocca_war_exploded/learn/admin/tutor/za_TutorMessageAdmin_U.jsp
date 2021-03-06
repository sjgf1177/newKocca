<%
//**********************************************************
//  1. 제      목: 운영자자료실
//  2. 프로그램명 : za_TutorMessageAdmin_U.jsp
//  3. 개      요: 운영자자료실 수정
//  4. 환      경: JDK 1.4
//  5. 버      젼: 1.0
//  6. 작      성: msc
//  7. 수      정:
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
    String  ss_upperclass   = box.getString("s_upperclass");      //과정대분류
    String  ss_middleclass  = box.getString("s_middleclass");     //과정중분류
    String  ss_lowerclass   = box.getString("s_lowerclass");      //과정소분류
    String  ss_subjcourse   = box.getString("s_subjcourse");      //과정&코스
    String  ss_action       = box.getString("s_action");
    int     v_pageno        = box.getInt("p_pageno");
    int     v_seq           = box.getInt("p_seq");                // 게시물 ID

    int    v_cnt     = 0;
	String v_subj    = "";
    String v_userid  = "";
    String v_name    = "";
    String v_indate  = "";
    String v_title   = "";
    String v_content = "";
    String content   = "";

    DataBox dbox = (DataBox)request.getAttribute("selectMessage");
    if (dbox != null ) {
		v_subj        = dbox.getString("d_subj");
        v_userid      = dbox.getString("d_userid");
        v_name        = dbox.getString("d_name");
        v_title       = dbox.getString("d_title");
        v_content     = dbox.getString("d_content");
        v_cnt         = dbox.getInt("d_cnt");
        v_indate      = dbox.getString("d_indate");

        content = StringManager.replace(v_content,"&nbsp;","&amp;nbsp;");
    }

%>
<html>
<head>
<title>Message</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    function insert() {
        document.form1.p_content.value = document.form1.Wec.MIMEValue;
        document.form1.p_content.value.replace("&","&amp;");
        
        if (blankCheck(document.form1.p_title.value)) {
            alert("제목을 입력하세요!");
            document.form1.p_title.focus();
            return;
        }
        if (realsize(document.form1.p_title.value) > 200) {
            alert("제목은 한글기준 100자를 초과하지 못합니다.");
            document.form1.p_title.focus();
            return;
        }
        if (blankCheck(document.form1.p_content.value)) {
            alert("내용을 입력하세요!");
            return;
        }

		document.form1.p_pageno.value=1;
        document.form1.action = "/servlet/controller.tutor.TutorMessageAdminServlet";
        document.form1.p_process.value = "update";
        document.form1.submit();
    }

   function cancel() {
        document.form1.action = "/servlet/controller.tutor.TutorMessageAdminServlet";
        document.form1.p_process.value = "listPage";
        document.form1.submit();
   }

   function initPage() {
       document.form1.Wec.Value = document.form1.p_content.value;
   }

//-->
</SCRIPT>


</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0" onLoad="initPage()">
<form name="form1" method="post" enctype = "multipart/form-data">
    <input type="hidden" name="p_process"     value="<%=v_process %>">
    <input type="hidden" name="s_upperclass"  value="<%=ss_upperclass %>">
    <input type="hidden" name="s_middleclass" value="<%=ss_middleclass %>">
    <input type="hidden" name="s_lowerclass"  value="<%=ss_lowerclass %>">
    <input type="hidden" name="s_subjcourse"  value="<%=ss_subjcourse %>">
    <input type="hidden" name="s_action"      value="<%=ss_action %>">
    <input type="hidden" name="p_pageno"      value="<%=v_pageno %>">
    <input type="hidden" name="p_seq"         value="<%=v_seq %>">
    <input type="hidden" name="p_content"     value="<%=StringUtil.convertHtmlchars(content)%>">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="768">
  <tr>
      <td align="center" valign="top"> 
        <!----------------- title 시작 ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
          <tr> 
            <td><img src="/images/admin/tutor/tit_tutor_message.gif"></td>
            <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
          </tr>
        </table>
        <!----------------- title 끝 ----------------->

      <br>
        <!----------------- FORM 시작 ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>작성자</strong></td>
            <td height="25" class="table_02_2"><%=v_name%></td>
          </tr>
          <tr >
            <td height="25" class="table_title"><strong>등록일</strong></td>
            <td height="25" class="table_02_2"><%= FormatDate.getFormatDate(v_indate, "yyyy/MM/dd") %></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>제목</strong></td>
            <td height="25" class="table_02_2"><input type="text" name="p_title" size = 100 class="input" value = `<%= v_title %>`></td>
          </tr>
          <tr>
            <td width="15%" class="table_title"><strong>내용</strong></td>
            <td height="25" class="table_02_2">
                <!-- 나모 액티브 스퀘어  시작 -->
                <script language="javascript" src="/script/user_patch.js"></script>
                <script language="javascript" for="Wec" event="OnInitCompleted()"> namoActiveInitCompleted('p_content');</script>
                <script language="javascript">object_namoActivepatch('100%','500');</script>
                <!-- 나모 액티브 스퀘어  종료 -->
            </td>
          </tr>
          </table>
         <br>
        <!----------------- FORM 끝 ----------------->

        <!----------------- total 시작 ----------------->

        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td align="right" class="ms"><a href="javascript:insert()"><img src="/images/admin/button/btn_save.gif"border="0"></a>&nbsp;</td>
            <td align="left" class="ms"><a href="javascript:cancel()"><img src="/images/admin/button/btn_cancel.gif" border="0"></a>&nbsp;</td>
          </tr>
        </table>
        <br>
        <!----------------- total 끝 ----------------->
      </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>

</form>
</body>
</html>
