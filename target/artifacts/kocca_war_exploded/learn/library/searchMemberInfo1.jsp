<%
//**********************************************************
//  1. ��      ��: ȸ�� ���� ����
//  2. ���α׷���: searchMemberInfo.jsp
//  3. ��      ��: ȸ�� ����(�˾�)
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 9. 23
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");    
    String  v_process   = box.getString("p_process");
    String v_resno      = "";  //�ֹε�Ϲ�ȣ
    String v_name       = "";  //�̸�
    String v_email      = "";  //�̸���    
    String v_hometel    = "";  //�Ҽ�
    String v_cono       = "";  //ID
        
    MemberData data = (MemberData)request.getAttribute("SelectMemberInfo");    
    v_resno      = data.getResno();
    v_name       = data.getName();    
    v_email      = data.getEmail();   
    v_hometel    = data.getHometel(); 
    v_cono       = data.getCono();    
    
    //v_resno = v_resno.substring(0, 6) + "-" + v_resno.substring(6);
    if(v_resno.length() > 12){
      v_resno = v_resno.substring(0, 6) + "-*******";
    }
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<SCRIPT LANGUAGE = "JAVASCRIPT" SRC = "/script/hhi_lib.js"></SCRIPT>
</head>



<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">


  
<table width="600" border="0" cellpadding="0" cellspacing="10" bgcolor="#f7f7f7">
  <tr> 
    <td> 
        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
          <tr> 
            
          <td align="center" bgcolor="#FFFFFF"> 

            <br>

            <table cellspacing="1" cellpadding="5" class="open_table_out">
              <tr> 
                <td colspan="3" class="table_top_line"></td>
              </tr>
              <tr> 
                <td width="22%" class="table_title">�ֹε�Ϲ�ȣ</td>
                <td class="table_02_2"><%=v_resno%></td>
              </tr>
              <tr> 
                <td class="table_title">����</td>
                <td class="table_02_2"><%=v_name%></td>
              </tr>
              <tr> 
                <td class="table_title">E-mail</td>
                <td class="table_02_2"><%=v_email%></td>
              </tr>
              <tr> 
                <td class="table_title">��ȭ��ȣ</td>
                <td class="table_02_2"><%=v_hometel%></td>
              </tr>
              <tr> 
                <td class="table_title">ID</td>
                <td class="table_02_2"><%=v_cono%></td>
              </tr>
            </table>

            <!----------------- �ݱ� ��ư ���� ----------------->
            <table cellspacing="0" cellpadding="0" class="open_table1">
              <tr> 
                <td align="right" style="padding-top=10">
                <a href="javascript:self.close()"><img src="/images/admin/button/btn_close02.gif" border="0"></a>
                </td>
              </tr>
            </table>
            <!----------------- �ݱ� ��ư �� ----------------->





              <br>




          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>



</body>
</html>
