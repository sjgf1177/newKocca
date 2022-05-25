<%
//**********************************************************
//  1. ��		��: ����������
//  2. ���α׷���: za_off_grseq_L.jsp
//  3. ��		��: ����������
//  4. ȯ		��: JDK 1.5
//  5. ��		��: 1.0
//  6. ��		��: swchoi 2009.11.18
//  7. ��		��: 
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %> 
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%!
	private final String NULL = "";
	private String chkAcceptResult(ArrayList<DataBox> acceptResultList, String p_acceptResult) {
		if(p_acceptResult.length() == 2 && (p_acceptResult.charAt(0) == 'N' || p_acceptResult.charAt(1) == 'Y' || p_acceptResult.charAt(1) == 'N')) {
			return SelectBoxBean.getSelectedString(acceptResultList, "p_acceptResult", p_acceptResult, NULL);
		}
		else
			return SelectBoxBean.getSelectBoxString(acceptResultList, "p_acceptResult", p_acceptResult, NULL);
	}
%>
<%
	RequestBox box = null;
	box = (RequestBox)request.getAttribute("requestbox");

	//DEFINED in relation to select START
	String  ss_action	= box.getString("s_action");
	String  ss_year = box.getStringDefault("s_year", FormatDate.getDate("yyyy"));	//����
	String  ss_subj = box.getString("s_subjcode");									//����
	String  ss_subjseq = box.getString("s_subjseq");								//��������
	String p_param1 = box.getString("p_param1");
	String p_param2 = box.getString("p_param2");
	String s_subjsearchkey = box.getString("s_subjsearchkey");
	//DEFINED in relation to select END
	
	String  v_newyear       = box.getString("p_newyear");                      // ���� �԰��� ����
    String  v_newsubj       = box.getString("p_newsubj");                      // ���� �԰��� ����
    String  v_newsubjseq    = box.getString("p_newsubjseq");                   // ���� �԰��� ��������
	
	
	
	ArrayList list		= null;
	if(ss_action.equals("go")){	//go button ���ýø� list ���
		list = (ArrayList)request.getAttribute("resultList");
	}

	String  v_orderType	= box.getStringDefault("p_orderType"," asc"); //���ļ���
%>
<html>
<head>
<title>�������ΰ��� | ������߰�</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script> 
<SCRIPT LANGUAGE="JavaScript">
<!--
// �˻�
function whenSelection(ss_action) {
	document.form1.s_action.value = ss_action;
	document.form1.p_process.value = 'studentListPage';
	document.form1.submit();
}
//����
function whenOrder(column) {
	if (document.form1.p_orderType.value == " asc") {
		document.form1.p_orderType.value = " desc";
	} else {
		document.form1.p_orderType.value = " asc";
	}

	document.form1.s_action.value = "go";
	document.form1.p_process.value = 'studentListPage';	
	document.form1.p_orderColumn.value = column;
	
	document.form1.submit();
}

//���ô��� �����
function chkeckall(o){
	if(document.form1.all['p_checks'] == '[object]') {
		if (document.form1.p_checks.length > 0) {
			for (i=0; i<document.form1.p_checks.length; i++) {
			document.form1.p_checks[i].checked = o.checked;
			}
		} else {
			document.form1.p_checks.checked = o.checked;
		}
	}
}

function whenApprovalProcess() {
	document.ff.p_process.value="insert";
	document.ff.submit();
}

function update() {
	var inputObj = document.form1.p_dinsertreason;
	var userObj  = document.getElementsByName("p_userid");
    var radioObj = document.getElementsByName("p_checks");
    var radioLen = radioObj.length;
    var cnt = 0;

    for(var i = 0 ; i < radioLen ; i++) {
        if(radioObj[i].checked) {
        	document.form1.p_newuserid.value = userObj[i].value;
            cnt++;
        }
    }

    if(cnt == 0 ) {
        alert("�������� �����ϼ���."); return;
    } 

    if(inputObj.value == "") {
        alert("�����԰� ������ �Է��ϼ���.");
        inputObj.focus();
        return
    }

    var bRtn = confirm("������ �������� ���� �԰���Ű�ڽ��ϱ�?");

    if(!bRtn) return;
	
	document.form1.p_process.value="dinsert";
	document.form1.submit();
}

function resetDinsertReason() {
	var inputObj = document.form1.p_dinsertreason;

	inputObj.value = "";
}
-->
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<div id="existSubjSeqDiv"></div>
<div id=minical OnClick="this.style.display='none';" oncontextmenu='return false'
ondragstart='return false' onselectstart='return false'
style="background : buttonface; margin: 5; margin-top: 2;border-top: 1
solid buttonhighlight;border-left: 1 solid buttonhighlight;border-right: 1
solid buttonshadow;border-bottom: 1 solid buttonshadow;width:155;display:none;position: absolute; z-index: 99">
</div>
<form name="form1" method="post" action="/servlet/controller.off.OffStudentManageAdminServlet">
	<input type="hidden" name="p_process"  value="">
	<input type="hidden" name="p_subj"	 value="">
	<input type="hidden" name="p_subjnm"	value="">
	<input type="hidden" name="s_action"  value="">
	<input type="hidden" name="p_orderColumn">
	<input type="hidden" name="p_orderType" value="<%=v_orderType%>">
	
	<input type="hidden" name="p_newyear"     value="<%=v_newyear%>">
    <input type="hidden" name="p_newsubj"     value="<%=v_newsubj%>">
    <input type="hidden" name="p_newsubjseq"  value="<%=v_newsubjseq%>">
    <input type="hidden" name="p_newuserid"  value="">
    
<table id="listForm" width=100% border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td align="center" valign="top">
		<!----------------- title ���� ----------------->
		<table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
		<tr> 
			<td><img src="/images/admin/portal/s.1_off05.gif" ></td>
			<td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
		</tr>
		</table>
		<!----------------- title �� ----------------->
		<br>
		<!----------------- form ���� ----------------->
		<table cellspacing="0" cellpadding="1" class="form_table_out">

			
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
						<!------------------- ���ǰ˻� ���� ------------------------->
						 <table cellspacing="0" cellpadding="0" width="99%">
							<tr>
								<td>
									<table border="0" cellspacing="0" cellpadding="0" width="99%">
										<tr>
											<td>
												���� <kocca_select:select name="s_year" sqlNum="off.year"  param=" "
													onChange="changes_middleclass(this.value);" attr=" " selectedValue="<%= ss_year %>" isLoad="true" all="none" />
												������ <kocca_select:select name="s_subjcode" sqlNum="off.subj"  param="<%= ss_year %>"  param2="ALL"  param3="ALL"  param4="ALL"
													onChange="changes_subjseq($('#s_year').val(),this.value);" attr=" " selectedValue="<%= ss_subj %>" isLoad="true" all="no" />
												���� <kocca_select:select name="s_subjseq" sqlNum="off.subjseq" param="<%= ss_year %>"  param2="<%= ss_subj %>"
													onChange="" attr=" " selectedValue="<%= ss_subjseq %>" isLoad="true" all="true" />
											</td>
											<td rowspan=2 width="10%" align="right"><%@ include file="/learn/admin/include/za_GoButton.jsp" %><!-- whenSelection('go') --></td>
										</tr>
										<tr>
											<td>
												<select name="p_param1"><option value="name">�̸�</option><option value="id" <%=p_param1.equals("id")? "selected" : ""%>>ID</option></select>
												<input type="text" name="p_param2" size="17" onkeypress="if(event.keyCode=='13') whenSelection('go');" value="<%=p_param2%>">
											</td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
						<!-------------------- ���ǰ˻� �� ---------------------------->
						</td>
					</tr>
					</table>
				</td>
				</tr>
				<tr>
				<td height="7" width="99%"></td>
				</tr>
			</table>
			</td>
		</tr>
		</table>
		<br>
		<!----------------- �߰� ��ư ���� ----------------->

		<!----------------- ���� ���� ���� ----------------->
		<table cellspacing="1" cellpadding="5" class="table_out">
		<tr>
			<td colspan="7" class="table_top_line"></td>
		</tr>
		<tr>
			<td class="table_title">����</td>
			<td class="table_title" width="34"><b>NO</b></td>
			<td class="table_title"><a href="javascript:whenOrder('userid')" class="e">ID</a></td>
			<td class="table_title"><a href="javascript:whenOrder('name')" class="e">����</a></td>
			<td class="table_title">�й�</td>
			<td class="table_title"><a href="javascript:whenOrder('subjnm')" class="e">��������</a></td>
			<td class="table_title">��������</td>
		</tr>
<%  if(ss_action.equals("go") && list!= null){	//go button ���ýø� list ���
	DataBox data = null;
	String acceptResult = null;
	for (int i=0; i<list.size(); i++) {
		data  = (DataBox)list.get(i);
%>
		<tr id="<%=data.get("d_subjnm")%>">
			<td class="table_02_1">
			     <input type="radio" name="p_checks" id="p_checks" value="<%= data.get("d_studentno") %>" onclick="resetDinsertReason();"/>
			     <input type="hidden" name="p_userid" value = "<%=data.get("d_userid") %>"/>
			</td>
			<td class="table_01">
				<%=String.valueOf(i+1)%>
			</td>
			<td class="table_01"><%=data.get("d_userid") %></td>
			<td class="table_01"><%=data.get("d_name") %></td>
			<td class="table_01"><%=data.get("d_studentno") %></td>
			<td class="table_01"><%=data.getDate("d_confirmdate") %></td>
			<td class="table_01"><%=data.get("d_stustatusnm") %></td>
		</tr>
<%  } %>

		<% if (list.size()==0) {%>
			<tr><td colspan=7 class="table_02_1">�˻��� ����� �����ϴ�.</td></tr>  
		<% } %>
<%} %>
		</table>
		<!----------------- ���� ���� �� ----------------->
		<br>
		 <table cellspacing="1" cellpadding="5" class="open_table_out">
              <tr>
                <td class="table_title" width="20%" >�����԰� ����</td>
                <td class="table_02_2"  width="80%" ><textarea name="p_dinsertreason" cols='80' rows='5' style="width: 100%; height: 50;"></textarea></td>
              </tr>
         </table>
         <br/>
		<!----------------- �ݱ� ��ư ���� ----------------->
            <table cellspacing="0" cellpadding="0" class="open_table1">
              <tr> 
                <td align="right" style="padding-top=10">
                <a href="javascript:update()"><img src="/images/admin/button/btn_add.gif" border="0"></a>
                <a href="javascript:self.close()"><img src="/images/admin/button/btn_close.gif" border="0"></a>
                </td>
              </tr>
            </table>
            <!----------------- �ݱ� ��ư �� ----------------->
		
	</td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>
</table>
</form>
</body>
</html>
