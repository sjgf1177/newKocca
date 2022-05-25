<%
//**********************************************************
//  1. ��      ��: �������
//  2. ���α׷��� : za_Book_R.jsp
//  3. ��      ��: �������
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��:
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.book.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process    = box.getString("p_process");
    int     v_pageno     = box.getInt("p_pageno");

    String  ss_classify   = box.getString("s_classify");
    String  v_searchtext  = box.getString("p_searchtext");
    String  ss_action     = box.getString("s_action");

%>

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src= "/script/cresys_lib.js"></script>
<script language = "VBScript"   src= "/script/cresys_lib.vbs"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    //����
    function insert_check() {

        if (blankCheck(document.form1.p_bookname.value)) {
            alert("������� �Է��ϼ���");
            document.form1.p_bookname.focus();
            return;
        }

        if (blankCheck(document.form1.p_author.value)) {
            alert("���ڸ��� �Է��ϼ���");
            document.form1.p_author.focus();
            return;
        }

        if (realsize(document.form1.p_bookname.value) > 200) {
            alert("������� �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_bookname.focus();
            return;
        }

        if (blankCheck(document.form1.p_book_site.value)) {
            alert("�Ǹ�ó�� �Է��ϼ���");
            document.form1.p_book_site.focus();
            return;
        }

        if (blankCheck(document.form1.p_book_url.value)) {
            alert("�Ǹ�ó �ּ�(URL)�� �Է��ϼ���");
            document.form1.p_book_url.focus();
            return;
        }

/*      if (!number_chk_noalert(document.form1.p_price.value)) {
            alert('������ �߸��ԷµǾ����ϴ�.');
            return ;
        }

        if (!number_chk_noalert(document.form1.p_dis_price.value)) {
            alert('�ǸŰ��� �߸��ԷµǾ����ϴ�.');
            return ;
        } */

        var booksurl = document.form1.p_book_url;

        if (booksurl.value.indexOf("http://") == -1 && booksurl.value.indexOf("HTTP://") == -1 ) {
            booksurl.value = "http://" + booksurl.value;
        }
             
        document.form1.p_searchtext.value = "";
        document.form1.action = "/servlet/controller.book.BookAdminServlet";
        document.form1.p_process.value = "insert";
        
        document.form1.submit();
    }

    function list() {
        document.form1.action = "/servlet/controller.book.BookAdminServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }

    //����÷�ο� ���� ����
    function File_CancelKeyInput()
    {
            if(event.keyCode == 9){ // Tab key�� ���
                return true;
            }else{
                alert('[ã�ƺ���] ��ư�� �̿��� ÷���Ͻ� ������ �����ϼ���.\n\n��θ� �������� �߸� �Է��Ͻ� ��� ���ε尡 ����� �̷������ �ʽ��ϴ�.'); 
                return false;
            }
        }


//-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0" >

<form name="form1" method="post" enctype="multipart/form-data">
    <input type = "hidden" name="p_process"    value = "<%=v_process %>">
    <input type = "hidden" name="p_pageno"     value = "<%=v_pageno %>">
    <input type = "hidden" name="s_action"     value = "<%=ss_action %>">
    <input type = "hidden" name="s_classify"   value = "<%=ss_classify %>">
    <input type = "hidden" name="p_searchtext" value = "<%=v_searchtext %>">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top"> 

      <!----------------- title ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class="page_title">
          <tr>
            <td><img src="/images/admin/portal/s.1_22.gif" ></td>
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
          <td width="15%" class="table_title"><strong>�����ڵ�</strong></td>
            <td height="25" class="table_02_2">*�ڵ��Է�</td>
            <td width="15%" class="table_title"><strong>�з�</strong></td>
            <td height="25" class="table_02_2"><%=CodeConfigBean.getCodeGubunSelect ("0073", "", 1, "p_classify", "", "", 0)%></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>�����</strong></td>
            <td height="25" class="table_02_2"><input type="text" name="p_bookname" size="50" class="input" maxlength="100"></td>
            <td width="15%" class="table_title"><strong>���ڸ�</strong></td>
            <td height="25" class="table_02_2"><input type="text" name="p_author" size="55" class="input" maxlength="100"></td>
          </tr>
          <!--tr> 
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2"><input type="text" name="p_price" size="10" class="input" maxlength="10"></td>
            <td width="15%" class="table_title"><strong>�ǸŰ�</strong></td>
            <td height="25" class="table_02_2"><input type="text" name="p_dis_price" size="10" class="input" maxlength="10"></td>
          </tr-->
          <tr> 
            <td width="15%" class="table_title"><strong>�Ǹ�ó</strong></td>
            <td height="25" class="table_02_2"><input type="text" name="p_book_site" size="50" class="input" maxlength="200"></td>
            <td width="15%" class="table_title"><strong>ISBN</strong></td>
            <td height="25" class="table_02_2"><input type="text" name="p_isbn" size="55" class="input" maxlength="200"></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>�Ǹ� URL</strong></td>
            <td height="25" class="table_02_2" colspan="3">http:// <input type="text" name="p_book_url" size="125" class="input" maxlength="200"></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>����Ұ�</strong></td>
            <td height="25" class="table_02_2" colspan="3"><textarea name="p_intro" style="width:100%" cols="110" rows="10"></textarea></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>���ڼҰ�</strong></td>
            <td height="25" class="table_02_2" colspan="3"><textarea name="p_writer" style="width:100%" cols="110" rows="10"></textarea></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2" colspan="3"><textarea name="p_content" style="width:100%" cols="110" rows="10"></textarea></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2" colspan="3"><textarea name="p_review" style="width:100%" cols="110" rows="10"></textarea></td>
          </tr>
          <tr>
            <td width="16%" class="table_title"><b>�����̹���<br>( 133 X 152 )</b></td>
            <td width="81%" class="table_02_2" colspan="3">
              <input type="FILE" name="p_file2" size="60" class="input"  onkeydown="javascript:return File_CancelKeyInput()"> <strong>( 53 X 79 )</strong> <br>
            </td>
          </tr>
          <!--tr>
            <td width="16%" class="table_title"><b>���̹�������<br>( 150 X 220 )</b></td>
            <td width="81%" class="table_02_2" colspan="3">
              <input type="FILE" name="p_file1" size="60" class="input"  onkeydown="javascript:return File_CancelKeyInput()"> <strong>( 150 X 220 )</strong> <br>
            </td>
          </tr-->
          <!--tr> 
            <td width="15%" class="table_title"><strong>��õ����</strong></td>
            <td height="25" class="table_02_2" colspan="3">
              <select name= "p_recom">
                <option value="N">N</option>
                <option value="Y">Y</option>
              </select>
            </td>
          </tr-->
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

</form>

<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
