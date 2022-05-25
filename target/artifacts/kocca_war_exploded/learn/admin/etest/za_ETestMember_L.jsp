<%
/**
 * file name : za_ETestMaster_L.jsp
 * date      :
 * programmer:
 * function  : �¶����� �����  ��ȸ
 */
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.etest.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    String  v_etestsubjnm    = box.getString("p_etestsubjnm");

    String  ss_grcode    = box.getString("s_grcode");        //�����ְ�
    String  ss_upperclass= box.getStringDefault("s_upperclass", "ALL");
    String  ss_etestsubj      = box.getString("s_etestsubj");
    String  ss_gyear       = box.getString("s_gyear");
    String  ss_etestcode    = box.getString("s_etestcode");
    String ems_url = conf.getProperty("ems.url.value"); // ����

    DataBox dbox = (DataBox)request.getAttribute("ETestMasterData");

    ArrayList list = (ArrayList)request.getAttribute("ETestMemberList");
%>
<html>
<head>
<title>�¶����׽�Ʈ ������ȭ��</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--

// ����� �߰�
function InsertMember(maxjoin) {
    if(maxjoin == 0) {
        alert('���� �����ʰ��Դϴ�. ����� ������ �� �� ����ڸ� �߰��Ͻʽÿ�.');
        return;
    }
    window.self.name = "winInsertPage";     //      opener ��ü�� name �� �����Ѵ�
    farwindow =  window.open("", "openWinInsert", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 1017, height = 700, top=0, left=0");
    document.form1.target = "openWinInsert"
    document.form1.p_process.value = "ETestMemberInsertPage";
    document.form1.p_action.value = "go";
    document.form1.p_maxjoin.value = maxjoin;
    document.form1.action = "/servlet/controller.etest.ETestMemberServlet";
    document.form1.submit();

    farwindow.window.focus();
    document.form1.target = window.self.name;
}

// ����������߰�
function InsertSubjMember(maxjoin) {
    if(maxjoin == 0) {
        alert('���� �����ʰ��Դϴ�. ����� ������ �� �� ����ڸ� �߰��Ͻʽÿ�.');
        return;
    }
    window.self.name = "winInsertPage";     //      opener ��ü�� name �� �����Ѵ�
    farwindow =  window.open("", "openWinInsert", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 1017, height = 700, top=0, left=0");
    document.form1.target = "openWinInsert"
    document.form1.p_process.value = "ETestSubjMemberInsertPage";
    document.form1.p_action.value = "go";
    document.form1.p_maxjoin.value = maxjoin;
    document.form1.action = "/servlet/controller.etest.ETestMemberServlet";
    document.form1.submit();

    farwindow.window.focus();
    document.form1.target = window.self.name;
}

// ����������߰�
function InsertFileToDB(maxjoin) {
    if(maxjoin == 0) {
        alert('���� �����ʰ��Դϴ�. ����� ������ �� �� ����ڸ� �߰��Ͻʽÿ�.');
        return;
    }
    window.self.name = "winInsertPage";     //      opener ��ü�� name �� �����Ѵ�
    farwindow = window.open("", "openWinInsert", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 800, height = 600, top=0, left=0");
    document.form1.target = "openWinInsert"
    document.form1.p_process.value = "ETestMemberFileToDB";
    document.form1.p_action.value = "go";
    document.form1.p_maxjoin.value = maxjoin;
    document.form1.action = "/servlet/controller.etest.ETestMemberServlet";
    document.form1.submit();

    farwindow.window.focus();
    document.form1.target = window.self.name;
}

// ����� ����
function DeleteMember() {
  if (chkSelected() < 1) {
    alert('�׽�Ʈ���� ����� ����ڸ� �����ϼ���');
    return;
  }
  document.form1.p_process.value = 'ETestMemberDelete';
  document.form1.p_action.value = "go";
  document.form1.action = "/servlet/controller.etest.ETestMemberServlet";
  document.form1.submit();
}

// üũ����
function chkSelected() {
  var selectedcnt = 0;
  if(document.form1.all['p_checks'] == '[object]') {
    if (document.form1.p_checks.length > 0) {
      for (i=0; i<document.form1.p_checks.length; i++) {
        if (document.form1.p_checks[i].checked == true) {
          selectedcnt++;
        }
      }
    } else {
      if (document.form1.p_checks.checked == true) {
        selectedcnt++;
      }
    }
  }
  return selectedcnt;
}

// �ȳ����Ϲ߼�
/*function whenFreeMail() {
  if (chkSelected() < 1) {
    alert('������ ���� ����ڸ� �����ϼ���');
    return;
  }
    //window.self.name = "winInsertPage";     //      opener ��ü�� name �� �����Ѵ�
    //farwindow = window.open("", "openWinInsert", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 667, //height = 700, top=0, left=0");
    //document.form1.target = "openWinInsert"
    //document.form1.p_process.value = 'ETestMailSendPage';
    //document.form1.p_action.value = "go";
    //document.form1.action = "/servlet/controller.etest.ETestMailServlet";
    //document.form1.submit();


      window.self.name = "ProposeMemberList";
      open_window("openFreeMail","","10","10","800","650");
      document.form1.target = "openFreeMail";
      document.form1.action='<%=ems_url%>/ems/MassMail.do';
      document.form1.p_process.value = 'SendFreeMail';
      document.form1.submit();

    document.form1.target = window.self.name;
}
*/

    //�Ϲݸ��� �߼�
    function MailSend() {
      if (chkSelected() < 1) {
        alert('������ �߼��� �н��ڸ� �����ϼ���');
        return;
      }
      window.self.name = "EtestMemberList";
      open_window("openFreeMail","","10","10","800","650");
      document.form1.target = "openFreeMail";
      document.form1.action='/servlet/controller.etest.ETestMemberServlet';
      document.form1.p_process.value = 'SendFreeMail';
      document.form1.submit();
      document.form1.target = window.self.name;
    }

// ��ȸ�˻�
function whenSelection(p_action) {
    if (document.form1.s_grcode.value == '----') {
            alert("�����׷��� �����ϼ���.");
            return ;
    }
    if (p_action=="go") {
        if (document.form1.s_etestsubj.value=="0"){
            alert("�׽�Ʈ�׷��� �����ϼ���");
            return;
        }
        if (document.form1.s_etestcode.value==0){
            alert("�׽�Ʈ�� �����ϼ���");
            return;
        }
        top.ftop.setPam();
    }
  document.form1.p_process.value = 'ETestMemberListPage';
  document.form1.p_action.value  = p_action;
  document.form1.action = "/servlet/controller.etest.ETestMemberServlet";
  document.form1.submit();
}

// ����� ȭ�� ���ε�
function ReloadPage(p_action) {
  document.form1.p_process.value = 'ETestMemberListPage';
  document.form1.action = "/servlet/controller.etest.ETestMemberServlet";
  document.form1.p_action.value  = p_action;
  document.form1.submit();
}
//-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post" >
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/etest/test_title04.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <br>
      <!----------------- form ���� ----------------->
      <table class="form_table_out" cellspacing="0" cellpadding="1">
        <tr>
          <td align="center">
            <table class="form_table_bg" cellspacing="0" cellpadding="0">
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td align="center">
                  <table class="form_table" cellspacing="0" cellpadding="0" width="99%">
                    <tr>
                      <td>
                          <font color="red">��</font> <%= SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   �����׷�  -->
                         <%= SelectEduBean.getGyear(box, true )%><!-- getGyear(RequestBox, isChange)   �ش翬��  -->
                         �з�<%=CodeConfigBean.getCodeGubunSelect (ETestBean.ETSUBJ_CLASS, "", 1, "s_upperclass", ss_upperclass, "onchange=javascript:whenSelection('change')", 2)%>
                          <font color="red">��</font> �׷�<%=ETestQuestionBean.getGroupSelect (ss_grcode, ss_upperclass, "s_etestsubj", ss_etestsubj, "onchange=javascript:whenSelection('change')")%>
                          <font color="red">��</font> �׽�Ʈ��<%= ETestMemberBean.getETestCode(ss_etestsubj, ss_gyear, "s_etestcode", ss_etestcode, "")%>&nbsp;<% //-- getSubjseq(RequestBox, isChange, isALL) ---%>
                         <%@ include file="/learn/admin/include/za_GoButton.jsp" %>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td height="3"></td>
              </tr>
<%
           String v_ing = "";
           int v_update = 0;

           if(!dbox.getString("d_etesttext").equals("")){

           long v_start = Long.parseLong(dbox.getString("d_startdt"));
           long v_end = Long.parseLong(dbox.getString("d_enddt"));

                 Date d_now = new Date();
                 String d_year = String.valueOf(d_now.getYear()+1900);
                 String d_month = String.valueOf(d_now.getMonth()+1);
                 String d_day = String.valueOf(d_now.getDate());
                 String d_hour = String.valueOf(d_now.getHours());
                 String d_minute = String.valueOf(d_now.getMinutes());

                 if(d_month.length() == 1){
                        d_month = "0" + d_month;
                 }
                 if (d_day.length() == 1){
                        d_day = "0" + d_day;
                 }
                 if (d_hour.length() == 1){
                        d_hour = "0" + d_hour;
                 }
                 if (d_minute.length() == 1){
                        d_minute = "0" + d_minute;
                 }
                 long v_now = Long.parseLong(d_year+d_month+d_day+d_hour+d_minute);


           if (v_start > v_now){
                    v_ing = "<font color='red'>�׽�Ʈ ���� ���Դϴ�.</font>";
                    v_update = 1;
           } else if (v_now > v_end){
                    v_ing = "�׽�Ʈ ������ �Ϸ�Ǿ����ϴ�.";

           } else if (v_start <= v_now || v_now < v_end){
                    v_ing = "�׽�Ʈ�� ���� ���Դϴ�";
                    v_update = 2;
           }
           }
%>
              <tr>
                <td align="center">
                  <table width="98%" cellspacing="0" cellpadding="0" class="form_table">
                    <tr>
                      <td width="11%">��<b> �׽�Ʈ��</b></td>
                      <td align="left">: &nbsp;&nbsp;<%=dbox.getString("d_etesttext")%></td>
                      <td width="" height="25"></td>
                      <td align="left"></td>
                      <td width="13%"></td>
                      <td align="left"></td>
                    </tr>
                    <tr>
                      <td width="11%" height="25">��<b> ���۽ð�</b></td>
                      <td align="left">: &nbsp;&nbsp;<%=FormatDate.getFormatDate(dbox.getString("d_startdt"),"yyyy/MM/dd hh:mm")%></td>
                      <td width="11%">��<b> ����ð�</b></td>
                      <td align="left">: &nbsp;&nbsp;<%=FormatDate.getFormatDate(dbox.getString("d_enddt"),"yyyy/MM/dd hh:mm")%></td>
                      <td width="11%"></td>
                      <td align="left"></td>
                    </tr>
                    <tr>
                      <td width="11%">��<b> ����</b></td>
                      <td align="left">: &nbsp;&nbsp;<%=dbox.getInt("d_etestlimit")%>��</td>
                      <td width="11%">��<b> �� �����</b></td>
                      <td align="left">: &nbsp;&nbsp;<%=dbox.getInt("d_membercnt")%>��</td>
                      <td width="13%">��<b> ���࿩��</b></td>
                      <td align="left">: &nbsp;&nbsp;<%=v_ing%></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td height="3"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <!----------------- form �� ----------------->
      <br>
      <!----------------- ������߰�, ����ڻ��� ��ư ���� ----------------->
      <table cellpadding="0" cellspacing="0" class="table1">
<%if(v_update > 0){%>
        <tr align="right">
          <td>
            <%if(v_update < 3 ){%>
            <a href='javascript:MailSend()'><img src="/images/admin/button/btn_guidemail.gif" border="0"></a>
            <a href="javascript:InsertSubjMember('<%=dbox.getInt("d_etestlimit")-list.size()%>')"><img src="/images/admin/button/btn_cpeopleplus.gif" border="0"></a>
            <a href="javascript:InsertFileToDB('<%=dbox.getInt("d_etestlimit")-list.size()%>')"><img src="/images/admin/button/btn_peoplefilep.gif" border="0"></a>
            <a href="javascript:InsertMember('<%=dbox.getInt("d_etestlimit")-list.size()%>')"><img src="/images/admin/button/btn_peopleplus.gif" border="0"></a>
            <a href="javascript:DeleteMember()"><img src="/images/admin/button/btn_peopledelete.gif" border="0"></a>
            <%} else if (v_update == 3){%>

            <%}%>
          </td>
        </tr>
<%}else{%>
        <tr align="right">
          <td align="left"></td>
          <td>
          <td>
          </td>
        </tr>
<%}%>
      </table>
      <!----------------- ������߰�, ����ڻ��� ��ư �� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
    <input type="hidden" name="emsName" value="<%=box.getSession("name")%>">
    <input type="hidden" name="emsEmail" value="<%=box.getSession("email")%>">


        <input type="hidden" name="userLoginID" value="<%=box.getSession("userid")%>">
        <input type="hidden" name="p_process"    value="">
        <input type="hidden" name="p_action"     value="">
        <input type="hidden" name="p_etestsubjnm"       value="<%=dbox.getString("d_etestsubjnm")%>">
        <input type="hidden" name="p_etesttext"       value="<%=dbox.getString("d_etesttext")%>">
        <input type="hidden" name="p_maxjoin"     value="">
        <tr>
          <td colspan="7" class="table_top_line"></td>
        </tr>
        <tr>
          <td width="5%" class="table_title">NO</td>
          <td class="table_title">ȸ������</td>
          <td class="table_title">ID</td>
          <td class="table_title">����</td>
          <td class="table_title">����</td>
        </tr>
<%
        for (int i=0; i<list.size(); i++) {
            DataBox dbox2  = (DataBox)list.get(i);      %>
        <tr>
          <td width="5%" class="table_01"><%=(i+1)%></td>
          <td class="table_02_1"><%=dbox2.getString("d_membergubunnm")%></td>
          <td class="table_02_1"><%=dbox2.getString("d_userid")%></td>
          <td class="table_02_1"><%=dbox2.getString("d_name")%></td>
          <td class="table_02_1">
            <input type="checkbox" name="p_checks" value="<%=dbox2.getString("d_userid")%>,,,">
          </td>
        </tr>
<%  }  %>
        </table>
      <br>
    </td>
  </tr>
</table>

</form>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
