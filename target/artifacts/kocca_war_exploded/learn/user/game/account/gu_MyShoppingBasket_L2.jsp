<%
//**********************************************************
//  1. ��      ��: SUBJECT PREVIEW PAGE
//  2. ���α׷���: gu_SubjectPreviewOn.jsp
//  3. ��      ��: �����ȳ�
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004. 01.12
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />
<jsp:useBean id = "memberBean" class = "com.credu.system.MemberAdminBean"  scope = "page" />
<jsp:useBean id = "code" class = "com.credu.system.CodeConfigBean"  scope = "page" />
<jsp:useBean id = "probean" class = "com.credu.propose.ProposeBean"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    box.put("leftmenu","01");                       // �޴� ���̵� ����
    String upload_url = conf.getProperty("url.upload");

    String  v_process      = box.getString("p_process");
    String  v_rprocess     = box.getString("p_rprocess");
    String  v_subj         = box.getString("p_subj");
    String  v_subjnm       = box.getString("p_subjnm");
    String  v_isonoff      = box.getString("p_isonoff");
    String  v_upperclassnm = box.getString("p_upperclassnm");
    String  v_upperclass   = box.getString("p_upperclass");
    String  v_select       = box.getString("p_select");
    String  v_actionurl    = box.getString("p_actionurl");
    String  v_lsearchsubject = box.getString("p_lsearchsubject");
    String  v_gubun       = box.getString("p_gubun");






%>

<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topApply.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->


<SCRIPT LANGUAGE="JavaScript">
<!--
//-->
</SCRIPT>


<form name="form1" method="post" >
    <input type='hidden' name='p_process' value="<%=v_process%>" >

	<!-- title -->
	<table width="720" border="0" cellspacing="0" cellpadding="0">
	  <tr> 
		<td width="720" height="35" align="right"  background="/images/user/game/mystudy/type1/tit_interest.gif" class="location" ><img src="/images/user/game/common/location_bl.gif"> 
		  HOME > ������û > ��ٱ���</td>
	  </tr>
	  <tr> 
		<td height="20"></td>
	  </tr>
	</table>
	<!-- ���ɰ���table  -->
	<table width="720" border="2" cellspacing="0" cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
		<form name="frm3" method="post" >
			<INPUT TYPE="hidden" NAME="p_process">
		

	  <tr  class="lcolor"> 
		<td height="3" colspan="8" class="linecolor_my"></td>
	  </tr>
		  <tr> 
			<td class="tbl_ptit2">����</td>
			<td class="tbl_ptit">������</td>
			<td class="tbl_ptit2">����</td>
			<td class="tbl_ptit">��米��</td>
			<td class="tbl_ptit2">�����Ⱓ</td>
			<td class="tbl_ptit">������</td>
			<td class="tbl_ptit2">[����]</td>
		  </tr>
	  </tr>

	  <tr> 
		<td class="tbl_grc">����</td>
		<td class="tbl_gleft"><a href="javascript:whenSubjInfo('000019','ALL')">���ӹ�ȭ��</a><br>
		</td>
		<td class="tbl_grc">003</td>
		<td class="tbl_grc">ȫ�浿</td>
		<td class="tbl_grc">2006-07-28 ~ 2006-09-21</td>
		<td class="tbl_grc">25,000��</td>
		<td class="tbl_grc">����</td>
	</tr>

	<tr>
	  <td colspan=7 height=30></td>
	</tr>
	
	<tr>
	  <td colspan=5 class="tbl_grc">�հ�</td>
	  <td class="tbl_grc">25,000��</td>
	  <td>&nbsp;</td>
	</tr>
	<tr>
	  <td colspan=5 class="tbl_grc">������</td>
	  <td class="tbl_grc">10%</td>
	  <td>&nbsp;</td>
	</tr>
	<tr>
	  <td colspan=5 class="tbl_grc">�����ݾ�</td>
	  <td class="tbl_grc">22,500��</td>
	  <td>&nbsp;</td>
	</tr>
	

	  </form>
	</table>
	
	<table width="720" border="2" cellspacing="0" cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
		<tr>
			<td> ���� �����ϱ�
			</td>	
		</tr>
	</table>
	
	
        <br>
        <br>


<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->