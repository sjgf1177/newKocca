<%
//**********************************************************
//  1. ��      ��: �����ȸ���ڵ� �ߺ�üũ
//  2. ���α׷���: za_OutUser_AesCodeChk.jsp
//  3. ��      ��: ���־�ü ���� ��Ͻ� �����ȸ���ڵ� �ߺ�üũ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ��â�� 2004.12.15
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=MS949" %>
<%//@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.cp.*" %>
<%@ page import = "com.credu.library.*" %>

<%
RequestBox box = (RequestBox)request.getAttribute("requestbox");

DataBox dbox = (DataBox)request.getAttribute("aescodecheck");

//�����ȸ���ڵ尡 �ߺ��̸� v_cnt ���� 1�� ��ȯ��.
int v_cnt = dbox.getInt("d_cnt");
String v_aes_code = box.getString("p_aes_code");
%>


<html>

<head>
<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">
<script language="javascript" src = "/script/cresys_lib.js"></script>
<script language="javascript">
<!--
//parent.form1.p_ischk.value = "0";
//alert("�̹� ������� ȸ���ڵ��Դϴ�.");
<%if(v_cnt > 0){%>

<%}else{%>
  
<%}%>

function id_ok(){
  opener.document.form1.p_ischk.value = "1";
  opener.document.form1.p_isaescodeoverlap.value = "Y";
  //opener.document.form1.p_aes_code.readOnly = true;
  opener.document.form1.p_aes_code.value = "<%=v_aes_code%>";
  self.close();
}

function id_search(){
  document.form1.action='/servlet/controller.system.OutUserAdminServlet';
  document.form1.p_process.value = 'aescodecheck';
  document.form1.submit();
}
-->
</script>
</head>
<body>
<!----------------- title ���� ----------------->
   <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td class=sub_title><img src="/images/admin/common/icon.gif"> ȸ���ڵ��ߺ�üũ
          </td>
        </tr>
      </table>

<form name="form1"  method="post" action="/servlet/controller.cp.CPCompServlet">
<input type = "hidden" name = "p_process" value= "">

  <table width="270"  height="190"  border="0"  cellpadding="0" cellspacing="1" class="table_out">
  <%if(v_cnt > 0){%>
    <tr>
      <td class="table_02_2">
        <table>
        <tr>
          <td colspan="2" align="center">
          <font color="red"><b><%=v_aes_code%></b></font>�� �̹� ������� ȸ���ڵ��Դϴ�.
          </td>
        </tr>
        <tr>
          <td>
            <input name="p_aes_code" type="text" class="input" style="width:100" value="<%=v_aes_code%>">
          </td>
          <td>
           <a href="javascript:id_search()"><img src="/images/admin/button/btn_checkok.gif" border="0"></a>
          </td>
        </tr>
      </td>
    </tr>
  <%}else{%>
    <tr>
      <td class="table_02_2">
      <table>
        <tr>
          <td><font color="red"><b><%=v_aes_code%></b></font>�� ��밡���� ȸ���ڵ��Դϴ�.</font> </td>
          <td width="20">&nbsp;</td>
          <td align="right"><a href="javascript:id_ok()"><img src="/images/admin/button/btn_checkok.gif" border="0"></a></td>
          <input name="p_aes_code" type="hidden" value="<%=v_aes_code%>">
        </tr>
      </table>
      </td>
      
    </tr>
  <%}%>
  </table>
</form>
</body>
</html>