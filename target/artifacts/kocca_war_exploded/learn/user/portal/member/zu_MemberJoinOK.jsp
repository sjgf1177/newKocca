<%
//**********************************************************
//  1. ��      ��: ȸ������ �Ϸ�
//  2. ���α׷��� : zu_MemberJoinOk.jsp
//  3. ��      ��: ȸ������ �Ϸ�
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��:
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->


<!-- ��ũ��Ʈ���� -->
<script language="JavaScript" type="text/JavaScript">
<!--//

//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- form ���� -->
<form name="form1"  action="" method="post" >
	<input type="hidden"	name="p_process"	value="" />
	<input type="hidden"	name="p_resno" value="" />
	
	<!--Ÿ��Ʋ�κ�//-->
	
<table>
<tr>
<td>
<table width="672" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" colspan="2" class="h_road">&nbsp;</td>
      </tr>
      <tr>
        <td><img src="/images/portal/homepage_renewal/member/stitle_01.gif" alt="ȸ������" /></td>
        <td class="h_road">Home &gt; �̿�ȳ�  &gt; <strong>ȸ������</strong></td>
      </tr>
      <tr>
        <td height="12" colspan="2"></td>
        </tr>
      <tr>
        <td height="1" colspan="2" bgcolor="E5E5E5"></td>
      </tr>
    </table>
      <table width="672" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="15"></td>
        </tr>
        <tr>
          <td>
          
          <!--process-->
          <table width="672" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="34"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td><img src="/images/portal/homepage_renewal/member/step_04.gif" alt="���ԿϷ�" /></td>
                </tr>
              </table></td>
            </tr>
          </table>
          <!--process//-->
          
          </td>
        </tr>
        <tr>
          <td height="15"></td>
        </tr>
      </table>
      
     
      <table width="100%" border="0" cellspacing="10" cellpadding="0" id="join_last">
        <tr>
          <td align="right" valign="bottom" ><table border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td height="30" align="left"><b>�ѱ���������ī���� ȸ�������� �Ϸ�Ǿ����ϴ�.</b></td>
            </tr>
            <tr>
              <td><a href="/servlet/controller.homepage.MainServlet"><img src="/images/portal/homepage_renewal/member/btn_main.jpg" alt="���������� �ٷΰ���" /></a> <a href="javascript:menuMainForward('1','/servlet/controller.homepage.SubMenuMainServlet?p_process=ONLINE_COURSE')"><img src="/images/portal/homepage_renewal/member/btn_online.jpg" alt="�¶��ΰ��� �ٷΰ���" /></a> <a href="javascript:menuMainForward('2','/servlet/controller.homepage.SubMenuMainServlet?p_process=OFFLINE_COURSE')"><img src="/images/portal/homepage_renewal/member/btn_offline.jpg" alt="�������ΰ��� �ٷΰ���" /></a></td>              
            </tr>
          </table></td>
        </tr>
      </table>
    </td>
    <td width="20">&nbsp;</td>
    
  </tr>
</table>

</form>
<!-- form �� -->

<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->