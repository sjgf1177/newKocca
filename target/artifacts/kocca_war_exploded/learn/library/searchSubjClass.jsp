<%
//**********************************************************
//  1. ��      ��: ���� ��з� �ߺз� (IFrame)
//  2. ���α׷���: searchSubjClass.jsp
//  3. ��      ��: ���� ��з� �ߺз� (IFrame)
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2005. 11. 14
//  7. ��      ��: 
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }
    
    String v_formname = box.getString("p_formname");

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language="JavaScript">
function whenSelection(ss_action) {
    parent.<%=v_formname%>.p_upperclass.value = document.form1.s_upperclass.value;
    parent.<%=v_formname%>.p_middleclass.value = document.form1.s_middleclass.value;
    parent.<%=v_formname%>.p_lowerclass.value = document.form1.s_lowerclass.value;

        document.form1.submit();
}
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
      <form name="form1" method="post" action="/servlet/controller.library.SearchServlet">
<table  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="left" valign="top"> 
        <input type="hidden" name="p_process" value="subjclass">
        <input type="hidden" name="p_formname" value="<%=v_formname%>">
        <%= SelectSubjBean.getUpperClass(box, true, true, false)%><!-- getUpperclass(RequestBox, isChange, isALL, isStatisticalPage)    ������з�  --><br>
        <%= SelectSubjBean.getMiddleClass(box, true, true, false)%><!-- getMiddleclass(RequestBox, isChange, isALL, isStatisticalPage)    �����ߺз�  --><br>
        <%= SelectSubjBean.getLowerClass(box, true, true, true)%><!-- getLowerclass(RequestBox, isChange, isALL, isStatisticalPage)    �����Һз�  -->
      </td>
  </tr>
</table>
    </form>                      
</body>
</html>
