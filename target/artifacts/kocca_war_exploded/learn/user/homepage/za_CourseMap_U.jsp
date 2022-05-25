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

 //�����͸� �Է��Ѵ�.
function insert() {
    if (blankCheck(document.all.p_tabseqname.value)) {
        alert("�з����� �Է��ϼ���!");
        document.all.p_tabseqname.focus();
        return;
    }
    if (blankCheck(document.all.p_pdffile.value)) {
        alert("pdf ������ �Է��ϼ���!");
        document.all.p_pdffile.focus();
        return;
    }
    if (blankCheck(document.all.p_sfile.value)) {
        alert("�̹��� ������ �Է��ϼ���!");
        document.all.p_sfile.focus();
        return;
    }
    if (blankCheck(document.all.p_lfile.value)) {
        alert("�̹��� ������ �Է��ϼ���!");
        document.all.p_lfile.focus();
        return;
    }

    document.form1.action = "/servlet/controller.homepage.HomePageCourseMapAdminServlet";
	document.form1.p_process.value = "insert";
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
function realsize( value ) {//���ڼ��� üũ
    var len = 0;
    if ( value == null ) return 0;
    for(var i=0;i<value.length;i++){
        var c = escape(value.charAt(i));
        if ( c.length == 1 ) len ++;
        else if ( c.indexOf("%u") != -1 ) len += 2;
        else if ( c.indexOf("%") != -1 ) len += c.length/3;
    }
    return len;
}


</script>

</head>

<body topmargin=0 leftmargin=0>
<form  name = "form1"  method = "post" enctype = "multipart/form-data">
<input type = "hidden" name = "p_process"     value = "">
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
          <td class="table_02_2"><input type="file" name="p_pdffile" size="45" class="input" value="<%=v_pdffile%>"></td>
        </tr>
        <tr>
          <td class="table_title">�����̹������ϸ�</td>
          <td class="table_02_2"><input type="file" name="p_sfile" size="45" class="input" value="<%=v_sfile%>"></td>
        </tr>
        <tr>
          <td class="table_title">ū�̹������ϸ�</td>
          <td class="table_02_2"><input type="file" name="p_lfile" size="45" class="input" value="<%=v_lfile%>"></td>
        </tr>
      </table>

      <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
			<!--����ϱ�-->
			<td align = "right"><a href="javascript:insert();"><img src="/images/user/button/btn_register.gif" border="0"></a> &nbsp;&nbsp;
			<!--����ϱ�-->
			<a href="javascript:selectList();"><img src="/images/user/button/btn_cancel.gif" border="0"></a></td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
