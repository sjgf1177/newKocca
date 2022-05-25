
<%
//**********************************************************
//  1. ��      ��: �������� ����Ʈ ��ȸȭ��
//  2. ���α׷���: za_Grseq_L.jsp
//  3. ��      ��: �������� ����Ʈ ��ȸȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 11. 11
//  7. ��      ��:
//**********************************************************
%>
<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page errorPage="/learn/library/error.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.credu.system.*"%>
<%@ page import="com.credu.library.*"%>
<%@ page import="com.credu.course.*"%>
<%@ page import="com.credu.common.*"%>

<%@ taglib uri="/tags/KoccaTaglib" prefix="kocca"%>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select"%>

<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }
    

    String v_grcode = box.getString("p_grcode");               //�����׷�
    String v_gyear = box.getString("p_gyear");                //�⵵
    String v_type = box.getString("p_type");                //�⵵

    int failCnt = 0;
    String msg = "";
    DataBox dbox = null;
    ArrayList list = (ArrayList)request.getAttribute("list");
	for(int i=0; i<list.size(); i++){
		dbox = (DataBox)list.get(i);
		msg = dbox.getString("d_msg");
		if(!"SUCCESS".equals(msg)){
			failCnt++;
		}
	}  
%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<style>
th {
	font-size: 12px;
}
</style>
<script type="text/javascript" src="/script/jquery-1.3.2.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
	});
	
	// �������
	function fnGrseqList(){
		$('#p_process').val('listPage');
		$('#form1').attr({
			action : '/servlet/controller.course.GrseqServlet',
			target : '_self'
		}).submit();
	}
	
	// ����������(�������ε�)
	function fnList(){
		$('#p_process').val('excelUpload');
		$('#form1').attr({
			action : '/servlet/controller.course.GrseqServlet',
			target : '_self'
		}).submit();
	}
	

</script>
</head>
<body bgcolor="#ffffff" text="#000000" topmargin="0" leftmargin="0">
	<form id="form1" name="form1" method="post" enctype="multipart/form-data">
		<input type="hidden" id="p_process" name="p_process" /> 
		<input type="hidden" id="p_type" name="p_type" /> 

		<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
			<tr>
				<td align="center" valign="top">
					<!-- title ���� //-->
					<table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
						<tr>
							<td><img src="/images/admin/course/c_title02.gif" alt="asdf"></td>
							<td align="right"><img src="/images/admin/common/sub_title_tail.gif"></td>
						</tr>
					</table> 
					<!-- title �� //-->
					<br /> 
					
					<%if(failCnt > 0){%>
						<font color="red">ERROR�Ǽ��� 1�� �̻� �߻��ϸ� �ϰ�ó���� �ڵ���ҵ˴ϴ�.</font>
					<%}%>
					<table width="970" class="table_out" cellspacing="1" cellpadding="0">
		                <tr>
		                    <td colspan="14" class="table_top_line"></td>
		                </tr>
		                <tr>
							<td colspan="7" align="center" height="23px;"><b>ERROR : <%=failCnt%>��</b></td>
						</tr>
		                <tr height="25">
		                    <td width="8%" class="table_title"><b>�ٹ�ȣ</b></td>
		                    <td width="10%" class="table_title"><b>�����ڵ�</b></td>
		                    <td width="10%" class="table_title"><b>����������</b></td>
		                    <td width="10%" class="table_title"><b>����������</b></td>
		                    <td width="10%" class="table_title"><b>�н�������</b></td>
		                    <td width="10%" class="table_title"><b>�н�������</b></td>
		                    <td width="*" class="table_title"><b>MESSAGE</b></td>
						</tr>
						<%if(failCnt > 0){%>
							<%
							for(int i=0; i<list.size(); i++){
								dbox = (DataBox)list.get(i);
								msg = dbox.getString("d_msg");
								if(!"SUCCESS".equals(msg)){
							%>
									<tr>
										<td class="table_02_1"><%=dbox.getString("d_line")%></td>
										<td class="table_02_1"><%=dbox.getString("d_subj")%></td>
										<td class="table_02_1"><%=dbox.getString("d_propstart")%></td>
										<td class="table_02_1"><%=dbox.getString("d_propend")%></td>
										<td class="table_02_1"><%=dbox.getString("d_edustart")%></td>
										<td class="table_02_1"><%=dbox.getString("d_eduend")%></td>
										<td class="table_02_2">
											<%if("ERROR01".equals(msg)){ out.println("�����ڵ尡 �ùٸ��� �ʽ��ϴ�."); }%>
											<%if("ERROR02".equals(msg)){ out.println("������û��¥�� �ùٸ��� �ʽ��ϴ�."); }%>
											<%if("ERROR03".equals(msg)){ out.println("������û �������� �����Ϻ��� ŭ�ϴ�."); }%>
											<%if("ERROR04".equals(msg)){ out.println("�н���¥�� �ùٸ��� �ʽ��ϴ�."); }%>
											<%if("ERROR05".equals(msg)){ out.println("�н� �������� �����Ϻ��� ŭ�ϴ�."); }%>
										</td>
									</tr>
							<%
								}
							}
							%>
						<%}else{%>
							<tr>
								<td class="table_02_1" colspan="7">�˻��� ERROR�� �����ϴ�.</td>
							</tr>
						<%}%>
					</table>
					<br/>
					<br/>
					<table width="970" class="table_out" cellspacing="1" cellpadding="0">
		                <tr>
		                    <td colspan="14" class="table_top_line"></td>
		                </tr>
		                <tr>
							<td colspan="7" align="center" height="23px;"><b>�����Է�</b></td>
						</tr>
		                <tr height="25">
		                    <td width="8%" class="table_title"><b>�ٹ�ȣ</b></td>
		                    <td width="10%" class="table_title"><b>�����ڵ�</b></td>
		                    <td width="10%" class="table_title"><b>����������</b></td>
		                    <td width="10%" class="table_title"><b>����������</b></td>
		                    <td width="10%" class="table_title"><b>�н�������</b></td>
		                    <td width="10%" class="table_title"><b>�н�������</b></td>
		                    <td width="*" class="table_title"><b>MESSAGE</b></td>
						</tr>
							<%
							for(int i=0; i<list.size(); i++){
								dbox = (DataBox)list.get(i);
								if("SUCCESS".equals(dbox.getString("d_msg"))){
							%>
									<tr>
										<td class="table_02_1"><%=dbox.getString("d_line")%></td>
										<td class="table_02_1"><%=dbox.getString("d_subj")%></td>
										<td class="table_02_1"><%=dbox.getString("d_propstart")%></td>
										<td class="table_02_1"><%=dbox.getString("d_propend")%></td>
										<td class="table_02_1"><%=dbox.getString("d_edustart")%></td>
										<td class="table_02_1"><%=dbox.getString("d_eduend")%></td>
										<td class="table_02_2">�����Է�</td>
									</tr>
							<%
								}
							}
							%>
					</table>
					
					<table width="970" cellspacing="1" cellpadding="0">
						<tr>
							<td height="5"></td>
						</tr>
						<tr>
					        <td align="right" colspan="2">
					        	<%if(v_type.equals("Ins")){%>
						        	<%if(failCnt > 0){%>
							        	<a href="#none" onclick="fnList();"><img src="/images/admin/button/btn_list.gif" border="0"></a>
						        	<%}else{%>
							        	<a href="#none" onclick="fnGrseqList();"><img src="/images/admin/button/btn_list.gif" border="0"></a>
						        	<%}%>
					        	<%}else{%>
						        	<a href="#none" onclick="fnList();"><img src="/images/admin/button/btn_list.gif" border="0"></a>
					        	<%}%>
					        </td>
					    </tr>
					</table>
					<br/>
					
				</td>
			</tr>
		</table>
	</form>
	<%@ include file="/learn/library/getJspName.jsp"%>
</body>
</html>
