<%
//**********************************************************
//  1. ��      ��: ��뺸�� ȯ�ޱⰣ
//  2. ���α׷���: zu_HomePageWork_04.jsp
//  3. ��      ��: ��뺸�� ȯ�ޱⰣ
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
function Process02() {
    document.form1.action = "/servlet/controller.homepage.HomePageWorkServlet";
    document.form1.p_process.value = "selectListMove02";
    document.form1.submit();
}
//ȯ�ޱⰣ ������ �̵��Ѵ�.
function Process03() {
    document.form1.action = "/servlet/controller.homepage.HomePageWorkServlet";
    document.form1.p_process.value = "selectListMove03";
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
                      <td width="171" valign="top" ><a href="javascript:Process02()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image35','','/images/user/guide/tab_wprocess_on.gif',1)"><img src="/images/user/guide/tab_wprocess.gif" name="Image35" width="171" height="22" border="0"></a></td>
                      <td width="94" valign="top" ><a href="javascript:Process03()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image36','','/images/user/guide/tab_completion_on.gif',1)"><img src="/images/user/guide/tab_completion.gif" name="Image36" width="94" height="22" border="0"></a></td>
                      <td width="99" valign="top"><img src="/images/user/guide/tab_gigan_on.gif" ></td>
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
                            <td><img src="/images/user/guide/sst_gigan.gif"></td>
                          </tr>
                          <tr> 
                            <td height="5"></td>
                          </tr>
                          <tr> 
                            <td><img src="/images/user/guide/work_text5.gif"></td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                          <tr> 
                            <td align="center" valign="top"> <table width="616" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td colspan="2"><img src="/images/user/guide/work_st_05.gif" ></td>
                                </tr>
                                <tr> 
                                  <td height="10" colspan="2"></td>
                                </tr>
                                <tr> 
                                  <td width="22">&nbsp;</td>
                                  <td width="594" valign="top"><strong>1) �뵿�� 
                                    ������� <br>
                                    </strong><br> <font color="#FFFFFF">... 
                                    </font>���ͳ����� ���� ����뵿���� ����ó�� Ȯ���Ͻð�, ȯ�ް��� �����ۼ� 
                                    ���ǵ� ����뵿������ <br> <font color="#FFFFFF">... 
                                    </font>���� �� �ֽʽÿ�!! </td>
                                </tr>
                                <tr>
                                  <td>&nbsp;</td>
                                  <td valign="top">&nbsp;</td>
                                </tr>
                                <tr> 
                                  <td>&nbsp;</td>
                                  <td valign="top"><strong>2) ����뵿���� ����ó Ȯ�ι��<br>
                                    </strong><br>
                                    <font color="#FFFFFF">....</font>- �뵿�� �ѱ� 
                                    Ȩ�������� �����Ѵ�(http://www.molab.go.kr/Korean/Korean.html) 
                                    <br>
                                    <font color="#FFFFFF">....</font>- Ȩ������ ���� 
                                    �޴����� ����뵿������ Ŭ���Ѵ�. <br>
                                    <font color="#FFFFFF">....</font>- �������� ���� 
                                    ������ ����뵿������ Ŭ���Ѵ�(��, �����ߺ�����뵿�繫��) <br>
                                    <font color="#FFFFFF">....</font>- ȭ�� ������ 
                                    �ִ� �޴����� ��ȭ �� �൵�� Ŭ���Ѵ�. <br>
                                    <font color="#FFFFFF">....</font>- ����� ���� 
                                    ��ȭ��ȣ �߿��� ���������͸� ã�Ƽ� ��ȭ�ϸ� ��뺸�� ȯ�޿� ���ؼ� �ڼ��� 
                                    <br>
                                    <font color="#FFFFFF">....</font><font color="#FFFFFF">..</font> 
                                    �ȳ��� �帳�ϴ�.<br></td>
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

<!---------- copyright start ------------------->
<%@ include file="/learn/user/include/bottom.jsp"%>
<!---------- copyright end  -------------------->