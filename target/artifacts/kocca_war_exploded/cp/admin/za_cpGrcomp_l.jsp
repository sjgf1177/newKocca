<%
//**********************************************************
//  1. ��      ��: �������� ���� ��ϰ���
//  2. ���α׷���: za_cpcourseSeq_l.jsp
//  3. ��      ��: �������� ���� ��ϰ��� ����Ʈȭ��
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ��â�� 2005.7.18
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%//@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.cp.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
RequestBox box = (RequestBox)request.getAttribute("requestbox");

String v_subj = "", v_subjnm = "", v_cpnm = "", v_cpsubjseq = "", v_year = "", v_grcodenm="", v_grcode="";
String v_subjseq = "", v_subjseqgr = "", v_propstart = "", v_propend = "", v_edustart = "", v_eduend = "";

ArrayList list = (ArrayList)request.getAttribute("selectGrcompList");
  
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>�����׷캰 ȸ�� ����Ʈ</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language="javascript">

</script>
</head>

<body topmargin=0 leftmargin=0>
<table width="620" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td align="center">
	
 

   <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
            
          <td><img src="../../images/admin/cp/cp_title12_pop2.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <br>
      <table width="590" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>�����׷캰 ȸ�� </td>
        </tr>
        <tr> 
          <td height=6></td>
          <td height=6></td>
        </tr>
      </table>  
	  <table width="590"  border="0"  cellpadding="0" cellspacing="1" class="table_out">
	          <tr> 
          <td colspan="7" class="table_top_line"></td>
        </tr>

        <tr> 
          <td class="table_title" width="10%">��ȣ</td>
          <td class="table_title"  width="90%">ȸ���</td>
        </tr>

        <%for(int i = 0; i<list.size(); i++){
            DataBox dbox = (DataBox)list.get(i);
        %>
        <tr> 
          <td class="table_02_1"><%=i+1%></td>
          <td class="table_02_1"><%=dbox.getString("d_companynm")%></td>
        </tr>
        <%}%>
      </table>
      
    </td>
  </tr>
</table>
<br>
</body>
</html>
