<%
//**********************************************************
//  1. ��      ��: �������� �԰��ο� �����ٿ�ε�
//  2. ���α׷���: za_cpstudentExcel.jsp
//  3. ��      ��: �������� �԰��ο� �����ٿ�ε�
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ��â�� 2004.12.29
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=MS949" %>
<%//@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.cp.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>

<%
RequestBox box = (RequestBox)request.getAttribute("requestbox");

%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>�԰��ο� ���� �ٿ�ε�</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">
<script language="javascript">
<!--//
function whenSelection(arg){
	document.form1.action = "/servlet/controller.cp.CPEduStudentServlet";
	document.form1.p_process.value = "studentExcel";
	document.form1.submit();
}

function excelDown(gubun){
	document.form1.action = "/servlet/controller.cp.CPEduStudentServlet";
	document.form1.p_process.value = "studentExcelDown";
	document.form1.p_downgubun.value = gubun;
	document.form1.submit();
}
//-->
</script>
</head>

<body>
<form name="form1">
<input type="hidden" name="p_process" value="">
<input type="hidden" name="p_downgubun" value="">
<table width="518" border="0" cellpadding="10" cellspacing="1" bgcolor="#999999" style="font-size:12px">
  <tr>
    <td bgcolor="#FFFFFF"><strong>���� �ٿ�ε�</strong><br>
      <br>
      <font color="#006699">���������ϰ� �������� �������� �Ⱓ�� ���ԵǴ� ��� �ο��� �ٿ�ε� �� �� �ֽ��ϴ�.</font><br><br>
      <table width="100%" cellpadding="1" cellspacing="0" class="form_table_out">
        <tr> 
          <td align="center">
			<table width="100%" cellpadding="0" cellspacing="0" class="form_table_bg">
		      <tr> 
		        <td height="7"></td>
		      </tr>
		      <tr> 
		        <td>
			      <table border="0" cellspacing="0" cellpadding="0">
			        <tr> 
			          <td width="10"></td>
			          <td><%= SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  --></td>
			          <td width="20"></td>
			          <td> <%=SelectCompanyBean.getGrcomp(box, false, true)%><!-- getGyear(RequestBox, isChange)   �����⵵  --></td>
			          <td width="20"></td>
			          <td ><a href="javascript:whenSelection('go');"><img src="/images/admin/button/b_go.gif"  border="0"></a><br></td>
			        </tr>
			        <tr> 
			          <td height="5" colspan='5'></td>
			        </tr>
			        <tr>
			          <td></td>
			          <td>��ü�� :&nbsp; <%= CPCommonBean.getCP(box, true, true)%><!-- getCompany(RequestBox, isChange, isALL)    �������  -->&nbsp; </td>
			          <td></td>
			          <td colspan='3'> </td>
			        </tr>
			      </table>
		        </td>
		      </tr>
		      <tr> 
		        <td height="7"></td>
		      </tr>
		    </table> 
          </td>
        </tr>
      </table>
      <br>
                  
      <table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#006699" style="font-size:12px">
        <tr bgcolor="#E8F8FF"> 
          <td width="20%"><div align="center">����������</div></td>
          <td width="80%">
            <%= CPCommonBean.getYear(box, false, false, "2002", "p_syear")%>
            <select name="p_smon" size="1">
            <%for(int i=1;i<13;i++){%>
              <option value="<%=i%>"<%if(StringManager.toInt(FormatDate.getDate("MM")) == i){%> selected<%}%>><%=i%>��</option>
            <%}%>
            </select>
            <select name="p_sday" size="1">
            <%for(int i=1;i<32;i++){%>
              <option value="<%=i%>"<%if(StringManager.toInt(FormatDate.getDate("dd")) == i){%> selected<%}%>><%=i%>��</option>
            <%}%>
            </select>
            
          </td>
        </tr>
        <tr bgcolor="#E8F8FF"> 
          <td><div align="center">����������</div></td>
          <td>
            <%= CPCommonBean.getYear(box, false, false, "2002", "p_eyear")%>
            <select name="p_emon" size="1">
            <%for(int i=1;i<13;i++){%>
              <option value="<%=i%>"<%if(StringManager.toInt(FormatDate.getDate("MM")) == i){%> selected<%}%>><%=i%>��</option>
            <%}%>
            </select>
            <select name="p_eday" size="1">
            <%for(int i=1;i<32;i++){%>
              <option value="<%=i%>"<%if(StringManager.toInt(FormatDate.getDate("dd")) == i){%> selected<%}%>><%=i%>��</option>
            <%}%>
            </select>
          </td>
        </tr>
        <tr bgcolor="#E8F8FF"> 
          <td>&nbsp; </td>
          <td><a href="javascript:excelDown('1')">[��üȮ����]</a> <a href="javascript:excelDown('2')">[��ü�����]</a> <!--a href="javascript:excelDown('3')">[��ü��û��]</a--></td>
        </tr>
      </table>
      <br>
      <font color="#CC0066">�ο��� ������� �ٿ�ε� �ð��� ���� �����ɼ� ������ ������ �ּ����� �ʿ��� �Ⱓ�� �Է��Ͽ� 
      �ٿ�ε带 �����մϴ�.</font><br>
    </td>
  </tr>
</table>
</form>
</body>
</html>
