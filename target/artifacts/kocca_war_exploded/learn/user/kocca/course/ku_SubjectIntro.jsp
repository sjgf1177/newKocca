<%
//**********************************************************
//  1. ��      ��: SUBJECT LIST
//  2. ���α׷���:  ku_SubjectIntro.jsp
//  3. ��      ��: ������ȸ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004.01.12
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />
<%

    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    box.put("leftmenu","01");                       // �޴� ���̵� ����
    String  v_process         = box.getString("p_process");
    
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/kocca/include/topApply.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<SCRIPT LANGUAGE="JavaScript">
<!--
   
//-->
</SCRIPT>

<form name="form1" method="post" >
    <input type='hidden' name='p_process'  >
    <input type='hidden' name='p_subj'     value="">

	<table width="680" border="0" cellspacing="0" cellpadding="0">
	  <tr> 
		<td  class="location" > HOME > ������û > ������û ���/�ȳ�</td>
	  </tr>
	</table>
	<table width="680" border="0" cellspacing="0" cellpadding="0">
	  <tr> 
		<td><img src="/images/user/kocca/apply/type1/tit_guide.gif"></td>
	  </tr>
	  <tr> 
		<td height ="250" ></td>
	  </tr>
	</table>


</form>
<!---------- copyright start ------------------->
<%@ include file="/learn/user/kocca/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
