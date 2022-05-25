<%
//**********************************************************
//  1. ��	  ��: �������� ���� �ϰ����� ȭ��
//  2. ���α׷���: za_Grseq_Assign_U.jsp
//  3. ��	  ��: �������� ���� �ϰ����� ȭ��
//  4. ȯ	  ��: JDK 1.4
//  5. ��	  ��: 1.0
//  6. ��	  ��: ���� 2004. 11. 11
//  7. ��	  ��:
//**********************************************************
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
	String v_grcode = box.getString("p_grcode");
	String v_gyear = box.getString("p_gyear");
	String v_grseq = box.getString("p_grseq");
	box.put("s_grcode", v_grcode);
	box.put("s_gyear", v_gyear);
	box.put("s_grseq", v_grseq);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<link rel="stylesheet" type="text/css" href="/css/ui-lightness/ui.all.css" />
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language="JavaScript">

function updateScore(){
	var f = document.form1;
	var gradscore = f.p_gradscore.value; // ��������
	
	var gradstep = f.p_gradstep.value;	//������
	var gradexam = f.p_gradexam.value;  //�߰���
	var gradftest = f.p_gradftest.value;  // ������
	var gradhtest = f.p_gradhtest.value;	// ������
	var gradreport = f.p_gradreport.value;	//����Ʈ
	var gradetc1 = f.p_gradetc1.value;	//������

	var wstep = f.p_wstep.value;	//������(%)
	var wmtest = f.p_wmtest.value;  //�߰���(%)
	var wftest = f.p_wftest.value;  // ������(%)
	var whtest = f.p_whtest.value;	// ������(%)
	var wreport = f.p_wreport.value;	//����Ʈ(%)
	var wetc1 = f.p_wetc1.value;	//������(%)

	num_che_0_100('��������', gradscore);
	num_che_0_100('������', gradstep);
	num_che_0_100('�߰���', gradexam);
	num_che_0_100('������', gradftest);
	num_che_0_100('������', gradhtest);
	num_che_0_100('����Ʈ', gradreport);
	num_che_0_100('������', gradetc1);
	num_che_0_100('������ ����ġ', wstep);
	num_che_0_100('�߰��� ����ġ', wmtest);
	num_che_0_100('������ ����ġ', wftest);
	num_che_0_100('������ ����ġ', whtest);
	num_che_0_100('����Ʈ ����ġ', wreport);
	num_che_0_100('������ ����ġ', wetc1);

	var wtot = parseFloat(f.p_wstep.value,10) + parseFloat(f.p_wmtest.value,10) + parseFloat(f.p_wftest.value,10) + parseFloat(f.p_whtest.value,10)+ parseFloat(f.p_wreport.value,10) + parseFloat(f.p_wetc1.value,10);
	if(wtot != 100){ alert("����ġ�� ���� 100�̿��� �մϴ�."); return;}

	f.action='/servlet/controller.course.GrseqServlet';
	f.p_process.value = 'updateSubjScore';
	f.target = "_self";
	f.submit();
}

function num_che_0_100(pname,num){
	var msg = "OK";
	if(num == ''){		msg = pname+"�� �Է��� �ּ���."; alert(msg); return;}
	if(num > 100){		msg = pname+" 100���� Ů�ϴ�."; alert(msg); return;}
	else if(num < 0){		msg = pname+" 0���� �۽��ϴ�."; alert(msg); return;}
}

</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<form name = "form1" method = "post" action="/servlet/controller.course.GrseqServlet">
	<input type="hidden" name="p_process"   value="updateSubjScore">
	<input type="hidden" name="s_grcode"	value="<%=v_grcode%>">
	<input type="hidden" name="p_grcode"	value="<%=v_grcode%>">
	<input type="hidden" name="p_gyear"	 value="<%=v_gyear%>">
	<input type="hidden" name="p_grseq"	 value="<%=v_grseq%>">


<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td align="center" valign="top">
	  <!----------------- title ���� ----------------->
	  <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
		<tr>
		  <td><img src="/images/admin/course/c_title02.gif" ></td>
		  <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
		</tr>
	  </table>
	  <!----------------- title �� ----------------->
		<br>
		<br>

		<!----------------- �����׷�, (��з�, �ߺз�, �Һз�, ����) �˻� ----------------->
		<table class="table_out" cellspacing="1" cellpadding="5">
			<tr>
				<td colspan="2" class="table_top_line"></td>
			</tr>
			<tr>
				<td width="16%" height="25" class="table_title"><b>�����׷�</b></td>
				<td class="table_02_1" width="81%"> <b><%=GetCodenm.get_grcodenm(v_grcode)%></b></td>
			</tr>
			<tr>
				<td class="table_title" height="25"><b>��������</b></td>
				<td class="table_02_1"> <b><%=GetCodenm.get_grseqnm(v_grcode, v_gyear, v_grseq)%> (<%=v_gyear%>�� <%=v_grseq%>��)</b></td>
			</tr>
		</table>
		<br/>
		<table class="table_out" cellspacing="1" cellpadding="5" width="95%">
			<tr>
				<td colspan="4" class="table_top_line"></td>
			</tr>
			<tr>
				<td colspan="4" class="table_02_2">
					�� �ʱ⿡ ����� ������ �ش� ���� ������ ������� ������ ���Դϴ�.<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;�����ϰ��� �ϴ� ���� �Է� �� �����ư�� Ŭ�� �� �ش� ���������� ���� ��� ������ �����˴ϴ�.<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;����� ������ Ȯ�� �ϰ��� �Ͻ� ��� �������� ����Ʈ���� �ش� ���� �󼼺��⸦ ���Ͽ� Ȯ���Ͻ� �� �ֽ��ϴ�.<br/><br/>
					
					�� ����ġ�� �� ���� 100% �̿��� �մϴ�.<br/>
					�� �� ������ 0~100 ���� ���̿��� �մϴ�.<br/>
				</td>
			</tr>
			<tr>
				<td width="16%" height="25" class="table_title"><b>��������</b></td>
				<td colspan="3" class="table_02_2"> <input type="text" name="p_gradscore" size="4" value="60" /> ��</td>
			</tr>
			<tr>
				<td width="16%" class="table_title"><b>������</b></td>
				<td class="table_02_2"> <input type="text" name="p_gradstep" size="4"  value="60" /> �� �̻�</td>
				<td width="16%" class="table_title"><b>������ ����ġ</b></td>
				<td class="table_02_2"> <input type="text" name="p_wstep" size="4"  value="100" /> %</td>
			</tr>
			<tr>
				<td width="16%" class="table_title"><b>�߰���</b></td>
				<td class="table_02_2"> <input type="text" name="p_gradexam" size="4"  value="0" /> �� �̻�</td>
				<td width="16%" class="table_title"><b>�߰��� ����ġ</b></td>
				<td class="table_02_2"> <input type="text" name="p_wmtest" size="4"  value="0" /> %</td>
			</tr>
			<tr>
				<td width="16%" class="table_title"><b>������</b></td>
				<td class="table_02_2"> <input type="text" name="p_gradftest" size="4"  value="0" /> �� �̻�</td>
				<td width="16%" class="table_title"><b>������ ����ġ</b></td>
				<td class="table_02_2"> <input type="text" name="p_wftest" size="4"  value="0" /> %</td>
			</tr>
			<tr>
				<td width="16%" class="table_title"><b>������</b></td>
				<td class="table_02_2"> <input type="text" name="p_gradhtest" size="4"  value="0" /> �� �̻�</td>
				<td width="16%" class="table_title"><b>������ ����ġ</b></td>
				<td class="table_02_2"> <input type="text" name="p_whtest" size="4"  value="0" /> %</td>
			</tr>
			<tr>
				<td width="16%" class="table_title"><b>����Ʈ</b></td>
				<td class="table_02_2"> <input type="text" name="p_gradreport" size="4"  value="0" /> �� �̻�</td>
				<td width="16%" class="table_title"><b>����Ʈ ����ġ</b></td>
				<td class="table_02_2"> <input type="text" name="p_wreport" size="4"  value="0" /> %</td>
			</tr>
			<tr>
				<td width="16%" class="table_title"><b>������</b></td>
				<td class="table_02_2"> <input type="text" name="p_gradetc1" size="4"  value="0" /> �� �̻�</td>
				<td width="16%" class="table_title"><b>������ ����ġ</b></td>
				<td class="table_02_2"> <input type="text" name="p_wetc1" size="4"  value="0" /> %</td>
			</tr>
		</table>

		<br>
		<!----------------- ����, ��� ��ư ���� ----------------->
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td align="center">
					<a href="javascript:updateScore();"><img src="/images/admin/button/btn_save.gif" border="0"></a>
					<a href="javascript:window.close()"><img src="/images/admin/button/btn_close.gif" border="0"></a>
				</td>
			</tr>
		</table>
		<!----------------- ����, ��� ��ư �� ----------------->

		<br>
	  </td>
  </tr>
</table>

</form>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>








