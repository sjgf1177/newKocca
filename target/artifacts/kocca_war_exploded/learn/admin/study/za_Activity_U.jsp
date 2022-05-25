
<%
	//**********************************************************
	//  1. ��      ��: ������ / ��Ÿ  ����
	//  2. ���α׷���: za_Activity_U.jsp
	//  3. ��      ��: ������ ����
	//  4. ȯ      ��: JDK 1.5
	//  5. ��      ��: 1.0
	//  6. ��      ��: 2009.11.13
	//***********************************************************
%>
<%@ page contentType="text/html;charset=MS949"%>
<%@page errorPage="/learn/library/error.jsp"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.credu.study.*"%>
<%@ page import="com.credu.propose.*"%>
<%@ page import="com.credu.library.*"%>
<%@ page import="com.credu.common.*"%>
<%@ page import="com.credu.study.*"%>
<jsp:useBean id="conf" class="com.credu.library.ConfigSet" scope="page" />
<%
	//DEFINED class&variable START
	RequestBox box		= (RequestBox) request.getAttribute("requestbox");
	String	s_gadmin	= box.getSession("gadmin");
	String	v_process	= box.getString("p_process");
    int		v_pageno	= box.getInt("p_pageno");
    int		v_pagesize	= box.getInt("p_pagesize");

	String	v_subj		= "";
	String	v_year		= "";
	String	v_subjnm	= "";
	String	v_subjseq	= "";
	String	v_subjseqgr	= "";
	String	v_userid	= "";
	String	v_name		= "";
	int		v_logincnt	= 0;
	int		v_qnacnt	= 0;
	int		v_toroncnt	= 0;
	double	v_etc1		= 0;
	double	v_etc2		= 0;
	double	v_wetc1		= 0;
	double	v_wetc2		= 0;
	double	v_avetc1	= 0;
	double	v_avetc2	= 0;

	ActivityAdminData data = null;
	//DEFINED class&variable END

	//DEFINED in relation to select START
    String  ss_grcode    = box.getString("s_grcode");        //�����׷�
    String  ss_gyear     = box.getString("s_gyear");         //�⵵
    String  ss_grseq     = box.getString("s_grseq");         //��������
    String  ss_uclass    = box.getString("s_uclass");        //�����з�
    String  ss_subjcourse= box.getString("s_subjcourse");    //����&�ڽ�
    String  ss_subjseq   = box.getString("s_subjseq");       //���� ����
    String  ss_action    = box.getString("s_action");
    //DEFINED in relation to select END

	data = (ActivityAdminData) request.getAttribute("selectViewActivity");

	v_subj		= data.getSubj();
	v_year		= data.getYear();
	v_subjnm	= data.getSubjnm();
	v_subjseq	= data.getSubjseq();
	v_subjseqgr	= data.getSubjseqgr();
	v_userid	= data.getUserid();
	v_name		= data.getName();
	v_logincnt	= data.getLogincnt();
	v_qnacnt	= data.getQnacnt();
	v_toroncnt	= data.getToroncnt();
	v_etc1		= data.getEtc1();
	v_etc2		= data.getEtc2();
	v_wetc1		= data.getWetc1();
	v_wetc2		= data.getWetc2();
	v_avetc1	= data.getAvetc1();
	v_avetc2	= data.getAvetc2();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language="javascript" src="/script/cresys_lib.js"></script>
<script language="JavaScript">
<!--
    // �� ����
    function updateActivity() {

	    if (document.form1.p_etc1.value > 100) {
	        alert("�������� 100�� �����Դϴ�.");
	        document.form1.p_etc1.focus();
	        return;
	    }
	    if (document.form1.p_etc2.value > 100) {
	        alert("��Ÿ�� 100�� �����Դϴ�.");
	        document.form1.p_etc2.focus();
	        return;
	    }
        
        document.form1.p_process.value = "update";
        document.form1.action = "/servlet/controller.study.ActivityAdminServlet";
        document.form1.submit();
    }

	// �������
	function listActivity() {
	    document.form1.target = "_self";
		document.form1.p_process.value='listPage';
		document.form1.action='/servlet/controller.study.ActivityAdminServlet';
		document.form1.submit();
	}

	// �����
	function insertCounsel() {
	        window.self.name = "ActivityUpdate";
	        document.form1.p_subjyearsubjseq.value= '';
	        open_window("openCounsel","","50","50","800","650", false,false,true,true,true);
	        document.form1.target = "openCounsel";
	        document.form1.action='/servlet/controller.study.StudyStatusAdminServlet';
	        document.form1.p_process.value = 'CounselInsertPage';
	        document.form1.submit();

	        document.form1.target = window.self.name;
	}

	// // �����2
	function insertCounsel2(subj, year, subjseq) {
	        window.self.name = "ActivityUpdate";
	        document.form1.p_subjyearsubjseq.value= subj+"/"+year +"/"+subjseq;
	        open_window("openCounsel","","50","50","800","650", false,false,true,true,true);
	        document.form1.target = "openCounsel";
	        document.form1.action='/servlet/controller.study.StudyStatusAdminServlet';
	        document.form1.p_process.value = 'CounselInsertPage';
	        document.form1.submit();

	        document.form1.target = window.self.name;
	}


	//��㳻������
	function viewCounsel(no) {
	     window.self.name = "ActivityUpdate";
	     document.form1.p_no.value= no;
	     open_window("openCounsel","","50","50","800","650", false,false,true,true,true);
	     document.form1.target = "openCounsel";
	     document.form1.action='/servlet/controller.study.StudyStatusAdminServlet';
	     document.form1.p_process.value = 'CounselUpdatePage';
	     document.form1.submit();

	     document.form1.target = window.self.name;
	}

	// ��㳻������
	function viewCounsel(no) {
	    window.self.name = "ActivityUpdate";
	    document.form1.p_no.value= no;
	    open_window("openCounsel","","50","50","800","650", false,false,true,true,true);
	    document.form1.target = "openCounsel";
	    document.form1.action='/servlet/controller.study.StudyStatusAdminServlet';
	    document.form1.p_process.value = 'CounselUpdatePage';
	    document.form1.submit();

	    document.form1.target = window.self.name;
	}

	//Q&A��ȭ�� �������� �̵�
	function viewHomeqna(seq, upfilecnt, userid, types, type) {
	    window.self.name = "ActivityUpdate";
	    open_window("openHomeqna","","50","50","800","650", false,false,true,"yes","yes");
	    document.form1.target = "openHomeqna";
	    document.form1.action='/servlet/controller.study.StudyStatusAdminServlet';
	    document.form1.p_process.value = 'ViewHomeqna';

	    document.form1.p_seq.value = seq;
	    document.form1.p_userid.value   = userid;
	    document.form1.p_types.value    = types;
	    document.form1.pp_type.value    = type;
	    document.form1.p_upfilecnt.value = upfilecnt;
	    
	    document.form1.submit();

	    document.form1.target = window.self.name;
	}

	//��� �� ������
	function viewToron(seq, subj, year, subjseq, tpcode) {
	    window.self.name = "ActivityUpdate";
	    open_window("openToron","","50","50","800","650", false,false,true,"yes","yes");
	    document.form1.target = "openToron";
	    document.form1.action='/servlet/controller.study.ActivityAdminServlet';
	    document.form1.p_process.value = 'ViewToron';

	    document.form1.p_seq.value     = seq;
	    document.form1.p_subj.value    = subj;
	    document.form1.p_year.value    = year;
	    document.form1.p_subjseq.value = subjseq;
	    document.form1.p_tpcode.value  = tpcode;
	    
	    document.form1.submit();

	    document.form1.target = window.self.name;
	}

	//�������� ��ȭ�� �������� �̵�
	function viewQna(seq, subj, year, subjseq) {
	    window.self.name = "ActivityUpdate";
	    open_window("openQna","","50","50","800","650", false,false,true,"yes","yes");
	    document.form1.target = "openQna";
	    document.form1.action='/servlet/controller.study.StudyStatusAdminServlet';
	    document.form1.p_process.value = 'ViewQna';

	    document.form1.p_seq.value     = seq;
	    document.form1.p_subj.value    = subj;
	    document.form1.p_year.value    = year;
	    document.form1.p_subjseq.value = subjseq;
	    
	    document.form1.submit();

	    document.form1.target = window.self.name;
	}

	//�з� ����
	function selectMcode() {
	        document.form1.action='/servlet/controller.study.StudyStatusAdminServlet';
	        document.form1.p_process.value = 'ActivityUpdate';
	        document.form1.submit();
	}

	//���ڵ�з� ����
	function selectType() {
	        document.form1.action='/servlet/controller.study.StudyStatusAdminServlet';
	        document.form1.p_process.value = 'ActivityUpdate';
	        document.form1.submit();
	}

	//������ �̵�
	function go(index) {
	document.form1.p_action.value = "go";
	  document.form1.p_pageno.value = index;
	  document.form1.action = "/servlet/controller.study.StudyStatusAdminServlet";
	  document.form1.p_process.value = "ActivityUpdate";
	  document.form1.submit();
	}
	
	//������ �̵�
	function goPage(pageNum) {
	document.form1.p_action.value = "go";
	   document.form1.p_pageno.value = pageNum;
	   document.form1.action = "/servlet/controller.study.StudyStatusAdminServlet";
	   document.form1.p_process.value = "ActivityUpdate";
	   document.form1.submit();
	}
	
	//���ڸ� �Է� KeyDown �̺�Ʈ (keyPressCheck�� ���û���ؾ���, �ѱ��� ���� �ȵ�)
	function keyDownCheck(P) {
	   var sKeyCode  = event.keyCode;
	   var sKeyValue = String.fromCharCode(sKeyCode);
	   var sKeyCheck = "";
	   var sTmpKey1  = 0;
	   var sTmpKey2  = 0;
	
	   if (P == "Y") {
	      sKeyCheck = "-0123456789";
	      sTmpKey1  = 109;
	      sTmpKey2  = 189;
	   }
	   else {
	      sKeyCheck = "0123456789";
	      sTmpKey1  = 8;
	      sTmpKey2  = 8;
	   }
	   if (sKeyCheck.indexOf(sKeyValue) > -1 || sKeyCode == sTmpKey1 || sKeyCode == sTmpKey2 || sKeyCode == 8 || sKeyCode == 9 || sKeyCode == 110 || sKeyCode == 190 || sKeyCode == 46 || sKeyCode == 16 || sKeyCode == 17 || (sKeyCode >= 96 && sKeyCode <= 105)|| (sKeyCode >= 35 && sKeyCode <= 40) ) {
	      event.returnValue = true;
	   }
	   else {
	    event.keyCode = 0;
	      event.returnValue = false;
	   }
	}
	
	// ���ڸ� �Է� KeyPress �̺�Ʈ (keyDownCheck�� ���û���ؾ���, �ѱ��� ���� �ȵ�)
	function keyPressCheck(P) {
	   var sKeyCode  = event.keyCode;
	   var sKeyValue = String.fromCharCode(sKeyCode);
	   var sKeyCheck = "";
	   if (P == "Y") {
	      sKeyCheck = "-0123456789";
	   }
	   else {
	      sKeyCheck = "0123456789";
	   }
	   if (sKeyCheck.indexOf(sKeyValue) > -1 || sKeyCode == 46) {
	      event.returnValue = true;
	   }
	   else {
	    event.keyCode = 0;
	      event.returnValue = false;
	   }
	}

	function fnCalcAvetc1() {
		var etc1 = document.form1.p_etc1.value;
		document.all.SPN_AVETC1.innerHTML = etc1 * <%= v_wetc1 %> / 100;
	}

	function fnCalcAvetc2() {
		var etc2 = document.form1.p_etc2.value;
		document.all.SPN_AVETC2.innerHTML = etc2 * <%= v_wetc2 %> / 100;
	}
	//-->
</script>
<script language="VbScript">
'���ڷ� �ٲٱ�
Public Function SetNum(i_sInVals)
   SetNum = Replace(i_sInVals, ",", "")
End Function

Dim sPubSelYN
sPubSelYN = True
Public Function SetNumObj(what)
   On Error Resume Next

   what.value = SetNum(what.value)

   If sPubSelYN Then
      what.select()
   End If

   sPubSelYN = True
End Function

Public Sub fnKeyUpCheck(what)
   If InStr(what.value, " ") Then
      what.value = Trim(what.value)
   End If

   If what.value = "" Then
      Exit Sub
   End If

   sKeyTmpVal = what.value

   If Len(sKeyTmpVal) = 1 And Left(sKeyTmpVal, 1) = "-" Then
   Else
      If Not IsNumeric(sKeyTmpVal) And Len(sKeyTmpVal) > 0 Then
         sPubSelYN = False
         what.blur()
         what.focus()
         'what.value = sKeyTmpVal& " "
         'what.value = Replace(sKeyTmpVal, right(sKeyTmpVal,1), "")
         If Right(sKeyTmpVal, 1) = "-" Then
            what.value = "-" & Replace(sKeyTmpVal, right(sKeyTmpVal,1), "")
         Else
            what.value = Replace(sKeyTmpVal, right(sKeyTmpVal,1), "")
         End If
      End If
   End If

   If what.value = "" Then
      what.value = "0"
   End If

   '���� ���������� KeyUp �� �ؾߵ� ���� ������ fnPlus�� �� ���������� �����ؼ� ���� �ȴ�
   On Error Resume Next
   fnPlus()
   Err.Clear
End Sub
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post">
  <input type="hidden" name="p_postgubun"  value="<%=v_process%>">
  <input type="hidden" name="p_process"    value="<%=v_process%>">
  <input type="hidden" name="s_action"     value="<%=ss_action%>">     <!--in relation to select-->
  <input type="hidden" name="s_grcode"     value="<%=ss_grcode%>">     <!--in relation to select-->
  <input type="hidden" name="s_gyear"      value="<%=ss_gyear%>">      <!--in relation to select-->
  <input type="hidden" name="s_grseq"      value="<%=ss_grseq%>">      <!--in relation to select-->
  <input type="hidden" name="s_uclass"     value="<%=ss_uclass%>">     <!--in relation to select-->
  <input type="hidden" name="s_subjcourse" value="<%=ss_subjcourse%>"> <!--in relation to select-->
  <input type="hidden" name="s_subjseq"    value="<%=ss_subjseq%>">    <!--in relation to select-->
  <input type="hidden" name="p_seq"        value="">
  <input type="hidden" name="p_types"      value="">
  <input type="hidden" name="p_subj"       value="<%= v_subj %>">
  <input type="hidden" name="p_year"       value="<%= v_year %>">
  <input type="hidden" name="p_subjseq"    value="<%= v_subjseq %>">
  <input type="hidden" name="p_tpcode"     value="">
  <input type="hidden" name="p_userid"     value="<%= v_userid %>">
  <input type="hidden" name="p_pageno"     value="<%=v_pageno%>">
  <input type="hidden" name="p_pagesize"   value="<%=v_pagesize%>">

  <table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
	  <td align="center" valign="top"><!----------------- title ���� ----------------->
	    <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
		  <tr>
		    <td><img src="/images/admin/portal/s.1_40.gif"></td>
			<td align="right"><img src="/images/admin/common/sub_title_tail.gif"></td>
			</tr>
		</table>
		<!----------------- title �� ----------------->
        <br>

		<!----------------- ������ ����ȸ ���� ----------------->
		<table class="table_out" cellspacing="1" cellpadding="4" border="0">
		  <tr>
			<td colspan="4" class="table_top_line"></td>
		  </tr>
		  <tr>
			<td width="15%" class="table_title"><b>������</b></td>
			<td class="table_02_2"><%= v_subjnm %></td>
		  </tr>
		  <tr>
			<td width="15%" class="table_title"><b>��������</b></td>
			<td class="table_02_2"><%= v_subjseqgr %></td>
		  </tr>
		  <tr>
			<td width="15%" class="table_title"><b>����</b></td>
			<td class="table_02_2"><%= v_name %></td>
		  </tr>
		  <tr>
			<td width="15%" class="table_title"><b>����Ƚ��</b></td>
			<td class="table_02_2"><%= v_logincnt %></td>
		  </tr>
		  <tr>
		    <td width="15%" class="table_title"><b>����������</b></td>
			<td class="table_02_2"><%= v_qnacnt %></td>
		  </tr>
		  <tr>
			<td width="15%" class="table_title"><b>��й�</b></td>
			<td class="table_02_2"><%= v_toroncnt %></td>
		  </tr>
		  <tr>
			<td colspan="4" class="table_top_line"></td>
		  </tr>
		  <tr>
			<td width="15%" class="table_title"><b>������ ����</b></td>
			<td class="table_02_2"><input type="text" class="input" name="p_etc1" size="20" maxlength="3" value="<%= v_etc1 %>" onKeyDown=keyDownCheck('N'); onKeyPress=keyPressCheck('N') onFocus='SetNumObj(this)' onKeyUp='fnKeyUpCheck(this);fnCalcAvetc1();' style='text-align:right;'"></td>
		  </tr>
		  <tr>
			<td width="15%" class="table_title"><b>������ ����</b></td>
			<td class="table_02_2"><%= v_wetc1 %></td>
		  </tr>
		  <tr>
			<td width="15%" class="table_title"><b>������ ��</b></td>
			<td class="table_02_2"><b><span id="SPN_AVETC1" style="color:blue"><%= v_avetc1 %></span></b></td>
		  </tr>
		  <tr>
			<td colspan="4" class="table_top_line"></td>
		  </tr>
		  <tr>
			<td width="15%" class="table_title"><b>��Ÿ ����</b></td>
			<td class="table_02_2"><input type="text" class="input" name="p_etc2" size="20" maxlength="3" value="<%= v_etc2 %>" onKeyDown=keyDownCheck('N'); onKeyPress=keyPressCheck('N') onFocus='SetNumObj(this)' onKeyUp='fnKeyUpCheck(this);fnCalcAvetc2();' style='text-align:right;'"></td>
		  </tr>
		  <tr>
			<td width="15%" class="table_title"><b>��Ÿ ����</b></td>
			<td class="table_02_2"><%= v_wetc2 %></td>
		  </tr>
		  <tr>
			<td width="15%" class="table_title"><b>��Ÿ ��</b></td>
			<td class="table_02_2"><b><span id="SPN_AVETC2" style="color:blue"><%= v_avetc2 %></span></b></td>
          </tr>
		  <tr>
			<td align="center" colspan="5" height="25" bgcolor="#F7F7F7">
		      <table width="97%" border="0" cellpadding="0" cellspacing="0">
			    <tr>
				  <td align="center" height="20">
                    <a href="javascript:listActivity()"><img src="/images/admin/button/btn_list.gif" border="0"></a>&nbsp;
				    <a href="javascript:updateActivity()"><img src="/images/admin/button/btn_modify.gif" border="0"></a>
				  </td>
			    </tr>
		      </table>
		    </td>
		  </tr>
		  <tr>
			<td align="center" colspan="5" height="25" bgcolor="#F7F7F7">
			<!----------------- ����Ƚ����������Ʈ ���� ----------------->
			  <br>
			  <table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				  <td width="110">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					  <tr>
						<td background="/images/admin/study/study_blue_img1.gif" rowspan="3" width="5" height="23"></td>
						<td background="/images/admin/study/study_blue_img3.gif" height="5"></td>
						<td rowspan="3" background="/images/admin/study/study_blue_img2.gif" width="5" height="23"></td>
					  </tr>
					  <tr>
						<td background="/images/admin/study/study_blue_img5.gif" align="center" height="16" valign="middle"><b><font color="#FFFFFF">����Ƚ��</font></b></td>
					  </tr>
					  <tr>
						<td background="/images/admin/study/study_blue_img4.gif" height="2"></td>
					  </tr>
				    </table>
				  </td>
				  <td>&nbsp;</td>
				</tr>
			  </table>
<%
	// ����Ƚ�� �α� ����
	String	v_lgip	= "";
	String	v_ldate	= "";
	String	v_day	= "";
	String	v_time	= "";
	int		v_total	= 0;
 	int		j		= 0;

 %>
			  <table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				  <td bgcolor="#636563">
					<table width="100%" border="0" cellspacing="1" cellpadding="0">
					  <tr>
						<td bgcolor="#FFFFFF" valign="top">
						  <br>
						  <table class="box_table_out_1" cellspacing="1" cellpadding="5"width="940">
						    <tr>
							  <td colspan="9" class="table_top_line"></td>
							</tr>
			  			    <tr>
							  <td class="table_title" width="10%"><b>NO</b></td>
							  <td class="table_title" width="30%"><b>������</b></td>
							  <td class="table_title" width="30%"><b>���ӽð�</b></td>
							  <td class="table_title" width="30%"><b>���� IP</b></td>
							</tr>
						  </table>
						  <div style='width: 960px; height: 230px; overflow: auto; visibility: visible; border: 1'>
							<table class="box_table_out_1" cellspacing="1" cellpadding="5" width="940">
							<%
								ArrayList list1 = (ArrayList) request.getAttribute("selectLoginList");

								v_total = list1.size();
								
								for (j = 0; j < list1.size(); j++) {
									DataBox dbox1 = (DataBox) list1.get(j);
									v_lgip = dbox1.getString("d_lgip");
									v_ldate = dbox1.getString("d_ldate");
									
							        v_day  = FormatDate.getFormatDate(v_ldate,"yyyy/MM/dd");
							        v_time = FormatDate.getFormatDate(v_ldate,"HH:mm:ss");

							%>
							  <tr>
								<td class="table_01"   width="10%"><%= j + 1 %></td>
								<td class="table_02_1" width="30%"><%= v_day %></td>
								<td class="table_02_1" width="30%"><%= v_time %></td>
								<td class="table_02_1" width="30%"><%= v_lgip %></td>
							  </tr>
							<%
								}
								if (j == 0) {
							%>
							  <tr>
								<td class="table_01" colspan="7">�н�â ����������  �����ϴ�.</td>
							  </tr>
							<%
								}
							%>
							</table>
						  </div>
						</td>
					  </tr>
					</table>
				  </td>
				</tr>
			  </table>
			  <!----------------- ����Ƚ�� ��������Ʈ �� ----------------->
			  <br>
<%
	// �Խ��� Ȱ�� ����
	String	vc_type			= "";
	String	vc_typenm		= "";
	String	vc_no			= "";
	String	vc_userid		= "";
	String	vc_title		= "";
	String	vc_sdate		= "";
	String	vc_ldate		= "";
	String	vc_subj			= "";
	String	vc_year			= "";
	String	vc_subjseq		= "";
	String	vc_tpcode		= "";
	String	sScriptString	= "";
 	int		k 			= 0;
 %>
 			  <!----------------- �Խ��� Ȱ�� ��������Ʈ �� ----------------->
 			  <table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				  <td width="110">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
					  <tr>
						<td background="/images/admin/study/study_blue_img1.gif" rowspan="3" width="5" height="23"></td>
						<td background="/images/admin/study/study_blue_img3.gif" height="5"></td>
						<td rowspan="3" background="/images/admin/study/study_blue_img2.gif" width="5" height="23"></td>
					  </tr>
					  <tr>
						<td background="/images/admin/study/study_blue_img5.gif" align="center" height="16" valign="middle"><b><font color="#FFFFFF">�Խ��� Ȱ������</font></b></td>
					  </tr>
					  <tr>
						<td background="/images/admin/study/study_blue_img4.gif" height="2"></td>
					  </tr>
					</table>
				  </td>
				  <td>&nbsp;</td>
				</tr>
		      </table>
			  <table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
				  <td bgcolor="#636563">
					<table width="100%" border="0" cellspacing="1" cellpadding="0">
					  <tr>
						<td bgcolor="#FFFFFF" valign="top"><br>
						  <table class="box_table_out_1" cellspacing="1" cellpadding="5" width="940">
						    <tr>
							  <td colspan="9" class="table_top_line"></td>
							</tr>
							<tr>
							  <td class="table_title" width="10%"><b>NO</b></td>
							  <td class="table_title" width="10%"><b>�з�</b></td>
							  <td class="table_title" width="70%"><b>����</b></td>
							  <td class="table_title" width="20%"><b>�ۼ�����</b></td>
							</tr>
						  </table>
						  <div style='width: 960px; height: 230px; overflow: auto; visibility: visible; border: 1'>
						  <table class="box_table_out_1" cellspacing="1" cellpadding="5" width="940">
							<%
								ArrayList list2 = (ArrayList) request.getAttribute("selectBbsList");
								
								for (k= 0; k < list2.size(); k++) {
									DataBox dbox2 = (DataBox) list2.get(k);
									vc_type       = dbox2.getString("d_type");
									vc_no         = dbox2.getString("d_no");
									vc_title      = dbox2.getString("d_title");
									vc_ldate      = dbox2.getString("d_ldate");
									vc_tpcode     = dbox2.getString("d_tpcode");
									vc_sdate	  = dbox2.getString("d_sdate");

									if(vc_type.equals("SUBJ"))			   {	 vc_typenm="����������";   }
									if(vc_type.equals("TOR"))			   {	 vc_typenm="���";   }
									
							        //�󼼺��� ��ũ �����
							        if ("TOR".equals(vc_type)) {
							        	sScriptString	= "viewToron('" + vc_no + "', '" + v_subj + "', '" + v_year + "', '" + v_subjseq + "', '" + vc_tpcode + "');";	
							        } else if ("SUBJ".equals(vc_type)) {
							        	sScriptString	= "viewQna('" + vc_no + "', '" + v_subj + "', '" + v_year + "', '" + v_subjseq + "');";	
							        }

							%>
							<tr>
							  <td class="table_01"   width="10%"><%= k + 1 %></td>
							  <td class="table_02_1" width="10%"><%= vc_typenm %></td>
							  <td class="table_02_2" width="70%"><a href="javascript:<%= sScriptString %>"><%= vc_title %></a></td>
							  <td class="table_02_1" width="20%"><%= FormatDate.getFormatDate(vc_ldate,"yyyy/MM/dd") %></td>
							</tr>
							<%
								}

								if (k== 0) {
							%>
							<tr>
							  <td class="table_01" colspan="7">�Խ��� Ȱ�� ������  �����ϴ�.</td>
							</tr>
							<%
								}
							%>
					      </table>
						</div>
					  </td>
					</tr>
				  </table>
				</td>
			  </tr>
			</table>
			<!----------------- ������/��Ÿ ����ȸ �� ----------------->
	      </td>
		</tr>
      </table>
      <br>
	</td>
  </tr>
</table>
</form>

</SCRIPT>
<%@ include file="/learn/library/getJspName.jsp"%>
</body>
</html>

