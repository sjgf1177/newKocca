<%
/**
 * file name : za_ETestGroup_L.jsp
 * date      : 2003/09/23
 * programmer:
 * function  : �¶����׽�Ʈ �׷� ��ȸȭ��
 */
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.etest.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    String  ss_grcode    = box.getString("s_grcode");        //�����׷�
    String  ss_upperclass= box.getStringDefault("s_upperclass", "ALL");

    String  v_search = box.getString("p_search");
    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���    
%>
<html>
<head>
<title>�׷����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!--

// ���׽�Ʈ��  �˻�
function SearchGroup(p_action) {
	document.form1.action = "/servlet/controller.etest.ETestGroupServlet";
	document.form1.p_process.value = 'ETestGroupListPage';
	document.form1.p_action.value  = p_action;
    document.form1.submit();
}

// ���׽�Ʈ �߰����
function InsertGroupPage() {
	if (document.form1.s_grcode.value == '----') {
			alert("�����׷��� �����ϼ���.");
			return ;
	}
        window.self.name = "winSelectView";
        farwindow = window.open("", "openWinQuestion", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no, width = 1000, height = 667, top=0, left=0");
        document.form1.target = "openWinQuestion";
    	document.form1.action = "/servlet/controller.etest.ETestGroupServlet";
	    document.form1.p_process.value = 'ETestGroupInsertPage';
	    document.form1.submit();

        farwindow.window.focus();
        document.form1.target = window.self.name;
}

// ���׽�Ʈ �󼼺���,����
function UpdateGroupPage(p_subj) {
	if (document.form1.s_grcode.value == '----') {
			alert("�����׷��� �����ϼ���.");
			return ;
	}
        window.self.name = "winSelectView";
        farwindow = window.open("", "openWinQuestion", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=yes,copyhistory=no, width = 1000, height = 667, top=0, left=0");
        document.form1.target = "openWinQuestion";
    	document.form1.action = "/servlet/controller.etest.ETestGroupServlet";
	    document.form1.p_process.value = 'ETestGroupUpdatePage';
	    document.form1.p_etestsubj.value  = p_subj;
		document.form1.submit();

        farwindow.window.focus();
        document.form1.target = window.self.name;
}

// �˻� ��ȸ
function whenSelection(p_action) {

	document.form1.action = "/servlet/controller.etest.ETestGroupServlet";
     document.form1.p_process.value = 'ETestGroupListPage';
     document.form1.p_action.value  = p_action;

  if (p_action == "go"){
	if (document.form1.s_grcode.value == '----') {
			alert("�����׷��� �����ϼ���.");
			return ;
	}
  top.ftop.setPam();
  }
	 document.form1.submit();		
}

// �߰��� ȭ�� ���ε�
function ReloadPage(p_action) {
  document.form1.p_process.value = 'ETestGroupListPage';
  document.form1.p_action.value  = p_action;
  document.form1.submit();
}

// ����
function whenOrder(column) {
    if (document.form1.p_orderType.value == " asc") {
        document.form1.p_orderType.value = " desc";
    } else {
        document.form1.p_orderType.value = " asc";
    }

    document.form1.p_orderColumn.value = column;
    whenSelection("go");
}

// EnterŰ
function keypress(event){
	if(event.keyCode=="13") SearchGroup('go');
	return;
}
-->
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top"> 
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/etest/test_title01.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>
      <!----------------- form ���� ----------------->
      <table class="form_table_out" cellspacing="0" cellpadding="1">
	  <form name="form1" method="post" >
        <input type="hidden" name="p_process" value="">
        <input type="hidden" name="p_action"  value="">
        <input type="hidden" name="p_grcode"  value="">
        <input type="hidden" name="p_etestsubj"  value="">
        <input type="hidden" name="p_orderColumn">
        <input type="hidden" name="p_orderType" value="<%=v_orderType%>">           
        <tr>
          <td align="center">
            <table class="form_table_bg" cellspacing="0" cellpadding="0">
              <tr><td height="7"></td></tr>
              <tr>
                <td align="center">
                  <table class="form_table" cellspacing="0" cellpadding="0" width="99%">
                    <tr>
                      <td> <font color="red">��</font> 
                         <%= SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->
						 &nbsp; �з�<%=CodeConfigBean.getCodeGubunSelect (ETestBean.ETSUBJ_CLASS, "", 1, "s_upperclass", ss_upperclass, "onchange=javascript:whenSelection('change')", 2)%>
                         &nbsp; <%@ include file="/learn/admin/include/za_GoButton.jsp" %>
                      </td>
                    </tr>
                  </table>
               </td>
              </tr>
              <tr><td height="7"></td></tr>
            </table>
          </td>
        </tr>
      </table>
      <!----------------- form �� ----------------->
      <br>
      <!----------------- �¶����׽�Ʈ������, ��ȸ, �߰���ư ���� ----------------->
      <table cellpadding="0" cellspacing="0" width=970>
        <tr> 
          <td width="238" align="left"> E-TEST �׷�� : <input name="p_search" type="text" class="input" value="<%=v_search%>" onKeyDown="javascript:keypress(event);"></td>
		  <td width="635" align="left"><a href="javascript:SearchGroup('go')"><img src="/images/admin/button/btn_inquiry.gif" border="0"></a></td>
          <td width="95" align="right"><a href="javascript:InsertGroupPage()"><img src="/images/admin/button/btn_add.gif" border="0"></a></td>
        </tr>
        <tr> 
          <td height="3"></td>
		  <td height="3"></td>
		  <td height="3"></td>
        </tr>
      </form>  
      </table>
      <!----------------- �¶����׽�Ʈ������, ��ȸ, �߰���ư �� ----------------->
      <!----------------- �¶����׽�Ʈ �������� ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
        <tr> 
          <td colspan="5" class="table_top_line"></td>
        </tr>
        <tr>  
          <td width="6%" class="table_title">NO</td>
          <td class="table_title"><a href="javascript:whenOrder('a.etestsubj')" class="e">�׷��ڵ�</a></td>
          <td class="table_title"><a href="javascript:whenOrder('a.etestsubjnm')" class="e">�׷��</a></td>
          <td class="table_title"><a href="javascript:whenOrder('upperclassnm')" class="e">�з�</a></td>
          <td class="table_title"><a href="javascript:whenOrder('a.indate')" class="e">��������</a></td>
        </tr>
<%   ArrayList  list = (ArrayList)request.getAttribute("ETestGroupList");

            for (int i=0; i<list.size(); i++) {
                DataBox dbox = (DataBox)list.get(i);   %>
        <tr> 
          <td class="table_01"><%=(i+1)%></td>
          <td class="table_02_1"><%=dbox.getString("d_etestsubj") %></td>
          <td class="table_02_1"><a href="javascript:UpdateGroupPage('<%=dbox.getString("d_etestsubj") %>')" class='b'><%=dbox.getString("d_etestsubjnm") %></a></td>
          <td class="table_02_1"><%=dbox.getString("d_upperclassnm") %></td>
          <td class="table_02_1"><%=FormatDate.getFormatDate(dbox.getString("d_indate"), "yyyy-MM-dd HH:mm:ss") %></td>
        </tr>
<%  } %>        
      </table>
      <!----------------- �¶����׽�Ʈ �������� �� ----------------->
      <br>
    </td>
  </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
