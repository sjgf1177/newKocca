<%
//**********************************************************
//  1. ��      ��: ������������ ������
//  2. ���α׷��� : zu_MemberInfoUpdate.jsp
//  3. ��      ��: ������������
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 7. 27
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.homepage.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    String s_userid  = box.getSession("userid");
    box.put("leftmenu","2");

    //��������
    ArrayList  list1 = (ArrayList)request.getAttribute("memberView");

    MemberInfoBean bean = new MemberInfoBean();

%>
<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/include/topHome.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<SCRIPT LANGUAGE="JavaScript">
<!--

    // �������� ����
    function update() {
        if (document.form1.p_pwd.value == ""){
            alert('��й�ȣ�� �Է��ϼ���.');
            return;
        }else if(document.form1.p_pwd.value != document.form1.p_re_pwd.value){
            alert('��й�ȣ�� ��й�ȣȮ���� �ٸ��ϴ�.��й�ȣ�� �ٽ� �Է��ϼ���.');
            document.form1.p_pwd.value ="";
            document.form1.p_re_pwd.value ="";
            document.form1.p_pwd.focus();
            return;
        }

        if (document.form1.p_deptnam.value == ""){
            alert('�μ��� �Է��ϼ���.');
           document.form1.p_deptnam.focus();
            return;
        }
        if (document.form1.p_work_plcnm.value == ""){
            alert('�ٹ����� �Է��ϼ���.');
           document.form1.p_work_plcnm.focus();
            return;
        }
        if (document.form1.p_handphone.value == "" && document.form1.p_comptel.value == ""){
            alert('�系��ȭ/�ڵ����� �Ѱ��� �Է��Ͽ��� �մϴ�.');
           document.form1.p_handphone.focus();
            return;
        }

        if (document.form1.p_addr.value == ""){
            alert('�ּҸ� �Է��ϼ���.');
           document.form1.p_addr.focus();
            return;
        }
        if (document.form1.p_addr2.value == ""){
            alert('���ּҸ� �Է��ϼ���.');
           document.form1.p_addr2.focus();
            return;
        }
        if (document.form1.p_email.value == ""){
            alert('e-mail�� �Է��ϼ���.');
           document.form1.p_email.focus();
            return;
        }

        form1.p_process.value   = "memberUpdate";
        form1.action            = "/servlet/controller.homepage.MemberInfoServlet";
        form1.submit();
    }

    // �Է� üũ
    function input_chk(form1)  {
        var chk = (isNull(form1.elements["p_pwd"],"��й�ȣ"));
        return (chk);
    }

    // �����ȣ�˻�
    function searchPost() {
        window.self.name = "PersonalSelect";
        open_window("openPost","","100","100","390","400","","","","yes","");
        document.form1.target = "openPost";
        document.form1.action='/servlet/controller.library.PostSearchServlet';
        document.form1.p_process.value = 'SearchPostOpenPage';
        document.form1.submit();

        document.form1.target = window.self.name;
    }

    function goMain() {
        form1.p_process.value   = "";
        form1.action            = "/servlet/controller.homepage.MainServlet";
        form1.submit();
    }
//-->
</SCRIPT>

<% for (int i=0; i<list1.size(); i++) {
      DataBox dbox = (DataBox)list1.get(i); %>

 <form name="form1" method="post" action="javascript:return;">
  <input type='hidden' name='p_process'>
          <!-- center start -->

<table width="730" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="20" align="center" valign="top" class="location">HOME &gt; ������������</td>
  </tr>
  <tr>
    <td align="center" valign="top"> <table width="675" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="/images/user/common/<%=tem_subimgpath%>/tit_personal_mod.jpg"></td>
        </tr>
        <tr>
          <td height="20"></td>
        </tr>
      </table>
      <table width="675" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="200" valign="top"> <table width="675" border="2" cellspacing="0"
                         cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
              <tr  class="lcolor">
                <td height="3" colspan="2" class="line_color_com"></td>
              </tr>
              <tr>
                <td width="117" class="tbl_dbtit1">&nbsp;&nbsp; ���̵�</td>
                <td width="538" class="tbl_bleft"> <%=s_userid%></td>
              </tr>
              <tr>
                <td class="tbl_dbtit2">&nbsp;&nbsp; �̸�(�ѱ�)</td>
                <td class="tbl_bleft"> <%=dbox.getString("d_name")%></td>
              </tr>
              <tr>
                <td height="26" class="tbl_dbtit1"><font color="red" size="4">*</font> ��й�ȣ</td>
                <td height="26" class="tbl_bleft"> <input type="password" class="input" name="p_pwd" size="20" maxlength="20" value="<%=dbox.getString("d_pwd")%>">&nbsp;&nbsp; �ʱ��й�ȣ(11111)�� ��� ��й�ȣ�� �������ּž�
                </td>
              </tr>
              <tr>
                <td class="tbl_dbtit2"><font color="red" size="4">*</font> ��й�ȣȮ��</td>
                <td class="tbl_bleft"> <input type="password" class="input" name="p_re_pwd" size="20" maxlength="20" value="<%=dbox.getString("d_pwd")%>">&nbsp;&nbsp; ����Ʈ �̿��� �����մϴ�.</td>
              </tr>
              <tr>
                <td class="tbl_dbtit1">&nbsp;&nbsp; ȸ��</td>
                <td class="tbl_bleft"> <%=dbox.getString("d_compnm")%></td>
              </tr>
              <tr>
                <td class="tbl_dbtit2"><font color="red" size="4">*</font> �μ�</td>
                <td class="tbl_bleft"> <input type="text" class="input" name="p_deptnam" size="20" maxlength="40" value="<%=dbox.getString("d_deptnam")%>"></td>
              </tr>
              <tr>
                <td class="tbl_dbtit1">&nbsp;&nbsp; ����</td>
                <td class="tbl_bleft"> <%=dbox.getString("d_jikwinm")%></td>
              </tr>
              <tr>
                <td class="tbl_dbtit2"><font color="red" size="4">*</font> �ٹ���</td>
                <td class="tbl_bleft"> <input type="text" class="input" name="p_work_plcnm" size="20" maxlength="100" value="<%=dbox.getString("d_work_plcnm")%>"> </td>
              </tr>
              <tr>
                <td class="tbl_dbtit1"><font color="red" size="4">*</font> �系��ȭ</td>
                <td class="tbl_bleft"> <input type="text" class="input" name="p_comptel" size="20" maxlength="20" value="<%=dbox.getString("d_comptel")%>">
                  ���� :
                  <input type="text" class="input" name="p_tel_line"  size="5" maxlength="4" value="<%=dbox.getString("d_tel_line")%>"></td>
              </tr>
              <tr>
                <td class="tbl_dbtit2">&nbsp;&nbsp; �ڵ���</td>
                <td class="tbl_bleft"> <input type="text" class="input" name="p_handphone" size="20" maxlength="20" value="<%=dbox.getString("d_handphone")%>"></td>
              </tr>
              <tr>
                <td class="tbl_dbtit1">&nbsp;&nbsp; ����ȭ</td>
                <td class="tbl_bleft"> <input type="text" class="input" name="p_hometel" size="20" maxlength="20" value="<%=dbox.getString("d_hometel")%>"></td>
              </tr>
              <tr>
                <td class="tbl_dbtit2"><font color="red" size="4">*</font> �����ȣ</td>
                <td class="tbl_bleft"> <input type="text" class="input" name="p_post1" size="3" maxlength="3" value="<%=dbox.getString("d_post1")%>">
                  -
                  <input type="text" class="input" name="p_post2"  size="3" maxlength="3" value="<%=dbox.getString("d_post2")%>">
                  &nbsp;<a href="javascript:searchPost()"><img src="/images/user/button/btn_postfind.gif" align="absmiddle" border="0"></a></td>
              </tr>
              <tr>
                <td class="tbl_dbtit1"><font color="red" size="4">*</font> �ּ�</td>
                <td class="tbl_bleft"> <input type="text" class="input" name="p_addr" size="50" maxlength="100" value="<%=dbox.getString("d_addr")%>" readonly></td>
              </tr>
              <tr>
                <td class="tbl_dbtit2"><font color="red" size="4">*</font> ���ּ�</td>
                <td class="tbl_bleft"> <input type="text" class="input" name="p_addr2" size="50" maxlength="50" value="<%=dbox.getString("d_addr2")%>"></td>
              </tr>
              <tr>
                <td class="tbl_dbtit1"><font color="red" size="4">*</font> e-mail</td>
                <td class="tbl_bleft"> <input type="text" class="input" name="p_email" size="50" maxlength="50" value="<%=dbox.getString("d_email")%>"></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="5" align="center" valign="top"></td>
  </tr>
  <tr>
    <td align="center" valign="top"><a href="javascript:update()"><img src="/images/user/button/btn_save.gif" border="0"></a>
      <a href="javascript:goMain()"><img src="/images/user/button/btn_cancel.gif"></a></td>
  </tr>
  <tr>
    <td align="center" valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td width="470" height="2" align="center" valign="top" bgcolor="#999999"></td>
  </tr>
</table>
<%}%>
<!---------- copyright start ------------------->
<%@ include file="/learn/user/include/bottom.jsp"%>
<!---------- copyright end  -------------------->