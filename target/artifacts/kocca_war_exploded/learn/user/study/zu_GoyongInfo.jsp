<%
//**********************************************************
//  1. ��      ��: �н�â ����ȭ�� - ��뺸�� �ȳ�������
//  2. ���α׷���: zu_GoyongInfo.jsp
//  3. ��      ��: �н�â ����ȭ�� - ��뺸�� �ȳ�������
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2004. 1. 10
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.library.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_subj      = box.getString("p_subj");
    String  v_subjseq   = box.getString("p_subjseq");
    String  v_year			= box.getString("p_year");
    
    String  v_office  = "";
    String v_museridnm = "���";
    SubjGongData data = (SubjGongData)request.getAttribute("selectGoyong");
    String  v_subjnm        = data.getSubjnm();
    int     v_studentlimit  = data.getStudentLimit();
    int     v_framecnt      = data.getFrameCnt();
    int     v_edutimes      = data.getEduTimes();
    String  v_musertel      = data.getMuserTel();
    String  v_comp			= data.getComp();
    
    if (v_comp.equals("0101")){
    	v_office = "��������뵿�繫��";
    } else {
    	v_office = "��������뵿û(�繫��)";
    }
    
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="STYLESHEET" type="text/css" href="/css/user_style_study.css">
<script>
function doCancel() {
        self.close();
}

</script>
</head>
<body bgcolor="#FCE1D0" text="#000000" topmargin=0 leftmargin=0>
<form name="form1" method="post">
<table width="560" border="0" cellspacing="0" cellpadding="0" align=center>
  <tr>
    <td height="11"></td>
    <td height="11"></td>
    <td height="11"></td>
  </tr>
  <tr> 
    <td><img src="/images/user/study/notice_top_l.gif"></td>
    <td width="510"><img src="/images/user/myclass/notice_top_title.gif" alt="����Ʒ� ������ ���ǻ���"></td>
      <td><img src="/images/user/study/notice_top_r.gif"></td>
  </tr>
  <tr> 
    <td background="/images/user/myclass/notice_l_bg.gif"></td>
    <td bgcolor="#FFFFFF"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="4%" height="8"></td>
          <td width="92%" height="8"></td>
          <td width="4%" height="8"></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td>���ϲ��� ���� ��û�� <span class=notice_pop><%=v_subjnm%></span> �Ʒð����� �ٷ��������Ʒ������� ��28���� ������ ���Ͽ� �뵿�� <%=v_office%>�κ��� 
            �����ɷ°����Ʒð����������� ���� �Ʒð����Դϴ�.</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td>�� ������ �Ʒú�� ������ ����ְ� ���� �δ��ϸ� �ٷ��������Ʒ������������Ģ<br>
            ��8�� �� ������ ������ؿ� ���Ͽ� ������ ��� ���ϰ� �Ҽ��� �ִ� ����ִ� <br>
           ����� 1�δ� �뵿�ηκ��� ��뺸���ݿ��� �Ʒú���� �������� �� �ֽ��ϴ�.<br>
           ���� ���ϲ����� �������׿� �����Ͽ� �Ʒÿ� �����ֽñ� �ٶ��ϴ�.</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5%" valign="top">��.</td>
                <td width="95%">�Ʒü��������� ���� ������ ���� �Ʒ��� �����Ͽ��� �ϸ�, �븮, ���� ��������<br>
                  �ϴ� ��쿡�� �뵿�ηκ��� �Ʒú���� ������ ���� �� ����.</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td valign="top">��.</td>
                <td>�򰡴� �ݵ�� �����Ͽ��� �ϸ�, ����뵿������ �����κ��� �������� �ƷñⰣ�� �����ϱ� ������ ��� �򰡿� 
                  �����Ͽ� ������ؿ� ������ ��쿡 ���Ͽ� ������ ����ִ� �뵿�ηκ��� �Ʒú���� ������ ���� �� ����</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td valign="top">��.</td>
                <td>�н�����, ���� ���� �븮, ���� �ۼ� ��Ÿ ������ ������� ������ ��� ������ �� ������ ���� ���ϰ� 
                  �ҼӵǾ� �ִ� ����ִ� 1�Ⱓ ��뺸��� ���� �����ɷ°����Ʒ� ��������� ���� �� ���� �� ���� ����.</td>
              </tr>
            </table></td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td class= notice_pop>�� �������� �������� <%=v_studentlimit%>�� �����̸� <%=v_framecnt%>�����Ӽ�/<%=v_edutimes%>�ð����� �̷���� ����</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td style=padding-left:18px>��Ÿ �Ʒð��� �������� �� ���� ������ ������ ��� ��ȭ <%=v_musertel%><br>
            (�����:<%=v_museridnm%>)���� �����Ͻñ� �ٶ��ϴ�.</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table></td>
    <td background="/images/user/myclass/notice_r_bg.gif"></td>
  </tr>
  <tr> 
    <td><img src="/images/user/study/notice_bottom_l.gif"></td>
    <td background="/images/user/myclass/notice_bottom_bg.gif"></td>
    <td><img src="/images/user/myclass/notice_bottom_r.gif"></td>
  </tr>
  <tr> 
    <td height="35">&nbsp;</td>
    <td height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="right"><img src="/images/user/button/btn_close.gif" alt="�ݱ�" border="0" onclick="doCancel();" style="cursor:hand;"></td>
        </tr>
      </table></td>
    <td height="35">&nbsp;</td>
  </tr>
</table>
<br>
</form>
</body>
</html>
