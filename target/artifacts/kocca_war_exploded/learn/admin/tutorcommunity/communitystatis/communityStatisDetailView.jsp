<%
//**********************************************************
//  1. ��      ��: Ʃ�͸�Ŀ�´�Ƽ Ŀ�´�Ƽ ���
//  2. ���α׷��� : communityStatisList.jsp
//  3. ��      ��: Ŀ�´�Ƽ ���
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2013.07.17
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
	RequestBox box = null;
	box = (RequestBox)request.getAttribute("requestbox");
	DataBox dbox = (DataBox)request.getAttribute("SelectView");
	ArrayList alist = (ArrayList)request.getAttribute("AnswerList");
	ArrayList clist = (ArrayList)request.getAttribute("CommentList");
	
	String	v_process	= box.getStringDefault("p_process","detailView");
	String	v_pageno	= box.getStringDefault("p_pageno","0");
	String	v_pagesize	= box.getStringDefault("p_pagesize","0");
	String	v_tgubun	= box.getStringDefault("s_tgubun", "ALL");
	String	v_area		= box.getStringDefault("s_area", "ALL");
	String	v_sdate		= box.getStringDefault("s_sdate",FormatDate.getDate("yyyyMMdd"));
	String	v_edate		= box.getStringDefault("s_edate",FormatDate.getDate("yyyyMMdd"));
	
	String	v_tabseq	= dbox.getString("d_tabseq");
	String	v_seq		= dbox.getString("d_seq");
	String	v_types		= dbox.getString("d_types");
	String	v_subj		= dbox.getString("d_subj");
	String	v_subjseq	= dbox.getString("d_subjseq");
	String	v_year		= dbox.getString("d_year");
	String	v_lesson	= dbox.getString("d_lesson");
	
	String	v_gubun = dbox.getString("d_tgubun");
	String	v_indate = FormatDate.getFormatDate(dbox.getString("d_indate"), "yyyy-MM-dd");
	String	v_inuserid = dbox.getString("d_inuserid");
	String	v_name = dbox.getString("d_name");
	String	v_cnt = dbox.getString("d_cnt");
	String	v_title = dbox.getString("d_title");
	String	v_contents = dbox.getString("d_contents");
	
	String	v_gubunnm = "";
	if(v_gubun.equals("T")){v_gubunnm = "���";}
	else if(v_gubun.equals("Q")){v_gubunnm = "����";}
	else if(v_gubun.equals("C")){v_gubunnm = "�Ϲ�";}
	else if(v_gubun.equals("D")){v_gubunnm = "�ڷ�";}
	else if(v_gubun.equals("I")){v_gubunnm = "����";}
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<link rel="stylesheet" type="text/css" href="/css/ui-lightness/ui.all.css" />
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/ui.core.js"></script>
<script type="text/javascript" src="/script/effects.core.js"></script>
<script type="text/javascript" src="/script/effects.blind.js"></script>
<script type="text/javascript" src="/script/effects.drop.js"></script>
<script type="text/javascript" src="/script/effects.explode.js"></script>
<script type="text/javascript" src="/script/ui.datepicker.js"></script>
<script language = "javascript" src = "/script/cresys_lib.js"></script>

<SCRIPT LANGUAGE="JavaScript">
function list_tutorcommunity(){
	document.form1.p_process.value = "listPage";
	document.form1.submit();
}
function delete_tutorcommunity(){
	if (confirm("�����Ͻðڽ��ϱ�?")) {
		document.form1.p_process.value = "delete";
		document.form1.submit();
	}else{
		return;
	}
}
function answer_tutorcommunity(){
	document.form1.p_process.value = "answerPage";
	document.form1.submit();
}
</script>

</head>

<body id="tutor" bgcolor="#FFFFFF" text="#000000">
<form name="form1" action="/servlet/controller.tutorcommunity.TutorCommunityStatisServlet">
	<input type = "hidden" name = "p_process"	value = "<%=v_process %>"/>
    <input type = "hidden" name = "p_pageno"	value = "<%=v_pageno %>"/>
    <input type = "hidden" name = "p_pagesize"	value = "<%=v_pagesize %>"/>
    <input type = "hidden" name = "s_tgubun"	value = "<%=v_tgubun %>"/>
    <input type = "hidden" name = "s_area"		value = "<%=v_area %>"/>
    <input type = "hidden" name = "s_sdate"		value = "<%=v_sdate %>"/>
    <input type = "hidden" name = "s_edate"		value = "<%=v_edate %>"/>
    
    <input type = "hidden" name = "p_tabseq"	value = "<%=v_tabseq %>"/>
    <input type = "hidden" name = "p_seq"		value = "<%=v_seq %>"/>
    <input type = "hidden" name = "p_types"		value = "<%=v_types %>"/>
    <input type = "hidden" name = "p_subj"		value = "<%=v_subj %>"/>
    <input type = "hidden" name = "p_subjseq"	value = "<%=v_subjseq %>"/>
    <input type = "hidden" name = "p_year"		value = "<%=v_year %>"/>
    <input type = "hidden" name = "p_lesson"	value = "<%=v_lesson %>"/>
    
</form>
<table width="100%" border="0" cellspacing="0" cellpadding="0" >
	<tr>
		<td align="center" valign="top">
		<!----------------- title ���� ----------------->
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class=page_title>
				<tr> 
					<td align="left"><img src="/images/admin/tutorcommunity/lms_title_commstat.gif"></td>
				</tr>
			</table>
		<!----------------- title �� ----------------->
		</td>
	</tr>
	
	<tr>
		<td>
			<table class="table_out" cellspacing="1" cellpadding="5">
				<tr>
					<td colspan="6" class="table_top_line_1"></td>
				</tr>
				<tr>
					<td class="table_title" width="12%">����</td>
					<td class="table_02_2" width="38%"><%=v_gubunnm %></td>
					<td class="table_title" width="12%">�ۼ���</td>
					<td class="table_02_2" width="38%"><%=v_indate  %></td>
				</tr>
				<tr class="table_02_2">
					<td class="table_title">�ۼ���</td>
					<td class="table_02_2"><%=v_name %>(<%=v_inuserid %>)</td>
					<td class="table_title">��ȸ��</td>
					<td class="table_02_2"><%=v_cnt %></td>
				</tr>
				<tr>
					<td class="table_title">����</td>
					<td class="table_02_2" colspan="3"><%=v_title %></td>
				</tr>
				<tr>
					<td class="table_title">����</td>
					<td class="table_02_2" colspan="3"><%=v_contents %></td>
				</tr>
				<!---------����÷�ο��� ------------>
				<%
					Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
					Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
				%>
				<tr>
					<td class = "table_title">÷������</td>
					<td class = "table_02_2" colspan="3">
					<%@ include file="/learn/admin/include/za_MultiAttach_R.jsp" %> 
					</td>
 				</tr>
				<!---------����÷�ο��� �� ------------>
			</table>
		</td>
	</tr>
</table>
<br>

<!----------------- ����, ����, ����Ʈ ��ư ���� ----------------->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr> 
		<td align="center">
			<a href="javascript:delete_tutorcommunity()"><img src="/images/admin/button/btn_del.gif" border="0"></a>&nbsp;
			<%if(v_gubun.equals("Q") || v_gubun.equals("C")){ %><a href="javascript:answer_tutorcommunity()"><img src="/images/admin/button/btn_answer.gif" border="0"></a>&nbsp;<%} %>
			<a href="javascript:list_tutorcommunity()"><img src="/images/admin/button/btn_list.gif" border="0"></a>&nbsp;
		</td>
	</tr>
</table>
<!----------------- ����, ����, ����Ʈ ��ư �� ----------------->


<!----------------- �亯 ����Ʈ ���� ----------------->
<%
if(alist.size() > 0 ){
%>
<br/>
<table class="table_out" cellspacing="1" cellpadding="5" width="100%">
	<tr>
		<td colspan="2" class="table_top_line_1"></td>
	</tr>
	<%
	for(int i = 0; i < alist.size(); i++) {
		DataBox abox = (DataBox)alist.get(i);
		
		String		a_title		= abox.getString("d_title");
		String		a_contents	= abox.getString("d_contents");
		String		a_name		= abox.getString("d_name");
	%>
	<tr>
		<td width="12%" class="table_title">�亯 <br/>(<%=a_name %>)</td>
		<td class="table_02_2" >
			<strong><%=a_title%></strong><br/><br/>
			<%=a_contents %><br/><br/>
			<!---------����÷�ο��� ------------>
			<%
				Vector a_realfileVector    = (Vector)abox.getObject("d_realfile");        // ���� ���ϸ�
				Vector a_savefileVector    = (Vector)abox.getObject("d_savefile");        // ���� ���ϸ�
			%>
				<%{ int a_fileCnt = a_realfileVector != null ? a_realfileVector.size() : 0 ; %>
					<%      
					if( a_realfileVector != null ) { 
						for(int i_i = 0; i_i < a_realfileVector.size(); i_i++) {
							String a_realfile = (String)a_realfileVector.elementAt(i_i);
							String a_savefile = (String)a_savefileVector.elementAt(i_i);      

							if(a_realfile != null && !a_realfile.equals("")) {
					%>
							<a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= a_savefile%>&p_realfile=<%= a_realfile%>'><%= a_realfile%></a><br>
							<input type = "hidden" name = "p_savefile"  value = <%=a_savefile%>>
            		<%
							}   
						}
					}
            		%>
					<input type = "hidden" name="p_upfilecnt"  value = "<%=a_fileCnt%>">
					<%
					}
				%> 
			<!---------����÷�ο��� �� ------------>
		</td>
	</tr>
	<%} %>
</table>
<%} %>
<!----------------- �亯 ����Ʈ �� ----------------->


<!----------------- ��� ����Ʈ ���� ---------------------->
<%
if(clist.size() > 0 ){
	for(int i = 0; i < clist.size(); i++) {
		DataBox cbox = (DataBox)clist.get(i);
		
		String		c_commentqna	= cbox.getString("d_commentqna");
		String		c_userid		= cbox.getString("d_inuserid");
%>
<br/>
<table width="100%" border="0" cellspacing="0" cellpadding="0" >
	<tr>
		<td align="center" valign="top">
		<!----------------- title ���� ----------------->
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr> 
					<td align="left">���</td>
				</tr>
			</table>
		<!----------------- title �� ----------------->
		</td>
	</tr>
	
	<tr>
		<td>
			<table class="table_out" cellspacing="1" cellpadding="5">
				<tr>
					<td colspan="2" class="table_top_line_1"></td>
				</tr>
				<tr>
					<td class="table_title"><%=i %></td>
					<td class="table_02_2"><%=c_commentqna %></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<%}} %>

<!----------------- ��� ����Ʈ �� ---------------------->



<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>