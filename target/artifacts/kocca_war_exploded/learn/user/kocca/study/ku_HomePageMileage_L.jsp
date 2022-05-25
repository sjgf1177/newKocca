<%
//**********************************************************
//  1. ��      ��: EDUCATION SUBJECT PAGE
//  2. ���α׷���: ku_EducationSubject_L.jsp
//  3. ��      ��: ���ǰ��ǽ�
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: Kim.jin.suk 2005 12. 19
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.homepage.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    box.put("leftmenu","09");                       // �޴� ���̵� ����

    String  v_process   = box.getString("p_process");
    String  v_user_id   = box.getSession("userid");
    String  v_user_nm   = box.getSession("name");

	int v_point = 0;
	int v_total = 0;
	int v_tmp_total = 0;


	String v_mileagenm = "";
	String v_ldate	= "";
	String v_minus_num	= "";
	String v_plus_num	= "";

	int v_totalmil	= 0;
	int i = 0;

	v_totalmil = HomePageMileageBean.TotalMileage(box);

	ArrayList list = null;

	list = (ArrayList)request.getAttribute("MileageList");

%>


<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/kocca/include/topMyclass.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<script>
	function mileageList()
	{
		document.form1.action = "/servlet/controller.homepage.HomePageMileageServlet?p_process=mileageList";
		document.form1.submit();
	}
</script>

<form name= "form1" method= "post">
  <table width="680" border="0" cellspacing="0" cellpadding="0">
	  <tr> 
		<td  class="location">  HOME &gt; ����Ŭ���� &gt; ���ϸ���</td>
	  </tr>
	</table>
	<table width="680" border="0" cellspacing="0" cellpadding="0">
	  <tr> 
		<td><img src="/images/user/kocca/myclass/<%=tem_subimgpath%>/tit_mileage.gif"></td>
	  </tr>
	  <tr> 
		<td height="21"></td>
	  </tr>
	</table>
	<table width="680" border="0" cellspacing="0" cellpadding="0">
	  <tr> 
		<td colspan="5"><img src="/images/user/kocca/myclass/bar_classroom.gif" width="680" height="24"></td>
	  </tr>
	  <tr> 
		<td width="45" valign="top"><img src="/images/user/kocca/myclass/bar_classroom_left.gif" width="45" height="96"></td>
		<td width="287" valign="top">
		<table width="287" border="0" cellspacing="0" cellpadding="0">
			<tr> 
			  <td height="3" colspan="2"></td>
			</tr>
			<tr> 
			  <td width="70" background="/images/user/kocca/myclass/name_bg.gif"><div align="center"><strong><font color="#000000"><%=v_user_nm%></font></strong></div></td>
			  <td width="217"><img src="/images/user/kocca/myclass/text_mileage.gif"></td>
			</tr>
			<tr> 
			  <td height="10" colspan="2"></td>
			</tr>
		  </table>
		  <table width="257" border="0" cellspacing="0" cellpadding="0">
			<tr height="33"> 
			  <td width="30">&nbsp;</td>
			  <td width="40"> <img src="/images/user/kocca/myclass/ico_point.gif"> </td>
			  <td>�� <%=v_totalmil%> point</td>
			</tr>
			<tr> 
			  <td height="1" colspan="3" background="/images/user/kocca/myclass/dot_bgline.gif"></td>
			</tr>
			<tr> 
			  <td height="5" colspan="3"></td>
			</tr>
			<tr>
				<td align="right" colspan="3"><a href="javascript:mileageList()"><img src="/images/user/kocca/button/btn_list.gif"></a></td>
			</tr>
		  </table></td>
		<td width="16" valign="top"><img src="/images/user/kocca/myclass/vline.gif" width="16" height="96"></td>
		<td width="305"><img src="/images/user/kocca/myclass/im_mileage.gif"></td>
		<td width="27" valign="top"><img src="/images/user/kocca/myclass/bar_classroom_right.gif" width="27" height="96"></td>
	  </tr>
	  <tr> 
		<td height="10" colspan="5"></td>
	  </tr>
	</table>
	<!-- �н��������� -->
	<table width="680" border="2" cellspacing="0" 
	 cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed" >
	  <tr  class="lcolor"> 
		<td height="3" colspan="5" class="linecolor_my"></td>
	  </tr>
	  <tr> 
		<td width="88" class="tbl_ptit2">��/��</td>
		<td width="151" class="tbl_ptit">�߻� ���ϸ���</td>
		<td width="143" class="tbl_ptit2">��� ���ϸ��� </td>
		<td width="136" class="tbl_ptit">���� ���ϸ��� </td>
		<td width="118" class="tbl_ptit2">���</td>
	  </tr>
<%
	for(i = 0; i < list.size(); i++)
	{
		DataBox dbox = (DataBox)list.get(i);
			
		
		v_point		= dbox.getInt("d_point");
		v_mileagenm	= dbox.getString("d_usememo");
		v_ldate		= dbox.getString("d_ldate");
		v_total		+= v_point;

		v_ldate		= FormatDate.getFormatDate(v_ldate,"yyyy/MM");

		if(v_point > 0)
		{
			v_plus_num = String.valueOf(v_point);
			v_minus_num = "-";
		}
		else
		{
			v_plus_num = "-";
			v_minus_num = String.valueOf(Math.abs(v_point));
		}

%>
	  <tr> 
		<td class="tbl_grc"><%=v_ldate%></td>
		<td class="tbl_grc"><%=v_plus_num%> </td>
		<td class="tbl_grc"><%=v_minus_num%></td>
		<td class="tbl_grc"><%=v_total%></td>
		<td class="tbl_grc"><%=v_mileagenm%></td>
	  </tr>
<% } 
	if(i == 0)
	{	%>
		<tr>
			<td colspan="5" align="center"> ���ϸ��� ��� ������ �����ϴ�.</td>
		</tr>
<%	}
%>
	  
	</table>
	  
	<table width="680" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td height="30">&nbsp;</td>
	  </tr>
	</table>
	<!-- ���ϸ��� -->
	 <!--table width="680" border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<td colspan="3"><img src="/images/user/kocca/myclass/sst_mileage_info.gif"></td>
	  </tr>
	   <tr>
		<td width="21" background="/images/user/kocca/myclass/bg_mileage_left.gif"></td>
		<td width="634"> <table width="634" height="115" border="0" cellpadding="0" cellspacing="0" bgcolor="#fefdea">
			<tr>
			  <td>&nbsp;</td>
			</tr>
		  </table></td>
		<td width="25" background="/images/user/kocca/myclass/bg_mileage_right.gif"></td>
	  </tr>
	   <tr>
		<td colspan="3"><img src="/images/user/kocca/myclass/sst_mileage_info_bottom.gif"></td>
	  </tr>
	</table>
	<!-- ���ϸ��� -->
</form>
<br><br>

<!---------- copyright start ------------------->
<%@ include file="/learn/user/kocca/include/bottom.jsp"%>
<!---------- copyright end  -------------------->