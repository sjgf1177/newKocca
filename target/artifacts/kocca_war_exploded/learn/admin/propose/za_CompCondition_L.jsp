<%
//**********************************************************
//  1. ��      ��: ȸ�纰 ������û ���� ����
//  2. ���α׷���: za_CompCondition_L.jsp
//  3. ��      ��: ȸ�纰 ������û ���� ���� ��ȸȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 07. 14
//  7. ��      ��: 
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.propose.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    String v_comp				= "";
    String v_companynm			= "";
    int v_duty					= 0;
    int v_language				= 0;
    int v_allcondition			= 0;
    int v_yearduty				= 0;
    int v_yearlanguage			= 0;

    String v_process = box.getString("p_process"); 
    String ss_action = box.getString("p_action"); 
    String s_gadmin	 = box.getSession("gadmin");

	ArrayList list = null;

    if(ss_action.equals("go")){
      list = (ArrayList)request.getAttribute("compconditionlist");
    }
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script> 
<script language="JavaScript">
<!--

//��ȸ
function whenSelection(p_action) {
        document.form1.p_action.value = p_action;
        document.form1.target = "_self";
        document.form1.action = '/servlet/controller.propose.AcceptFileToDBServlet';
        document.form1.p_process.value = 'compCoditionPage';
        document.form1.submit();
}

// ������û ���� ���� ����
function whenUpdateCondition(i){
		document.form1.unum.value = i;
        document.form1.target = "_self";
        document.form1.action = "/servlet/controller.propose.AcceptFileToDBServlet";
        document.form1.p_process.value="compCoditionUpdate";
        document.form1.submit();
}

// ������û ���� ���� ����
function whenDeleteCondition(i){
		document.form1.unum.value = i;
        document.form1.target = "_self";
        document.form1.action = "/servlet/controller.propose.AcceptFileToDBServlet";
        document.form1.p_process.value="compCoditionDelete";
        document.form1.submit();
}

// ������û ���� ���� �߰�
function whenInsertCondition(){

	  if(document.form1.s_company.value == "ALL"){
		alert("ȸ�縦 �����Ͽ� �ֽʽÿ�.");
		return;
	  }

        document.form1.target = "_self";
        document.form1.action = "/servlet/controller.propose.AcceptFileToDBServlet";
        document.form1.p_process.value="compCoditionInsert";
        document.form1.submit();
}

//-->
</script>

</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">


<form name="form1" method="post">
<input type=hidden name=p_process value="">
<input type=hidden name=p_action value="">
<input type="hidden" name="unum" value="">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top"> 
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="../../../images/admin/system/tit_new_comapply.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>

	  <!----------------- form ���� ----------------->
      <table  width="1000" border=0 cellspacing="0" cellpadding="1" class="form_table_out">
        <tr>
          <td bgcolor="#C6C6C6" align="left">

            <table border=0 cellspacing="0" cellpadding="0" class="form_table_bg" >
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td align="left">

                  <table width="100%" border="0" cellspacing="0" cellpadding="0" class="form_table">
                    <tr>
                      <!------------------- ���ǰ˻� ���� ------------------------->
                      <td width="90%" align="left" valign="middle">&nbsp; 
                      <%
                      	if(s_gadmin.equals("A1")){
                      %>
											<%= SelectCompanyBean.getCompany(box, false, true)%><!-- getCompany(RequestBox, isChange, isALL)    ȸ�� --> 					  
											<%
												} else {
											%>
											<%= SelectCompanyBean.getCompany(box, false, false)%><!-- getCompany(RequestBox, isChange, isALL)    ȸ�� --> 					  
											<%	}	%>
					  </td>
					  <td width="10%" align="center">
	                    <%@ include file="/learn/admin/include/za_GoButton.jsp" %><!-- whenSelection('go') -->
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="9"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <!----------------- form �� ----------------->
	  <br>

	  <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td class=sub_title><img src="/images/admin/common/icon.gif"> ������û ���� ���</td>
		  <td align="right">
		  	<img src="/images/admin/button/btn_add.gif" style="cursor:hand" onClick="whenInsertCondition()">
		  </td>
        </tr>
      </table>

        <!----------------- ���� ���� �߰� ----------------->

        <table width="50%" class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="7" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="40%"class="table_title" colspan="2"><b>�����з�</b></td>
            <td width="20%"class="table_title" rowspan="2"><b>��ü�������ɼ�</b></td>
            <td width="40%"class="table_title" colspan="2"><b>�Ⱓ�������ɼ�</b></td>
          </tr>
          <tr> 
            <td width="20%" class="table_title"><b>����</b></td>
            <td width="20%" class="table_title"><b>����</b></td>
            <td width="20%" class="table_title"><b>����</b></td>
            <td width="20%" class="table_title"><b>����</b></td>
          </tr>
		  <tr>
            <td class="table_02_1"><input type="text" class="input" name="duty" size="5" maxlength="1" value="" onblur="numeric_chk(this)"></td>
            <td class="table_02_1"><input type="text" class="input" name="language" size="5" maxlength="1" value="" onblur="numeric_chk(this)"></td>
            <td class="table_02_1"><input type="text" class="input" name="allcondition" size="5" maxlength="1"  value="" onblur="numeric_chk(this)"></td>
            <td class="table_02_1"><input type="text" class="input" name="yearduty" size="5" maxlength="1"  value="" onblur="numeric_chk(this)"></td>
            <td class="table_02_1"><input type="text" class="input" name="yearlanguage" size="5" maxlength="1"  value="" onblur="numeric_chk(this)"></td>
          </tr>
		</table>
        <!----------------- ���� ���� �߰� ----------------->
		<br>
		<br>
		<table width="97%" border="0" cellspacing="0" cellpadding="0">
		  <tr> 
		    <td class=sub_title><img src="/images/admin/common/icon.gif"> ������û ���� ���</td>
		  </tr>
		</table>
        <!----------------- ���� ���� ���� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="8" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="5%" height="25" class="table_title" rowspan="2"><b>NO</b></td>
            <td width="25%"class="table_title" rowspan="2"><b>ȸ��</b></td>
            <td width="20%"class="table_title" colspan="2"><b>�����з�</b></td>
            <td width="15%"class="table_title" rowspan="2"><b>��ü�������ɼ�</b></td>
            <td width="15%"class="table_title" colspan="2"><b>�Ⱓ�������ɼ�</b></td>
            <td width="20%"class="table_title" rowspan="2"><b>���</b></td>
          </tr>
		  <tr>
            <td width="10%"class="table_title"><b>����</b></td>
            <td width="10%"class="table_title"><b>����</b></td>
            <td width="10%"class="table_title"><b>����</b></td>
            <td width="10%"class="table_title"><b>����</b></td>
		  </tr>
<%
    if(ss_action.equals("go")){
        for(int i = 0; i < list.size(); i++) {
          DataBox dbox		= (DataBox)list.get(i);
          v_comp			= dbox.getString("d_comp");
          v_companynm		= dbox.getString("d_companynm");
          v_duty			= dbox.getInt("d_duty");
          v_language		= dbox.getInt("d_language");
          v_allcondition    = dbox.getInt("d_allcondition");
          v_yearduty		= dbox.getInt("d_yearduty");          
          v_yearlanguage    = dbox.getInt("d_yearlanguage");          
%>
          <tr> 
		  <input type="hidden" name="comp<%=i%>" value="<%=v_comp%>">
            <td class="table_02_1"><%=i+1%></td>
            <td class="table_02_1"><%=v_companynm%></td>
            <td class="table_02_1"><input type="text" class="input" name="duty<%=i%>" size="5" maxlength="1" value="<%=v_duty%>" onblur="numeric_chk(this)"></td>
            <td class="table_02_1"><input type="text" class="input" name="language<%=i%>" size="5" maxlength="1" value="<%=v_language%>" onblur="numeric_chk(this)"></td>
            <td class="table_02_1"><input type="text" class="input" name="allcondition<%=i%>" size="5" maxlength="1"  value="<%=v_allcondition%>" onblur="numeric_chk(this)"></td>
            <td class="table_02_1"><input type="text" class="input" name="yearduty<%=i%>" size="5" maxlength="1"  value="<%=v_yearduty%>" onblur="numeric_chk(this)"></td>
            <td class="table_02_1"><input type="text" class="input" name="yearlanguage<%=i%>" size="5" maxlength="1"  value="<%=v_yearlanguage%>" onblur="numeric_chk(this)"></td>
            <td class="table_02_1"><img src="/images/admin/button/btn_modify.gif" onClick="javascript:whenUpdateCondition('<%=i%>')" style="cursor:hand"> <img src="/images/admin/button/btn_del.gif" onClick="javascript:whenDeleteCondition('<%=i%>')" style="cursor:hand"></td>
          </tr>
<%
       }
   }
%>

        </table>
        <!----------------- �������� �����Է� �� ----------------->
        <br>
      </td>
  </tr>

  <tr><td>

<%@ include file = "/learn/library/getJspName.jsp" %>

</form>
</body>
</html>
