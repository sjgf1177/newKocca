 <%
//**********************************************************
//  1. ��      ��: Ȩ������ �����˻�
//  2. ���α׷��� : SubjSearch.jsp
//  3. ��      ��: Ȩ������ �����˻�
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
	   
<SCRIPT LANGUAGE="JavaScript">
<!--

    function search_enter(e)  {
        if (e.keyCode =='13'){  subjSearch();}
    }


    function subjSearch() {
        if (document.subjSearch.p_lsearchtext.value=="") {
            alert("�˻�� �Է��ϼ���");
            return;
        }

        document.subjSearch.action = "/servlet/controller.propose.KMainSubjSearchServlet";
        document.subjSearch.p_process.value = "SubjSearch";
        document.subjSearch.submit();
    }
//-->
</SCRIPT>
    <form name="subjSearch" method="post" action="javascript:return;">
      <input type='hidden' name='p_process'>
      <input type='hidden' name='p_lsearch' value="">
                        <table width="166" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="41" height="20" class="tbl_bleft2"><img src="/images/user/kocca/homepage/type1/st_course_search.gif" width="33" height="11"></td>
                            <td><input type="text" name="p_lsearchtext" value="" size="13" onkeypress="search_enter(event)"></td>
                            <td width="22"><a href="javascript:subjSearch()"><img src="/images/user/kocca/homepage/type1/i_go.gif" width="18" height="18" border="0"></a></td>
                          </tr>
                          <tr> 
                            <td height="1" colspan="3" background="f"></td>
                          </tr>
                          <tr> 
                            <td height="6" colspan="3"></td>
                          </tr>
                          <tr > 
                            <td height="3" colspan="3" background="/images/user/kocca/homepage/type1/bg_course_search_line.gif"></td>
                          </tr>
                          <tr > 
                            <td height="8" colspan="3"></td>
                          </tr>
                        </table>
    </form>