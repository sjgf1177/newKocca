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

String v_inuserid = "";
String v_indate   = "";
String v_realfile = "";
String v_newfile  = "";

ArrayList list = (ArrayList)request.getAttribute("selectUpdateList");
  
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>������Ʈ��Ȳ ����Ʈ</title>
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
      <br>
      <table width="590" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>������Ʈ��Ȳ</td>
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
          <td class="table_title"  width="30%">������Ʈ�Ͻ�</td>
          <td class="table_title"  width="30%">���ϸ�</td>
          <td class="table_title"  width="30%">�����</td>
        </tr>

        <%for(int i = 0; i<list.size(); i++){
            DataBox dbox = (DataBox)list.get(i);
            v_inuserid = dbox.getString("d_inuserid");
            v_indate   = dbox.getString("d_indate");
            v_realfile = dbox.getString("d_realfile");
            v_newfile = dbox.getString("d_newfile");
        %>
        <tr> 
          <td class="table_02_1"><%=i+1%></td>
          <td class="table_02_1"><%=FormatDate.getFormatDate(v_indate,"yyyy/MM/dd HH:mm")%></td>
          <td class="table_02_1"><a href="/servlet/controller.library.DownloadServlet?p_savefile=<%=v_newfile%>&p_realfile=<%=v_realfile%>"><%=v_realfile%></a></td>
          <td class="table_02_1"><%=v_inuserid%></td>
        </tr>
        <%}%>
      </table>
      
    </td>
  </tr>
</table>
<br>
</body>
</html>


