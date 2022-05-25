<%
//**********************************************************
//  1. ��      ��: ����ó��-��������Ȳ ����Ʈ
//  2. ���α׷���: za_FinishStudent_L.java
//  3. ��      ��: ����ó��-��������Ȳ ����Ʈ
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 6. 30
//  7. ��      ��: 
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.complete.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.course.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    String  ss_grcode       = box.getString("s_grcode");          //�����׷�
    String  ss_gyear        = box.getString("s_gyear");           //�⵵
    String  ss_grseq        = box.getStringDefault("s_grseq","ALL");           //��������
    String  ss_grseqnm      = box.getString("s_grseqnm");         //����������
    String  ss_upperclass   = box.getString("s_upperclass");      //������з�
    String  ss_middleclass  = box.getString("s_middleclass");     //�����ߺз�
    String  ss_lowerclass   = box.getString("s_lowerclass");      //�����Һз�
    String  ss_subjcourse   = box.getString("s_subjcourse");      //����&�ڽ�
    String  ss_subjseq      = box.getString("s_subjseq");         //���� ����
	String  ss_action       = box.getString("s_action");
    
    String  v_subj			= box.getString("p_subj");
    String  v_year			= box.getString("p_year");
    String  v_subjseq		= box.getString("p_subjseq");
    String  v_subjnm		= box.getString("p_subjnm");
    
    ArrayList list = (ArrayList)request.getAttribute("CompleteStudentList");
    DataBox dbox2 = (DataBox)request.getAttribute("SubjseqData");
    
    //��ư ��� �ʿ��� ������
    String v_isclosed   = dbox2.getString("isclosed");
    String v_iscpresult = dbox2.getString("iscpresult");
    String v_iscpflag   = dbox2.getString("iscpflag");
    String v_isoutsrc   = dbox2.getString("isoutsourcing");
    String v_isapproval = dbox2.getString("d_isapproval");
    String v_isonoff	= dbox2.getString("isonoff");
    
    int    v_stoldcnt   = dbox2.getInt("d_stoldcnt");
    int    v_studentcnt = dbox2.getInt("d_studentcnt");
    
    int    v_stoldycnt   = dbox2.getInt("d_stoldycnt");
    int    v_stoldncnt   = dbox2.getInt("d_stoldncnt");
    
    int is_complete  = 0;                                // ���Ῡ��
    String v_eduend  = FormatDate.getFormatDate(dbox2.getString("eduend"),"yyyyMMdd");
	String v_date    = FormatDate.getDate("yyyyMMdd");   // ���糯¥

    // ���Ῡ��          
    if (!v_eduend.equals("")) {
        if (Integer.parseInt(v_date) > Integer.parseInt(v_eduend)) is_complete=1;
    }
                        
    String  v_subjseqgr		= dbox2.getString("subjseqgr");
    String  v_orderType    = box.getStringDefault("p_orderType"," asc"); //���ļ���
      
%>
<html>
<head>
<title>����ó��</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language="JavaScript">
<!--
function open_window(name, url, left, top, width, height, scrollbar, toolbar, menubar, statusbar, resizable)
    {
        toolbar_str = toolbar ? 'yes' : 'no';
        menubar_str = menubar ? 'yes' : 'no';
        statusbar_str = statusbar ? 'yes' : 'no';
        scrollbar_str = scrollbar ? 'yes' : 'no';
        resizable_str = resizable ? 'yes' : 'no';
        window.open(url, name, 'left='+left+',top='+top+',width='+width+',height='+height+',toolbar='+toolbar_str+',menubar='+menubar_str+',status='+statusbar_str+',scrollbars='+scrollbar_str+',resizable='+resizable_str).focus();
    }
    
function whenSelection(p_action) {
  document.form1.target = "_self";
  document.form1.p_process.value = 'subjectSelect';
  document.form1.p_action.value = p_action;
  document.form1.submit();
}


// ��������
function ReRating() {
   //p_subj = document.form1.p_subj.value;
   //p_year = document.form1.p_year.value;
   //p_subjseq = document.form1.p_subjseq.value;
   p_isonoff = document.form1.p_isonoff.value;         
      
   if (confirm("�������� �Ͻðڽ��ϱ�?")) {
        document.form1.target = "_self";
    
        if(p_isonoff == "ON"){
          document.form1.p_process.value = 'subjectCompleteRerating';        // ���̹�
        }else{
          document.form1.p_process.value = 'offSubjectCompleteRerating';     // ����
        }
    
        document.form1.submit();
  }
}


// ����ó�� 
function whenComplete(v_process) {
	if (confirm("����ó���� �Ͻðڽ��ϱ�?")) {
  		document.form1.target = "_self";
  		document.form1.p_process.value = v_process;
  		document.form1.submit();
  	}
}

// �������
function listpage() {
    document.form1.target = "_self";
	document.form1.p_process.value = "listPage";
	document.form1.p_action.value = "go";
	document.form1.submit();
}

// �Ⱦ���
function whenChangeGradu(userid, name, jikwi, compnm, notgraduetc) {
	if (confirm("�̼������� ���� �Ͻðڽ��ϱ�?")) {
		document.form1.p_userid.value = userid;
   		document.form1.p_name.value = name;
   		document.form1.p_jikwinm.value = jikwi;
   		document.form1.p_compnm.value = compnm;
   		document.form1.p_notgraduetc.value = notgraduetc;
   
        window.self.name = "projectDetail";     //opener ��ü�� name �� �����Ѵ�
        open_window("openChangeSubmit","","100","100","548","350","1");      
        document.form1.target = "openChangeSubmit";
        document.form1.action = "/servlet/controller.complete.FinishServlet";
        document.form1.p_process.value = "changeNotgraduPage";
        document.form1.submit();
        document.form1.target = window.self.name;        
    }
}

// ����� �̼����� ����
function whenChangeIsGradu(userid, isgraduated) {
	if (confirm("�̼������� ���� �Ͻðڽ��ϱ�?")) {
		document.form1.p_userid.value = userid;
   		document.form1.p_isgraduated.value = isgraduated;
        document.form1.p_process.value = "changeGraduated";
        document.form1.submit();
    }
}

// ����� ����Ʈ sorting
function whenOrder(column) {
	if (document.form1.p_orderType.value == " asc") {
		document.form1.p_orderType.value = " desc";
	} else {
		document.form1.p_orderType.value = " asc";
	}

    document.form1.p_orderColumn.value = column;
    whenSelection("go");
}

function openOffSubjInput() {
  window.self.name = "winOffSubjResultInput";
  window.open("", "openOffSubjResultInput", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes, resizable=yes,copyhistory=no, width=880, height=600, top=0, left=0");
  document.form1.target = "openOffSubjResultInput";
  document.form1.p_process.value = "offSubjectInputPage";

  document.form1.submit();
}

function whenApproval() {
   document.form1.target = "_self";
   document.form1.p_process.value = "requestApprovalPage";

   window.self.name = "winChiefApproval";
   var url = "/servlet/controller.complete.FinishServlet";
   var new_Open = window.open(url,"proposeChief",'scrollbars=yes,width=550,height=200,scrollbars=no,resizable=no');

   document.form1.target = "proposeChief";
   document.form1.submit();
}

function whenCancel(v_process) {
  if (confirm("����ó���� ��� �Ͻðڽ��ϱ�?")) {
      document.form1.target = "_self";
      document.form1.p_process.value = v_process;
      
      
      document.form1.submit();
    }
}

function whenOffComplete() {
  if (confirm("����ó���� �Ͻðڽ��ϱ�?")) {
      document.form1.target = "_self";
      document.form1.p_process.value = 'offSubjIsClosed';
      document.form1.submit();
    }
}

function whenOutComplete() {
  if (confirm("����ó���� �Ͻðڽ��ϱ�?")) {
      document.form1.target = "_self";
      document.form1.p_process.value = 'outSubjIsClosed';
      document.form1.submit();
    }
}

function whenApprovalCancel(){
  if (confirm("�������� ����Ͻðڽ��ϱ�?")) {
      document.form1.target = "_self";
      document.form1.p_process.value = 'requestApprovalCancel';
      document.form1.submit();
    }
}

function whenApprovalCancelAdmin(){
  if (confirm("�̷°��縦 ����Ͻðڽ��ϱ�?")) {
      document.form1.target = "_self";
      document.form1.p_process.value = 'requestApprovalCancelAdmin';
      document.form1.submit();
    }
}

function whenOutSubjReject() {
  if (confirm("����Է��� ���û �Ͻðڽ��ϱ�?")) {
      document.form1.target = "_self";
      document.form1.p_process.value = 'outSubjReject';
      document.form1.submit();
    }
}


//-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
      <form name="form1" method="post" action="/servlet/controller.complete.FinishServlet">
		<input type="hidden" name="p_process"   value="">
    	<input type="hidden" name="s_grcode"      value="<%=ss_grcode%>">
  		<input type="hidden" name="s_gyear"       value="<%=ss_gyear%>">
  		<input type="hidden" name="s_grseq"       value="<%=ss_grseq%>">
  		<input type="hidden" name="s_upperclass"  value="<%=ss_upperclass%>">
  		<input type="hidden" name="s_middleclass" value="<%=ss_middleclass%>">
  		<input type="hidden" name="s_lowerclass"  value="<%=ss_lowerclass%>">
  		<input type="hidden" name="s_subjcourse"  value="<%=ss_subjcourse%>">
  		<input type="hidden" name="s_subjseq"     value="<%=ss_subjseq%>">
	
	
        <input type="hidden" name="p_action"   value="">
        <input type="hidden" name="p_subj"    value="<%=v_subj%>">
        <input type="hidden" name="p_subjnm"    value="<%=v_subjnm%>">
        <input type="hidden" name="p_year"    value="<%=v_year%>">
        <input type="hidden" name="p_subjseq" value="<%=v_subjseq%>">
        <input type="hidden" name="p_subjseqgr" value="<%=v_subjseqgr%>">
        <input type="hidden" name="p_isclosed" value="<%=v_isclosed%>">
        <input type="hidden" name="p_isapproval" value="<%=v_isapproval%>">
        <input type="hidden" name="p_isonoff" value="<%=v_isonoff%>">
        <input type="hidden" name="p_userid" value="">
        <input type="hidden" name="p_name" value="">
        <input type="hidden" name="p_jikwinm" value=""> 
        <input type="hidden" name="p_compnm" value="">
        <input type="hidden" name="p_notgraduetc" value="">
        <input type="hidden" name="p_isgraduated" value="">
        
        <input type="hidden" name="p_orderColumn">
		<input type="hidden" name="p_orderType" value="<%=v_orderType%>">
		
	
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/co_title10.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
	        <!----------------- title �� ----------------->
      <br>

			<!----------------- �����׷�, �⵵, ��������, �з�, �ڽ�, ����, ���� ���� ----------------->
                        <table cellspacing="1" cellpadding="5" class="table_out">
                          <tr> 
                              <td width="13%" height="25" class="table_title"><b> �����׷�</b></td>
                              <td width="35%" class="table_02_2"><%=dbox2.getString("grcodenm")%></td>
                              <td width="13%" class="table_title"><b> �⵵</b></td>
                              <td class="table_02_2"><%=dbox2.getString("gyear")%>��</td>
                          </tr>
                          <tr> 
                              <td height="25" class="table_title"><b>����</b></td>
                              <td class="table_02_2"><%=dbox2.getString("subjnm")%></td>
                              <td class="table_title"><b>����</b></td>
                              <td class="table_02_2"><%=StringManager.cutZero(v_subjseqgr)%>��</td>
                          </tr>

                          <tr> 
                              <td class="table_title" height="25"><b>����ó���Ϸ�</b> </td>
                              <td class="table_02_2" colspan='3'>
							      <% if (v_isclosed.equals("Y")) out.print("ó���Ϸ�"); 
                              	     else                        out.print("��ó��"); 
                              	  %>
                              </td>

                          </tr>
                          <tr> 
                              <td class="table_title" height="25"><b> ��Ź��������</b></td>
                              <td class="table_02_2"><%=v_isoutsrc%></td>
                              <td class="table_title"><b>����Է¿���</b></td>
                              <td class="table_02_2"><%=v_iscpresult%></td>
                          </tr>
                          <tr> 
                              <td class="table_title" height="25"><b> ��Ź��������Ȯ��</b></td>
                              <td class="table_02_2" colspan=3><%=v_iscpflag%></td>
                          </tr>
                          
                        </table>
            <!----------------- �����׷�, �⵵, ��������, �з�, �ڽ�, ����, ���� �� ----------------->
            
            
            <br>
            <!-- ���̹� ���� ���� -->
            <% if (v_isonoff.equals("ON")) { %>
            <!----------------- �����Ⱓ, ������� ���� ----------------->
                        
        <table  cellspacing="1" cellpadding="5" class="table_out" >
          <tr> 
            <td class="table_title" width="13%" height="25" ><b> �����Ⱓ</b></td>
            <td class="table_02_2" colspan="5"><%=FormatDate.getFormatDate(dbox2.getString("edustart"),"yyyy/MM/dd")%>~<%=FormatDate.getFormatDate(dbox2.getString("eduend"),"yyyy/MM/dd")%></td>
          </tr>
          <tr> 
            <td class="table_title" rowspan="6"><b> �̼�����</b></td>
            <td width="11%" height="25" class="table_02_2">����</td>
            <td width="24%" class="table_02_2" ><%=dbox2.getInt("gradscore")%>��</td>
            <td class="table_title" width="13%" rowspan="7">����ġ(%)</td>
            <td width="11%" class="table_02_2" >������</td>
            <td width="28%" class="table_02_2" ><%=dbox2.getDouble("wstep")%>%</td>
          </tr>
          <tr> 
            <td height="25" class="table_02_2" >������</td>
            <td class="table_02_2" ><%=dbox2.getInt("gradstep")%>��</td>
            <td class="table_02_2" >�߰���</td>
            <td class="table_02_2" ><%=dbox2.getDouble("wmtest")%>%</td>
          </tr>
          <tr> 
            <td height="25" class="table_02_2" >�߰���</td>
            <td class="table_02_2" ><%=dbox2.getInt("gradexam")%>��</td>
            <td class="table_02_2" >������</td>
            <td class="table_02_2" ><%=dbox2.getDouble("wftest")%>%</td>
          </tr>
          <tr> 
            <td class="table_02_2" height="25">������</td>
            <td class="table_02_2" ><%=dbox2.getInt("gradftest")%>��</td>
            <td class="table_02_2" >������</td>
            <td class="table_02_2" ><%=dbox2.getDouble("whtest")%>%</td>
          </tr>
          <tr> 
            <td class="table_02_2" height="25">������</td>
            <td class="table_02_2" ><%=dbox2.getInt("gradhtest")%>��</td>
            <td class="table_02_2" >����Ʈ</td>
            <td class="table_02_2" ><%=dbox2.getDouble("wreport")%>%</td>
          </tr>
          <tr> 
            <td class="table_02_2" height="25">����Ʈ</td>
            <td class="table_02_2" ><%=dbox2.getInt("gradreport")%>��</td>
            <td class="table_02_2" height="25">��Ÿ1</td>
            <td class="table_02_2" ><%=dbox2.getDouble("wetc1")%>%</td>
          </tr>
          <tr> 
            <td class="table_02_2" colspan="3">&nbsp;</td>
            <td class="table_02_2"  height="25">��Ÿ2</td>
            <td class="table_02_2" ><%=dbox2.getDouble("wetc2")%>%</td>
          </tr>
        </table>
            <!----------------- �����Ⱓ, ������� �� ----------------->
            <!-- ���̹� ���� ���� -->
            <% } else { %>
            <!-- ���հ��� ���� -->
            <!----------------- �����Ⱓ, ������� ���� ----------------->
                        <table cellspacing="1" cellpadding="5" class="table_out" >
                          <tr> 
                            <td width="13%" height="25" class="table_title"><b>�����Ⱓ</b></td>
                            <td colspan="5" class="table_02_2"><%=FormatDate.getFormatDate(dbox2.getString("edustart"),"yyyy/MM/dd")%>~<%=FormatDate.getFormatDate(dbox2.getString("eduend"),"yyyy/MM/dd")%></td>
                          </tr>
                          <tr> 
                            <td rowspan="4" class="table_title"><b>�̼�����</b></td>
                            <td width="11%" height="25" class="table_02_2">����</td>
                            <td width="24%" class="table_02_2"><%=dbox2.getInt("gradscore")%>��</td>
                            <td rowspan="4" class="table_title"><b>����ġ(%)</b></td>
                            <td width="11%" class="table_02_2">�⼮��</td>
                            <td width="28%" class="table_02_2"><%=dbox2.getDouble("d_wstep")%>%</td>
                          </tr>
                          <tr> 
                            <td height="25" class="table_02_2">�⼮��</td>
                            <td class="table_02_2"><%=dbox2.getInt("gradstep")%>��</td>
                            <td class="table_02_2">��</td>
                            <td class="table_02_2"><%=dbox2.getDouble("wftest")%>%</td>
                          </tr>
                          <tr> 
                            <td height="25" class="table_02_2">��</td>
                            <td class="table_02_2"><%=dbox2.getInt("gradexam")%>��</td>
                            <td class="table_02_2">����Ʈ</td>
                            <td class="table_02_2"><%=dbox2.getDouble("wreport")%>%</td>
                          </tr>
                          <tr> 
                            <td height="25" class="table_02_2">����Ʈ</td>
                            <td class="table_02_2"><%=dbox2.getInt("gradreport")%>��</td>
                            <td class="table_02_2">��Ÿ</td>
                            <td class="table_02_2"><%=dbox2.getDouble("wetc1")%>%</td>
                          </tr>
                        </table>
            <!----------------- �����Ⱓ, ������� �� ----------------->
            <!-- ���հ��� ���� -->
            <% } %>
      
          <br>
            <!----------------- �߰� ��ư ���� ----------------->
	      <table cellpadding="0" cellspacing="0" class="table1">
	        <tr>
	          <%if (v_isclosed.equals("Y")) { %>
	          <td align="left" height="20">
	          	<b>����: <%=v_stoldycnt%>�� &nbsp;&nbsp;�̼���: <%=v_stoldncnt%>��</b>
	          </td>
	          <% } %>
	          <td align="right" height="20">
	          <%
	           //**************** ����ó�� *****************//
	           if (is_complete==1) {  
	           
	           //��ư ���� ����
	           //1. ���־�ü ����
	           //   ����ó��
	           //   ������û
	           String v_outProcess = "����<a href=\"javascript:whenComplete('outSubjIsClosed');\"><img src='/images/admin/button/btn_sooruok.gif' border=0></a>&nbsp;";
	           String v_outReProcess = "<a href=\"javascript:whenOutSubjReject();\"><img src='/images/admin/button/btn_resultretry.gif' border=0></a>&nbsp;"; //"������û ";
	           
	           
	           //2. ����
	           //   ����ó�� ���
	           //   ������
	           
	           //String v_Cancel = "����ó����� ";
	           String v_Cancel =  "<a href=\"javascript:whenCancel('subjectCompleteCancel');\"><img src='/images/admin/button/btn_soorucancel.gif' border=0></a>&nbsp;";
	           String v_OffCancel =  "<a href=\"javascript:whenCancel('offSubjectCompleteCancel');\"><img src='/images/admin/button/btn_soorucancel.gif' border=0></a>&nbsp;";
	           
	           
	           //String v_Approval = "������ ";
	           String v_Approval = "";
/*
	           //�̼�ó�� ���� ���� ������ ������ ������ �ȵ�.
	           if (v_studentcnt==v_stoldcnt) {
	           		v_Approval = "<a href=\"javascript:whenApproval();\"><img src='/images/admin/button/btn_galjeshangshin.gif' border=0></a>&nbsp;";
	           } else {
	           		v_Approval = "<a href=\"javascript:alert('�̼�ó������ ���� �н��ڰ� �ֽ��ϴ�. Ȯ���� �ּ���.');\"><img src='/images/admin/button/btn_galjeshangshin.gif' border=0></a>&nbsp;";
	           }
*/
	           
	           //3. ���̹�����
	           //   ����ó��
	           String v_Process = "<a href=\"javascript:whenComplete('subjectComplete');\"><img src='/images/admin/button/btn_sooruok.gif' border=0></a>&nbsp;";
	           
	           
	           //4. ���հ���
	           //   ����ó��(���� ����ó���� �����ϸ� tz_student table�� isclosed ���¸� ��������)
	           //   �����Է�
	           //String v_inputScore = "�����Է� ";
	           String v_offProcess = "";
	           
	           //if (v_stoldcnt==0) {
	           //		v_offProcess = "<a href=\"javascript:alert('���� ����Է�ó���� �ϼ���.');\"><img src='/images/admin/button/btn_sooruok.gif' border=0></a>&nbsp;";
	           //} else {
	           		v_offProcess = "<a href=\"javascript:whenComplete('offSubjectCompleteNew');\"><img src='/images/admin/button/btn_sooruok.gif' border=0></a>&nbsp;";
	           //}
	           String v_inputScore = "<a href=\"javascript:openOffSubjInput();\"><img src='/images/admin/button/btn_reslultinsertok.gif' border=0></a>&nbsp;";	           	           
	           //��ư ���� ����          
	           
	            //��ư���� ����
	          	//1. ���־�ü ������ ���
	          	//1.1 ����ó�� ���� �Ϸᰡ �ƴϰ� ������� �ƴҶ�
	          	//1.1.1 ��ü�� ����� �Է��߰� 
	          	//1.1.1.1 ����ó���� ���� ���� ���
	          	//		  ����ó��, ������û
	          	
	          	//1.1.1.2 ����ó���� �� ���
	          	//		  ����ó�� ���, ������
	          	
	          	
	          	//2. ���־�ü ������ �ƴѰ��
	          	//2.1 ����ó�� ���� �Ϸᰡ �ƴϰ� ������� �ƴҋ�
	          	//2.1.2 ����ó���� ���� ���� ���
	          	//		����ó��
	          	
	          	//2.1.2.1 ���հ����� ���
	          	//		  �����Է�
	          	
	          	//2.1.3 ����ó���� �� ���
	          	//		����ó�� ���, ���� ���
	          	
	          	
	          	//3. ���������϶�
	          	//	 ������ ���
	          	
	          	//4. ����Ϸ��̰� �Ѱ������ڸ�
	          	//	 �̷°���ݷ�
	          	
	          	//��ư���� ����
	          		          	
	          	//out.print(v_isoutsrc);
	          	//out.print(v_isclosed);
	          	//out.print(v_isonoff);
	          	
	          	//1. ���־�ü ������ ���
	          	if (v_isoutsrc.equals("Y")) {
	          			//1.1.1 ��ü�� ����� �Է��߰� 
	          			if (v_iscpresult.equals("Y")) {
	          				//1.1.1.1 ����ó���� ���� ���� ���
	          				if (v_isclosed.equals("N")) {
	          				  	//		  ����ó��, ������û
	          				  	out.print(v_outProcess);
	          				  	out.print(v_outReProcess);
	          				} else {
	          		          	//1.1.1.2 ����ó���� �� ���
	          					//		  ����ó�� ���, ������
	          					out.print(v_Cancel);
	          					//out.print(v_Approval);
	          				}
	          			}
	          	} else {
	          	//2. ���־�ü ������ �ƴѰ��
	          			//2.1.2 ����ó���� ���� ���� ���
	          			if (v_isclosed.equals("N")) {
	          				
	          				//2.1.2.1 ���հ����� ���
	          				//		  �����Է�
	          				if (v_isonoff.equals("OFF")) {
	          					out.print(v_inputScore);
	          				}
	          				
	          				//		����ó��
	          				if (v_isonoff.equals("ON")) {
	          					out.print(v_Process);
	          				} else {
	          					out.print(v_offProcess);
	          				}

	          			} else {
	          				//2.1.3 ����ó���� �� ���
	          				//		  ����ó�� ���, ������
	          				if (v_isonoff.equals("ON")) {
	          					out.print(v_Cancel);
	          				} else {
	          					out.print(v_OffCancel);
	          				}
	          				out.print(v_Approval);
	          			}
	          	}

	           }else{ 
	           	   //**************** �������� *****************//          
                  out.print("<a href=\"javascript:ReRating()\">");
                  out.print("<img src='/images/admin/button/btn_rerating.gif' border=0 alt='��������'>");
                  out.print("</a>&nbsp;");
	           }	          	
	           %>
	          </td>
	        </tr>
	        <tr>
	          <td height="3"></td>
	        </tr>
	      </table>
	      <!----------------- �߰� ��ư �� ----------------->
          
         
      <br>
      <!----------------- ����ó�� ���� ----------------->
        <table cellspacing="1" cellpadding="5" class="table_out">
          <tr> <!--ȸ�� ���� ID ���� �μ� ���� ���� ���� -->
            <td rowspan="2" width="27" class="table_title">NO</td>
            <td rowspan="2" class="table_title" width="135"><a href="javascript:whenOrder('compnm')" class="e">ȸ��</a></td>
            <td width="50" rowspan="2" class="table_title"><a href="javascript:whenOrder('userid')" class="e">ID</a></td>
            <td rowspan="2" class="table_title" width="50"><a href="javascript:whenOrder('name')" class="e">����</a></td>
            <td rowspan="2" class="table_title" width="120"><a href="javascript:whenOrder('compnm')" class="e">�μ�</a></td>
            <td width="60" rowspan="2" class="table_title"><a href="javascript:whenOrder('jikwinm')" class="e">����</a></td>
            <td colspan="<% if (v_isonoff.equals("OFF")) out.print(5); else out.print(8);%>" class="table_title">�� �� �� ��</td>
            <td width="64" rowspan="2" class="table_title"><a href="javascript:whenOrder('score')" class="e">����</a></td>            
            <td width="64" rowspan="2" class="table_title"><a href="javascript:whenOrder('a.samtotal')" class="e">����<br>�ƿ�</a></td>
            <td width="64" rowspan="2" class="table_title"><a href="javascript:whenOrder('isgraduated')" class="e">����</a></td>
            <td width="65" rowspan="2" class="table_title">�̼���<br>
              ��������</td>            
          </tr>
          <tr> 
            <td width="47" class="table_title">����</td>
            <% if (v_isonoff.equals("OFF")) { %>
            <td width="47" class="table_title"><a href="javascript:whenOrder('avtstep')" class="e">�⼮��</a></td>
            <td width="42" class="table_title"><a href="javascript:whenOrder('avftest')" class="e">��</a></td>
            <td width="42" class="table_title"><a href="javascript:whenOrder('avreport')" class="e">����Ʈ</a></td>
            <td width="38" class="table_title"><a href="javascript:whenOrder('avetc1')" class="e">��Ÿ</a></td>
            <% } else  { %>
            <td width="47" class="table_title"><a href="javascript:whenOrder('avtstep')" class="e">������</a></td>
            <td width="42" class="table_title"><a href="javascript:whenOrder('avmtest')" class="e">�߰���</a></td>
            <td width="42" class="table_title"><a href="javascript:whenOrder('avhtest')" class="e">������</a></td>
            <td width="38" class="table_title"><a href="javascript:whenOrder('avhtest')" class="e">������</a></td>
            <td width="35" class="table_title"><a href="javascript:whenOrder('avreport')" class="e">����Ʈ</a></td>
            <td width="25" class="table_title"><a href="javascript:whenOrder('avetc1')" class="e">��Ÿ1</a></td>
            <td width="30" class="table_title"><a href="javascript:whenOrder('avetc2')" class="e">��Ÿ2</a></td>
            <% } %>
          </tr>
          <% if (list.size()==0) { %>
          <!--tr> 
          <td class="table_02_1" colspan="<% if (v_isonoff.equals("OFF")) out.print(14); else out.print(18);%>"> �������� �����ϴ�.</td>
        </tr-->
          <%  } %>
          <% 
		
			for (int i=0; i<list.size(); i++) {
				DataBox dbox = (DataBox)list.get(i); 
				
				String v_isgradated = dbox.getString("d_isgraduated");	
		  %>
          <tr> 
            <td rowspan="2" class="table_01"><%=(i+1)%>
            
               <a href="javascript:whenChangeGradu('<%=dbox.getString("d_userid")%>','<%=dbox.getString("d_name")%>','<%=dbox.getString("d_jikwinm")%>','<%=dbox.getString("d_compnm")%>','<%=dbox.getString("d_notgraduetc")%>')"><img src="/images/admin/button/b_sayouchange.gif" border="0">aa</a>
            </td>
            <td rowspan="2" class="table_02_1"><%=dbox.getString("d_companynm")%></td>
            <td rowspan="2" class="table_02_1"><%=dbox.getString("d_userid")%></td>
            <td rowspan="2" class="table_02_1"><%=dbox.getString("d_name")%></td>
            <td rowspan="2" class="table_02_1"><%=dbox.getString("d_compnm")%></td>
            <td rowspan="2" class="table_02_1"><%=dbox.getString("d_jikwinm")%></td>
            <td class="table_02_1">���</td>
            <% if (v_isonoff.equals("OFF")) { %>
              <td class="table_02_1"><%=dbox.getDouble("d_tstep")%></td>
			  <td class="table_02_1"><%=dbox.getDouble("d_ftest")%></td>
			  <td class="table_02_1"><%=dbox.getDouble("d_report")%></td>
			  <td class="table_02_1"><%=dbox.getDouble("d_etc1")%></td>

            <% } else { %>
            <td class="table_02_1"><%=dbox.getDouble("d_tstep")%></td>
            <td class="table_02_1"><%=dbox.getDouble("d_mtest")%></td>
            <td class="table_02_1"><%=dbox.getDouble("d_ftest")%></td>
            <td class="table_02_1"><%=dbox.getDouble("d_htest")%></td>
            <td class="table_02_1"><%=dbox.getDouble("d_report")%></td>
            <td class="table_02_1"><%=dbox.getDouble("d_etc1")%></td>
            <td class="table_02_1"><%=dbox.getDouble("d_etc2")%></td>
            <% } %>
            <td rowspan="2" class="table_02_1">
            <% if (v_isclosed.equals("Y") || v_isoutsrc.equals("Y")) { %>
            	<%=dbox.getDouble("d_score")%>
            <%   } else { out.print("-");} %>
            </td>
            <td  rowspan="2" class="table_02_1"><%=dbox.getDouble("d_samtotal")%></td>            
            <td rowspan="2" class="table_02_1" >
            
	            <% if (v_isclosed.equals("Y") || v_isoutsrc.equals("Y")) {
	            		if (v_isgradated.equals("Y"))  {
		            			if (v_isoutsrc.equals("N") ) {  %>
	            				<a href="javascript:whenChangeIsGradu('<%=dbox.getString("d_userid")%>','N')">�̼�</a>
	            			<%	} else { 
	            					out.print("�̼�");
	            				}
	               		} else { 
	               			 if (v_isoutsrc.equals("N")) {   %>
	               				<a href="javascript:whenChangeIsGradu('<%=dbox.getString("d_userid")%>','Y')">���̼�</a>
	               		<%	} else { 
	               				out.print("���̼�");
	               			}
	               		}	 %>
	            <%   } else {out.print("��ó��");} %>
	            
	            
	           
            </td>
            <td  rowspan="2" class="table_03_1"> <a href="javascript:whenChangeGradu('<%=dbox.getString("d_userid")%>','<%=dbox.getString("d_name")%>','<%=dbox.getString("d_jikwinm")%>','<%=dbox.getString("d_compnm")%>','<%=dbox.getString("d_notgraduetc")%>')"><img src="/images/admin/button/b_sayouchange.gif" border="0"></a></td>   

                        
          </tr>
          <tr> 
            <td bgcolor="#FFFFCC">����ġ</td>
            <% if (v_isonoff.equals("OFF")) { %>
              <td bgcolor="#FFFFCC" align=center><%=dbox.getDouble("d_avtstep")%></td>
			  <td bgcolor="#FFFFCC" align=center><%=dbox.getDouble("d_avftest")%></td>
			  <td bgcolor="#FFFFCC" align=center><%=dbox.getDouble("d_avreport")%></td>
			  <td bgcolor="#FFFFCC" align=center><%=dbox.getDouble("d_avetc1")%></td>
            <% } else { %>
            <td bgcolor="#FFFFCC" align=center><%=dbox.getDouble("d_avtstep")%></td>
            <td bgcolor="#FFFFCC" align=center><%=dbox.getDouble("d_avmtest")%></td>
            <td bgcolor="#FFFFCC" align=center><%=dbox.getDouble("d_avftest")%></td>
            <td bgcolor="#FFFFCC" align=center><%=dbox.getDouble("d_avhtest")%></td>
            <td bgcolor="#FFFFCC" align=center><%=dbox.getDouble("d_avreport")%></td>
            <td bgcolor="#FFFFCC" align=center><%=dbox.getDouble("d_avetc1")%></td>
            <td bgcolor="#FFFFCC" align=center><%=dbox.getDouble("d_avetc2")%></td>
            <% } %>
          </tr>
          <%  } 
          
 %>
        </table>
      <!----------------- ����ó�� �� ----------------->
		<br>
        <!----------------- ����, ����, ����Ʈ ��ư ���� ----------------->
        <table width="16%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="center"><a href="javascript:listpage()"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
          </tr>
        </table>
        <!----------------- ����, ����, ����Ʈ ��ư �� ----------------->

        <br>
    </td>
  </tr>
</table>
</form>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
