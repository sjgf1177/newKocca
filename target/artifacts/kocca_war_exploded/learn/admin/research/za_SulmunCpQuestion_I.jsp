<%
//**********************************************************
//  1. ��      ��: ���� 
//  2. ���α׷���: za_SulmunAllQuestion_I.java
//  3. ��      ��: ��ü���� ���
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 6. 30
//  7. ��      ��: 
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.research.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

	String v_end = box.getString("p_end");
	String v_onload = "";
	if(v_end.equals("0")) { v_onload = "onload='javascript:onload();'"; }

    String  v_gubun = box.getStringDefault("p_gubun", SulmunAllBean.DEFAULT_SUBJ);
    String  v_grcode    = box.getString("p_grcode");        //�����ְ�
	String v_gubunnm = "��ü����";

    String  v_subj = box.getString("s_subjcourse");  
    String v_reloadlist = box.getString("p_reloadlist");
    String v_distcode = box.getString("p_distcode");

%>
<html>
<head>
<title>������������-���</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<script language="JavaScript">
<!--

// ��� ó��
function InsertQuestion() {
  if(!chkData()) {
     return;
  }
  document.form2.p_process.value = "SulmunQuestionInsert";
  document.form2.p_reloadlist.value = 'true';
  document.form2.submit();  
}


// ������ ��Ͻ� üũ����
function chkData() {
  if (blankCheck(document.form2.p_sultext.value)) {
    document.form2.p_sultext.focus();
    alert('������������  �Է��Ͻʽÿ�.');
    return false;
  }

  //var v_sultype = document.form2.p_sultype.options[document.form2.p_sultype.selectedIndex].value;
  var v_selcount = 0;
  var v_seltextcnt = 0;
  document.form2.p_selcount6.value = "7";

  return true;
}

<% if (v_reloadlist.equals("true")) { %>
opener.ReloadPage('go');
<% } %>


function onload() {
  window.self.close();
}



/*
function changeScaleC() {

  var v_scalecode = document.form2.p_scalecode5.options[document.form2.p_scalecode5.selectedIndex].value;

	    document.form2.target = "openWinQuestion";
		document.form2.action = "/servlet/controller.research.SulmunAllQuestionServlet";
		document.form2.p_process.value = "SulmunQuestionInsertS";
		document.form2.p_scalecode.value = v_scalecode;
		document.form2.p_sultype.value = 5;
		document.form2.submit();
 
}
*/
-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0"  <%=v_onload%>>

<table width="667" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
     
	
     
	<!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/research/tit_pop_sulmunman.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
	        <!----------------- title �� ----------------->
     
     
     <br>
      <!----------------- ������ ���� ----------------->
      </p><table cellpadding="0" cellspacing="0" class="table1">
        <tr>
		 <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td valign="bottom" height="20" class=sub_title>
		  <%=v_gubunnm%> �űԹ��� ���</td>
        </tr>
        <tr>
          <td height="3"></td>
        </tr>
      </table>
      <!----------------- ������ �� ----------------->
      <!----------------- ������� ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
      <form name="form2" method="post" action="/servlet/controller.research.SulmunCPQuestionServlet">
        <input type="hidden" name="p_process" value="">
        <input type="hidden" name="p_action"  value="">
        <input type="hidden" name="p_gubun"   value="<%=v_gubun%>">
        <input type="hidden" name="p_subj"    value="<%=v_subj%>">
        <input type="hidden" name="p_grcode"  value="<%=v_grcode%>">
        <input type="hidden" name="p_scalecode"  value="">
        <input type="hidden" name="p_reloadlist"  value="">
        <tr>
          <td colspan="4" class="table_top_line"></td>
        </tr>
		<tr>
          <td class="table_title">�����з�</td>
          <td class="table_02_1"><%=CodeConfigBean.getCodeGubunSelect (SulmunCpBean.DIST_CODE, "", 1, "p_distcode", v_distcode, "", 0)%></td>
          <td class="table_title">���</td>
          <td class="table_02_1">
          <input type="hidden" name="p_sultype"  value="1">
		  <SELECT name="p_apptarget">
            <option value=1>���־�ü</option>
            <option value=2>AES�Է�</option>
          </SELECT> 
          </td>
		</tr>
		<tr>
          <td class="table_title">����</td>
          <td class="table_02_1" valign="top" colspan="3">
            <textarea name="p_sultext" cols="60" rows="12" class="input"></textarea>
		  </td>
		</tr>
	   </table>

      <table cellspacing="1" cellpadding="5" class="table_out">
	    <input type="hidden" name="p_selmax6"  value="">
	    <input type="hidden" name="p_selcount6"  value="">	
		<tr>
		  <td colspan="4" class="table_title">����</td>
		</tr>
<%  
    for (int k=1; k <= 7; k++) {
%>
        <tr>
          <td class="table_01"><%=String.valueOf(k)%>��</td>
          <td class="table_02_1">
             <input name="p_seltext6" type="text" class="input" size="60" value="" >
			 <!--input type="hidden" name="p_selpoint6"  value="0"-->
          </td>
		  <td class="table_02_1"><%=k%>��</td>
		  <input name="p_selpoint6" type="hidden" value="<%=k%>" >
        </tr>
<% } %>
	  </table>



      </form>
	  <!----------------- ������� �� ----------------->
      <!----------------- ��� ��ư ���� ----------------->
      <table cellspacing="0" cellpadding="0" >
        <tr>
          <td><a href="javascript:InsertQuestion()"><img src="/images/admin/button/btn_apply.gif" border="0"></a></td>
        </tr>
      </table>
      <!----------------- ��� ��ư �� ----------------->
      <br>
    </td>
  </tr>

  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>     

</table>
</body>
</html>
