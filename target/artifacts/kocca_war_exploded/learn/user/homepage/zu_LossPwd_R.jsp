<%
//**********************************************************
//  1. ��      ��: �α���
//  2. ���α׷��� : zu_login.jsp
//  3. ��      ��: �α���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 7. 13
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    String s_userid  = box.getSession("userid");
    box.put("leftmenu","1");

    String v_name  = box.getString("p_name");
    String v_pwd   = (String)request.getAttribute("pwd");
	String msg     = "";

	if (v_pwd.equals("")) {
		msg = "�˻��� ��й�ȣ�� �����ϴ�.";
	} else {
		msg = "<b>"+v_name+"</b> ���� ��й�ȣ�� <br><b>"+v_pwd+"</b> �Դϴ�.";
	}
%>
<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/include/topHome.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

 <SCRIPT LANGUAGE="JavaScript">
 <!--
// ������������
function indexList() {
    document.form1.p_process.value = "";
    document.form1.action = "/servlet/controller.homepage.MainServlet";
    document.form1.submit();
}
 //-->
 </SCRIPT>
 <form name="form1" method="post" action="javascript:return;">
  <input type='hidden' name='p_process'>


          <!-- center start -->
            <table width="730" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="20" align="center" valign="top" class="location">HOME &gt; �н��������� &gt; �α���</td>
              </tr>
              <tr> 
                <td align="center" valign="top"> 
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="/images/user/common/<%=tem_subimgpath%>/tit_login.jpg" ></td>
                    </tr>
                    <tr>
                      <td height="20"></td>
                    </tr>
                  </table>
                  <table width="405" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                  <!-- �α��� table -->
                  <table width="405" border="0" cellpadding="0" cellspacing="0" background="/images/user/common/log_bg.gif">
                    <tr> 
                      <td colspan="2" valign="top"><img src="/images/user/common/log_top.gif"></td>
                    </tr>
                    <tr> 
                      <td width="125"><img src="/images/user/common/pwsearch_img.jpg"></td>
                      <td width="280" valign="top"><table width="259" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="259" class="padd03">&nbsp;</td>
                          </tr>
                          <tr> 
                            <td align="right">
                              <table width="214" border="0" cellspacing="0" cellpadding="0">
                                 <tr> 
                                  <td width="210" align = "center"><%=msg%></td>
                                </tr>
                                <tr> 
                                <td height="5" ></td>
                              </tr>
                            </table>
                          </td>
                          </tr>
                          <tr> 
                            <td height="8" align="right"><img src="/images/user/common/log_line.gif" width="214" height="9"></td>
                          </tr>
                          <tr> 
                            <td height="8" align="right"><a href="javascript:indexList()"><img src="/images/user/button/btn_confirm.gif"></a></td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td colspan="2" valign="bottom"><img src="/images/user/common/log_bo.gif"></td>
                    </tr>
                  </table>
                  <table width="405" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td height="10"></td>
                    </tr>
                    <tr>
                      <td class="font_ex">- ����Ʈ �α��ν� ID�� ����Դϴ�.<br>
                        - �ʱ� PW�� �ֹι�ȣ ���ڸ� 7�ڸ��Դϴ�.</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td align="center" valign="top">&nbsp;</td>
              </tr>
</form>
              <tr> 
                <td width="470" height="2" align="center" valign="top" bgcolor="#999999"></td>
              </tr>
            </table>


<!---------- copyright start ------------------->
<%@ include file="/learn/user/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
