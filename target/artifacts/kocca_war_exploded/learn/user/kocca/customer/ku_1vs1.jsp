<%
//**********************************************************
//  1. ��      ��: ����Ÿ > 1:1���
//  2. ���α׷��� : ku_1vs1.jsp
//  3. ��      ��: 1:1���
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
    String content      = "";
    String width        = "650";
    String height       = "200";
    String s_userid      = box.getSession("userid");
    String s_name        =  box.getSession("name");

    ArrayList list       = (ArrayList)request.getAttribute("selectList");

%>


<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/kocca/include/topHelpdesk.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<script language="JavaScript" type="text/JavaScript">
<!--
function insert(){
    if(document.all.use_editor[0].checked) {
        form1.content.value = ObjEditor.document.all.tags("html")[0].outerHTML;
    }else {
        form1.content.value = document.all.txtDetail.value;
    }
    if (blankCheck(document.all.p_title.value)) {
        alert("������ �Է��ϼ���!");
        document.all.p_title.focus();
        return;
    }
    if (realsize(document.all.p_title.value) > 100) {
        alert("������ �ѱ۱��� 50�ڸ� �ʰ����� ���մϴ�.");
        document.all.p_title.focus();
        return;
    }

    document.form1.action = "/servlet/controller.homepage.KHome1vs1Servlet";
    document.form1.p_process.value = "insertData";
    document.form1.submit();
}

//�����Է��� ����ϰ� ����Ʈ�� �̵�
function cancel() {
     document.form1.action = "/servlet/controller.homepage.MainServlet";
     //document.form1.p_process.value = "selectList";
     document.form1.submit();
}


//-->
</script>



<form name = "form1" method = "post">
      <input type = "hidden" name = "p_process"   value = "">
      <input type = "hidden" name = "p_userid"    value = "">


                       <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td  class="location" > HOME > ����Ÿ &gt; 1:1 ���</td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td><img src="/images/user/kocca/customer/<%=tem_subimgpath%>/tit_1vs1.gif"></td>
                          </tr>
                          <tr>
                            <td height="20"></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td><img src="/images/user/kocca/customer/text_1vs1.gif"></td>
                          </tr>
                          <tr>
                            <td height="15"></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="9"></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td colspan="2"><img src="/images/user/kocca/customer/bar_1vs1_top.gif" width="680" height="7" ></td>
                          </tr>
                          <tr>
                            <td height="2" colspan="2"></td>
                          </tr>
                          <tr>
                            <td width="75" class="textcolor_customer01">��������</td>
                            <td width="605" class="tbl_gleft01"><input name="p_title" type="text" class="input3" style="width:300"></td>
                          </tr>
                          <tr>
                            <td colspan="2" height="1"></td>
                          </tr>
                          <tr>
                            <td colspan="2" height="1" class="linecolor_main01"></td>
                          </tr>
                          <tr>
                            <td width="75" class="textcolor_customer01">�ۼ���</td>
                            <td width="605" class="tbl_gleft02"><%=s_name%></td>
                          </tr>
                          <tr>
                            <td colspan="2" height="1"></td>
                          </tr>
                          <tr>
                            <td colspan="2" height="1" class="linecolor_main01"></td>
                          </tr>
                          <tr>
                            <td colspan="2" height="1"></td>
                          </tr>
                          <tr>
                            <td class="textcolor_customer01">���� �ۼ���</td>
                            <td class="tbl_gleft02"><%= FormatDate.getDate("yyyy-MM-dd") %></td>
                          </tr>
                          <tr>
                            <td colspan="2" height="1" class="linecolor_main01"></td>
                          </tr>
                          <tr>
                            <td colspan="2">
                            <!-- DHTML Editor  -->
                            <%@ include file="/include/DhtmlEditor.jsp" %>
                            <!-- DHTML Editor  -->
                            </td>
                          </tr>
                          <tr>
                            <td height="7" colspan="2"></td>
                          </tr>
                          <tr>
                            <td colspan="2" height="1" class="linecolor_main01"></td>
                          </tr>
                          <tr>
                            <td colspan="2">&nbsp;</td>
                          </tr>
                          <tr>
                            <td colspan="2" height="1" class="linecolor_main01"></td>
                          </tr>
                          <tr>
                            <td height="3" colspan="2" class="linecolor_customer02"></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td height="20"><table width="680" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="2"></td>
                                </tr>
                                <tr>
                                  <td height="27" class="linecolor_notice"><table width="52" border="0" align="right" cellpadding="0" cellspacing="0">
                                      <tr>
                                        <td><a href="javascript:insert()"><img src="/images/user/kocca/button/btn_save.gif" border="0"></a>&nbsp;<a href="javascript:cancel()"><img src="/images/user/game/button/btn_list.gif" border="0"></a>
                                        </td>
                                      </tr>
                                    </table></td>
                                </tr>
                                <tr>
                                  <td height="1" bgcolor="#cccccc"></td>
                                </tr>
                              </table>
                              <table width="680" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="20">&nbsp;</td>
                                </tr>
                              </table></td>
                          </tr>
                        </table>
    </form>

<!---------- copyright start ------------------->
<%@ include file="/learn/user/kocca/include/bottom.jsp"%>
<!---------- copyright end  -------------------->