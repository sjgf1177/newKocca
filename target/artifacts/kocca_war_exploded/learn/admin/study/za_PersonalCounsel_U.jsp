<%
//**********************************************************
//  1. ��      ��: ��㳻�� ����
//  2. ���α׷���: za_PersonalCounsel_U.jsp
//  3. ��      ��: ��㳻�� ����
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
    v_resno      = data.getResno();
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
    int     v_no       = box.getInt("p_no");

    String v_cuserid = ""; 
    String v_cname    = ""; 
    String v_title   = "";
    String v_ftext   = "";
    String v_ctext   = "";
    String v_mcode   = "";
    String v_subj    = "";
    String v_year    = "";
    String v_subjseq = "";
    String v_etime   = "";
    String v_status  = "";
    String v_sdate   = "";
    String v_ldate   = "";
    String v_gubun   = "";
    String v_sdate_view = "";
    String v_ldate_view = "";
    int i = 0;

    DataBox dbox   = (DataBox)request.getAttribute("selectCounsel");

    if (dbox != null) {
        v_userid  = dbox.getString("d_userid");
        v_cname    = dbox.getString("d_name");
        v_cuserid = dbox.getString("d_cuserid");
        v_title   = dbox.getString("d_title");
        v_ftext   = dbox.getString("d_ftext");
        v_ctext   = dbox.getString("d_ctext");
        v_mcode   = dbox.getString("d_mcode");
        v_subj    = dbox.getString("d_subj");
        v_year    = dbox.getString("d_year");
        v_subjseq = dbox.getString("d_subjseq");
        v_etime   = dbox.getString("d_etime");
        v_status  = dbox.getString("d_status");
        v_sdate   = dbox.getString("d_sdate");
        v_ldate   = dbox.getString("d_ldate");
        v_gubun   = dbox.getString("d_gubun");
        v_sdate_view = FormatDate.getFormatDate(v_sdate,"yyyy/MM/dd");
        v_ldate_view = FormatDate.getFormatDate(v_ldate,"yyyy/MM/dd");

        if (v_etime.equals("")) v_etime="0";
    }

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
    // üũ �� ����
    function update_check() {
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
        document.form1.p_process.value = "CounselUpdate";
        document.form1.submit();
    }

    function delete_check() {
        document.form1.action = "/servlet/controller.study.CounselAdminServlet";
        document.form1.p_process.value = "CounselDelete";
        document.form1.submit();
    }

    function listPage() {
        document.form1.action = "/servlet/controller.study.CounselAdminServlet";
        document.form1.p_process.value = "CounselListPage";
        document.form1.submit();
    }

// �ð��� ���� �ϼ���
var limit= <%=v_etime%>+":01";

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
    <input type="hidden" name="p_gubun"   value="<%=v_gubun%>">
    <input type="hidden" name="p_subj"    value="<%=p_subj%>">
    <input type="hidden" name="p_no" value="<%=v_no%>">
    

<table width="800" border="0" cellpadding="0" cellspacing="10">
  <tr> 
    <td align="left"> 

    <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="../../../images/admin/study/tit_counsel.gif"></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
    </td>
  </tr>
</table>

<table width="800" border="0" cellpadding="0" cellspacing="10" bgcolor="#f7f7f7">
  <tr> 
    <td align="left"> 
        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
          <tr> 
            
          <td align="center" bgcolor="#FFFFFF"> 

            <br>

            <table cellspacing="1" cellpadding="5" class="open_table_out">
              <tr>
                <td colspan="4" class="table_top_line"></td>
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
                <%=CodeConfigBean.getCodeGubunSelect (CounselAdminBean.COUNSEL_KIND, "", 1, "p_mcode", v_mcode, "", 0)%>
            </td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>����</b></td>
            <td class="table_02_2"><input name="p_title" type="text" class="input" size="80" value="<%=v_title%>"></td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>��㳻��</b></td>
            <td class="table_02_2"><textarea name="p_ctext" rows="8" cols="80"><%=v_ctext%></textarea></td>
          </tr>

          <tr> 
            <td class="table_title" height="25"><b>����</b></td>
            <td class="table_02_2">
              <select name="p_status">
                <option value="1" <%if (v_status.equals("1")) {%>selected<%}%>>��ó��</option>
                <option value="2" <%if (v_status.equals("2")) {%>selected<%}%>>ó����</option>
                <option value="3" <%if (v_status.equals("3")) {%>selected<%}%>>�Ϸ�</option>
              </select>
            </td>
          </tr>
          <tr> 
            <td class="table_title" height="25"><b>�������</b></td>
            <td class="table_02_2">
              <input name="p_sdate_view" id="p_sdate_view" class="datepicker_input1" type="text" size="10" value='<%=v_sdate_view%>'>
              <input name="p_sdate" type="hidden" value="<%=v_sdate%>">
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
                <textarea name="p_ftext" rows="7" cols="80"><%=v_ftext%></textarea>
            </td>
          </tr>
        </table>
        <br>
        <!----------------- ����, �ݱ� ��ư ���� ----------------->
        <table width="11%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td align="center"><a href="javascript:update_check()"><img src="/images/admin/button/btn_modify.gif"  border="0"></a></td>
            <td align="center"><a href="javascript:delete_check()"><img src="/images/admin/button/btn_del.gif"  border="0"></a></td>
            <td align="center"><a href="javascript:listPage()"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
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