<%
//**********************************************************
//  1. ��      ��: ��㳻�� ���
//  2. ���α׷���: za_Counsel_I.jsp
//  3. ��      ��: ��㳻�� ���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004.1.28
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    String  v_userid    = box.getString("p_userid");

    String  v_subjyearsubjseq = box.getString("p_subjyearsubjseq");
    String  v_today     = FormatDate.getDate("yyyy-MM-dd");
    
    
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<link rel="stylesheet" type="text/css" href="/css/ui-lightness/ui.all.css" />
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/ui.core.js"></script>
<script type="text/javascript" src="/script/effects.core.js"></script>
<script type="text/javascript" src="/script/effects.blind.js"></script>
<script type="text/javascript" src="/script/effects.drop.js"></script>
<script type="text/javascript" src="/script/effects.explode.js"></script>
<script type="text/javascript" src="/script/ui.datepicker.js"></script>
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
$(document).ready(function(){
	$("#p_sdate_view").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
});
<!--
    // üũ �� ���
    function insert_check() {
        if (document.form1.p_subj.value == "") {
            alert("������ �����ϼ���");
            document.form1.p_subj.focus();
            return;
        }
        if (document.form1.p_status.value == "") {
            alert("ó�����¸� �����ϼ���");
            document.form1.p_status.focus();
            return;
        }
        if (document.form1.p_title.value == "") {
            alert("������ �Է��ϼ���");
            document.form1.p_title.focus();
            return;
        }
        if (realsize(document.form1.p_title.value) > 200) {
            alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_title.focus();
            return;
        }
        if (document.form1.p_ctext.value == "") {
            alert("������ �Է��ϼ���");
            document.form1.p_contents.focus();
            return;
        }
        if (realsize(document.form1.p_ctext.value) > 4000) {
            alert("������ �ѱ۱��� 2000�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_ctext.focus();
            return;
        }
        if (realsize(document.form1.p_ftext.value) > 4000) {
            alert("ó�������� �ѱ۱��� 2000�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_ftext.focus();
            return;
        }
        if (!number_chk_noalert(document.form1.p_etime.value)) {
          alert('���ð��� �߸��ԷµǾ����ϴ�.');
          document.form1.p_etime.focus();
          return;
        }

        var p_sdate = make_date(document.form1.p_sdate_view.value);
        if (p_sdate == "") {
            alert("��������� �Է��ϼ���");
            return;
        }

        document.form1.p_sdate.value = p_sdate;

        document.form1.action = "/servlet/controller.study.StudyStatusAdminServlet";
        document.form1.p_process.value = "CounselInsert";
        document.form1.submit();
    }



// �ð��� ���� �ϼ���
var limit= 0+":01";

var parselimit=limit.split(":");
parselimit=parselimit[0]*60+parselimit[1]*1;

function begintimer(){
    parselimit+=1;
    curmin=Math.floor(parselimit/60);
    cursec=parselimit%60;
    if (curmin!=0)
      curtime=curmin+" �� "+cursec+" ��";
    else
      curtime="0 : "+cursec+" ��";

//    time.innerText=curtime;
	time.innerText = curmin + " ��";

	document.form1.p_etime.value = curmin;
    setTimeout("begintimer()",1000);
}
//-->
</SCRIPT>
<title>����Է�/��ȸ</title>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0" onLoad='begintimer();'>

<form name="form1" method="post" action="/servlet/controller.study.StudyStatusAdminServlet">
    <input type="hidden" name="p_process" value="<%=v_process%>">
    <input type="hidden" name="p_userid"  value="<%=v_userid%>">
    <input type="hidden" name="p_gubun"   value="in">
    <input type="hidden" name="p_search" value="userid">
    <input type="hidden" name="p_searchtext" value="<%=v_userid%>">

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center" valign="top"> 

     <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="../../../images/admin/study/tit_counsel.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
        <br>
        <br>

        <table border="0" cellspacing="0" cellpadding="0" width="97%">
          <tr>
            <td align="left"><b>[�����Է�]</b></td>
          </tr>
        </table>
        <!----------------- �������� �������� ���� ----------------->
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="16%" height="25" class="table_title"><b>��㱸��</b></td>
            <td class="table_02_2" width="81%">�������</td>
          </tr>
          <tr> 
            <td width="16%" height="25" class="table_title"><b>��������</b></td>
            <td class="table_02_2" width="81%">
                <%=CounselAdminBean.getSubjSelect(v_userid,"p_subj",v_subjyearsubjseq)%>
            </td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>ó������</b></td>
            <td class="table_02_2">
              <select name="p_status">
                <option value="">����</option>
                <option value="1">������</option>
                <option value="2">�亯�غ���</option>
                <option value="3">�亯�Ϸ�</option>
              </select>
              <input type="hidden" name="p_mcode" value="6"/>
            </td>
          </tr>
          <!--tr> 
            <td width="16%" height="25" class="table_title"><b>�з�</b></td>
            <td class="table_02_2" width="81%">
                <%//=CodeConfigBean.getCodeGubunSelect (CounselAdminBean.COUNSEL_KIND, "", 1, "p_mcode", "", "", 0)%>
            </td>
          </tr-->
          <tr> 
            <td class="table_title" height="25"><b>�������</b></td>
            <td class="table_02_2">
              <input name="p_sdate_view" id="p_sdate_view" class="datepicker_input1" type="text" size="10" value='<%=v_today%>'>
              <input name="p_sdate" type="hidden" value="">
            </td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>�ҿ�ð�</b></td>
            <td class="table_02_2"><div id="time"></div>
			<input name="p_etime" type="hidden" class="input" size="10" value=""></td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>����</b></td>
            <td class="table_02_2"><input name="p_title" type="text" class="input" size="80"></td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>����</b></td>
            <td class="table_02_2"><textarea name="p_ctext" rows="10" cols="80"></textarea></td>
          </tr>
        </table>
        <br/>
        <table border="0" cellspacing="0" cellpadding="0" width="97%">
          <tr>
            <td align="left"><b>[�亯�Է�]</b></td>
          </tr>
        </table>
        <table class="table_out" cellspacing="1" cellpadding="5">
          <tr> 
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="16%" class="table_title" height="25"><b>ó������</b></td>
            <td class="table_02_2">
                <textarea name="p_ftext" rows="10" cols="80"></textarea>
            </td>
          </tr>
        </table>
        <br>
        <!----------------- ����, �ݱ� ��ư ���� ----------------->
        <table width="11%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="center"><a href="javascript:insert_check()"><img src="/images/admin/button/btn_save.gif"  border="0"></a></td>
            <td align="center"><a href="javascript:window.close()"><img src="/images/admin/button/btn_close.gif" border="0"></a></td>
          </tr>
        </table>
        <!----------------- ����, ��� ��ư �� ----------------->
    </td>
  </tr>
  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr> 
<table>
</form>
</body>
</html>