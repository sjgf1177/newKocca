<%
//**********************************************************
//  1. ��      ��: ���̵�/��й�ȣ ã��
//  2. ���α׷��� : ku_IdpwSearch.jsp
//  3. ��      ��: ���̵�/��й�ȣ ã��
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 06.01.02
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    String v_name = box.getString("p_name_1");
    String v_pwd  = (String)request.getAttribute("pwd");
    String v_isOk = box.getString("p_isOk");

%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/kocca/include/topMember.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<SCRIPT LANGUAGE="JavaScript">
<!--

// ID ã��
function searchId() {

    if(document.form1.p_name.value == ""){
        alert("�̸��� �Է��ϼ���!");
        form1.p_name.focus();
        return;
    }

    if (document.form1.p_resno1.value=="") {
        alert("�ֹι�ȣ�� ��Ȯ�� �Է��ϼ���.");
        form1.p_resno1.focus();
        return;
    }
    
    if (document.form1.p_resno2.value=="") {
        alert("�ֹι�ȣ�� ��Ȯ�� �Է��ϼ���.");
        form1.p_resno2.focus();
        return;
    }


    document.form1.p_process.value = "lossidresult";
    document.form1.action = "/servlet/controller.homepage.KLoginServlet";
    document.form1.submit();
}

// ������������
function indexList() {
    document.form1.p_process.value = "";
    document.form1.action = "/servlet/controller.homepage.MainServlet";
    document.form1.submit();
}

//�ڵ��̵�
function moveFocus(num,fromform,toform)
    {
        var str = fromform.value.length;
        if(str == num)
       toform.focus();
    }
// ���ڸ� ���� �����.
function onlyNumber()
{
    if(((event.keyCode<48)||(event.keyCode>57)))
    event.returnValue=false;
}

//-->
</SCRIPT>

 <form name="form1" method="post" action="javascript:return;">
  <input type='hidden' name='p_process'>


    <!-- title -->
        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td  class="location" > HOME > ȸ�� > ���̵�/��й�ȣã��</td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td><img src="/images/user/kocca/member/<%=tem_subimgpath%>/tit_idpw.gif"></td>
                          </tr>
                          <tr> 
                            <td height="20"></td>
                          </tr>
                        </table>
                        <table width="680" border="0" cellspacing="0" cellpadding="0">
                          <tr> 
                            <td width="88" rowspan="3"><img src="/images/user/kocca/member/text_idpw.gif"></td>
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
                        <!--�Խ��Ǹ�� -->
                        <table cellpadding="0" cellspacing="0" width="680">
                          <col width=50%>
                          <col width=7>
                          <col width=50%>
                          <tr> 
                            <td><img src="/images/user/kocca/member/id_pw_st01.gif" vspace="5"></td>
                            <td></td>
                            <td><img src="/images/user/kocca/member/id_pw_st02.gif" vspace="5"></td>
                          </tr>
                          <tr> 
                            <td style="border-top:5px solid #D8D2E0;border-bottom:5px solid #D8D2E0;border-left:5px solid #D8D2E0;"> 
                              <table cellpadding=0 cellspacing=0>
                                <tr> 
                                  <td><img src="/images/user/kocca/member/text_idpw_name.gif"></td>
                                  <td><input name="p_name" type="text" class="input3" style="width:175px"></td>
                                  <td></td>
                                </tr>
                                <tr> 
                                  <td><img src="/images/user/kocca/member/text_idpw_number.gif"></td>
                                  <td style="padding:5px 0px;">
                                      <input name="p_resno1" type="text" class="input3" style="width:74px" onkeyup="moveFocus(6,this,this.form.p_resno2);" OnKeypress="onlyNumber();">
                                      <img src="/images/user/kocca/member/idpw_dash.gif" hspace="5" align="absmiddle">
                                      <input name="p_resno2" type="text" class="input3" style="width:74px"></td>
                                  <td style="padding-left:25"><a href="javascript:searchId()"><img src="/images/user/kocca/button/btn_ok.gif" border="0"></a></td>
                                </tr>
                              </table>
                            </td>
                            <td style="border-top:5px solid #D8D2E0;border-bottom:5px solid #D8D2E0;"><img src="/images/user/kocca/member/idpw_hdot.gif"></td>
                            <td style="border-top:5px solid #D8D2E0;border-bottom:5px solid #D8D2E0;border-right:5px solid #D8D2E0;"> 
                              <table cellpadding=0 cellspacing=0>
                                <tr> 
                                  <td width="10%">&nbsp;</td>

<%                              if (!v_pwd.equals("")) {               %>
                                  <td><b><%=v_name%></b>���� �н������ <b><%=v_pwd%></b> �Դϴ�.</td>
<%                              } else  {                                %>
                                  <td>��ڿ��� �������ּ���</td>
<%                              }                                        %>

<!--���ϼ����� ����        
<%                            if (StringManager.toInt(v_isOk) > 0) {               %>
                                <td>�н����尡 �߼۵Ǿ����ϴ�.</td>
<%                            } else  {                                %>
                                <td>��ڿ��� �������ּ���</td>
<%                            }                                        %>
-->

                                  <td width="22%" align="left" style="padding-left:25"><a href="javascript:indexList()"><img src="/images/user/kocca/button/btn_ok.gif "border="0"></a></td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                        </table>


<!---------- copyright start ------------------->
<%@ include file="/learn/user/kocca/include/bottom.jsp"%>
<!---------- copyright end  -------------------->
