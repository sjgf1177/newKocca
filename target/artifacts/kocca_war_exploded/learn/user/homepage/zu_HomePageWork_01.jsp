<%
//**********************************************************
//  1. ��      ��: Ȩ������ ��Ź�Ʒ� �Ƿ�����
//  2. ���α׷���: zu_HomePageWork_L01.jsp
//  3. ��      ��: Ȩ������ ��Ź�Ʒ� �Ƿ�����
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̿��� 2005. 7. 26
//  7. ��      ��: �̿��� 2005. 7. 26
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>


<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    String s_userid     = box.getSession("userid");
	box.put("leftmenu","04");                       // �޴� ���̵� ����
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/include/topGuide.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<script language="JavaScript" type="text/JavaScript">
<!--

//��Ź�Ʒ� �Ƿ����� ������ �̵��Ѵ�.
function Process() {
    document.form1.action = "/servlet/controller.homepage.HomePageWorkServlet";
    document.form1.p_process.value = "selectList";
    document.form1.submit();
}

//ȯ�޽�û��� �� ����  ������ �̵��Ѵ�.
function Process02() {
    document.form1.action = "/servlet/controller.homepage.HomePageWorkServlet";
    document.form1.p_process.value = "selectListMove02";
    document.form1.submit();
}
//�������� ������ �̵��Ѵ�.
function Process03() {
    document.form1.action = "/servlet/controller.homepage.HomePageWorkServlet";
    document.form1.p_process.value = "selectListMove03";
    document.form1.submit();
}
//ȯ�ޱⰣ ������ �̵��Ѵ�.
function Process04() {
    document.form1.action = "/servlet/controller.homepage.HomePageWorkServlet";
    document.form1.p_process.value = "selectListMove04";
    document.form1.submit();
}


//-->
</script>
		  <!-- center start -->
		    <form name="form1">
		    <input type="hidden" name="p_process">
		    <table width="730" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="20" align="center" valign="top" class="location"> 
                  HOME &gt; �����ȳ� &gt; �뵿�ΰ��� ����</td>
              </tr>
              <tr> 
                <td align="center" valign="top"> 
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="top"><img src="/images/user/guide/<%=tem_subimgpath%>/tit_workinfo.jpg"></td>
                    </tr>
                    <tr> 
                      <td height="20"></td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><img src="/images/user/guide/st_goyong.gif"></td>
                    </tr>
                    <tr>
                      <td height="20"></td>
                    </tr>
                  </table>
                  <!-- ������ -->
                  <table width="640" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="126" valign="top"><a href="javascript:Process()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image33','','/images/user/guide/tab_goyoung_on.gif',1)"><img src="/images/user/guide/tab_goyoung.gif" name="Image33" width="126" height="22" border="0"></a> 
                      </td>
                      <td width="150" valign="top" ><img src="/images/user/guide/tab_train_on.gif"></td>
                      <td width="171" valign="top" ><a href="javascript:Process02()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image29','','/images/user/guide/tab_wprocess_on.gif',1)"><img src="/images/user/guide/tab_wprocess.gif" name="Image29" border="0"></a></td>
                      <td width="94" valign="top" ><a href="javascript:Process03()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image30','','/images/user/guide/tab_completion_on.gif',1)"><img src="/images/user/guide/tab_completion.gif" name="Image30" width="94" height="22" border="0"></a></td>
                      <td width="99" valign="top"><a href="javascript:Process04()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image31','','/images/user/guide/tab_gigan_on.gif',1)"><img src="/images/user/guide/tab_gigan.gif" name="Image31" width="99" height="22" border="0"></a></td>
                    </tr>
                    <tr> 
                      <td height="22" colspan="5"></td>
                    </tr>
                  </table>
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr align="center"> 
                      <td width="675" height="150" colspan="2" valign="top" > 
                        <table width="641" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/guide/sst_train.gif"></td>
                          </tr>
                          <tr> 
                            <td height="5"></td>
                          </tr>
                          <tr> 
                            <td><img src="/images/user/guide/work_text2.gif"></td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                          <tr>
                            <td class="font_ex">������ ����Ͻô� ���� ������ ����ֿ��� ��û�Ͽ� ����ְ� ������ ������ ���Ͽ� ��������<br>
                              ��Ź�Ʒ��� �Ƿ��ϵ��� �Ͽ��� ȯ���� ���� �� �ֽ��ϴ�.</td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                          <tr> 
                            <td align="center" valign="top"><table width="616" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td><img src="/images/user/guide/work_st_02.gif" width="616" height="27" ></td>
                                </tr>
                                <tr> 
                                  <td height="10"></td>
                                </tr>
                                <tr> 
                                  <td><img src="/images/user/guide/work_02_img.jpg"></td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr> 
                            <td align="center" valign="top">&nbsp; </td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                        </table></td>
                    </tr>
                    <tr> 
                      <td height="20" colspan="2">&nbsp;</td>
                    </tr>
                  </table></td>
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
