<%
//**********************************************************
//  1. ��      ��: Ʃ�͹�������
//  2. ���α׷���: za_TutorDistribution_L.jsp
//  3. ��      ��: Ʃ�͹������� ��ȸ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.complete.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");

    //DEFINED class&variable END

    DataBox dbox = (DataBox)request.getAttribute("measure");

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script> 
<SCRIPT LANGUAGE="JavaScript">
<!--          
function whenSave() {
    document.form1.action = "/servlet/controller.tutor.TutorDistributionAdminServlet";
    document.form1.p_process.value= "update";
    document.form1.submit();
}
function whenList() {
    document.form1.action = "/servlet/controller.tutor.TutorDistributionAdminServlet";
    document.form1.p_process.value= "listPage";
    document.form1.submit();
}
-->        
</SCRIPT>
</head>



<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name = "form1" method = "post">
    <input type="hidden" name="p_process" value="<%=v_process%>">

    
  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top"> 

      <!----------------- title ���� ----------------->
      <br>
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="40"><img src="/images/admin/common/lms_titlebg01.gif" width="40" height="37"></td>
          <td width="170" background="/images/admin/common/lms_titlebg02.gif" style="padding-top:5" class="head_title">
         Ʃ�� ��������
          </td>
          <td background="/images/admin/common/lms_titlebg03.gif">&nbsp;</td>
        </tr>
      </table>
      <!----------------- title �� --------------- -->
      <br>

      <br>
      <br>

      <!-----------------  ��ư ���� ----------------->
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
            <td align="right" height="20">&nbsp;</td>
            <td align="right" width="100">
            <a href="javascript:whenList()"><img src="/images/admin/system/list1_butt.gif" border="0"></a>
            <a href="javascript:whenSave()"><img src="/images/admin/tutor/record2_butt.gif" border="0"></a>
            </td>            
        </tr>
        <tr> 
          <td height="3"></td>
        </tr>
      </table>
      <!-----------------  ��ư �� ----------------->
      <!-----------------  ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
          <tr> 
            <td colspan="23" class="table_top_line"></td>
          </tr>
          <tr> 
            <td class="table_title" width="20%">�⺻��</td>
            <td class="table_02_1" colspan="5" width="80%"><input type="text" name="p_value" value="<%=dbox.getString("va_basepay")%>" size=10>��
            <input type="hidden" name="p_code" value="basepay"></td>    
          </tr>
          <tr> 
            <td class="table_title" rowspan="3">�����������</td>
            <td class="table_02_1" colspan="5">���� Ʃ�� : <input type="text" name="p_value" value="<%=dbox.getString("va_tax1")%>" size=4>%
            <input type="hidden" name="p_code" value="tax1"></td>
          </tr>
          <tr> 
            <td class="table_02_1" colspan="5">���� Ʃ�� : <input type="text" name="p_value" value="<%=dbox.getString("va_tax3")%>" size=4>%
            <input type="hidden" name="p_code" value="tax3">
            </td>
          </tr>
          <tr> 
            <td class="table_02_1" colspan="5">�ܺ� Ʃ�� : <input type="text" name="p_value" value="<%=dbox.getString("va_tax2")%>" size=4>%
            <input type="hidden" name="p_code" value="tax2">
            </td>
          </tr>
          <tr> 
            <td class="table_title" rowspan="2">Ʃ�� ������</td>
            <td class="table_title" width="16%"><%=dbox.getString("c_okrate1")%>�� �̻�</td>    
            <td class="table_title" width="16%"><%=dbox.getString("c_okrate2")%>�� �̻�</td>    
            <td class="table_title" width="16%"><%=dbox.getString("c_okrate3")%>�� �̻�</td>    
            <td class="table_title" width="16%"><%=dbox.getString("c_okrate4")%>�� �̻�</td>    
            <td class="table_title" width="16%"><%=dbox.getString("c_okrate5")%>�� �̸�</td>    
          </tr>
          <tr>
            <td class="table_02_1" width="16%"><input type="text" name="p_value" value="<%=dbox.getString("va_okrate1")%>" size=4><input type="hidden" name="p_code" value="okrate1"></td>    
            <td class="table_02_1" width="16%"><input type="text" name="p_value" value="<%=dbox.getString("va_okrate2")%>" size=4><input type="hidden" name="p_code" value="okrate2"></td>    
            <td class="table_02_1" width="16%"><input type="text" name="p_value" value="<%=dbox.getString("va_okrate3")%>" size=4><input type="hidden" name="p_code" value="okrate3"></td>    
            <td class="table_02_1" width="16%"><input type="text" name="p_value" value="<%=dbox.getString("va_okrate4")%>" size=4><input type="hidden" name="p_code" value="okrate4"></td>    
            <td class="table_02_1" width="16%"><input type="text" name="p_value" value="<%=dbox.getString("va_okrate5")%>" size=4><input type="hidden" name="p_code" value="okrate5"></td>    
          </tr>
          <tr> 
            <td class="table_title" rowspan="2">������</td>
            <td class="table_title" width="16%"><%=dbox.getString("c_actrate1")%>ȸ �̻�</td>    
            <td class="table_title" width="16%"><%=dbox.getString("c_actrate2")%>ȸ �̻�</td>    
            <td class="table_title" width="16%"><%=dbox.getString("c_actrate3")%>ȸ �̻�</td>    
            <td class="table_title" width="16%"><%=dbox.getString("c_actrate4")%>ȸ �̻�</td>    
            <td class="table_title" width="16%"><%=dbox.getString("c_actrate5")%>ȸ �̸�</td>    
          </tr>
          <tr> 
            <td class="table_02_1" width="16%"><input type="text" name="p_value" value="<%=dbox.getString("va_actrate1")%>" size=4><input type="hidden" name="p_code" value="actrate1"></td>    
            <td class="table_02_1" width="16%"><input type="text" name="p_value" value="<%=dbox.getString("va_actrate2")%>" size=4><input type="hidden" name="p_code" value="actrate2"></td>    
            <td class="table_02_1" width="16%"><input type="text" name="p_value" value="<%=dbox.getString("va_actrate3")%>" size=4><input type="hidden" name="p_code" value="actrate3"></td>    
            <td class="table_02_1" width="16%"><input type="text" name="p_value" value="<%=dbox.getString("va_actrate4")%>" size=4><input type="hidden" name="p_code" value="actrate4"></td>    
            <td class="table_02_1" width="16%"><input type="text" name="p_value" value="<%=dbox.getString("va_actrate5")%>" size=4><input type="hidden" name="p_code" value="actrate5"></td>    
          </tr>
          <tr> 
            <td class="table_title" rowspan="2">�����</td>
            <td class="table_title" width="16%"><%=dbox.getString("c_manrate1")%></td>    
            <td class="table_title" width="16%"><%=dbox.getString("c_manrate2")%></td>    
            <td class="table_title" width="16%"><%=dbox.getString("c_manrate3")%></td>    
            <td class="table_title" width="16%"><%=dbox.getString("c_manrate4")%></td>    
            <td class="table_title" width="16%"><%=dbox.getString("c_manrate5")%></td>    
          </tr>
          <tr> 
            <td class="table_02_1" width="16%"><input type="text" name="p_value" value="<%=dbox.getString("va_manrate1")%>" size=4><input type="hidden" name="p_code" value="manrate1"></td>     
            <td class="table_02_1" width="16%"><input type="text" name="p_value" value="<%=dbox.getString("va_manrate2")%>" size=4><input type="hidden" name="p_code" value="manrate2"></td>     
            <td class="table_02_1" width="16%"><input type="text" name="p_value" value="<%=dbox.getString("va_manrate3")%>" size=4><input type="hidden" name="p_code" value="manrate3"></td>     
            <td class="table_02_1" width="16%"><input type="text" name="p_value" value="<%=dbox.getString("va_manrate4")%>" size=4><input type="hidden" name="p_code" value="manrate4"></td>     
            <td class="table_02_1" width="16%"><input type="text" name="p_value" value="<%=dbox.getString("va_manrate5")%>" size=4><input type="hidden" name="p_code" value="manrate5"></td>     
          </tr>
          <tr> 
            <td class="table_title" rowspan="2">�����ο�</td>
            <td class="table_title" width="16%"><%=dbox.getString("c_grcnt1")%>�� �̻� </td>    
            <td class="table_title" width="16%"><%=dbox.getString("c_grcnt2")%>�� �̻� </td>    
            <td class="table_title" width="16%"><%=dbox.getString("c_grcnt3")%>�� �̻� </td>    
            <td class="table_title" width="16%"><%=dbox.getString("c_grcnt4")%>�� �̻�</td>    
            <td class="table_title" width="16%"><%=dbox.getString("c_grcnt5")%>�� �̸�</td>    
          </tr>
          <tr> 
            <td class="table_02_1" width="16%"><input type="text" name="p_value" value="<%=dbox.getString("va_grcnt1")%>" size=4><input type="hidden" name="p_code" value="grcnt1"></td>   
            <td class="table_02_1" width="16%"><input type="text" name="p_value" value="<%=dbox.getString("va_grcnt2")%>" size=4><input type="hidden" name="p_code" value="grcnt2"></td>   
            <td class="table_02_1" width="16%"><input type="text" name="p_value" value="<%=dbox.getString("va_grcnt3")%>" size=4><input type="hidden" name="p_code" value="grcnt3"></td>   
            <td class="table_02_1" width="16%"><input type="text" name="p_value" value="<%=dbox.getString("va_grcnt4")%>" size=4><input type="hidden" name="p_code" value="grcnt4"></td>   
            <td class="table_02_1" width="16%"><input type="text" name="p_value" value="<%=dbox.getString("va_grcnt5")%>" size=4><input type="hidden" name="p_code" value="grcnt5"></td>   
          </tr>
      </table>      

     <br>
    </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>      
</table>
</form>
</body>
</html>
