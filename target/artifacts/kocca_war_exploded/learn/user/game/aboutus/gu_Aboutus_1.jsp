<%
//**********************************************************
//  1. ��      ��: ��ī���̼Ұ� > ��ȭ������ �η¾缺ü�赵
//  2. ���α׷��� : ku_Academy.jsp
//  3. ��      ��: ��ȭ������ �η¾缺ü�赵
//  4. ȯ      ��: JDK 1.4
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

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
	if (box == null) box = RequestManager.getBox(request);

	box.put("leftmenu","01"); 
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topAboutus.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->
                  <!-- Ÿ��Ʋ -->
                  <table width="720" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="35" width="720" align="right"  background="/images/user/game/aboutus/<%=tem_subimgpath%>/tit_01.gif" class="location"><img src="/images/user/game/common/location_bl.gif"> HOME > aboutus > ������ǥ</td>
                    </tr>
                      <td height="20">&nbsp;</td>
                    </tr>
                  </table>
             
                  <table width="720" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="/images/user/game/aboutus/about01.gif"></td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                  <table width="720" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="/images/user/game/aboutus/st_b.gif"></td>
                    </tr>
                    <tr>
                      <td height="5"></td>
                    </tr>
                  </table>
                  <table width="720" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="/images/user/game/aboutus/about01-1.gif"></td>
                    </tr>
                  </table>
	
<!-- foote -->
<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>