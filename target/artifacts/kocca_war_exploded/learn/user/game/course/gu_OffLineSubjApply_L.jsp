<%
//**********************************************************
//  1. ��      ��: SUBJECT LIST
//  2. ���α׷���: zu_Subject_L.jsp
//  3. ��      ��: ������ȸ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004.01.14
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    box.put("leftmenu","05");                       // �޴� ���̵� ����

    String  v_process     = box.getString("p_process");
    String  v_select      = box.getStringDefault("p_select","ON");
    String  v_gubun       = box.getStringDefault("p_gubun","1");
	String  v_grcode      = box.getStringDefault("p_grcode","G01");
	
	String v_tabnum		= box.getStringDefault("p_tabnum","1");

    String v_code       = "";
    String v_codenm     = "";

	int v_seq = 0;

    String v_subj           = "";
    String v_subjseq        = "";
    String v_subjnm         = "";

	String v_gubunNm	= "";
	String v_tname		= "";
	String v_dday		= "";
	String v_starttime	= "";
	String v_endtime	= "";
	String v_place		= "";

    ArrayList list1      = null;
    ArrayList list2      = null;

	list1 = (ArrayList)ProposeCourseBean.OffLineSelectSubjectList(box);	// ��û ������ ����
	list2 = (ArrayList)ProposeCourseBean.OffLineApplySelectSubjectList(box);	// ��û�� ����

%>
<!------- ��� �ΰ�,�޴�,�������� ���� ���� ------------>
<%@ include file="/learn/user/game/include/topApply.jsp"%>
<!------- ��� �ΰ�,�޴�,�������� ���� ��  ------------->

<SCRIPT LANGUAGE="JavaScript">
<!--
	// �������� ���� ��û
	function applyOffLine( seq)
	{
		var frm = document.form1;
		if(!confirm("�ش� ������ ������û�Ͻðڽ��ϱ�?")){
		 return;
	   }

	   frm.p_seq.value = seq;
	   frm.action = "/servlet/controller.propose.ProposeCourseServlet";
	   frm.p_process.value = "OffLineApply";
	   frm.target = "_self";
	   frm.submit();
	}

	// �������� ������û �ּ�
	function applyOffLineCancel(seq)
	{
		var frm = document.form1;
		if(!confirm("���� ��û�� ����Ͻðڽ��ϱ�?")){
		 return;
	   }

	   frm.p_seq.value = seq;
	   frm.action = "/servlet/controller.propose.ProposeCourseServlet";
	   frm.p_process.value = "OffLineCancel";
	   frm.target = "_self";  
	   frm.submit();
	}

	// �󼼺���
	function applyOffLineView(seq)
	{
		var frm = document.form1;

		frm.p_seq.value = seq;
		frm.action = "/servlet/controller.propose.ProposeCourseServlet";
		frm.p_process.value = "OffLineView";
		frm.target = "_self";
		frm.submit();
	}

//-->
</SCRIPT>

<form name="form1" method="post" enctype = "multipart/form-data">
    <input type='hidden' name='p_process' >	
    <input type='hidden' name='p_seq' >	
    <input type='hidden' name='p_userid'>
    <input type='hidden' name='p_grcode' value='G01'>

          <!-- center start -->
		  <!-- title -->
		<table width="720" border="0" cellspacing="0" cellpadding="0">
		  <tr>
			<td height="35" align="right"  background="/images/user/game/apply/<%=tem_subimgpath%>/tit_offline_apply.gif" class="location" ><img src="/images/user/game/common/location_bl.gif"> 
			  HOME > ������û > �������ΰ��� ��û/Ȯ��</td>
		  </tr>
		  <tr> 
			<td height="20"></td>
		  </tr>
		</table>
		<table width="720" border="0" cellspacing="0" cellpadding="0">
		  <tr>
			<td><img src="/images/user/game/apply/st_offline_apply.gif"></td>
		  </tr>
		  <tr>
			<td height="10">&nbsp;</td>
		  </tr>
		</table>
		<!-- ��û�� �������ΰ��� -->
		<table width="720" border="2" cellspacing="0" cellpadding="3" style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
		  <tr  class="lcolor"> 
			<td height="3" colspan="8" class="linecolor_app"></td>
		  </tr>
		  <tr> 
			<td width="16" class="tbl_gtit2">No</td>
			<td width="51" class="tbl_gtit2">����</td>
			<td width="163" class="tbl_gtit">���Ǹ�</td>
			<td width="61" class="tbl_gtit2">��米��</td>
			<td width="81"  class="tbl_gtit">�Ͻ�</td>
			<td width="70"  class="tbl_gtit">�ð�</td>
			<td width="144"  class="tbl_gtit">���</td>
			<td width="66"  class="tbl_gtit">����</td>
		  </tr>
		  <tr> 
			<td height="5" colspan="8" ></td>
		  </tr>
		  <%
	int i = 0;
	String v_status	= "";
	String v_statusString = "";
	for(i = 0; i < list2.size(); i++) 
	{
		DataBox dbox2 = (DataBox)list2.get(i);

		v_gubunNm	= dbox2.getString("d_gubunnm");
		v_subjnm	= dbox2.getString("d_subjnm");
		v_tname		= dbox2.getString("d_tname");
		v_dday		= dbox2.getString("d_dday");
		v_starttime	= dbox2.getString("d_starttime");
		v_endtime	= dbox2.getString("d_endtime");
		v_subjnm	= dbox2.getString("d_subjnm");
		v_place		= dbox2.getString("d_place");
		v_seq		= dbox2.getInt("d_seq");
		v_status	= dbox2.getString("d_status");

		//��¥ ó��
		if(v_dday.equals("")){v_dday = "����";}
		else{v_dday     = FormatDate.getFormatDate(v_dday,"yyyy/MM/dd");}



%>
		  <tr> 
			<td class="tbl_grc"><%= String.valueOf(i+1) %></td>
			<td class="tbl_grc"><%= v_gubunNm %></td>
			<td class="tbl_bleft"><a href="javascript:applyOffLineView('<%=v_seq%>')"><%= v_subjnm %></a></td>
			<td class="tbl_grc"><%= v_tname %></td></td>
			<td class="tbl_grc"><%= v_dday %><br></td>
			<td class="tbl_grc"><%= v_starttime %> ~ <%= v_endtime %> </td>
			<td class="tbl_grc"><%= v_place %></td>
			<td class="tbl_grc"><%
			if(v_status.equals("W"))
			{
				%>
					<img src="/images/user/game/button/b_apply_cancel.gif" style="cursor:hand" onClick="applyOffLineCancel('<%=v_seq%>')">
				<%
			}
			else
			{
				%>�� ��	<%
			}
				%>
				</td>
		  </tr>
<% } 
		if(i == 0)
		{%>
			<tr>
				<td colspan="8" class="tbl_grc">���� ��û �Ͻ� ���°� �����ϴ�.</td>
			</tr>
<%		} %>
		</table>
		<table width="720" border="0" cellspacing="0" cellpadding="0">
		  <tr>
			<td height="20">&nbsp;</td>
		  </tr>
		</table>
		<!-- ��û������ �������ΰ��� -->
		<table width="720" border="0" cellspacing="0" cellpadding="0">
		  <tr> 
			<td><img src="/images/user/game/apply/st_offline_apply2.gif"></td>
		  </tr>
		  <tr> 
			<td height="10">&nbsp;</td>
		  </tr>
		</table>
		<table width="720" border="2" cellspacing="0" cellpadding="3"style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
		  <tr  class="lcolor"> 
			<td height="3" colspan="8" class="linecolor_app"></td>
		  </tr>
		  <tr> 
			<td width="16" class="tbl_gtit2">No</td>
			<td width="51" class="tbl_gtit2">����</td>
			<td width="163" class="tbl_gtit">���Ǹ�</td>
			<td width="61" class="tbl_gtit2">��米��</td>
			<td width="81"  class="tbl_gtit">�Ͻ�</td>
			<td width="70"  class="tbl_gtit">�ð�</td>
			<td width="144"  class="tbl_gtit">���</td>
			<td width="66"  class="tbl_gtit">����</td>
		  </tr>
		  <tr> 
			<td height="5" colspan="8" ></td>
		  </tr>

<%
	i = 0;
	for(i = 0; i < list1.size(); i++) 
	{
		  DataBox dbox = (DataBox)list1.get(i);

		  v_gubunNm		= dbox.getString("d_gubunnm");
		  v_subjnm		= dbox.getString("d_subjnm");
		  v_tname		= dbox.getString("d_tname");
		  v_dday		= dbox.getString("d_dday");
		  v_starttime	= dbox.getString("d_starttime");
		  v_endtime		= dbox.getString("d_endtime");
		  v_subjnm		= dbox.getString("d_subjnm");
		  v_place		= dbox.getString("d_place");
		  v_seq			= dbox.getInt("d_seq");

		  //��¥ ó��
		if(v_dday.equals("")){v_dday = "����";}
		else{v_dday     = FormatDate.getFormatDate(v_dday,"yyyy/MM/dd");}

%>
		  <tr> 
			<td class="tbl_grc"><%= String.valueOf(i+1) %></td>
			<td class="tbl_grc"><%= v_gubunNm %></td>
			<td class="tbl_bleft"><a href="javascript:applyOffLineView('<%=v_seq%>')"><%= v_subjnm %></a></td>
			<td class="tbl_grc"><%= v_tname %></td>
			<td class="tbl_grc"><%= v_dday %><br></td>
			<td class="tbl_grc"><%= v_starttime %> ~ <%= v_endtime %> </td>
			<td class="tbl_grc"><%= v_place %></td>
			<td class="tbl_grc"><img src="/images/user/game/button/b_apply.gif" style="cursor:hand" onClick="applyOffLine('<%=v_seq%>')"></td>
		  </tr>
<% } 
		if(i == 0)
		{%>
			<tr>
				<td colspan="8" class="tbl_grc">���� ��û �Ͻ� �� �ִ� ���°� �����ϴ�.</td>
			</tr>
<%		} %>
		</table>
		</form> 
		<br>
		<br>


<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->