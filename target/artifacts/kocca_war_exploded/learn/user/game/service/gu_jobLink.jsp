<%
//**********************************************************
//  1. ��      ��: ���� > ���α���
//  2. ���α׷��� : gu_jobLink.jsp
//  3. ��      ��: ���� > ���α���
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 05.12.26
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
	if (box == null) box = RequestManager.getBox(request);
 	box.put("leftmenu","04");                       // �޴� ���̵� ����

   
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topService.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<SCRIPT LANGUAGE="JavaScript">
<!--


//-->
</SCRIPT>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="css/user_style1.css" rel="stylesheet" type="text/css">
</head>

<body>
<!-- title -->
<table width="720" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr> 
    <td width="720" height="35" align="right"  background="/images/user/game/service/<%=tem_subimgpath%>/tit_job.gif" class="location" ><img src="/images/user/game/common/location_bl.gif"> 
      HOME > ���� > ���α���</td>
  </tr>
  <tr> 
    <td height="20">
      <!-- page sub -->
    </td>
  </tr>
</table>

<table width="720" height="400" border="0" cellspacing="0" cellpadding="0" align="center">

				<tr>
					<td width="40">&nbsp;</td>
					<td valign=top align=centerc>
					<iframe frameborder="0"  height=100% marginheight="0" marginwidth="0" name=job src="http://www.gamejob.co.kr/partner/cga/com/CL_total_list.html" width="700" cellspacing="0" cellpadding="0"  scrolling="auto"></iframe>
					</td>
				</tr>

</table>
<p>&nbsp;</p>
</body>
</html>


<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
