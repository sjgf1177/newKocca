<%
//**********************************************************
//  1. ��      ��: ����
//  2. ���α׷���: za_SulmunTargetMember_I.java
//  3. ��      ��: ����� ���� ����� ���κ� ���
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//**********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.research.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

	String v_grcode = box.getSession("tem_grcode");
	System.out.println("�׷찪"+v_grcode);

	String v_end = box.getString("p_end");
	String v_onload = "";
	if(v_end.equals("0")) { v_onload = "onload='javascript:onload();'"; }
    
    String  ss_upperclass= box.getString("s_upperclass");
    String  ss_subj      = box.getString("s_subj");
    String  ss_grcode       = box.getString("s_grcode");
    String  ss_year       = box.getString("s_gyear");
    String  ss_subjseq    = box.getString("s_subjseq");
    String  v_sulpapernum = box.getString("s_sulpapernum");
    String  v_action     = box.getString("p_action");
    String  v_process = box.getString("p_process");

    String  ss_searchtype2 = box.getString("s_searchtype2");		// ȸ������  ����/���/����
    String  ss_searchtype = box.getString("s_searchtype");		// �˻�����
    String  ss_searchtext = box.getString("s_searchtext");		//�˻���

	String v_reloadlist = box.getString("p_reloadlist");    
    
    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���
    
    int     v_pageno   = box.getInt("p_pageno");
    int     v_pagesize = box.getInt("p_pagesize");

    //��������
    if (v_pageno == 0)  v_pageno = 1;
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));

    //�������� ���ڵ��
    if (v_pagesize == 0)  v_pagesize = 10;

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<script language="JavaScript">
<!--
// ��ȸ �˻�
function MemberSearch(p_action) {
  if (p_action == 'go') {
    if (chkData() == false) {
      return; 
    }
  }
  document.form2.p_process.value = 'MemberTargetListPage';
  document.form2.p_action.value  = p_action;
  document.form2.submit();
}

// �˻��� üũ
function chkData() {
  if (blankCheck(document.form2.s_searchtext.value)) {
    alert('�˻�� �Է��Ͻʽÿ�.');
    document.form2.s_searchtext.focus();
    return false;
  }
}

// ��� ����
function InsertSulmunMember() {
  var chkselected = chkSelected();
  if (chkselected < 1) {
    alert('����ڸ� �����ϼ���');
    return;
  }

  document.form2.p_process.value = 'SulmunMemberInsert';
  document.form2.p_action.value  = 'go';
  document.form2.submit();
}

// üũ�ڽ� ����
function chkSelected() {
  var selectedcnt = 0;
  if(document.form2.all['p_checks'] == '[object]') {
    if (document.form2.p_checks.length > 0) {
      for (i=0; i<document.form2.p_checks.length; i++) {
        if (document.form2.p_checks[i].checked == true) {
	      selectedcnt++;
	    }  
      }
    } else {
      if (document.form2.p_checks.checked == true) {
	    selectedcnt++;
      }
    }
  }
  return selectedcnt; 
}


function whenSelection(p_action) {
  document.form2.p_process.value = 'MemberTargetListPage';
  document.form2.p_action.value  = p_action;
  document.form2.submit();
}

// üũ�ڽ� ��ü����
function checkall(){
    if(document.form2.p_chkeckall.checked){
      whenAllSelect();
    }
    else{
      whenAllSelectCancel();
    }
}

// üũ�ڽ� ��ü ���õ�.
function whenAllSelect() {
  if(document.form2.all['p_checks'] == '[object]') {
    if (document.form2.p_checks.length > 0) {
      for (i=0; i<document.form2.p_checks.length; i++) {
        document.form2.p_checks[i].checked = true;
      }
    } else {
      document.form2.p_checks.checked = true;
    }
  } 
}

// üũ�ڽ� ��ü ���� ��ҵ�.
function whenAllSelectCancel() {
  if(document.form2.all['p_checks'] == '[object]') {
    if (document.form2.p_checks.length > 0) {
      for (i=0; i<document.form2.p_checks.length; i++) {
        document.form2.p_checks[i].checked = false;
      }
    } else {
      document.form2.p_checks.checked = false;
    }
  } 
}

// sorting ��ȸ
function whenOrder(column) {
	if (document.form2.p_orderType.value == " asc") {
		document.form2.p_orderType.value = " desc";
	} else {
		document.form2.p_orderType.value = " asc";
	}

    document.form2.p_orderColumn.value = column;
    whenSelection("go");
}


// ����Ű ����
function press_enter(e) { 
	if (e.keyCode =='13'){  MemberSearch('go');  }
}
-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">

	    <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/research/r_title03.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
	    <!----------------- title �� ----------------->
	    <br>
		        <!-------------������ ����-------------------------->
 <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>���κ� ���</td>
        </tr>
        <tr> 
          <td height=6></td>
          <td height=6></td>
        </tr>
      </table> 
        <!--------------������ ��---------------------------->

	    <!----------------- ����, ����, ���۽ð�, ����, �ҿ�ð� ���� ----------------->
	    <table width=97% cellspacing="0" cellpadding="1" class="open_form_table_out">
      <form name="form2" method="post" action="/servlet/controller.research.SulmunTargetMemberServlet">
        <input type="hidden" name="p_process" value="">
        <input type="hidden" name="p_action"  value="">
        <input type="hidden" name="s_subj"       value="TARGET">
        <input type="hidden" name="p_grcode"       value="<%=ss_grcode%>">
		<input type="hidden" name="s_grcode"       value="<%=ss_grcode%>">
        <input type="hidden" name="p_sulpapernum"       value="<%=v_sulpapernum%>">
        <input type="hidden" name="s_sulpapernum"  value="<%=v_sulpapernum%>">
        <input type="hidden" name="p_gyear"       value="<%=ss_year%>">
		<input type="hidden" name="s_gyear"       value="<%=ss_year%>">
		<input type="hidden" name="p_reloadlist" value="">
	    <input type="hidden" name="p_pageno" value="<%=v_pageno%>">
        <input type="hidden" name="p_pagesize" value="<%=v_pagesize%>">

	<input type="hidden" name="p_orderColumn">
	<input type="hidden" name="p_orderType" value="<%=v_orderType%>">
      </table>
      <!----------------- ����, ����, ���۽ð�, ����, �ҿ�ð� �� ----------------->
      <!----------------- �з� ���� ----------------->
      <table border=0 width="95%" cellpadding="0" cellspacing="0" class="table1">
        <tr>
          <td valign="middle"  align=right>
			<INPUT TYPE="radio" NAME="s_searchtype2" value="ALL" 
				<% if (ss_searchtype2.equals("ALL") || ss_searchtype2.equals("") ) { %>checked<% } %> >��ü 	
			<INPUT TYPE="radio" NAME="s_searchtype2" value="P" <% if (ss_searchtype2.equals("P")) { %>checked<% } %> >���� 
			<INPUT TYPE="radio" NAME="s_searchtype2" value="C" <% if (ss_searchtype2.equals("C")) { %>checked<% } %> >��� 
			<INPUT TYPE="radio" NAME="s_searchtype2" value="U" <% if (ss_searchtype2.equals("U")) { %>checked<% } %> >���� 
			&nbsp;&nbsp;
            <select name="s_searchtype" class="input">
              <option value="1" <% if (ss_searchtype.equals("1")) { %>selected<% } %>>ID</option>
              <option value="2" <% if (ss_searchtype.equals("2")) { %>selected<% } %>>����</option>
            </select>&nbsp; 
            <input name="s_searchtext" type="text" class="input" value="<%=ss_searchtext%>" onkeypress="press_enter(event)">                      
            &nbsp; <a href="javascript:MemberSearch('go')" class="c"><img src="/images/admin/button/btn_search02.gif" border="0" align='center'></a>
            &nbsp;&nbsp;&nbsp;
          </td>
		</tr>
      </table><br>
      <!----------------- �з� �� ----------------->
      <!----------------- ���κ� ��� ���� ----------------->
      <table width=97% cellspacing="1" cellpadding="5" class="open_table_out">
        <tr> 
          <td colspan="10" class="table_top_line"></td>
        </tr>
        <tr> 
          <td width="5%" class="table_title">NO</td>
          <td width="13%" class="table_title"><a href="javascript:whenOrder('membergubun')" class="e">ȸ������</a></td>          
          <td width="11%" class="table_title"><a href="javascript:whenOrder('userid')" class="e">ID</a></td>
          <td width="11%" class="table_title"><a href="javascript:whenOrder('name')" class="e">����</a></td>
          <td width="5%" class="table_title"><input type="checkbox" name="p_chkeckall" onClick="javascript:checkall()"></td>
        </tr>
<%  
     if(!v_process.equals("SulmunMemberInsertPage")) {
         ArrayList list = (ArrayList)request.getAttribute("MemberTargetList");
            for (int i=0; i<list.size(); i++) {
                DataBox dbox  = (DataBox)list.get(i); 
				
				%>

		  		<td class="table_02_1"><%=i+1%></td>
          <td class="table_01"><%=dbox.getString("d_membergubunnm")%> </td>		  
          <td class="table_01"><%=dbox.getString("d_userid")%></td>
          <td class="table_02_1"><%=dbox.getString("d_name")%></td>
          <td class="table_02_1">
            <input type="checkbox" name="p_checks" value="<%=dbox.getString("d_userid")%>">
          </td>
        </tr>
<%      }
      }  %>
      </form>   
      </table>
      <!----------------- ���κ� ��� �� ----------------->
      <!----------------- ���, �ݱ� ��ư ���� ----------------->
      <table cellspacing="0" cellpadding="0" >
	          <tr>
          <td>&nbsp;</td>
          <td></td>
          <td>&nbsp;</td>
        </tr>

        <tr> 
          <td><a href="javascript:InsertSulmunMember()"><img src="/images/admin/button/btn_apply.gif" border="0"></a></td>
          <td width=8></td>
          <td><a href="javascript:window.close()"><img src="/images/admin/button/btn_close.gif" border="0"></a></td>
        </tr>
      </table>
      <!----------------- ���, �ݱ� ��ư �� ----------------->
      <br>
    </td>
  </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
