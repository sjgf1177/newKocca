<%
//**********************************************************
//  1. ��      ��: ������û > ������û�ȳ�
//  2. ���α׷���: gu_ApplyIntro2.jsp
//  3. ��      ��: ������û�ȳ�
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: 06.01.23
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />
<%

    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    box.put("leftmenu","01");                       // �޴� ���̵� ����

    String  v_process		= box.getString("p_process");

%>


<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topApply.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->


<script language="JavaScript" type="text/JavaScript">
<!--
 
 function move(tab){
	document.form1.p_process.value= "SubjectIntro";
	document.form1.p_tab.value = tab;
	document.form1.action = "/servlet/controller.propose.ProposeCourseServlet";
	document.form1.submit();
 }

//-->

</script>

<form name="form1" method="post" enctype = "multipart/form-data">
    <input type='hidden' name='p_process'>
    <input type='hidden' name='p_tab'>


<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="35" align="right"  background="/images/user/game/apply/<%=tem_subimgpath%>/title01.gif" class="location" ><img src="/images/user/game/common/location_bl.gif"> 
      HOME > ������û > ������û�ȳ�</td>
  </tr>
  <tr> 
    <td height="20"></td>
  </tr>
</table>
<!-- �� -->
<table width="719" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td width="719" align="right"><a href="javascript:move(1)"><img src="/images/user/game/apply/tab_g01.gif" name="Image11" border="0"></a><img src="/images/user/game/apply/tab_g02_on.gif" width="109" height="32"></td>
  </tr>
</table>
<table width="720" border="0" cellpadding="0" cellspacing="0" background="/images/user/game/apply/gbox_bg.gif">
  <tr>
    <td><img src="/images/user/game/apply/gbox_top.gif"></td>
  </tr>
  <tr>
    <td align="center" valign="top"><table width="690" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td><img src="/images/user/game/apply/st_applyguide2.gif" width="352" height="15"></td>
        </tr>
        <tr> 
          <td height="9"></td>
        </tr>
      </table>
      <table width="690" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td class="tbl_menualtext" >1. ������û Ȯ��/��� �޴��� Ŭ���Ͽ� ������û�� ����Ʈ�� Ȯ���մϴ�.</td>
        </tr>
        <tr> 
          <td height="2"></td>
        </tr>
        <tr> 
          <td height="5" background="/images/user/game/apply/guide_linebg.gif"></td>
        </tr>
      </table> 
      <table width="690" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="10"></td>
        </tr>
        <tr> 
          <td class="tbl_gleft"><strong>�������</strong>�� ���� ���û��Ҹ� ������ �ٷ� ��û��Ұ� 
            �̷�����ϴ�.(������û�Ⱓ����)</td>
        </tr>
        <tr>
          <td class="tbl_gleft"><strong>�������</strong>�� ���� �Ա� Ȯ������ ���� �ٷ� ���û��Ҹ� 
            �Ͻ� �� �ֽ��ϴ�.</td>
        </tr>
        <tr> 
          <td height="5"></td>
        </tr>
        <tr> 
          <td align="center" valign="top"><img src="/images/user/game/apply/guide_img6.gif"></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="690" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td class="tbl_menualtext" >2. �Ա�Ȯ�� �Ǿ��� ����� ��û���<strong>(��������ϰ��)</strong></td>
        </tr>
        <tr> 
          <td height="2"></td>
        </tr>
        <tr> 
          <td height="5" background="/images/user/game/apply/guide_linebg.gif"></td>
        </tr>
      </table>
      <table width="690" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="10"></td>
        </tr>
        <tr> 
          <td class="tbl_gleft">�������û��� �Ⱓ�� �ش��ϸ� ���û��Ҹ� �Ͻ� �� �ֽ��ϴ�.</td>
        </tr>
        <tr> 
          <td height="5"></td>
        </tr>
        <tr> 
          <td align="center" valign="top"><img src="/images/user/game/apply/guide_img7.gif"></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="690" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td class="tbl_menualtext" >3. ��û��Ҹ� ������ <strong>ȯ�ҽ�û ȭ���� ��ϴ�</strong>. 
          </td>
        </tr>
        <tr> 
          <td height="2"></td>
        </tr>
        <tr> 
          <td height="5" background="/images/user/game/apply/guide_linebg.gif"></td>
        </tr>
      </table>
      <table width="690" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td class="tbl_gleft"><strong>��</strong>������ �Է��ϰ� Ȯ���ϸ� �Աݱ����� ȯ�� ó������ 
            �Ǹ� ������ ������ ȯ�� �Ϸ�� ��û��Ұ� �̷�����ϴ�.</td>
        </tr>
        <tr> 
          <td height="5"></td>
        </tr>
        <tr> 
          <td align="center" valign="top"><img src="/images/user/game/apply/guide_img8.gif"></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
      </table>
      
    </td>
  </tr>
  <tr>
    <td valign="bottom"><img src="/images/user/game/apply/gbox_bo.gif"></td>
  </tr>
</table>

          
</form>


<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->