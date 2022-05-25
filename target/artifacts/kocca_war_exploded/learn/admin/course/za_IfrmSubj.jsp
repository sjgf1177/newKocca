<%
//**********************************************************
//  1. ��      ��: 
//  2. ���α׷���: 
//  3. ��      ��: 
//  4. ȯ      ��: 
//  5. ��      ��: 
//  6. ��      ��: 
//  7. ��      ��: 
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %> 
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    //DEFINED in relation to select START
	String v_formname = box.getString("p_formname");
    String  ss_grcode		= box.getStringDefault("s_grcode", "G01");			//�����׷�
    String  ss_gyear		= box.getString("s_gyear");				//�⵵
    String  ss_upperclass	= box.getString("s_upperclass");		//������з�
    String  ss_middleclass	= box.getString("s_middleclass");		//�����ߺз�
    String  ss_lowerclass	= box.getString("s_lowerclass");		//�����Һз�
    String  ss_subjcourse	= box.getString("s_subjcourse");		//����&�ڽ�
    String  ss_subjseq		= box.getString("s_subjseq");			//���� ����
    String  ss_action		= box.getString("s_action");		
    String  ss_subjgubun    = box.getString("s_subjgubun");
    //DEFINED in relation to select END
   	
	
    String  v_process = box.getString("p_process");
    int  v_pageno         = box.getInt("p_pageno");
    if (v_pageno == 0) {
        v_pageno = 1;
    }
    
	String v_grcode = box.getStringDefault("p_grcode","G01"); 

%>

<html>
    <head>
    <meta http-equiv = "Content-Type" content = "text/html; charset = euc-kr">
	<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
	<script language = "javascript" src = "/script/cresys_lib.js"></script>
	<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
	<script language="JavaScript">
	function whenSelection2() 
	{
		var i =document.form1.s_subjcourse.selectedIndex // �����׸��� �ε��� ��ȣ

		parent.form1.p_subj.value = document.form1.s_subjcourse.value;
		parent.form1.p_subjseq.value = document.form1.s_subjseq.value;
		parent.form1.p_subjnm.value = document.form1.s_subjcourse.options[i].text ;

		document.form1.submit();
	}
	// ����Ʈ ������ �˻�
	function whenSelection(ss_action) 
	{
		if (ss_action=="go")    
		{
			//�����׷�����ڴ� �����׷��� �����ؾ���
			  if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '----' || document.form1.s_grcode.value == '' ) {
					alert("�����׷��� �����ϼ���.");
					return ;
				}

		}
			
		document.form1.s_action.value = ss_action;
		document.form1.p_process.value = 'ifrme';
		document.form1.action = '/servlet/controller.course.OffLineSubjectServlet?p_process=ifrme&p_formname=form1';
		document.form1.submit();

	}
	</script>

	</HEAD>

<BODY leftmargin="0" bgcolor="#FFFFFF" topmargin="0">
	<form name="form1" method="post">
		<input type="hidden" name="p_process"	value="<%=v_process%>">	
		<input type="hidden" name="p_grcode"    value="<%=v_grcode%>">
		<input type="hidden" name="s_action"	value="<%=ss_action%>">
		<input type="hidden" name="p_subjnm"	value="">
		<input type="hidden" name="p_subj"		value="">
		<input type="hidden" name="p_seq">          
	<table class="table_out" cellspacing="1" cellpadding="5">
		<tr>
		  <td width="100%" align="left" valign="middle" class="table_02_2" >
			<!------------------- ���ǰ˻� ���� ------------------------->
			<font color="red">��</font><%= SelectEduBean.getGrcode(box, true, false)%> <!-- �����׷�  -->
		  
			<font color="red">��</font> <%= SelectEduBean.getGyear(box, true)%><!-- getGyear(RequestBox, isChange)   �����⵵  -->
			<font color="red">��</font> <%= SelectEduBean.getGrseq(box, true, true)%><!-- getGrseq(RequestBox, isChange, isALL)   ��������  -->
		  </td>
		</tr>
		<tr>
			<td class="table_02_2">
				<!-- input type= "hidden" name="s_grseq" value="0001"-->
				<%= SelectSubjBean.getUpperClass(box, true, true, true)%><!-- getUpperclass(RequestBox, isChange, isALL, isStatisticalPage)    ������з�  -->
				<%= SelectSubjBean.getMiddleClass(box, true, true, true)%><!-- getMiddleclass(RequestBox, isChange, isALL, isStatisticalPage)    �����ߺз�  -->
				<%= SelectSubjBean.getLowerClass(box, true, true, true)%><!-- getLowerclass(RequestBox, isChange, isALL, isStatisticalPage)    �����Һз�  -->
			</td>
		</tr>
		<tr>
		  <td align="left" width="100%" class="table_02_2">
			<%@ include file="za_search_OffLineSubjnm.jsp"%>
			<%= SelectSubjBean.getSubj(box, true, true)%><!-- getSubj(RequestBox, isChange, isALL)    ����  -->
			<%= SelectSubjBean.getSubjseq(box, false, true)%><!-- getSubjseq(RequestBox, isChange, isALL)    ��������  -->
			
			<!-------------------- ���ǰ˻� �� ---------------------------->

			<input type = "hidden" name="s_start">
			<input type = "hidden" name="s_end">
			<input type="hidden" name="p_step"  value="2">
			<img src="/images/admin/button/btn_checkok.gif" onClick="whenSelection2()" style="cursor:hand";>
		  </td>
		</tr>
	</table>
	</form>
</BODY>
</HTML>
