<%
//**********************************************************
//  1. ��      ��: ���־�ü ���� ��ȸȭ��
//  2. ���α׷���: zu_cpcomp_L.jsp
//  3. ��      ��: ���־�ü ���� ��ȸȭ��
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
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
RequestBox box = (RequestBox)request.getAttribute("requestbox");

String v_cpseq =  "", v_email = "", v_cpnm = "", v_cpresno = "", v_homesite = "", v_address = "", v_ldate = "", v_userid = "", v_name = "", v_comptel = "", v_pwd = "", v_compgubun="", v_handphone="";
int i = 0, v_totalpage = 0, v_rowcount = 1;


String v_captinnm       = "";
String v_busicategory   = "";
int    v_employeetot    = 0;
int    v_employeeje     = 0;
int    v_employeebi     = 0;
String v_estabyear      = "";
String v_estabmon       = "";
String v_estabday       = "";
int    v_capital        = 0;
int    v_capitalplan    = 0;
int    v_capitalresult  = 0;
int    v_ownsubj        = 0;
int    v_goyonownsubj   = 0;
int    v_bigoyonownsubj = 0;
int    v_devsubj        = 0;
int    v_goyondevsubj   = 0;
int    v_bigoyondevsubj = 0;
int    v_devsystem      = 0;
String v_familysite     = "";
String v_vision         = "";
String v_mission        = "";
String v_mainbusi       = "";
String v_subbusi        = "";
String v_ownsolution    = "";
String v_prizerecord    = "";
String v_auth           = "";
String v_systemnm       = "";
String v_special        = "";
String v_bigo           = "";
String v_resno = "";


DataBox dbox = (DataBox)request.getAttribute("selectComp");

v_cpseq = dbox.getString("d_cpseq");
v_cpnm   = dbox.getString("d_cpnm");
v_cpresno   = dbox.getString("d_cpresno");
v_homesite    = dbox.getString("d_homesite");
v_address    = dbox.getString("d_address");
v_ldate      = dbox.getString("d_ldate");
v_userid  = dbox.getString("d_userid");
v_pwd  = dbox.getString("d_pwd");
v_name  = dbox.getString("d_name");
v_email  = dbox.getString("d_email");
v_comptel   = dbox.getString("d_comptel");
v_compgubun = dbox.getString("d_compgubun");
v_handphone = dbox.getString("d_handphone");
v_resno     = dbox.getString("d_resno");


    v_captinnm       = dbox.getString("d_captinnm");
    v_busicategory   = dbox.getString("d_busicategory");
    v_employeetot    = dbox.getInt   ("d_employeetot");
    v_employeeje     = dbox.getInt   ("d_employeeje");
    v_employeebi     = dbox.getInt   ("d_employeebi");
    v_estabyear      = dbox.getString("d_estabyear");
    v_estabmon       = dbox.getString("d_estabmon");
    v_estabday       = dbox.getString("d_estabday");
    v_capital        = dbox.getInt   ("d_capital");
    v_capitalplan    = dbox.getInt   ("d_capitalplan");
    v_capitalresult  = dbox.getInt   ("d_capitalresult");
    v_ownsubj        = dbox.getInt   ("d_ownsubj");
    v_goyonownsubj   = dbox.getInt   ("d_goyonownsubj");
    v_bigoyonownsubj = dbox.getInt   ("d_bigoyonownsubj");
    v_devsubj        = dbox.getInt   ("d_devsubj");
    v_goyondevsubj   = dbox.getInt   ("d_goyondevsubj");
    v_bigoyondevsubj = dbox.getInt   ("d_bigoyondevsubj");
    v_devsystem      = dbox.getInt   ("d_devsystem");
    v_familysite     = dbox.getString("d_familysite");
    v_vision         = dbox.getString("d_vision");
    v_mission        = dbox.getString("d_mission");
    v_mainbusi       = dbox.getString("d_mainbusi");
    v_subbusi        = dbox.getString("d_subbusi");
    v_ownsolution    = dbox.getString("d_ownsolution");
    v_prizerecord    = dbox.getString("d_prizerecord");
    v_auth           = dbox.getString("d_auth");
    v_systemnm       = dbox.getString("d_systemnm");
    v_special        = dbox.getString("d_special");
    v_bigo           = dbox.getString("d_bigo");
	    

//int v_pageno = box.getInt("p_pageno"); 

String s_userid = box.getSession("userid");
String s_usernm = box.getSession("username");
     
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">
<script language="JavaScript" type="text/JavaScript">
<!--

function MoveLink(act,cpseq) 
{

	if(act == "1"){
		//����Ʈ ��������
		document.form1.p_process.value   = "";
	    document.form1.action            = "/servlet/controller.cp.CPCompServlet";
	    document.form1.submit();	
	}
	else if(act == "2"){
		//�󼼺��� ��������
		document.form1.p_process.value   = "select";
		document.form1.p_cpseq.value   	 = cpseq;	
	    document.form1.action            = "/servlet/controller.cp.CPCompServlet";
	    document.form1.submit();
	}
	else if(act == "3"){
		//�����������
	    document.form1.p_process.value   = "insertPage";
	    document.form1.action            = "/servlet/controller.cp.CPCompServlet";
	    document.form1.submit();
	}
	else if(act == "4"){
		//��������
	    document.form1.p_process.value   = "updatePage";
	    document.form1.action            = "/servlet/controller.cp.CPCompServlet";
	    document.form1.submit();
	}
	else if(act == "5"){
		//����ó��
		if(confirm("���� �����Ͻðڽ��ϱ�?")){
		    document.form1.p_process.value   = "delete";
		    document.form1.action            = "/servlet/controller.cp.CPCompServlet";
		    document.form1.submit();
		}
	}

}

//-->
</script>
</head>

<body topmargin=0 leftmargin=0>
<form name = "form1" method = "post">
<input type = "hidden" name = "p_process" value = "">
<input type = "hidden" name = "p_cpseq" value = "<%=v_cpseq%>">
<input type = "hidden" name = "p_userid" value = "<%=v_userid%>">
<input type = "hidden" name = "p_compgubun" value = "<%=v_compgubun%>">
</form>
<table width="1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
	
	<table width="970" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/cp/cp_title01.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
	   
      <br>
      <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>������ȸ</td>
        </tr>
        <tr> 
          <td height=6></td>
          <td height=6></td>
        </tr>
      </table>  
      <table width="970"  border="0"  cellpadding="0" cellspacing="1" class="table_out">
	  <tr>
          <td colspan="2" class="table_top_line"></td>
        </tr>
        <tr> 
          <td class="table_title" width="16%">��ü��</td>
          <td class="table_02_2"  width="84%"><%=v_cpnm%></td>
        </tr>
        <tr> 
          <td class="table_title" width="16%">��ü����</td>
          <td class="table_02_2"  width="84%">
          <%
            if(v_compgubun.equals("S")){out.println("CP");}
            else if(v_compgubun.equals("T")){out.println("BP");}
            else if(v_compgubun.equals("M")){out.println("CP+BP");}
          %>
          </td>
        </tr>
        <tr> 
          <td class="table_title">�����ID</td>
          <td class="table_02_2"><%=v_userid%></td>
        </tr>
        <tr> 
          <td class="table_title">��й�ȣ</td>
          <td class="table_02_2"><%=v_pwd%></td>
        </tr>
        <tr> 
          <td class="table_title">����ڸ�</td>
          <td class="table_02_2"><%=v_name%></td>
        </tr>
        <tr> 
          <td class="table_title">�ֹε�Ϲ�ȣ</td>
          <td class="table_02_2"><%=v_resno%></td>
        </tr>
        <tr> 
          <td class="table_title">E-Mail</td>
          <td class="table_02_2" style=padding-top:5;padding-bottom:5><%=v_email%></td>
        </tr>
        <tr>
          <td class="table_title">ȸ����ȭ</td>
          <td class="table_02_2" style=padding-top:5;padding-bottom:5><%=v_comptel%></td>
        </tr>
        <tr>
          <td class="table_title">�ڵ���</td>
          <td class="table_02_2" style=padding-top:5;padding-bottom:5><%=v_handphone%></td>
        </tr>
      </table>
      
         
      <!--****************************************************************�߰����� ����****************************************************************-->
      <BR>
      <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>�߰�����</td>
        </tr>
        <tr> 
          <td height=6></td>
          <td height=6></td>
        </tr>
      </table>  
      <table width="970"  border="0"  cellpadding="0" cellspacing="1" class="table_out">
	    <tr>
          <td colspan="4" class="table_top_line"></td>
        </tr>
        <!--*************************************************ȸ�簳�����*************************************************-->
        <tr> 
          <td class="table_title" width="4%" rowspan="10">ȸ<br>��<br>��<br>��</td>
          <td class="table_title" width="12%" colspan='2'>Ȩ������</td>
          <td class="table_02_2"  width="84%"><%=v_homesite%></td>
        </tr>
        <tr> 
          <td class="table_title" width="12%" colspan='2'>FAMILYSITE</td>
          <td class="table_02_2"  width="84%"><%=v_familysite%></td>
        </tr>
        <tr> 
          <td class="table_title" width="12%" colspan='2'>��ǥ�̻�</td>
          <td class="table_02_2"  width="84%" ><%=v_captinnm%></td>
        </tr>
        <tr> 
          <td class="table_title" width="12%" colspan='2'>����</td>
          <td class="table_02_2"  width="84%"><%=v_busicategory%></td>
        </tr>
        <tr> 
          <td class="table_title" width="12%" colspan='2'>����ڵ�Ϲ�ȣ</td>
          <td class="table_02_2"  width="84%"><%=v_cpresno%></td>
        </tr>
        <tr> 
          <td class="table_title" width="3%" rowspan='3'>��<br>��</td>
          <td class="table_title" width="12%">������(TOTAL)</td>
          <td class="table_02_2"  width="84%"><%=v_employeetot%>��</td>
        </tr>
        <tr> 
          <td class="table_title" width="12%">������</td>
          <td class="table_02_2"  width="84%"><%=v_employeeje%>��</td>
        </tr>
        <tr> 
          <td class="table_title" width="12%">��������</td>
          <td class="table_02_2"  width="84%"><%=v_employeebi%>��</td>
        </tr>
        <tr> 
          <td class="table_title" width="12%" colspan='2'>���������</td>
          <td class="table_02_2"  width="84%"><%=v_estabyear%>��<%=v_estabmon%>��<%=v_estabday%>��</td>
        </tr>
        <tr> 
          <td class="table_title" width="12%"  colspan='2'>�ּ�</td>
          <td class="table_02_2"  width="84%"><%=v_address%></td>
        </tr>
        <!--*************************************************ȸ�簳�䳡*************************************************-->
        
        <!--*************************************************PR����*************************************************-->
        <tr> 
          <td class="table_title" width="4%" rowspan="4">P<br><br><br>R</td>
          <td class="table_title" width="12%" colspan='2'>Vision</td>
          <td class="table_02_2"  width="84%"><%=v_vision%></td>
        </tr>
        <tr> 
          <td class="table_title" width="12%"  colspan='2'>Mission</td>
          <td class="table_02_2"  width="84%"><%=v_mission%></td>
        </tr>
        <tr> 
          <td class="table_title" width="3%" rowspan='2'>��<br>��<br>��<br>��<br>��<br>��</td>
          <td class="table_title" width="12%" >�ַ»��</td>
          <td class="table_02_2"  width="84%" height="120"><%=v_mainbusi%></td>
        </tr>
        <tr> 
          <td class="table_title" width="12%" >�űԻ��</td>
          <td class="table_02_2"  width="84%" height="120"><%=v_subbusi%></td>
        </tr>
        <!--*************************************************PR��*************************************************-->
        
        <!--*************************************************IR����*************************************************-->
        <tr> 
          <td class="table_title" width="4%" rowspan="3">I<br><br><br>R</td>
          <td class="table_title" width="12%" colspan='2'>�ں���</td>
          <td class="table_02_2"  width="84%"><%=v_capital%>
        </tr>
        <tr> 
          <td class="table_title" width="12%"  colspan='2'>�����ȹ</td>
          <td class="table_02_2"  width="84%"><%=v_capitalplan%></td>
        </tr>
        <tr> 
          <td class="table_title" width="12%"  colspan='2'>�������</td>
          <td class="table_02_2"  width="84%"><%=v_capitalresult%></td>
        </tr>
        <!--*************************************************IR ��*************************************************-->
        
        <!--*************************************************����1*************************************************-->
        <tr> 
          <td class="table_title" width="4%"  rowspan="2">��<br>��<br>1</td>
          <td class="table_title" width="12%" colspan='2'>������</td>
          <td class="table_02_2"  width="84%"><%=v_prizerecord%></td>
        </tr>
        <tr> 
          <td class="table_title" width="12%"  colspan='2'>����ȹ��</td>
          <td class="table_02_2"  width="84%"><%=v_auth%></td>
        </tr>
        <!--*************************************************����1 ��*************************************************-->
        
        <!--*************************************************����2 ����*************************************************-->
        <tr>
          <td class="table_title" width="4%" rowspan="6">��<br>��<br>2</td>
          <td class="table_title" width="12%" colspan='2'>��ü����������(total)</td>
          <td class="table_02_2"  width="84%"><%=v_ownsubj%></td>
        </tr>
        <tr>
          <td class="table_title" width="3%" rowspan="2">&nbsp;</td>
          <td class="table_title" width="12%">��뺸������</td>
          <td class="table_02_2"  width="84%"><%=v_goyonownsubj%></td>
        </tr>
        <tr>
          <td class="table_title" width="12%">��뺸�������</td>
          <td class="table_02_2"  width="84%"><%=v_bigoyonownsubj%></td>
        </tr>
        <tr>
          <td class="table_title" width="12%" colspan=2>����/��ǰ ������(total)</td>
          <td class="table_02_2"  width="84%"><%=v_devsubj%></td>
        </tr>
        <tr>
          <td class="table_title" width="3%" rowspan="2">&nbsp;</td>
          <td class="table_title" width="12%">��뺸������</td>
          <td class="table_02_2"  width="84%"><%=v_goyondevsubj%></td>
        </tr>
        <tr>
          <td class="table_title" width="12%">��뺸�������</td>
          <td class="table_02_2"  width="84%"><%=v_bigoyondevsubj%></td>
        </tr>
        <!--*************************************************����2 ��*************************************************-->
        
        <!--*************************************************����3 ����*************************************************-->
        <tr> 
          <td class="table_title" width="4%" rowspan="3">��<br>��<br>3</td>
          <td class="table_title" width="12%" colspan='2'>�����ַ��</td>
          <td class="table_02_2"  width="84%"><%=v_ownsolution%></td>
        </tr>
        <tr>
          <td class="table_title" width="12%" colspan=2>���߳�ǰ�ý��ۼ�</td>
          <td class="table_02_2"  width="84%"><%=v_devsystem%></td>
        </tr>
        <tr>
          <td class="table_title" width="12%" colspan=2>�ý��۸�</td>
          <td class="table_02_2"  width="84%"><%=v_systemnm%></td>
        </tr>
        <!--*************************************************����3 ��*************************************************-->
        
        <!--*************************************************Ư¡/���*************************************************-->
        <tr> 
          <td class="table_title" width="16%" colspan='3'>Ư¡</td>
          <td class="table_02_2"  width="84%"><%=v_special%></td>
        </tr>
        <tr>
          <td class="table_title" width="16%" colspan=3>���</td>
          <td class="table_02_2"  width="84%"><%=v_bigo%></td>
        </tr>
        <!--*************************************************����3 ��*************************************************-->
      </table>
      <!--****************************************************************�߰����� ��****************************************************************-->
      
      
      
      <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height=6></td>
          <td height=6></td>
          <td height=6></td>
          <td align="right" height=6></td>
          <td width="12" height=6></td>
          <td align="right" height=6></td>
        </tr>
        <tr> 
          <td width="823" align="right" ></td>
          <td width="45" align="right"><a href="JavaScript:MoveLink(4)"><img src="/images/admin/button/btn_modify.gif" border="0"></a></td>
          <td width="14">&nbsp;</td>
          <td width="32" align="right"><a href="JavaScript:MoveLink(5)"><img src="/images/admin/button/btn_del.gif" border="0"></a></td>
          <td width="12">&nbsp;</td>
          <td width="44" align="right"><a href="JavaScript:MoveLink(1)"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr height="100">
    <td>
      <%@ include file = "/learn/library/getJspName.jsp" %> 
    </td>
  </tr>
</table>
</body>
</html>
