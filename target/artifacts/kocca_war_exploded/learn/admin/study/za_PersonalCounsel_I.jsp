<%
//**********************************************************
//  1. ��      ��: ��㳻�� ���
//  2. ���α׷���: za_Counsel_I.jsp
//  3. ��      ��: ��㳻�� ���
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: lyh
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
    RequestBox box = (RequestBox)request.getAttribute("requestbox");    
    String  v_process   = box.getString("p_process");
    String v_resno      = "";  //�ֹε�Ϲ�ȣ
    String v_name       = "";  //�̸�
    String v_email      = "";  //�̸���
    String v_hometel    = "";  //����ȭ
    String v_handphone  = "";  //�ڵ���
    String v_cono       = "";  //ID
    String v_pwd        = "";  //��й�ȣ
	String v_membergubunnm = ""; //ȸ������
        
    MemberData data = (MemberData)request.getAttribute("SelectMemberInfo");    
    //v_resno      = data.getResno();
    v_name       = data.getName();
    v_email      = data.getEmail();
    v_hometel    = data.getHometel();
    v_handphone	 = data.getHandphone();
    v_pwd        = data.getPwd();
    v_membergubunnm        = data.getMembergubunnm();
    
    //v_resno = v_resno.substring(0, 6) + "-" + v_resno.substring(6);
    //v_resno = v_resno.substring(0, 6) + "-*******";

    String  p_mcode     = box.getString("s_mcode");
    String  p_subj      = box.getString("p_subj");
    String  v_userid    = box.getString("p_userid");

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
            alert("��㳻���� �Է��ϼ���");
            document.form1.p_contents.focus();
            return;
        }
        if (realsize(document.form1.p_ctext.value) > 4000) {
            alert("��㳻���� �ѱ۱��� 2000�ڸ� �ʰ����� ���մϴ�.");
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

        document.form1.action = "/servlet/controller.study.CounselAdminServlet";
        document.form1.p_process.value = "CounselInsert";
        document.form1.submit();
    }

    function listPage() {
        document.form1.action = "/servlet/controller.study.CounselAdminServlet";
        document.form1.p_process.value = "CounselListPage";
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
    <input type="hidden" name="p_gubun"   value="out">
    <input type="hidden" name="p_subj"    value="<%=p_subj%>">
<table width="800" border="0" cellpadding="0" cellspacing="10" bgcolor="#f7f7f7">
  <tr> 
    <td align="left"> 
        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
          <tr> 
            
          <td align="center" bgcolor="#FFFFFF"> 
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="../../../images/admin/study/tit_counsel.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
            <br>

            <table width="100%" cellspacing="1" cellpadding="5" class="open_table_out">
              <tr>
                <td colspan="6" class="table_top_line"></td>
              </tr>
              <tr>
                <td width="20%" class="table_title" width="22%" >����(ID)</td>
                <td width="30%" class="table_02_2"  width="28%" ><%=v_name%>(<%=v_userid%>)</td>
                <td width="20%" class="table_title" width="22%">��й�ȣ</td>
                <td width="30%" class="table_02_2"  width="28%"><%=v_pwd%></td>
              </tr>
              <tr>
                <td width="20%" class="table_title">�ڵ���</td>
                <td width="30%" class="table_02_2"><%=v_handphone%></td>
                <td width="20%" class="table_title">ȸ������</td>
                <td width="20%" class="table_02_2"><%=v_membergubunnm%></td>
              </tr>

              <tr>
                <td width="20%" class="table_title">E-mail</td>
                <td width="40%" class="table_02_2" colspan=3><%=v_email%></td>
              </tr>
            </table>
            <br>

        <!----------------- �������� �������� ���� ----------------->
        <table cellspacing="1" cellpadding="5" class="open_table_out" >
          <tr> 
            <td colspan="2" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="16%" height="25" class="table_title"><b>�з�</b></td>
            <td class="table_02_2" width="81%">
                <%=CodeConfigBean.getCodeGubunSelect (CounselAdminBean.COUNSEL_KIND, "", 1, "p_mcode", "", "", 0)%>
            </td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>����</b></td>
            <td class="table_02_2"><input name="p_title" type="text" class="input" size="80"></td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>��㳻��</b></td>
            <td class="table_02_2"><textarea name="p_ctext" rows="8" cols="80"></textarea></td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>����</b></td>
            <td class="table_02_2">
              <select name="p_status">
                <option value="1" selected>��ó��</option>
                <option value="2">ó����</option>
                <option value="3">�Ϸ�</option>
              </select>
            </td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>�������</b></td>
            <td class="table_02_2">
              <input name="p_sdate_view" id="p_sdate_view" class="datepicker_input1" type="text" size="10" value='<%=v_today%>'>
              <input name="p_sdate" type="hidden" value="">
            </td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>���ҿ�ð�</b></td>
            <td class="table_02_2"><div id="time"></div>
			<input name="p_etime" type="hidden" class="input" size="10" value=""></td>
          </tr>
          <tr> 
            <td class="table_02_1" colspan="2" height="20"></td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>ó������</b></td>
            <td class="table_02_2">
                <textarea name="p_ftext" rows="7" cols="80"></textarea>
            </td>
          </tr>
        </table>
        <br>
        <!----------------- ����, �ݱ� ��ư ���� ----------------->
        <table width="11%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="center"><a href="javascript:insert_check()"><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
            <td align="center"><a href="javascript:listPage()"><img src="/images/admin/button/btn_list.gif"  border="0"></a></td>
          </tr>
        </table>
        <br>
        <!----------------- ����, ��� ��ư �� ----------------->
    </td>
  </tr>
<table>
</form>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>