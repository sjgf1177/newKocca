<%
//**********************************************************
//  1. ��      ��: ����ü�赵
//  2. ���α׷���: za_CourseMap_U.jsp
//  3. ��      ��: ����ü�赵 ����
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2005. 7. 28 �̿���
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box    = (RequestBox)request.getAttribute("requestbox");
	String s_userid   = box.getSession("userid");

	DataBox dbox = (DataBox)request.getAttribute("selectUpdate");

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

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">
<script src="/script/cafe_select.js" language="JavaScript"></script>
<SCRIPT LANGUAGE="javascript">

//����Ʈȭ������ �̵�
function selectList() {
    document.form1.action = "/servlet/controller.homepage.HomePageCourseMapAdminServlet";
    document.form1.p_process.value = "selectList";     
    document.form1.submit();	
}  

//����
function del() {
	if (confirm("������ �����Ͻðڽ��ϱ�?")) {
		document.form1.action = "/servlet/controller.homepage.HomePageCourseMapAdminServlet";
		document.form1.p_process.value = "delete";
		document.form1.submit();
	}
	else {
		return;
	}
}

 //�����͸� �Է��Ѵ�.
function update() {

    if (blankCheck(document.all.p_tabseqname.value)) {
        alert("�з����� �Է��ϼ���!");
        document.all.p_tabseqname.focus();
        return;
    }

    document.form1.action = "/servlet/controller.homepage.HomePageCourseMapAdminServlet";
	document.form1.p_process.value = "update";
    document.form1.submit();
}

//�Է� ������ ������ üũ
function blankCheck( msg ) {
    var mleng = msg.length;
    chk=0;
    
    for (i=0; i<mleng; i++) {
        if ( msg.substring(i,i+1)!=' ' && msg.substring(i,i+1)!='\n' && msg.substring(i,i+1)!='\r') chk++;
    }
    if ( chk == 0 ) return (true);
    
    return (false);
}



</script>

</head>

<body topmargin=0 leftmargin=0>
<form  name = "form1"  method = "post" enctype = "multipart/form-data">
<input type = "hidden" name = "p_tabseq"     value = "<%=v_tabseq%>">
<input type = "hidden" name = "p_process"    value = "">
<input type = "hidden" name = "p_realpdf"    value = "<%=v_realpdf%>">
<input type = "hidden" name = "p_savepdf"    value = "<%=v_savepdf%>">
<input type = "hidden" name = "p_realsfile"  value = "<%=v_realsfile%>">
<input type = "hidden" name = "p_savesfile"  value = "<%=v_savesfile%>">
<input type = "hidden" name = "p_reallfile"  value = "<%=v_reallfile%>">
<input type = "hidden" name = "p_savelfile"  value = "<%=v_savelfile%>">



<table width="1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">

        <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
          <tr> 
            <td><img src="/images/admin/homepage/homepage_title13.gif"></td>
            <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
          </tr>
        </table>
       <br>
      <table width="970"  border="0"  cellpadding="0" cellspacing="1" class="table_out">
        <tr>
          <td class="table_title" width="18%">�ۼ���</td>
          <td class="table_02_2"  width="82%"><%=s_userid%></td>
        </tr>
		<tr>
          <td class="table_title">�з���</td>
          <td class="table_02_2"><input type="text" name = "p_tabseqname" value="<%=v_tabseqname%>" size="50" maxlength ="50"></td>
        </tr>
        <tr>
          <td class="table_title">pdf ���ϸ�</td>
          <td class="table_02_2">
			<input type="file" name="s_pdffile" size="45" class="input" value="">
			<%=v_realpdf%>
		  </td>
        </tr>
        <tr>
          <td class="table_title">�����̹������ϸ�</td>
          <td class="table_02_2">
		    <input type="file" name="s_sfile" size="45" class="input" value="">
			<%=v_realsfile%> <b> (ǥ���̹��������� : 623*369)</b>
		  </td>
        </tr>
        <tr>
          <td class="table_title">ū�̹������ϸ�</td>
          <td class="table_02_2">
		    <input type="file" name="s_lfile" size="45" class="input" value="">
			<%=v_reallfile%>
		  </td>
        </tr>
      </table>

      <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
			<!--����ϱ�-->
			<td align = "right"><a href="javascript:update();"><img src="/images/admin/button/btn_apply.gif" border="0"></a> &nbsp;&nbsp;
			<a href="javascript:del();"><img src="/images/admin/button/btn_del.gif" border="0"></a> &nbsp;&nbsp;

			<!--����ϱ�-->
			<a href="javascript:selectList();"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
