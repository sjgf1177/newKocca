<%
//**********************************************************
//  1. ��      ��: �����ڷ��
//  2. ���α׷���: zu_StudyData_I.jsp
//  3. ��      ��: �����ڷ�� ���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 9. 6
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    int     v_tabseq   = box.getInt("p_tabseq");
    String  v_process  = box.getString("p_process");
    int     v_pageno   = box.getInt("p_pageno");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    int     v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�

    String s_userid    = box.getSession("userid");
    String s_username  = box.getSession("name");

%>
<html>
<head>
<title>::: �ڷ�� :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/user_style_study.css" type="text/css">
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
        document.form1.p_pageno.value = "1";
        document.form1.action = "/servlet/controller.study.StudyDataServlet";
        document.form1.p_process.value = "insert";
        document.form1.submit();
    }

   function cancel() {
        document.form1.action = "/servlet/controller.study.StudyDataServlet";
        document.form1.p_process.value = "";
        document.form1.submit();
   }

    //namo editor �ۼ� ���밪 �ű��
    function moveContent(){
        document.form1.p_content.value = document.form1.we.BodyValue;
    }

//-->
</SCRIPT>
</head>


<body topmargin="0" leftmargin="0">

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

<form name="form1" method="post" enctype = "multipart/form-data">
    <input type = "hidden" name = "p_tabseq"    value = "<%=v_tabseq %>">
    <input type = "hidden" name = "p_process"    value = "<%=v_process %>">
    <input type = "hidden" name = "p_pageno"     value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_search"     value = "<%=v_search %>">
    <input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
    <input type = "hidden" name = "p_upfilecnt"  value = "<%= v_upfilecnt %>">
    <input type = "hidden" name = "p_content"    value="">


<table cellpadding="0" cellspacing="10" bgcolor="#EEEEEE" width="783" height="100%">
  <tr> 
    <td> 
      <table cellpadding="0" cellspacing="1" bgcolor="#BEBEBE" class="table2" height="100%">
        <tr> 
          <td align="center" valign="top" class="body_color"> 

<br>
            <!----------------- Ÿ��Ʋ ���� ----------------->
  				<table cellspacing="0" cellpadding="0" class="open_table_out" align="center">
    				<tr> 
      					<td><img src="/images/user/study/data_title.gif"></td>
      					<td background="/images/user/study/gongi_title_bg.gif" width=100%></td>
      					<td><img src="/images/user/study/gongi_tail.gif"></td>
    				</tr>
  				</table>
            <!----------------- Ÿ��Ʋ �� ---------------->
            <br>

            <!----------------- �Խ��� �� ��� ���� ---------------->
            <table cellspacing="0" cellpadding="0" class="open_board_vertical_table_out">
              <tr> 
                <td width="3" class="board_color_line"></td>
                <td> 
                  <table cellspacing="1" cellpadding="1" class="table2">
                    <tr> 
                      <td class="board_title_bg2" width="150">�� ��</td>
                      <td class="table_text3"> 
                        <input size="80" maxlength="200" name="p_title" class="input">
                      </td>
                    </tr>
                    <tr> 
                      <td class="board_title_bg2" width="150">�ۼ���</td>
                      <td class="table_text3"><%=s_username%>
                      </td>
                    </tr>                                            
                    <tr> 
                      <td class="board_title_bg2">�� ��</td>
                      <td class="table_text3"> 
                                <OBJECT WIDTH=0 HEIGHT=0 CLASSID="clsid:5220cb21-c88d-11cf-b347-00aa00a28331">
                                <PARAM NAME="LPKPath" VALUE="/learn/namo/NamoWec4_Namo.lpk">
                                </OBJECT>
                                <OBJECT ID="we" WIDTH="560" HEIGHT="360" CLASSID="CLSID:C5AC95C0-C873-445B-BA1F-3A430A4DEA42" CODEBASE="/learn/namo/NamoWec.cab#version=4,0,0,17">
                                  <param name="InitFileURL" value="/learn/namo/namowec.env">
                                </OBJECT>
                    </tr>
                <%  if(box.getBoolean("p_isUpload")) {    //    ����÷�� ���� %>
                  <tr>
                    <td class="board_title_bg2" width="150">����÷��</td>
                    <td class="table_text3">
                      <input type="FILE" name="p_file" size="50" class="input"><br>
                    </td>
                  </tr>
                <%  }   %>                        
                  </table>
                </td>
              </tr>
            </table>
            <!----------------- �Խ��� �� ��� �� ---------------->
            <br>

            <!----------------- ����, ��� ��ư ���� ----------------->
            <table width="150" border="0" cellspacing="0" cellpadding="0" align="center">
              <tr> 
                <td align="center">
                <a href="javascript:insert()"><img src="/images/user/button/btn_save.gif" border="0"></a></td>
                <td align="center"><a href="javascript:cancel()"><img src="/images/user/button/btn_list.gif" border="0"></a></td>
              </tr>
            </table>
            <!----------------- ����, ��� ��ư �� ----------------->
            <br>

          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>


<%@ include file = "/learn/library/getJspName.jsp" %>

</form>
</body>
</html>
