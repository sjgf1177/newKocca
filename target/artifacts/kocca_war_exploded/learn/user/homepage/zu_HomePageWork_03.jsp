<%
//**********************************************************
//  1. ��      ��: ��뺸�� ��������
//  2. ���α׷���: zu_HomePageWork_03.jsp
//  3. ��      ��: ��뺸�� ��������
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
                      <td width="171" valign="top" ><a href="javascript:Process02()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image35','','/images/user/guide/tab_wprocess_on.gif',1)"><img src="/images/user/guide/tab_wprocess.gif" name="Image35" width="171" height="22" border="0"></a></td>
                      <td width="94" valign="top" ><img src="/images/user/guide/tab_completion_on.gif" ></td>
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
                            <td><img src="/images/user/guide/sst_completion.gif"></td>
                          </tr>
                          <tr> 
                            <td height="5"></td>
                          </tr>
                          <tr> 
                            <td><img src="/images/user/guide/work_text4.gif" width="641" height="55"></td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                          <tr> 
                            <td align="center" valign="top"> <table width="616" border="0" cellspacing="0" cellpadding="0">
                                <tr> 
                                  <td width="22">&nbsp;</td>
                                  <td width="594" class="tbl_gleft"><img src="/images/user/guide/bl_c.gif" width="20" height="15" align="absmiddle"> 
                                    ȯ��(��뺸�� ����)�� �����ϴ�.</td>
                                </tr>
                                <tr > 
                                  <td height="5"></td>
                                  <td height="5" background="/images/user/guide/stu_box_vline2.gif"></td>
                                </tr>
                                <tr> 
                                  <td>&nbsp;</td>
                                  <td class="tbl_gleft"><img src="/images/user/guide/bl_c.gif" width="20" height="15" align="absmiddle"> 
                                    �����׸� - �н�����, �Ѱ���, ����Ʈ</td>
                                </tr>
                                <tr > 
                                  <td height="5"></td>
                                  <td height="5" background="/images/user/guide/stu_box_vline2.gif"></td>
                                </tr>
                                <tr> 
                                  <td>&nbsp;</td>
                                  <td valign="top" class="tbl_gleft"><img src="/images/user/guide/bl_c.gif" width="20" height="15" align="absmiddle"> 
                                    �����׸��� ������ Ư���� ���� ���������� �뵿�� ��ħ�� ���� ��ü�� ������ 
                                    ���ؿ� ���մϴ�. &nbsp;&nbsp;</td>
                                </tr>
                                <tr>
                                  <td>&nbsp;</td>
                                  
                      <td valign="top" class="tbl_gleft"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;������ 
                        80%�̻�, ����������, ������������ �ݵ�� �ؾ߸� �����Ͻ� �� �ֽ��ϴ�.<br></td>
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