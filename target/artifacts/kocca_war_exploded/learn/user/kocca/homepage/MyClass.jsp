	   
<%
//**********************************************************
//  1. ��      ��: ����Ŭ����/������û���
//  2. ���α׷��� : MyClass.jsp
//  3. ��      ��: ����Ŭ����/������û���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 05.12.22
//  7. ��      ��:
//***********************************************************
%>
	   
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

%>
	   
 
<table width="166" border="0" cellspacing="0" cellpadding="0">
  <tr> 
	<td colspan="2"><a href="/servlet/controller.study.KMyClassServlet?p_process=EducationSubjectPage"><img src="/images/user/kocca/homepage/type1/st_myclass_b.gif" width="166" height="33" border="0"></a></td>
  </tr>
  <tr> 
	<td height="1" colspan="2"><img src="/images/user/kocca/homepage/type1/st_myclass_line.gif" width="166" height="1"></td>
  </tr>
  <tr> 
	<td colspan="2"><a href="/servlet/controller.propose.KProposeCourseServlet?p_process=SubjectList"><img src="/images/user/kocca/homepage/type1/st_aplly_b.gif" width="166" height="30" border="0"></a></td>
  </tr>
  <tr> 
	<td><a href="/servlet/controller.propose.KProposeCourseServlet?p_process=SubjectIntro"><img src="/images/user/kocca/homepage/type1/st_aplly_01.gif" width="98" height="18" border="0"></a></td>
	<td><a href="/servlet/controller.propose.KProposeCourseServlet?p_process=SubjectList"><img src="/images/user/kocca/homepage/type1/st_aplly_02.gif" width="68" height="18" border="0"></a></td>
  </tr>
  <tr> 
	<td colspan="2"><a href="/servlet/controller.study.KMyClassServlet?p_process=ProposeCancelPage"><img src="/images/user/kocca/homepage/type1/st_aplly_03.gif" width="166" height="15" border="0"></a></td>
  </tr>
  <tr> 
	<td colspan="2"><a href="/servlet/controller.propose.KProposeCourseServlet?p_process=OffLineSubjPage"><img src="/images/user/kocca/homepage/type1/st_aplly_04.gif" width="166" height="22" border="0"></a></td>
  </tr>
  <tr> 
	<td height="8" colspan="2"></td>
  </tr>
</table>
			<!--����Ŭ����/������û��� -->