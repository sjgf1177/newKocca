<%
//**********************************************************
//  1. ��      ��: HelpDesk > �ڷ��
//  2. ���α׷��� : gu_pds_I.jsp
//  3. ��      ��: �ڷ�� ���ȭ�� (������)
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 05.12.26
//  7. ��      ��: 
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.system.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    int     v_tabseq   = box.getInt("p_tabseq");
    String  v_process  = box.getString("p_process");
    int     v_pageno   = box.getInt("p_pageno");
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    int     v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�
    String  v_indate     = "";
    String  s_userid     = box.getSession("userid");
    String  s_username   = box.getSession("name");
	String  content = "";
	String  width = "650";
	String  height = "200";

box.put("leftmenu","04");                       // �޴� ���̵� ����
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topHelpdesk.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->


<script language="JavaScript" type="text/JavaScript">
<!--
//�Էµ� ���� ����
function insert() {
	if(document.all.use_editor[0].checked) {        
        form1.p_content.value = ObjEditor.document.all.tags("html")[0].outerHTML;
	}else {
		form1.p_content.value = document.all.txtDetail.value;
    }

if (blankCheck(document.all.p_title.value)) {
    alert("������ �Է��ϼ���!");
    document.all.p_title.focus();
    return;
}   
    if (realsize(document.form1.p_title.value) > 200) {
        alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
        document.form1.p_title.focus();
        return;
    }

    document.form1.p_pageno.value = "1";
    document.form1.p_search.value     = "";
    document.form1.p_searchtext.value = "";
    document.form1.action = "/servlet/controller.homepage.HomePageBoardServlet";
    document.form1.p_process.value = "insert";
    document.form1.submit();
}

//�󳻿� üũ
function blankCheck( msg ) {
    var mleng = msg.length;
    chk=0;
    
    for (i=0; i<mleng; i++) {
        if ( msg.substring(i,i+1)!=' ' && msg.substring(i,i+1)!='\n' && msg.substring(i,i+1)!='\r') chk++;
    }
    if ( chk == 0 ) return (true);
    
    return (false);
}

//�����Է��� ����ϰ� ����Ʈ�� �̵�
function cancel() {
     document.form1.action = "/servlet/controller.homepage.HomePageBoardServlet";
     document.form1.p_process.value = "selectList";
     document.form1.submit();
}

//���ڼ� üũ
function realsize( value ) {
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

//-->
</script>

<!-- /////////////////////////////////////////////////////////-->
<!--
  ����Ȯ����üũ INCLUDE
  
  1. page import = "com.credu.system.*" �߰�
  2. �ڹٽ�ũ��Ʈ ȣ��κ� �߰�
    ����)
    //���� Ȯ���� ���͸�  
	var islimit = true;
	var file = document.form1.p_file1.value;  
	if(file!="") {
	    islimit = limitFile(file);    //return�� true/false
	}
	
	if(islimit) {
        document.form1.submit();
	}else{
	    return;
	}

-->
<%@ include file = "/learn/library/fileFilter.jsp" %>
<!-- /////////////////////////////////////////////////////////-->


<form name = "form1" enctype = "multipart/form-data" method = "post">
				<input type = "hidden" name = "p_tabseq"     value = "<%=v_tabseq %>">
				<input type = "hidden" name = "p_pageno"     value = "<%=v_pageno %>">
				<input type = "hidden" name = "p_search"     value = "<%=v_search %>">
				<input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
				<input type = "hidden" name = "p_upfilecnt"  value = "<%= v_upfilecnt %>">
				<input type = "hidden" name = "p_content"    value="">
				<input type = "hidden" name = "p_process"	 value="">

<!-- title -->
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="720" height="35" align="right"  background="/images/user/game/helpdesk/<%=tem_subimgpath%>/tit_pds.gif" class="location" ><img src="/images/user/game/common/location_bl.gif"> 
      HOME > Help Desk > �ڷ��</td>
  </tr>
  <tr> 
    <td height="20"></td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><img src="/images/user/game/helpdesk/text_pds.gif"></td>
  </tr>
  <tr> 
    <td height="15">&nbsp;</td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="81" height="2" class="linecolor_helpdesk01"></td>
	<td width="639" height="2" class="linecolor_helpdesk02"></td>
  </tr>
</table>
<table width="720" border="2" cellspacing="0" 
    cellpadding="0"  style="border-collapse:collapse;" bordercolor="#A9B2CD" frame="hsides" rules="rows" >
  <tr> 
    <td width="80" class="tbl_grc"><img src="/images/user/game/helpdesk/text_subject.gif"></td>
    <td width="2" valign="bottom" ><img src="/images/user/game/helpdesk/vline.gif"></td>
    <td width="628" class="tbl_bleft"><input name="p_title" type="text" class="input" size="70"></td>
  </tr>
  <tr> 
    <td  class="tbl_grc"><img src="/images/user/game/helpdesk/text_writer.gif"></td>
    <td  valign="bottom"><img src="/images/user/game/helpdesk/vline.gif" ></td>
    <td bgcolor="F8F7EF" class="tbl_bleft">���</td>
  </tr>
  <tr> 
    <td colspan="3" class="tbl_bleft">
		<!-- DHTML Editor  -->
		<%@ include file="/include/DhtmlEditor.jsp" %>
		<!-- DHTML Editor  --></td>
  </tr>
  <tr> 
    <td class="tbl_grc"><img src="/images/user/game/helpdesk/text_addfile.gif"></td>
    <td valign="bottom"><img src="/images/user/game/helpdesk/vline.gif"></td>
    <td class="tbl_bleft">
		<input type="FILE" name="p_file1" size="60" class="input"><br>
		<input type="FILE" name="p_file2" size="60" class="input"><br>
		<input type="FILE" name="p_file3" size="60" class="input"><br>
	</td>
  </tr>
</table>
  <table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="81" height="2" class="linecolor_helpdesk01"></td>
	<td width="639" height="2" class="linecolor_helpdesk01"></td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td height="2" colspan="2" class="lcolor"></td>
  </tr>
  <tr> 
    <td height="1" colspan="2"></td>
  </tr>
  <tr> 
    <td height="5" colspan="2"></td>
  </tr>
  <tr> 
    <td align="center" valign="bottom">&nbsp;</td>
    <td align="right" valign="bottom"><a href="javascript:insert()"><img src="/images/user/game/button/btn_register.gif"></a><a href="javascript:cancel()"><img src="/images/user/game/button/btn_cancel.gif" border="0"></a></td>
  </tr>
  <tr> 
    <td height="5" colspan="2" ></td>
  </tr>
  <tr> 
    <td height="2" colspan="2"></td>
  </tr>
</table>
</body>
</html>

</form>

<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
