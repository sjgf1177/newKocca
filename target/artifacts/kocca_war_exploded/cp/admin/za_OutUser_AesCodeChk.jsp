<%
//**********************************************************
//  1. 제      목: 사용자회사코드 중복체크
//  2. 프로그램명: za_OutUser_AesCodeChk.jsp
//  3. 개      요: 외주업체 정보 등록시 담당자회사코드 중복체크
//  4. 환      경: JDK 1.3
//  5. 버      젼: 1.0
//  6. 작      성: 이창훈 2004.12.15
//  7. 수      정:
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

//사용자회사코드가 중복이면 v_cnt 값은 1을 반환함.
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
//alert("이미 사용중인 회사코드입니다.");
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
<!----------------- title 시작 ----------------->
   <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td class=sub_title><img src="/images/admin/common/icon.gif"> 회사코드중복체크
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
          <font color="red"><b><%=v_aes_code%></b></font>은 이미 사용중인 회사코드입니다.
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
          <td><font color="red"><b><%=v_aes_code%></b></font>은 사용가능한 회사코드입니다.</font> </td>
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