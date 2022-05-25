<%
//**********************************************************
//  1. ��      ��: ������� �󼼺���
//  2. ���α׷��� : za_Book_R.jsp
//  3. ��      ��: ������� �󼼺���
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
    RequestBox box    = (RequestBox)request.getAttribute("requestbox");
    String  v_process = box.getString("p_process");
    int v_pageno         = box.getInt("p_pageno");

    String  ss_classify    = box.getString("s_classify");
    String  v_searchtext   = box.getString("p_searchtext");
    String  ss_action      = box.getString("s_action");
    String v_bookcode      = box.getString("p_bookcode");          // �����ڵ�

    String v_classify      = "";          // �з�
    String v_codenm        = "";          // �з���
    String v_bookname      = "";          // �����
    int    v_price         = 0;           // ����
    int    v_dis_price     = 0;           // �ǸŰ�
    String v_intro         = "";          // ����Ұ�
    String v_writer        = "";          // ���ڼҰ�
    String v_content       = "";          // ����
    String v_review        = "";          // ����
    String v_recom         = "";          // ��õ���翩��
    String v_luserid       = "";          // �����
    String v_ldate         = "";          // �����
    String v_realfilename1 = "";          // ū�̹���   �������ϸ�
    String v_newfilename1  = "";          // ū�̹���   �������ϸ�
    String v_realfilename2 = "";          // �����̹��� �������ϸ�
    String v_newfilename2  = "";          // �����̹��� �������ϸ�
    String v_book_site     = "";          // �Ǹ�ó
    String v_book_url      = "";          // �Ǹ� �ּ�(URL)
    String v_author        = "";          // ����
    String v_isbn          = "";          // ISBN


    DataBox dbox = (DataBox)request.getAttribute("selectBook");
    
    if (dbox != null) {    
        v_classify      = dbox.getString("d_classify");
        v_codenm        = dbox.getString("d_codenm");
        v_bookname      = dbox.getString("d_bookname");
        v_price         = dbox.getInt   ("d_price");
        v_dis_price     = dbox.getInt   ("d_dis_price");
        v_intro         = dbox.getString("d_intro");
        v_writer        = dbox.getString("d_writer");
        v_content       = dbox.getString("d_content");
        v_review        = dbox.getString("d_review");
        v_recom         = dbox.getString("d_recom");
        v_luserid       = dbox.getString("d_luserid");
        v_ldate         = dbox.getString("d_ldate");
        v_realfilename1 = dbox.getString("d_realfilename1");
        v_newfilename1  = dbox.getString("d_newfilename1");
        v_realfilename2 = dbox.getString("d_realfilename2");
        v_newfilename2  = dbox.getString("d_newfilename2");
        v_book_site     = dbox.getString("d_book_site");
        v_book_url      = dbox.getString("d_book_url");
        v_author        = dbox.getString("d_author");
        v_isbn          = dbox.getString("d_isbn");

        v_ldate   = FormatDate.getFormatDate(v_ldate,"yyyy/MM/dd");
		v_intro   = StringManager.replace(v_intro,"\n","<br>");
        v_writer  = StringManager.replace(v_writer,"\n","<br>");
		v_content = StringManager.replace(v_content,"\n","<br>");
		v_review  = StringManager.replace(v_review,"\n","<br>");
     }  
%>

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

    function modifyBook() {
        document.form1.action = "/servlet/controller.book.BookAdminServlet";
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }

    function deleteBook() {
        document.form1.p_pageno.value = 1;
        document.form1.p_searchtext.value = "";
        document.form1.action = "/servlet/controller.book.BookAdminServlet";
        document.form1.p_process.value = "delete";
        document.form1.submit();
    }

    function listBook() {
        document.form1.action = "/servlet/controller.book.BookAdminServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }

//-->
</SCRIPT>

</head>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post">
    <input type = "hidden" name="p_process"    value = "<%=v_process %>">
    <input type = "hidden" name="p_pageno"     value = "<%=v_pageno %>">
    <input type = "hidden" name="s_action"     value = "<%=ss_action %>">
    <input type = "hidden" name="s_classify"   value = "<%=ss_classify %>">
    <input type = "hidden" name="p_searchtext" value = "<%=v_searchtext %>">
    <input type = "hidden" name="p_bookcode"   value = "<%=v_bookcode%>">

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
            <td height="25" class="table_02_2"><%=v_bookcode%></td>
            <td width="15%" class="table_title"><strong>�з�</strong></td>
            <td height="25" class="table_02_2"><%=v_codenm%></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>�����</strong></td>
            <td height="25" class="table_02_2"><%=v_bookname%></td>
            <td width="15%" class="table_title"><strong>���ڸ�</strong></td>
            <td height="25" class="table_02_2"><%=v_author%></td>
          </tr>
          <!--tr> 
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2"><%=v_price%></td>
            <td width="15%" class="table_title"><strong>�ǸŰ�</strong></td>
            <td height="25" class="table_02_2"><%=v_dis_price%></td>
          </tr-->
          <tr> 
            <td width="15%" class="table_title"><strong>�Ǹ�ó</strong></td>
            <td height="25" class="table_02_2"><%=v_book_site%></td>
            <td width="15%" class="table_title"><strong>ISBN</strong></td>
            <td height="25" class="table_02_2"><%=v_isbn%></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>�Ǹ� URL</strong></td>
            <td height="25" class="table_02_2" colspan="3"><a href="<%=v_book_url%>" target="_blank"><%=v_book_url%></a></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>����Ұ�</strong></td>
            <td height="25" class="table_02_2" colspan="3"><%=v_intro%></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>���ڼҰ�</strong></td>
            <td height="25" class="table_02_2" colspan="3"><%=v_writer%></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2" colspan="3"><%=v_content%></td>
          </tr>
          <tr> 
            <td width="15%" class="table_title"><strong>����</strong></td>
            <td height="25" class="table_02_2" colspan="3"><%=v_review%></td>
          </tr>
          <tr>
            <td width="16%" class="table_title"><b>����̹���<br>( 53 X 79 )</b></td>
            <td width="81%" class="table_02_2" colspan="3">
<%      if(v_realfilename2 != null && !v_realfilename2.equals("")) {        %>
                &nbsp;<a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_newfilename2%>&p_realfile=<%= v_realfilename2%>'><%= v_realfilename2%></a><br>
                &nbsp;<!--img src="<%= conf.getProperty("dir.upload.default")%><%=v_newfilename2%>" >&nbsp;<br-->
 <%      }                                                    %>
            </td>
          </tr>
          <!--tr>
            <td width="16%" class="table_title"><b>���̹�������<br>( 150 X 220 )</b></td>
            <td width="81%" class="table_02_2" colspan="3">
<%      if(v_realfilename1 != null && !v_realfilename1.equals("")) {        %>
                &nbsp;<a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_newfilename1%>&p_realfile=<%= v_realfilename1%>'><%= v_realfilename1%></a><br>
                &nbsp;<!--img src="<%= conf.getProperty("dir.upload.default")%><%=v_newfilename1%>">&nbsp;<br-->
 <%      }                                                    %>
            </td>
          </tr-->
          <!--tr> 
            <td width="15%" class="table_title"><strong>��õ����</strong></td>
            <td height="25" class="table_02_2" colspan="3"><%=v_recom%></td>
          </tr-->
        </table>
        <!----------------- �������� ���� �� ----------------->

        <br>
        <!----------------- ����, ����, ����Ʈ ��ư ���� ----------------->
        <table width="16%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="center"><a href="javascript:modifyBook()"><img src="/images/admin/button/btn_modify.gif" border="0"></a>&nbsp;</td>
            <td align="center"><a href="javascript:deleteBook()"><img src="/images/admin/button/btn_del.gif" border="0"></a>&nbsp;</td>
            <td align="center"><a href="javascript:listBook()"><img src="/images/admin/button/btn_list.gif" border="0"></a>&nbsp;</td>
          </tr>
        </table>
        <!----------------- ����, ����, ����Ʈ ��ư �� ----------------->

      </td>
  </tr>
</table>


<%@ include file = "/learn/library/getJspName.jsp" %>
</form>

</body>
</html>