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
    String v_userid     = box.getString("p_userid");
    String v_resno      = "";  //�ֹε�Ϲ�ȣ
    String v_name       = "";  //�̸�
    String v_email      = "";  //�̸���
    String v_hometel    = "";  //����ȭ
    String v_handphone  = "";  //����ȭ
    String v_comptel    = "";  //ȸ����ȭ
    String v_cono       = "";  //ID
    String v_pwd        = "";  //��й�ȣ
    String v_post1      = "";  //�����ȣ1
    String v_post2      = "";  //�����ȣ2
    String v_addr       = "";  //�ּ�1
    String v_addr2      = "";  //�ּ�2 ���ּ�
        
    MemberData data = (MemberData)request.getAttribute("SelectMemberInfo");    
    //v_resno      = data.getResno();
    v_resno      = data.getResno1()+data.getResno2();
    v_name       = data.getName();
    v_email      = data.getEmail();
    v_hometel    = data.getHometel();
    v_handphone  = data.getHandphone();
    v_comptel    = data.getComptel();
    v_cono       = data.getCono();
    v_pwd        = data.getPwd();
    
    v_post1  = data.getPost1();
    v_post2  = data.getPost2();
    v_addr   = data.getAddr();
    v_addr2  = data.getAddr2();

    
    //v_resno = v_resno.substring(0, 6) + "-" + v_resno.substring(6);
    
    //if(v_resno.length() > 12){
    //  v_resno = v_resno.substring(0, 6) + "-*******";
    //}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" type="text/CSS" href="/css/admin_style.css">
<SCRIPT LANGUAGE = "JAVASCRIPT" SRC = "/script/hhi_lib.js"></SCRIPT>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
</head>



<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">


  
<table width="600" border="0" cellpadding="0" cellspacing="10" bgcolor="#f7f7f7">
  <tr> 
    <td align="left"> 
        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
          <tr> 
            
          <td align="center" valign="top" bgcolor="#FFFFFF"> 
    <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/propose/tit_personal_info.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
        <!----------------- title �� ----------------->
            <br>

            <table cellspacing="1" cellpadding="5" class="open_table_out">
              <tr>
                <td colspan="4" class="table_top_line"></td>
              </tr>
              <tr>
                <td class="table_title" width="22%" >����(ID)</td>
                <td class="table_02_2"  width="28%" ><%=v_name%>(<%=v_userid%>)</td>
                <td class="table_title" width="22%" >��й�ȣ</td>
                <td class="table_02_2"  width="28%" ><!--<%=v_pwd%>-->****</td>
              </tr>
              <tr>
                <td class="table_title">�系��ȭ��ȣ</td>
                <td class="table_02_2"><%=v_comptel%></td>
                <td class="table_title">��ȭ��ȣ(Home)</td>
                <td class="table_02_2"><%=v_hometel%></td>
              </tr>
              <tr>
                <td class="table_title">��ȭ��ȣ(H.P)</td>
                <td class="table_02_2"><%=v_handphone%></td>
                <td class="table_title"></td>
                <td class="table_02_2"></td>
              </tr>

              <tr>
                <td class="table_title">E-mail</td>
                <td class="table_02_2" colspan=3><%=v_email%></td>
              </tr>
            </table>

            <!----------------- �ݱ� ��ư ���� ----------------->
            <table cellspacing="0" cellpadding="0" class="open_table1">
              <tr> 
                <td align="right" style="padding-top=10">
                <a href="javascript:self.close()"><img src="/images/admin/button/btn_close.gif" border="0"></a>
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

<div id=minical OnClick="this.style.display='none';" oncontextmenu='return false' 
ondragstart='return false' onselectstart='return false' 
style="background : buttonface; margin: 5; margin-top: 2;border-top: 1 
solid buttonhighlight;border-left: 1 solid buttonhighlight;border-right: 1 
solid buttonshadow;border-bottom: 1 solid buttonshadow;width:155;display:none;position: absolute; z-index: 99">
</div>

</body>
</html>
