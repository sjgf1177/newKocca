<%
//**********************************************************
//  1. ��      ��: ��뺸�� ȯ�޽�û��� �� ����
//  2. ���α׷���: zu_HomePageWork_02.jsp
//  3. ��      ��: ��뺸�� ȯ�޽�û��� �� ����
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
function Process01() {
    document.form1.action = "/servlet/controller.homepage.HomePageWorkServlet";
    document.form1.p_process.value = "selectListMove01";
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
                      <td width="126" valign="top"><a href="javascript:Process()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image33','','/images/user/guide/tab_goyoung_on.gif',1)"><img src="/images/user/guide/tab_goyoung.gif" name="Image33"  border="0"></a> 
                      </td>
                      <td width="150" valign="top" ><a href="javascript:Process01()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image34','','/images/user/guide/tab_train_on.gif',1)"><img src="/images/user/guide/tab_train.gif" name="Image34"  border="0"></a></td>
                      <td width="171" valign="top" ><img src="/images/user/guide/tab_wprocess_on.gif" ></td>
                      <td width="94" valign="top" ><a href="javascript:Process03()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image30','','/images/user/guide/tab_completion_on.gif',1)"><img src="/images/user/guide/tab_completion.gif" name="Image30"  border="0"></a></td>
                      <td width="99" valign="top"><a href="javascript:Process04()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image31','','/images/user/guide/tab_gigan_on.gif',1)"><img src="/images/user/guide/tab_gigan.gif" name="Image31"  border="0"></a></td>
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
                            <td><img src="/images/user/guide/sst_process.gif" width="312" height="14"></td>
                          </tr>
                          <tr> 
                            <td height="5"></td>
                          </tr>
                          <tr> 
                            <td><img src="/images/user/guide/work_text3.gif" width="641" height="48"></td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                          <tr> 
                            <td align="center" valign="top"> <table width="616" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td height="28" colspan="2"><img src="/images/user/guide/work_st_03.gif"></td>
                                </tr>
                                <tr> 
                                  <td height="10" colspan="2"></td>
                                </tr>
                                <tr> 
                                  <td rowspan="3"><img src="/images/user/guide/work_03_img1.gif"></td>
                                  <td><strong>1. ����ȯ�޼������ </strong></td>
                                </tr>
                                <tr> 
                                  <td height="3"></td>
                                </tr>
                                <tr> 
                                  <td valign="top">&nbsp;&nbsp;&nbsp;&nbsp;-ȸ�纰�Ʒú񳻿���<br> 
                                    &nbsp;&nbsp;&nbsp;&nbsp;- ���곻����</td>
                                </tr>
                                <tr> 
                                  <td colspan="2">&nbsp;</td>
                                </tr>
                                <tr> 
                                  <td width="132" rowspan="3"><img src="/images/user/guide/work_03_img2.gif"></td>
                                  <td width="484" valign="top"> <strong>2. (����)��꼭 
                                    �纻</strong></td>
                                </tr>
                                <tr> 
                                  <td height="3"></td>
                                </tr>
                                <tr> 
                                  <td class="font_ex">+++����뵿�ΰ����� ���� ���⼭���� ���̰� 
                                    ���� �� �ֽ��ϴ� </td>
                                </tr>
                                <tr> 
                                  <td height="20" colspan="2"></td>
                                </tr>
                                <tr> 
                                  <td colspan="2"><img src="/images/user/guide/work_st_04.gif"  ></td>
                                </tr>
                                <tr> 
                                  <td height="10" colspan="2"></td>
                                </tr>
                                <tr> 
                                  <td colspan="2">���������� �߱��� ������ ���� �� ���信���ý�����(��)���� 
                                    �߱��մϴ�.</td>
                                </tr>
                              </table></td>
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

<!-- footer -->
<!---------- copyright start ------------------->
<%@ include file="/learn/user/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
