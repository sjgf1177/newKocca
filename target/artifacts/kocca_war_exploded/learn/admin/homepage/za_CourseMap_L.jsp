<%
//**********************************************************
//  1. ��      �� : ����ü�赵
//  2. ���α׷��� : za_CourseMap_L.jsp
//  3. ��      �� : ����ü�赵 ����Ʈ
//  4. ȯ      �� : JDK 1.3
//  5. ��      �� : 1.0
//  6. ��      �� : �̿��� 2005. 7. 27
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
  RequestBox box        = (RequestBox)request.getAttribute("requestbox");
  String  v_process     = box.getString("p_process");

    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������
	int v_pageno   = box.getInt("p_pageno"); 
    ArrayList list = (ArrayList)request.getAttribute("selectList");
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">

<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">

//�Է��������� �̵�
function insertPage() {
	document.form1.action = "/servlet/controller.homepage.HomePageCourseMapAdminServlet";
	document.form1.p_process.value = "insertPage";   
	document.form1.submit();
}
//������������ �̵�
function updatePage(tabseq) {
	document.form1.p_tabseq.value=tabseq;
	document.form1.action = "/servlet/controller.homepage.HomePageCourseMapAdminServlet";
	document.form1.p_process.value = "updatePage";   
	document.form1.submit();
}
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form  name = "form1"  method = "post">
<input type = "hidden" name = "p_process" value = "">
<input type = "hidden" name = "p_pageno"  value = "">
<input type = "hidden" name = "p_tabseq"  >

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
      <td align="center" valign="top"> 
        <!----------------- title ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
          <tr> 
            <td><img src="../../../images/admin/homepage/homepage_title13.gif"></td>
            <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
          </tr>
        </table>
        <!----------------- title �� ----------------->

        <br>
        <!----------------- form ���� ----------------->

        <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td  align="right" valign="middle">
              <a href='javascript:insertPage()'><img src="/images/admin/button/btn_add.gif" border="0"></a>
            </td>
          </tr>

          <tr> 
            <td height="3"></td>
          </tr>
        </table>
        <!----------------- form �� ----------------->


        <!----------------- �������� ���� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr>
            <td colspan="7" class="table_top_line"></td>
          </tr>
          <tr>
            <td class="table_title" width="8%" height="25"><b>NO</b></td>
            <td class="table_title" ><b>�з���</b></td>
            <td class="table_title" ><b>pdf����</b></td>
            <td class="table_title" ><b>�����̹�������</b></td>
            <td class="table_title" ><b>ū�̹�������</b></td>
            <td class="table_title" width="8%"><b>�ۼ���</b></td>
            <td class="table_title" width="15%" ><b>�����</b></td>
          </tr>
          <!-- ��ü�������� ���� -->
<%
	if(list.size()>0){
		for(int i = 0; i < list.size(); i++) {
			DataBox dbox = (DataBox)list.get(i);  
			v_dispnum 	= dbox.getInt("d_dispnum");
			int    v_tabseq     = dbox.getInt("d_tabseq");
			String v_tabseqname = dbox.getString("d_tabseqname");
			String v_realpdf    = dbox.getString("d_realpdf");
			String v_savepdf    = dbox.getString("d_savepdf");
			String v_realsfile  = dbox.getString("d_realsfile");
			String v_savesfile  = dbox.getString("d_savesfile");
			String v_reallfile  = dbox.getString("d_reallfile");
			String v_savelfile  = dbox.getString("d_savelfile");
			String v_luserid 	= dbox.getString("d_luserid");
			String v_ldate    	= dbox.getString("d_ldate");			
%>

          <tr>
            <td class="table_02_1" height="25"><%=v_tabseq%></td>     
            <td class="table_02_1"><a href="javascript:updatePage(<%=v_tabseq%>)"><%=v_tabseqname%></a></td>		 
            <td class="table_02_1"><%=v_realpdf%></td>			 
            <td class="table_02_1"><%=v_realsfile%></td>		
            <td class="table_02_1"><%=v_reallfile%></td>		
            <td class="table_02_1"><%=v_luserid%></td>			 
            <td class="table_02_1"><%=FormatDate.getFormatDate(v_ldate, "yyyy/MM/dd")%></td>			     
          </tr>
<%
        }
	}else{

%>
		<tr>
		  <td colspan='15' class="table_02_1">
				��� �� ������ �����ϴ�.		
		  </td>
		</tr>
<%
        }
%>

        </table>
        <!----------------- �������� ���� �� ----------------->

        <!----------------- total ���� ----------------->
        <br>
        <table width="97%" height="26" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td align="right" valign="absmiddle"> 
              <%= PageUtil.printPageList(v_totalpage, v_pageno, 10) %>
            </td>
          </tr>
        </table>
        <!----------------- total �� ----------------->

        <br>
      </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
