<%
//**********************************************************
//  1. ��      ��: Ȩ������ ���п���μ���
//  2. ���α׷���: zu_HomePageProcess_01.jsp
//  3. ��      ��: Ȩ������ ���п���μ���
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̿��� 2005. 7. 25
//  7. ��      ��: �̿��� 2005. 7. 25
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
	box.put("leftmenu","03");                       // �޴� ���̵� ����
%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/include/topGuide.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<script language="JavaScript" type="text/JavaScript">
<!--

//���п ������ �̵��Ѵ�.
function Process() {
    document.form1.action = "/servlet/controller.homepage.HomePageProcessServlet";
    document.form1.p_process.value = "selectList";
    document.form1.submit();
}


//-->
</script>
		  <!-- center start -->
		    <form name=form1>
		    <input type="hidden" name="p_process">
		    <table width="730" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="20" align="center" valign="top" class="location"> 
                  HOME &gt; �����ȳ� &gt; � ���μ���</td>
              </tr>
              <tr> 
                <td align="center" valign="top"> 
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td valign="top"><img src="/images/user/guide/<%=tem_subimgpath%>/tit_process.jpg"></td>
                    </tr>
                    <tr> 
                      <td height="20"></td>
                    </tr>
                  </table>
                  <!-- ������ -->
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="5" colspan="4"></td>
                    </tr>
                    <tr> 
                      <td width="98" valign="top"><a href="javascript:Process()" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image28','','/images/user/guide/tab_job_on.gif',1)"><img src="/images/user/guide/tab_job.gif" name="Image28"  border="0"></a> 
                      </td>
                      <td width="98" valign="top" ><img src="/images/user/guide/tab_process_on.gif"></td>
                      <td width="98" valign="top" >&nbsp;</td>
                      <td width="381" align="right" >&nbsp;</td>
                    </tr>
                    <tr> 
                      <td height="22" colspan="4"></td>
                    </tr>
                  </table> 
                  <table width="675" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><img src="/images/user/guide/st_studyprocess.gif"></td>
                    </tr>
                    <tr> 
                      <td>&nbsp;</td>
                    </tr>
                    <tr> 
                      <td><img src="/images/user/guide/pro_w_img1.gif"></td>
                    </tr>
                    <tr> 
                      <td height="20">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td><img src="/images/user/guide/pro_w_img2.gif"></td>
                    </tr>
                    <tr>
                      <td height="20">&nbsp;</td>
                    </tr>
                    <tr> 
                      <td><img src="/images/user/guide/pro_w_img3.gif"></td>
                    </tr>
					<tr> 
                      <td height="20">&nbsp;</td>
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