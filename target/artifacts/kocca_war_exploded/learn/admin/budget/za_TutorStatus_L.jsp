<%
//**********************************************************
//  1. ��      ��: ������Ȳ
//  2. ���α׷���: za_TutorStatus_L.jsp
//  3. ��      ��: ������Ȳ
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 12. 17
//  7. ��      ��: 
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.budget.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    String  v_tutorgubun   = box.getStringDefault("s_tutorgubun","ALL");//���籸��(I:�系����,O:��ܰ���,G:�׷�簭��)
    String  v_srchsubjnm = box.getStringDefault("p_srchsubjnm","");		//������
    
    String  v_subjclass   = box.getStringDefault("p_subjclass","ALL");    //���Ǻо�
    String  v_tutorname   = box.getStringDefault("p_tutorname","");    //�����
    
    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���

    

%>

<html>
<head>
<title>��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<script language = "javascript" src = "/script/tutor.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

function tutor_select(tutorgubun, userid) {
	document.form2.action = "/servlet/controller.tutor.TutorAdminServlet";
	document.form2.p_process.value= "TutorSelect";
	document.form2.p_userid.value = userid;
	document.form2.target="_self";
	document.form2.submit();
}

function whenSelection() {
	document.form2.target="_self";
    document.form2.p_process.value = 'TutorStatusList';
    document.form2.submit();
}

function whenExcel() {

        window.self.name = "CompleteRateList";
        open_window("openExcel","","100","100","700","400","yes","yes","yes","yes","yes");
        document.form2.target = "openExcel";
        document.form2.action='/servlet/controller.budget.BudgetAdminServlet';
        document.form2.p_process.value = 'TutorStatusListExcel';
        document.form2.submit();
    }

function press_enter(e) { 
	if (e.keyCode =='13'){  whenSelection();  }
}

function subjSelect(subj) {
	document.form2.target="_self";
	document.form2.p_process.value = 'SubjSelect';
	document.form2.p_subj.value = subj;
	document.form2.submit();
	
}

function whenOrder(column) {
	if (document.form2.p_orderType.value == " asc") {
		document.form2.p_orderType.value = " desc";
	} else {
		document.form2.p_orderType.value = " asc";
	}

    document.form2.p_orderColumn.value = column;

    whenSelection();
}
-->
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<div id=minical OnClick="this.style.display='none';" oncontextmenu='return false'
ondragstart='return false' onselectstart='return false'
style="background : buttonface; margin: 5; margin-top: 2;border-top: 1
solid buttonhighlight;border-left: 1 solid buttonhighlight;border-right: 1
solid buttonshadow;border-bottom: 1 solid buttonshadow;width:155;display:none;position: absolute; z-index: 99">
</div>
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="../../../images/admin/tutor/tit_new_02.gif" width="528" height="36"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>
      <!----------------- form ���� ----------------->
      <table cellspacing="0" cellpadding="1" class="form_table_out">
        <form name="form2" method="post" action="/servlet/controller.budget.BudgetAdminServlet">
          <input type="hidden" name="p_process"  value="">
          <input type="hidden" name="p_subj" value="">
          <input type="hidden" name="p_inusercompnm" value="">
          <input type="hidden" name="p_subjgubun" value="">
          <input type="hidden" name="p_userid" value="">
		  <input type="hidden" name="p_busino" value="">
		  <input type="hidden" name="p_frompage"  value="TutorStatus">
		  <input type="hidden" name="p_orderColumn">
		  <input type="hidden" name="p_orderType" value="<%=v_orderType%>">
		  
        <tr>
          <td bgcolor="#C6C6C6" align="center">
            <table cellspacing="0" cellpadding="0" class="form_table_bg">
              <tr>
                <td height="7" width="99%"></td>
              </tr>
              <tr>
                <td align="center" width="99%" valign="middle">
                  <table width="99%" cellspacing="0" cellpadding="0" class="form_table">
                    <tr>
                      <td>
					  <!--input type="radio" name="p_searchgubun" checked value="Y"-->
					  <%//= BudgetAdminBean.getYear(box, true, false)%><!-- getCompany(RequestBox, isChange, isALL)    ȸ��(s_year)  --><br>
                      <!--input type="radio" name="p_searchtype" checked value="S">�����ϱ��� &nbsp;<input type="radio" name="p_searchtype" value="E">
                        �����ϱ���-->
                        
                        
						
                        
                       <!-- &nbsp;
						<input type="radio" name="p_searchgubun" value="T">
                        �Ⱓ <input name="p_edustartday" type="text" class="input" size="10" maxlength=10  value="" OnClick="MiniCal(this)" readonly>~
                        <input name="p_eduendday" type="text" class="input" size="10" maxlength=10  value="" OnClick="MiniCal(this)" readonly><br-->
						���籸�� :<%=CodeConfigBean.getCodeGubunSelect ("0027", "", 1, "s_tutorgubun", v_tutorgubun, "onchange='javascript:whenSelection()'", 1)%>
						������ : <input type="text" name="p_srchsubjnm" size="40" value="<%=v_srchsubjnm%>" onkeypress="press_enter(event)" style="width:119;height:18;border:B4BDD4 1px solid">
						<!--&nbsp; ���Ǻо� :
					<%=CodeConfigBean.getCodeGubunSelect ("0039", "", 1, "p_subjclass", v_subjclass, "", 1)%> -->
				  &nbsp;����� : <input type="text" name="p_tutorname" size="40" value="<%=v_tutorname%>" onkeypress="press_enter(event)" style="width:119;height:18;border:B4BDD4 1px solid">
				  
                       </td>
				  <td width=4></td>
				  <td><a href="javascript:whenSelection()"><img src="/images/admin/button/b_go.gif"  border="0"></a></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="7" width="99%"></td>
              </tr>
            </table>
          </td>
        </tr> </form>
      </table>
      <br>
      <br>
	  <!----------------- ��ư ���� ----------------->
        <table width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="81%" height="3"></td>
          </tr>
          <tr>
            
			<td width="10%" align="right">(EXCEL ��½� ��� �ְ��Ǳ����� ��Ÿ���ϴ�.)</td>
			<td width="9%" align="right">
            <a href="javascript:whenExcel()"><img src="/images/admin/button/btn_excelprint.gif"  border="0"></a>
            </td>
          </tr>
          <tr>
            <td height="3"></td>
          </tr>
        </table>
        <!----------------- ��ư ���� ----------------->
      <!----------------- ���� ���� ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
        <tr> 
          <td colspan="9" class="table_top_line"></td>
        </tr>
        <tr> 
          <td width="5%" class="table_title"><b>NO</b></td>
          <td width="10%" class="table_title"><a href="javascript:whenOrder('tutorgubunnm')" class="e"><b>���籸��</b></a></td>
          <td width="10%" class="table_title"><a href="javascript:whenOrder('name')" class="e"><b>�����</b></a></td>
		  <!--td width="10%" class="table_title"><a href="javascript:whenOrder('subjclassnm')" class="e"><b>���Ǻо�</b></a></td-->
          <td class="table_title"><a href="javascript:whenOrder('subjnm')" class="e"><b>����</b></a></td>
          <!--td class="table_title"><a href="javascript:whenOrder('inusercompnm')" class="e"><b>�ְ��μ�</b></a></td-->
          <td width="25%" class="table_title"><a href="javascript:whenOrder('lessonnm')" class="e"><b>������</b></a></td>
          <!--td width="7%" class="table_title"><a href="javascript:whenOrder('grade')" class="e"><b>����</b></a></td-->
          <td width="10%" class="table_title"><a href="javascript:whenOrder('price')" class="e"><b>�����/�δ�</b></a></td>
        </tr>
        <%  ArrayList  list = (ArrayList)request.getAttribute("tutorStatusList");
		double execpercent = 0.00d;
	    for (int i=0; i<list.size(); i++) {
	        DataBox dbox = (DataBox)list.get(i); 
			execpercent = dbox.getDouble("d_execpercent");
			%>
        <tr> 
          <td class="table_01"><%=list.size()-i%></td>
          <td class="table_02_1"><%=dbox.getString("d_tutorgubunnm")%></td>
          <td class="table_02_1"><a href = "javascript:tutor_select('<%=dbox.getString("d_tutorgubun")%>','<%=dbox.getString("d_userid")%>')"><%=dbox.getString("d_name")%></a></td>
<!--          <td class="table_02_1"><%=dbox.getString("d_subjclassnm")%></td>  -->
          <td class="table_02_2">
          <% if (dbox.getString("d_subj").equals("")) { %>
          	<a href="javascript:alert('���� �̷µ���Ÿ�� ���������� �����ϴ�.');"><%=dbox.getString("d_subjnm")%></a>
          <% } else { %>
          	<a href="javascript:subjSelect('<%=dbox.getString("d_subj")%>');"><%=dbox.getString("d_subjnm")%></a>
          <% } %>
          </td>
          <!--td class="table_02_1">
          <% if (dbox.getString("d_subj").equals("")) { %>
          <%=dbox.getString("d_inusercompnm")%>
          <% } else { %>
          <a href="javascript:inuserinfo('<%=dbox.getString("d_inusercompnm")%>','A','<%=dbox.getString("d_subj")%>')"><%=dbox.getString("d_inusercompnm")%></a>
          <% } %>
          </td-->
          <td class="table_02_1"><%=dbox.getString("d_lessonnm")%></td>
          <!--td class="table_02_1"><%=dbox.getDouble("d_grade")%></td-->
          <td class="table_02_1_r" style="padding-right:10px;"><%=dbox.getInt("d_price")%></td>
        </tr>
        <%  } %>
      </table>
      <!----------------- ���� ���� �� ----------------->
      <br>
    </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>
</table>

</body>
</html>
