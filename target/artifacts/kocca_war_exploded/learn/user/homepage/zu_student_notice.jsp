<%
//**********************************************************
//  1. ��      �� : �н������ǻ���
//  2. ���α׷��� : zu_student_notice.jsp
//  3. ��      �� :
//  4. ȯ      �� : JDK 1.3
//  5. ��      �� : 1.0
//  6. ��      �� : ������ 2005.07.8
//  7. ��      �� :
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.propose.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    String v_subj     = box.getString("p_subj");
    String v_year     = box.getString("p_year");
    String v_subjseq  = box.getString("p_subjseq");

%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="/css/user_style1.css" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!--
    function submit_check() {
        document.form1.p_process.value   = "firstSubj";
        document.form1.action            = "/servlet/controller.contents.EduStart";
        document.form1.submit();
    }

//-->
</SCRIPT>
</head>
<body leftmargin="0" topmargin="0" bottommargin="0" marginwidth="0" marginheight="0" >
<form name="form1" method="post">
  <input type='hidden' name='p_process'  value='firstSubj'>
  <input type='hidden' name='p_subj'     value='<%=v_subj%>'>
  <input type='hidden' name='p_year'     value='<%=v_year%>'>
  <input type='hidden' name='p_subjseq'  value='<%=v_subjseq%>'>


  <table cellpadding="0" cellspacing="10" bgcolor="#EEEEEE" width="550">
    <tr>
        <td>
            <table cellpadding="0" cellspacing="1" bgcolor="#bebebe" class="table2" height="100%">
                <tr>
                    <td align="center" valign="top" bgcolor="#FFFFFF" class="body_color">
                    <br>
<!-- �н������ǻ��� table  -->
            <table width="490" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
              <tr>
                <td align="center" valign="top"><img src="/images/user/common/stunotice_title.gif">
                </td>
              </tr>
              <tr>
                <td height="10"></td>
              </tr>
              <tr valign="top">
                <td height="20" align="center"> <table width="480" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td valign="top">�н��ڴԲ��� �����ϰ� ��ô� ���������� �ٷ��������Ʒ������� ��28����
                        ������ ���Ͽ� �뵿�ηκ��� <font color="#CC3300">�����ɷ°����Ʒ� �������� ��������
                        ��������</font>�Դϴ�.<br> <br>
                        �� ������ ������� �н��ڴԲ��� �Ҽӵ� ȸ�翡�� ���� �δ��ϸ�,���ϰ� ���Ḧ ���� ��쿡 ���� �뵿�ηκ���
                        ������ ���� ���� �� �ְ� �˴ϴ�. <br>
                        �н��ڴԲ��� ��� ���������� �̼����Ͻð� �Ǵ� ��� �н��ڴ��� �Ҽӵ� ȸ��� ������ ���� ����
                        �� ������, �н��ڴ� ���� �����̼�/�޿������� �������� �ް� �˴ϴ�. <br> <font color="#006699">����
                        �н��ڴԲ����� ���� ���׿� �����Ͽ� �н��� ���� �ֽñ� �ٶ��ϴ�.</font></td>
                    </tr>
                    <tr>
                      <td height="8" valign="top"></td>
                    </tr>
                    <tr >
                      <td height="5" background="/images/user/common/search_line-1.gif"></td>
                    </tr>
                    <tr >
                      <td height="8"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td height="10" align="center" valign="top"> <table width="477" border="0" cellpadding="0" cellspacing="0" background="/images/user/common/stu_box_bg.gif">
                    <tr>
                      <td valign="top"><img src="/images/user/common/stu_box_top.gif"></td>
                    </tr>
                    <tr>
                      <td height="10" align="center" valign="top" >- ���� -</td>
                    </tr>
                    <tr>
                      <td height="8" valign="top" style="padding-left:13pt"></td>
                    </tr>
                    <tr>
                      <td height="10" valign="top" style="padding-left:13pt"><img src="/images/user/common/stu_bl.gif" align="absmiddle"><font color="#000000">����
                        ���������� ���� ��ü �������� 20%, ����� �� ������������ ��ü ����<br>
                        &nbsp;&nbsp;&nbsp;&nbsp; ���� 40% ���� �Դϴ�.</font></td>
                    </tr>
                    <tr>
                      <td height="8" valign="top" style="padding-left:13pt"></td>
                    </tr>
                    <tr>
                      <td height="10" valign="top" style="padding-left:13pt"><img src="/images/user/common/stu_bl.gif"><font color="#000000">���������
                        ��������� �Ѵ��� <font color="#CC3300">������ ������(0��)�ϰ�� �Ǵ� ������
                        <br>
                        &nbsp;&nbsp;&nbsp;&nbsp; ������(0��)</font> �϶��� �̼��� ó���˴ϴ�.</font></td>
                    </tr>
                    <tr>
                      <td height="8" valign="top" style="padding-left:13pt"></td>
                    </tr>
                    <tr>
                      <td height="10" valign="top" style="padding-left:13pt"><img src="/images/user/common/stu_bl.gif"><font color="#000000">�򰡴�
                        ����Pool���(3��� �̻�)���� �������� 5�� �������� ����˴ϴ�.</font></td>
                    </tr>
                    <tr>
                      <td height="8" valign="top" style="padding-left:13pt"></td>
                    </tr>
                    <tr>
                      <td height="10" valign="top" style="padding-left:13pt"><img src="/images/user/common/stu_bl.gif"><font color="#000000">��������
                        ���������� 3�������� �������ֽñ� �ٶ��(�������), ����������<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;���� ������ ������ô� �̼��� ó���˴ϴ� <br>
                        &nbsp;&nbsp;&nbsp;&nbsp;(�Ʒñ���� ��å�� ��� �Ҽ� ȸ�翡 ���ع���� �ϳ�,
                        �̼��� ó���� �������� <br>
                        &nbsp;&nbsp;&nbsp;&nbsp;�ʽ��ϴ�)</font></td>
                    </tr>
                    <tr>
                      <td height="8" valign="top" style="padding-left:13pt"></td>
                    </tr>
                    <tr>
                      <td height="10" valign="top" style="padding-left:13pt"><img src="/images/user/common/stu_bl.gif"><font color="#000000">������
                        �з��� A4 ���� 2�� �̻� ������ ��Ģ�����ϸ�, ������ ������� <br>
                        &nbsp;&nbsp;&nbsp;&nbsp;�� �ϴ���� ����� ���� ��� ��θ� 0�� ó���Ͽ� �̼���
                        ó�� �մϴ�. </font></td>
                    </tr>
                    <tr >
                      <td><img src="/images/user/common/stu_box_bo.gif"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr>
                <td height="10"></td>
              </tr>
              <tr>
                <td height="10" align="center">��� �н��� ���ǻ��׿� ���� �Ͻʴϱ�?</td>
              </tr>
              <tr>
                <td height="10"></td>
              </tr>
              <tr align="right">
                <td height="20" align="center"><a href="javascript:submit_check()"><img src="/images/user/button/btn_agree_ok.gif" border="0"></a>
                  <a href="javascript:self.close()"><img src="/images/user/button/btn_agree_no.gif" border="0"></a>
                </td>
              </tr>
              <tr>
                <td height="10" align="right"><img src="/images/user/common/stu_logo.gif"></td>
              </tr>
              <tr>
                <td height="10"></td>
              </tr>
            </table>

          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</form>
</body>
</html>
