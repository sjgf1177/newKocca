<%
//**********************************************************
//  1. ��      ��: ���� �λ縻
//  2. ���α׷��� : ku_AcademyCeo.jsp
//  3. ��      ��: ���� �λ縻
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

	box.put("leftmenu","02"); 
%>

<%if( box.getSession("tem_grcode").equals("N000001")) { %>
	
	<!--Ÿ��Ʋ�κ�-->
    <table width="672" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" colspan="2" class="h_road">&nbsp;</td>
      </tr>
      <tr>
        <td><img src="/images/portal/homepage_renewal/academy/stitle_01.gif" alt="���� �λ縻" /></td>
        <td class="h_road">Home &gt; ��������  &gt; <strong>�����λ縻</strong></td>
      </tr>
      <tr>
        <td height="12" colspan="2"></td>
        </tr>
      <tr>
        <td height="1" colspan="2" bgcolor="E5E5E5"></td>
      </tr>
    </table>
    <!--Ÿ��Ʋ�κ�//-->

      <table width="672" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="15"></td>
        </tr>
        <tr>
          <td height="15"><img src="/images/portal/homepage_renewal/academy/greeting.jpg" /></td>
        </tr>
        <tr>
          <td>          </td>
        </tr>
      </table>
	
<%}else{ %>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/kocca/include/topAbout.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

						<table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td  class="location" > HOME > ��ī���̼Ұ� > �����λ縻</td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/kocca/aboutus/<%=tem_subimgpath%>/tit_ceomessage.gif"></td>
                          </tr>
                          <tr> 
                            <td height="20"></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="88" rowspan="3"><img src="/images/user/kocca/aboutus/text_introacademy.gif"></td>
                          </tr>
                          <tr> 
                            <td height="12"></td>
                          </tr>
                          <tr > 
                            <td height="1" colspan="2" background="/images/user/kocca/common/dot_bg_9.gif"></td>
                          </tr>
                          <tr > 
                            <td height="7" colspan="2" ></td>
                          </tr>
                        </table>
                        <!--�����λ縻-->
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="137"><img src="/images/user/kocca/aboutus/photo_ceo.jpg"></td>
                            <td width="544" valign="top"><img src="/images/user/kocca/aboutus/text_ceo_01.gif"></td>
                          </tr>
                          <tr>
                            <td><img src="/images/user/kocca/aboutus/text_ceo_03.gif"></td>
                            <td><img src="/images/user/kocca/aboutus/text_ceo_02.gif"></td>
                          </tr>
                        </table>

<!---------- copyright start ------------------->
<%@ include file="/learn/user/kocca/include/bottom.jsp"%>
<!---------- copyright end  --------------------> 

	</td>
  </tr>
</table>

</body>
</html>

<%} %>
