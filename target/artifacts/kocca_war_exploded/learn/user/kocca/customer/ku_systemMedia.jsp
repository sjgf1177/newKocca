<%
//**********************************************************
//  1. ��      ��: ����Ÿ > �н�ȯ��ý���
//  2. ���α׷��� : ku_systemMedia.jsp
//  3. ��      ��: �н�ȯ��ý��� (������)
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 05.12.26
//  7. ��      ��: 
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
    RequestBox box       = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    String  v_process    = box.getString("p_process");
    String  v_title      = "";
	String s_userid		 = box.getSession("userid");
	String s_name		 =  box.getSession("name");
                  
%>


<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/kocca/include/topHelpdesk.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<script language="JavaScript" type="text/JavaScript">
<!--


//-->
</script>



<form name = "form1" method = "post">
	  <input type = "hidden" name = "p_process"   value = "">
	  <input type = "hidden" name = "p_userid"    value = "">


						<table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td  class="location" > HOME > ����Ÿ &gt; �н�ȯ�� �ý���</td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/kocca/customer/<%=tem_subimgpath%>/tit_system.gif"></td>
                          </tr>
                          <tr> 
                            <td height="20"></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/kocca/customer/text_img_media.gif"></td>
                          </tr>
                          <tr> 
                            <td height="15"></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="94"><a href="/servlet/controller.homepage.KHomePageHelpServlet?p_process=selectHelp" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image37','','/images/user/kocca/customer/tab_internet_on.gif',1)"><img src="/images/user/kocca/customer/tab_internet.gif" name="Image37" width="94" height="30" border="0"></a></td>
                            <td width="3">&nbsp;</td>
                            <td width="94"><img src="/images/user/kocca/customer/tab_media_on.gif" width="94" height="30"></td>
                            <td width="3">&nbsp;</td>
                            <td width="94">&nbsp;</td>
                            <td width="3">&nbsp;</td>
                            <td width="94">&nbsp;</td>
                            <td width="295">&nbsp;</td>
                          </tr>
                          <tr> 
                            <td height="5" colspan="8" ></td>
                          </tr>
                          <tr> 
                            <td height="1" colspan="8" class="linecolor_cource02"></td>
                          </tr>
                          <tr>
                            <td height="10" colspan="8"></td>
                          </tr>
                          <tr> 
                            <td height="17" colspan="8" class="font_ex2">������ ���¸� 
                              ������ �� ���� ������ ����ٸ�, ������ �ӵ��� ������ ������.<br>
                              ���ͳ� ȸ���ӵ� ������ ������ �ӵ� ������ ������� �ٸ� �� ������, ������ �ӵ� ������� 
                              �ӵ��� ����ġ�� ���� ��� <br>
                              ���ͳ� ȸ���ӵ� ������ ���� ȸ�� �ӵ��� �Բ� üũ�� �ֽñ� �ٶ��ϴ�.</td>
                          </tr>
                        </table> 
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top"><img src="/images/user/kocca/customer/st_media1.gif"></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                          <tr> 
                            <td valign="top"><table width="680" border="2" cellspacing="0" 
                         cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
                                <tr  class="lcolor"> 
                                  <td height="3" colspan="2" class="linecolor_customer02"></td>
                                </tr>
                                <tr> 
                                  <td width="170" align="center" bgcolor="#D3E7F5"><strong>����</strong></td>
                                  <td width="550" align="center" bgcolor="#E7F7FE"><strong>�ý��� 
                                    ����</strong></td>
                                </tr>
                                <tr> 
                                  <td class="tbl_dbtit2">OS</td>
                                  <td align="center" >Windows XP </td>
                                </tr>
                                <tr> 
                                  <td height="26" class="tbl_dbtit1">IE</td>
                                  <td height="26" align="center" >Mozilla/4.0 
                                    (compatible; MSIE 6.0; Windows NT 5.1; SV1) 
                                  </td>
                                </tr>
                                <tr> 
                                  <td height="26" class="tbl_dbtit1">CPU</td>
                                  <td height="26" align="center" >x86 </td>
                                </tr>
                              </table></td>
                          </tr>
                          <tr> 
                            <td height="20">&nbsp;</td>
                          </tr>
                          <tr> 
                            <td><img src="/images/user/kocca/customer/st_media2.gif"></td>
                          </tr>
                          <tr> 
                            <td height="10"></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/kocca/customer/help_300.gif"></td>
                            <td valign="top"><img src="/images/user/kocca/customer/help_500.gif"></td>
                          </tr>
                          <tr> 
                            <td height="5" colspan="2"></td>
                          </tr>
                          <tr> 
                            <td width="365">
							<script language = "javascript" src = "/script/user_patch.js"></script>
							<script language='javascript'>object_embed("/asf/test_mynameis.asf","300","250");</script><!--embed src="/asf/test_mynameis.asf" width="300" height="250"></embed--></td>
                            <td width="355" valign="top"><script language='javascript'>object_embed("mms://speedtest.hvod.nefficient.co.kr/speedtest/test1.wmv","300","250");</script><!--embed src="mms://speedtest.hvod.nefficient.co.kr/speedtest/test1.wmv" width=300 height=250></embed--></td>
                          </tr>
                          <tr> 
                            <td>&nbsp;</td>
                            <td valign="top">&nbsp;</td>
                          </tr>
                        </table>

	</form>

<!---------- copyright start ------------------->
<%@ include file="/learn/user/kocca/include/bottom.jsp"%>
<!---------- copyright end  -------------------->