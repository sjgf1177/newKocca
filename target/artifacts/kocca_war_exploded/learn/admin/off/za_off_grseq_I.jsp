<%
//**********************************************************
//  1. ��     ��: ������� ȭ��
//  2. ���α׷���: za_off_Recruit_I.jsp
//  3. ��     ��: ������� ȭ��
//  4. ȯ     ��: JDK 1.5
//  5. ��     ��: 1.0
//  6. ��     ��: swchoi 2009.11.13
//  7. ��     ��:
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
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>

<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    //DEFINED in relation to select START
    String  ss_gyear     = box.getStringDefault("s_gyear", FormatDate.getDate("yyyy"));         //�⵵
    String  ss_subjseq   = box.getString("s_subjseq");        //���� ����
    //DEFINED in relation to select END

    DataBox data = (DataBox)request.getAttribute("resultData");
    String p_subj = data.getString("d_subj");
    String  p_upperclass = data.getString("d_upperclass");    //������з�
    String  p_middleclass = data.getString("d_middleclass");    //�����ߺз�
    String  p_lowerclass = data.getString("d_lowerclass");    //�����Һз�
    String  p_needinput = data.getString("d_needinput");      //�ʼ��Է�
%>
<html>
<head>
<title>���հ��� ����</title>
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
    $("#p_propstart1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
    $("#p_propend1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
    $("#p_edustart1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
    $("#p_eduend1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
    $("#p_billbegindt1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
    $("#p_billenddt1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
    $("#p_startcanceldate1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
    $("#p_endcanceldate1").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
});
<!--

//���� ����
function updateSubject() {
    if(!chkData()) {
      return;
    }

    document.form1.s_action.value = "go";
    document.form1.p_process.value = 'insert';
    document.form1.p_specials.value = document.form1.p_new.value + document.form1.p_hit.value + document.form1.p_recom.value + document.form1.p_lecture.value;
    document.form1.submit();
}
//���� ��
function DeleteSubject() {
  if (confirm("���������� ���� �Ͻðڽ��ϱ�?")) {
    document.form1.p_process.value = 'delete';
    document.form1.submit();
  }
}

function goSubjectListPage() {
    document.form1.s_action.value = "go";
    document.form1.p_process.value  = 'listPage';
    document.form1.submit();
}


//���� üũ ����

function whenUsebook() {
    //���翩�� üũ
    if (document.form1.p_usebook.value=="Y") {
        document.form1.p_bookname.disabled = false;
        document.form1.p_bookprice.disabled = false;
    } else {
        document.form1.p_bookname.disabled = true;
        document.form1.p_bookname.value = "";
        document.form1.p_bookprice.disabled = true;
        document.form1.p_bookprice.value = 0;
    }
}

function whenIsgoyong() {
    //��뺸�� ��뿩��üũ
    if (document.form1.p_isgoyong.value=="Y") {
        document.form1.p_goyongpricemajor.disabled = false;
        document.form1.p_goyongpriceminor.disabled = false;
    } else {
        document.form1.p_goyongpricemajor.disabled = true;
        document.form1.p_goyongpriceminor.disabled = true;
        document.form1.p_goyongpricemajor.value = 0;
        document.form1.p_goyongpriceminor.value = 0;
    }
}

function whenIsuse() {
    //������뿩��
    if (document.form1.p_isuse.value=="Y") {
        document.form1.p_isvisible.disabled = false;
    } else {
        document.form1.p_isvisible.disabled = true;
        document.form1.p_isvisible.value = "N";
    }
}

//����üũ ��


function chkData() {
  ff = document.form1;
  var wec = document.Wec;
  ff.p_explain.value = wec.MIMEValue;
  if(getObjectLength("p_subjtarget")>2000) {
         alert("��������� ������ �ʹ� ��ϴ�. 100����Ʈ ���Ϸ� �ۼ��Ͽ� �ֽʽÿ�.");
         document.form1.p_subjtarget.focuse();
         return false;
     }
     if(getObjectLength("p_intro")>4000) {
         alert("��������� ������ �ʹ� ��ϴ�. 4000����Ʈ ���Ϸ� �ۼ��Ͽ� �ֽʽÿ�.");
         document.form1.p_intro.focuse();
     }
  if(!dateChk()) {
      return false;
  }
  if (document.form1.p_subj.value=='ALL' || document.form1.p_subj.value=='') {
    alert('�����ڵ带 �����ϼ���.');
    return false;
  }
  if (!number_chk_noalert(document.form1.p_biyong.value)) {
    alert('�����ᰡ �߸��ԷµǾ����ϴ�.');
    return false;
  }
  if (!number_chk_noalert(document.form1.p_edudays.value)) {
    alert('�н������� �߸��ԷµǾ����ϴ�.');
    return false;
  }
  if (!number_chk_noalert(document.form1.p_point.value)) {
    alert('�̼������� �߸��ԷµǾ����ϴ�.');
    return false;
  }
  if (!number_chk_noalert(document.form1.p_studentlimit.value)) {
    alert('������ �߸��ԷµǾ����ϴ�.');
    return false;
  }

  if (!number_chk_noalert(document.form1.p_gradscore.value)) {
    alert('�̼�����-������ �߸��ԷµǾ����ϴ�.');
    return false;
  }

  if (!number_chk_noalert(document.form1.p_gradstep.value)) {
    alert('�̼�����-�������� �߸��ԷµǾ����ϴ�.');
    return false;
  }

  if (!number_chk_noalert(document.form1.p_gradexam.value)) {
    alert('�̼�����-�򰡰� �߸��ԷµǾ����ϴ�.');
    return false;
  }

  if (!number_chk_noalert(document.form1.p_gradreport.value)) {
    alert('�̼�����-����Ʈ�� �߸��ԷµǾ����ϴ�.');
    return false;
  }

    if (ff.p_gradscore.value > 100) {
        alert('�̼�����-������ 100 �̻��Դϴ�.');
        return false;
    }
    if (ff.p_gradstep.value > 100) {
        alert('�̼�����-�������� 100 �̻��Դϴ�.');
        return false;
    }
    if (ff.p_gradexam.value > 100) {
        alert('�̼�����-�߰��򰡰� 100 �̻��Դϴ�.');
        return false;
    }
    if (ff.p_gradftest.value > 100) {
        alert('�̼�����-�����򰡰� 100 �̻��Դϴ�.');
        return false;
    }
    if (ff.p_gradhtest.value > 100) {
        alert('�̼�����-�����򰡰� 100 �̻��Դϴ�.');
        return false;
    }
    if (ff.p_gradreport.value > 100) {
        alert('�̼�����-����Ʈ�� 100 �̻��Դϴ�.');
        return false;
    }
    if (ff.p_gradetc1.value > 100) {
        alert('�̼�����-�������� 100 �̻��Դϴ�.');
        return false;
    }
    if (ff.p_gradetc2.value > 100) {
        alert('�̼�����-��Ÿ�� 100 �̻��Դϴ�.');
        return false;
    }

  if (!number_chk_noalert(document.form1.p_goyongpricemajor.value)) {
    alert('ȯ�޾��� �߸��ԷµǾ����ϴ�.');
    return false;
  }

  if (!number_chk_noalert(document.form1.p_edulimit.value)) {
        alert('1���ִ��н����� �߸��ԷµǾ����ϴ�.');
        return false;
  }

  if (!whenChaneWValue()) return false;

  if (blankCheck(document.form1.p_subjnm.value)) {
    alert('�������� �Է��Ͻʽÿ�.');
    document.form1.p_subjnm.focus();
    return false;
  }

 if (document.form1.p_explain.value.length==0) {
        alert('���������� �Է��Ͻʽÿ�.');
        return false;
 }
    /* off line�� ����ġ ��� ����
  var weight = document.form1.p_wscore.value;
    if (weight < 100) {
        alert('����ġ�� 100% ���� �����ϴ�');
        return false;
        } else if (weight > 100) {
        alert('����ġ�� 100% ���� �����ϴ�.');
        return false;
        }
        */
  return true;
}

function fnPreview() {
      var url = "/servlet/controller.course.SubjectServlet?p_process=buyBagPreviewPage&p_needinput=" + $("#p_needinput").val();

      open_window("",url,"0","0","720","600");
}

// ��� �˻� �� ó��
function receiveMember(userid, name, resno, email, cono, jikwi, jikwinm, comp, compnm, tmp1, tmp2, tmp3){
  if (tmp1 == 'p_cuser') {
    document.form1.p_cuseridnm.value = name;
    document.form1.p_cuserid.value   = userid;
  } else if (tmp1 == 'p_muser') {
    document.form1.p_museridnm.value = name;
    document.form1.p_muserid.value   = userid;
    document.form1.p_musertel.value   = tmp3;
  }
}


//��米�� �˻�
function searchMuser() {
  var p_gubun = 'name';
  var p_key1  = '';//document.form1.p_museridnm.value;
  var p_key2  = '1';
  var url = "/servlet/controller.library.SearchServlet?p_process=tutor&p_gubun="+ p_gubun +"&p_key1="+ p_key1 +"&p_key2="+p_key2;
  open_window("",url,"0","0","100","100");
}
// ��米�� �˻� �� ó��
function receiveTutor(userid, name, resno, email, phone, tmp1, tmp2, tmp3, tmp4, tmp5){
    addMuser(userid, name);
//  document.form1.p_museridnm.value = name;
//  document.form1.p_muserid.value   = userid;
//  document.form1.p_musertel.value   = phone;
}

//����ȸ�� �˻�
function searchProducer() {
  var p_key1  = document.form1.p_producernm.value;
  var p_key2  = '';
//  var p_key2  = 'p_producer';
  var url = "/servlet/controller.library.SearchServlet?p_process=grpcomp&p_gubun=companynm&p_key1=&p_key2="+p_key2;
  open_window("",url,"0","0","100","100");
}

//����ȸ�� �˻�
function searchOwner() {
  var p_key1  = document.form1.p_ownernm.value;
  var p_key2  = 'p_owner';
  var url = "/servlet/controller.library.SearchServlet?p_process=grpcomp&p_gubun=companynm&p_key1=&p_key2="+p_key2;
  open_window("",url,"0","0","100","100");
}
// ȸ�� �˻� �� ó��
function receiveGrpComp(comp , compnm, comptype, groupnm, companynm, tmp1, tmp2, tmp3) {
//  if (tmp1 == 'p_producer') {
  if (tmp1 == '') {
    document.form1.p_producernm.value = compnm;
    document.form1.p_producer.value   = comp;
  } else if (tmp1 == 'p_owner') {
    document.form1.p_ownernm.value = compnm;
    document.form1.p_owner.value   = comp;
  }
}

// ���߼Һз� ����
function whenSelection() {
    document.form1.p_process.value = 'insertPage';
    //��з� ���ý� �ߺз��� ALL�� �ʱ�ȭ
    document.form1.s_middleclass.value = '';
    document.form1.submit();
}

function whenChaneWValue() {
      if (!number_chk_noalert(document.form1.p_wstep.value)) {
        alert('����ġ-������(%)�� �߸��ԷµǾ����ϴ�.');
        return false;
      }
      if (!number_chk_noalert(document.form1.p_wmtest.value)) {
        alert('����ġ-�߰���(%)�� �߸��ԷµǾ����ϴ�.');
        return false;
      }
      if (!number_chk_noalert(document.form1.p_wftest.value)) {
        alert('����ġ-������(%)�� �߸��ԷµǾ����ϴ�.');
        return false;
      }
      if (!number_chk_noalert(document.form1.p_whtest.value)) {
        alert('����ġ-������(%)�� �߸��ԷµǾ����ϴ�.');
        return false;
      }
      if (!number_chk_noalert(document.form1.p_wreport.value)) {
        alert('����ġ-����Ʈ(%)�� �߸��ԷµǾ����ϴ�.');
        return false;
      }
      if (!number_chk_noalert(document.form1.p_wact.value)) {
        alert('����ġ-��Ƽ��Ƽ(%)�� �߸��ԷµǾ����ϴ�.');
        return false;
      }
      if (!number_chk_noalert(document.form1.p_wetc1.value)) {
        alert('����ġ-������(%)�� �߸��ԷµǾ����ϴ�.');
        return false;
      }
      if (!number_chk_noalert(document.form1.p_wetc2.value)) {
        alert('����ġ-��Ÿ(%)�� �߸��ԷµǾ����ϴ�.');
        return false;
      }
      var weight =  (10*document.form1.p_wstep.value
        + 10*document.form1.p_wmtest.value + 10*document.form1.p_wftest.value
        + 10*document.form1.p_whtest.value + 10*document.form1.p_wreport.value
        + 10*document.form1.p_wact.value + 10*document.form1.p_wetc1.value
        + 10*document.form1.p_wetc2.value)/10;
      document.form1.p_wscore.value=weight;
      return true;
}
$(document).ready(function()    {
    existSubjSeq();
});
function existSubjSeq() {
    $.post("/servlet/controller.common.TagServlet"
            , {sqlNum:"off.existSubjSeq", param:"<%= p_subj %>", param2 : $("#p_year").val(), type:5,rerurnFunction:"existSubjSeqReturn",objNm:"existSubjSeqValue"}
            , function(data) {
                if (data.indexOf("existSubjSeqReturn")==-1)
                    $("#p_subjseq").val("0001");
                $("#existSubjSeqDiv").html(data);
            });
}
function existSubjSeqReturn(k, v) {
    var r=Number(k)+1;
    var tmp="";
    if(r<10)
        tmp="000"+r;
    else if(r>9 && r<100)
        tmp="00"+r;
    else if(r>99)
        tmp="0"+r;
    else
        tmp=r;

    $("#p_subjseq").val(tmp);
}
// �������ĺ�ȯ
function dateChk(){
    ff = document.form1;

    if(isNull(ff.p_startcanceldate1, "������û��ұⰣ")){
        ff.p_startcanceldate.value=make_date(ff.p_startcanceldate1.value)+ff.p_startcanceldate2.options[ff.p_startcanceldate2.selectedIndex].value;
    }
    else {
        location.href="#chk004";
        return false;
    }
    if(isNull(ff.p_endcanceldate1, "������û��ұⰣ")){
        ff.p_endcanceldate.value=make_date(ff.p_endcanceldate1.value)+ff.p_endcanceldate2.options[ff.p_endcanceldate2.selectedIndex].value;
    }
    else {
        location.href="#chk004";
        return false;
    }
    if(isNull(ff.p_propstart1, "������û�Ⱓ")){
        ff.p_propstart.value=make_date(ff.p_propstart1.value)+ff.p_propstart2.options[ff.p_propstart2.selectedIndex].value;
    }
    else {
        location.href="#chk001";
        return false;
    }
    if(isNull(ff.p_propend1, "������û�Ⱓ")){
        ff.p_propend.value=make_date(ff.p_propend1.value)+ff.p_propend2.options[ff.p_propend2.selectedIndex].value;
    }
    else {
        location.href="#chk001";
        return false;
    }

    if(isNull(ff.p_edustart1, "�н��Ⱓ")){
        ff.p_edustart.value=make_date(ff.p_edustart1.value)+ff.p_edustart2.options[ff.p_edustart2.selectedIndex].value;
    }
    else {
        location.href="#chk002";
        return false;
    }
    if(isNull(ff.p_eduend1, "�н��Ⱓ")){
        ff.p_eduend.value=make_date(ff.p_eduend1.value)+ff.p_eduend2.options[ff.p_eduend2.selectedIndex].value;
    }
    else {
        location.href="#chk002";
        return false;
    }
    if(isNull(ff.p_billbegindt1, "�����Ⱓ")){
        ff.p_billbegindt.value=make_date(ff.p_billbegindt1.value)+ff.p_billbegindt2.options[ff.p_billbegindt2.selectedIndex].value;
    }
    else {
        location.href="#chk003";
        return false;
    }
    if(isNull(ff.p_billenddt1, "�����Ⱓ")){
        ff.p_billenddt.value=make_date(ff.p_billenddt1.value)+ff.p_billenddt2.options[ff.p_billenddt2.selectedIndex].value;
    }
    else {
        location.href="#chk003";
        return false;
    }


    return true;
}

-->
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0" onload="">
<div id="existSubjSeqDiv"></div>

<form name="form1" enctype="multipart/form-data" method = "POST" action="/servlet/controller.off.OffGrseqAdminServlet">
    <input type="hidden" name="p_process"    value="">
    <input type="hidden" name="s_action">

    <input type="hidden" name="p_specials"  value="">

    <input type="hidden" name = "p_isoutsourcing" value="N">
    <input type="hidden" name="p_edulimit" value="0">
    <input type="hidden" name="p_musertel" value="">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/portal/s.1_off01.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <%=box.getString("p_warnmsg")%><br>
      <br>
      <!----------------- ���� ���/����/����/�󼼺��� (���̹�) ���� ----------------->
        <table cellspacing="1" cellpadding="5" class="table_out" border="0">
          <tr>
            <td colspan="5" class="table_top_line"></td>
          </tr>
          <tr>
            <td class="table_title" rowspan="25"><b>��������</b></td>
            <td colspan="4" class="table_01"><font color="red">(*)</font> ǥ�ô� �ʼ� �Է��Դϴ�.</td>
          </tr>
          <tr>
            <td class="table_01">��������</td>
            <td class="table_02_2" > �����ڵ� : <input type="text" class="input" name="p_subj" size="10" maxlength="10" value="<%= data.get("d_subj") %>" readonly></td>
          </tr>
          <tr>
            <td  class="table_01">������<font color="red">(*)</font></td>
            <td class="table_02_2"><input type="text" class="input" name="p_subjnm1" size="38" maxlength="100" value="<%= data.get("d_subjnm") %>" tabindex="" disabled="disabled">
                <input type="hidden" class="input" name="p_subjnm" size="38" maxlength="100" value="<%= data.get("d_subjnm") %>">
            </td>
          </tr>
          <tr>
            <td  class="table_01">����Ư��</td>
<%
                String specials = data.get("d_specials");
                String p_new   = (specials.length() > 0 ? specials.substring(0,1) : "N");
                String p_hit   = (specials.length() > 1 ? specials.substring(1,2) : "N");
                String p_recom = (specials.length() > 2 ? specials.substring(2,3) : "N");
                String p_lecture = (specials.length() > 3 ? specials.substring(3,4) : "N");
%>
            <td class="table_02_2"> �ű�
              <select name="p_new"  class="inputpsearch" tabindex=17>
                <option value='Y' <% if(p_new.equals("Y") ||p_new.equals("")) out.print(" selected"); %>>Y</option>
                <option value='N' <% if(p_new.equals("N")) out.print(" selected"); %>>N</option>
              </select>
              HIT
              <select name="p_hit"  class="inputpsearch" tabindex=15>
                <option value='Y' <% if(p_hit.equals("Y") ||p_hit.equals("")) out.print(" selected"); %>>Y</option>
                <option value='N' <% if(p_hit.equals("N")) out.print(" selected"); %>>N</option>
              </select>
              ��õ
              <select name="p_recom"  class="inputpsearch" tabindex=16>
                <option value='Y' <% if( p_recom.equals("Y") || p_recom.equals("")) out.print(" selected");%>>Y</option>
                <option value='N' <% if( p_recom.equals("N")) out.print(" selected");%>>N</option>
              </select>
              Ư��
              <select name="p_lecture"  class="inputpsearch" tabindex=16>
                <option value='Y' <% if( p_lecture.equals("Y") || p_lecture.equals("")) out.print(" selected");%>>Y</option>
                <option value='N' <% if( p_lecture.equals("N")) out.print(" selected");%>>N</option>
              </select>
            </td>
          </tr>
          <tr>
            <td  class="table_01">
                <!--����-->��米�� &nbsp;
            </td>
            <td height="34" class="table_02_2" >
                <kocca_select:select name="p_tutorid" sqlNum="offmuserList.1"  param="<%= p_subj %>"
                onChange="" attr=" " selectedValue="" isLoad="true" all="none" />
            </td>
          </tr>
<% if(!data.get("d_isterm").equals("N")) { %>
          <tr>
            <td height="31" class="table_01">�� �б��</td>
            <td class="table_02_2" > <input name="p_term" value="4" <%= data.get("d_isterm").equals("N") ? "disabled" : ""%> class="input"  size="2" maxlength="1" >�б�
            </td>
          </tr>
<%} %>
          <tr>
            <td height="31" class="table_01">������뿩��</td>
            <td class="table_02_2" > <select name="p_isuse"  class="inputpsearch" onChange="whenIsuse()" tabindex=26>
                <option value='Y'>Y</option>
                <option value='N' <%= data.get("d_isuse").equals("N") ? "selected" : ""  %>>N</option>
              </select>
            </td>
          </tr>
          <tr>
            <td class="table_01">�н��ڿ��� �����ֱ�</td>
            <td class="table_02_2" ><select name="p_isvisible"  class="inputpsearch" tabindex=27>
                <option value='Y'>Y</option>
                <option value='N' <%= data.get("d_isvisible").equals("N") ? "selected" : ""  %>>N</option>
              </select><select style="display:none" name="p_isintroduction"  class="inputpsearch" tabindex=28>
                <option value='Y'>Y</option>
                <option value='N' <%= data.get("d_isintroduction").equals("N") ? "selected" : ""  %>>N</option>
              </select>
              </td>
          </tr>
          <tr>
            <td class="table_01">�����Ⱓ</td>
            <td class="table_02_2">
                <input type="text" class="input" name="p_edudays" size="10" maxlength="5" value="<%= data.get("d_edudays") %>" tabindex=28>
                <select name="p_edudaystype"  class="inputpsearch" tabindex=28>
                    <option value='Y'>��</option>
                    <option value='M' <%= data.get("d_edudaystype").equals("M") ? "selected" : ""  %>>��</option>
                    <option value='W' <%= data.get("d_edudaystype").equals("W") ? "selected" : ""  %>>��</option>
                    <option value='D' <%= data.get("d_edudaystype").equals("D") ? "selected" : ""  %>>��</option>
                </select>
              </td>
          </tr>
          <tr>
            <td class="table_01">�������</td>
            <td class="table_02_2"><input type="text" class="input" name="p_place" size="50" value="<%= data.get("d_place") %>" tabindex=29></td>
          </tr>
          <tr>
            <td  class="table_01">��������</td>
            <td class="table_02_2"><input type="text" class="input" name="p_studentlimit" size="10" maxlength="5" value="<%= data.get("d_studentlimit") %>" tabindex=30>
              ��</td>
          </tr>
          <tr>
            <td  class="table_01">�������� �����</td>
            <td class="table_02_2"><input type="text" class="input" name="p_studentwait" size="10" maxlength="5" value="<%= data.get("d_studentwait") %>" tabindex=30>
              ��</td>
          </tr>
          <tr>
            <td class="table_01">������</td>
            <td class="table_02_2"><input type="text" class="input" name="p_biyong" size="10" maxlength="7" value="<%= data.get("d_biyong") %>" tabindex=31>
              ��</td>
          </tr>
          <tr>
            <td align="center" class="table_01">����(��������)</td>
            <td class="table_02_2">
                <input type="text" class="input" name="p_charger" value="<%= data.get("d_charger") %>" size="50"/>
            </td>
          </tr>
          <tr>
            <td class="table_01">��뺸�迩��</td>
            <td class="table_02_2">
              <select name="p_isgoyong"  class="inputpsearch" onChange="whenIsgoyong()" tabindex=31>
                <option value='Y' >Y</option>
                <option value='N' <%= data.get("d_isgoyong").equals("N") ? "selected" : ""  %>>N</option>
              </select>
            </td>
          </tr>
          <tr>
            <td  class="table_01">ȯ�ޱݾ�</td>
            <td class="table_02_2" >
              ��Ը���(300���̻���) : <input type="text" class="input" name="p_goyongpricemajor" size="15" maxlength="10" value="<%= data.get("d_goyongpricemajor") %>" <%= data.get("d_isgoyong").equals("N") ? "disabled" : ""  %> tabindex=36> ��
              &nbsp;&nbsp;&nbsp;�켱�������(�߼ұ��) : <input type="text" class="input" name="p_goyongpriceminor" size="15" maxlength="10" value="<%= data.get("d_goyongpriceminor") %>" <%= data.get("d_isgoyong").equals("N") ? "disabled" : ""  %> tabindex=36> ��
            </td>
          </tr>
          <tr>
            <td colspan="4" class="table_top_line"></td>
          </tr>
          <tr>
            <td height="25" class="table_01" width="25%"><b>�⵵</b></td>
            <td class="table_02_2"><input type="text" name="p_year" id="p_year" value="<%= ss_gyear %>" class="input" size="4" maxlength=4 onChange="existSubjSeq();"/></td>
          </tr>
          <tr>
            <td height="25" class="table_01" width="25%"><b>����</b></td>
            <td class="table_02_2"><input type="text" name="p_subjseq" id="p_subjseq" value="" readonly class="input" size="4" maxlength=4/><input type="hidden" name="p_seq" id="p_seq" value="1" readonly class="input" size="4" maxlength=4/></td>
          </tr>
            <tr>
              <td height="25" class="table_01" width="25%"><b>������û�Ⱓ</b></td>
              <td class="table_02_2">
                 <a name="#chk001"></a><input name="p_propstart1" id="p_propstart1" type="text" class="datepicker_input1" size="10" value="">
                ��&nbsp;&nbsp;
                <select name="p_propstart2"id="p_propstart2">
                  <%=FormatDate.getDateOptions(0,23,0)%>
                </select>
                �� &nbsp;~&nbsp;&nbsp;
                <input name="p_propend1" id="p_propend1" type="text" class="datepicker_input1" size="10" value="">
                ��&nbsp;
                <select name="p_propend2"id="p_propend2">
                  <%=FormatDate.getDateOptions(0,23,23)%>
                </select>
                ��&nbsp;
                <input type=hidden name="p_propstart" value="">
                <input type=hidden name="p_propend" value="">
              </td>
            </tr>
            <tr>
              <td height="25" class="table_01" width="25%"><b>�н� �Ⱓ</b></td>
              <td class="table_02_2">
                <a name="#chk002"></a><input name="p_edustart1" id="p_edustart1" type="text" class="datepicker_input1" size="10" value="">
                ��&nbsp;&nbsp;
                <select name="p_edustart2"id="p_edustart2">
                  <%=FormatDate.getDateOptions(0,23,0)%>
                </select>
                �� &nbsp;~&nbsp;&nbsp;
                <input name="p_eduend1" id="p_eduend1" type="text" class="datepicker_input1" size="10" value="">
                ��&nbsp;&nbsp;
                <select name="p_eduend2" id="p_eduend2">
                  <%=FormatDate.getDateOptions(0,23,23)%>
                </select>
                ��&nbsp;
                <input type=hidden name="p_edustart" value="">
                <input type=hidden name="p_eduend" value="">
              </td>
            </tr>
            <tr>
              <td height="25" class="table_01" width="25%"><b>���� �Ⱓ</b></td>
              <td class="table_02_2">
                <a name="#chk003"></a><input name="p_billbegindt1" id="p_billbegindt1" type="text" class="datepicker_input1" size="10" value="">
                ��&nbsp;&nbsp;
                <select name="p_billbegindt2" id="p_billbegindt2">
                  <%=FormatDate.getDateOptions(0,23,0)%>
                </select>
                �� &nbsp;~&nbsp;&nbsp;
                <input name="p_billenddt1" id="p_billenddt1" type="text" class="datepicker_input1" size="10" value="">
                ��&nbsp;&nbsp;
                <select name="p_billenddt2" id="p_billenddt2">
                  <%=FormatDate.getDateOptions(0,23,23)%>
                </select>
                ��&nbsp;
                <input type=hidden name="p_billbegindt" value="">
                <input type=hidden name="p_billenddt" value="">
              </td>
            </tr>
             <tr>
               <td class="table_01" height="25"><b>������û��ұⰣ</b></td>
               <td class="table_02_2">
                <a name="#chk004"></a><input name="p_startcanceldate1" id="p_startcanceldate1" type="text" class="datepicker_input1" size="10" value="" onMouseover="if(this.value=='') this.value=p_propstart1.value"> ��&nbsp;&nbsp;
                <select name="p_startcanceldate2" id="p_startcanceldate2">
                  <%=FormatDate.getDateOptions(0,23,0)%>
                </select>
                �� &nbsp;~&nbsp;&nbsp;
                <input name="p_endcanceldate1" id="p_endcanceldate1" type="text" class="datepicker_input1" size="10" value="" onMouseover="if(this.value=='') this.value=p_propend1.value"> ��&nbsp;&nbsp;
                <select name="p_endcanceldate2" id="p_endcanceldate2">
                  <%=FormatDate.getDateOptions(0,23,23)%>
                </select>
                ��&nbsp;
                <input type=hidden name="p_startcanceldate" value="">
                <input type=hidden name="p_endcanceldate" value="">
               </td>
             </tr>
        </table>

       </td></tr><tr><td align="center" valign="top"><br>

        <table cellspacing="1" cellpadding="5" class="table_out" border="0">
          <tr>
            <td class="table_title" rowspan=2>��������</td>
            <td class="table_01" rowspan=2>�̼�����<input type="hidden" name="p_point" value="100"></td>
            <td class="table_01">����</td>
            <td class="table_01">������</td>
            <td class="table_01">�߰���</td>
            <td class="table_01">������</td>
            <td class="table_01">������</td>
            <td class="table_01">����Ʈ</td>
            <td class="table_01">������</td>
            <td class="table_01">��Ÿ</td>
        </tr>
        <tr>
            <td class="table_02_2" ><input type="text" class="input" name="p_gradscore" size="10" maxlength="5" value="<%= data.get("d_gradscore") %>" tabindex=52></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_gradstep" size="10" maxlength="5" value="<%= data.get("d_gradstep") %>" tabindex=53></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_gradexam" size="10" maxlength="5" value="<%= data.get("d_gradexam") %>" tabindex=54></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_gradftest" size="10" maxlength="5" value="<%= data.get("d_gradftest") %>" tabindex=55></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_gradhtest" size="10" maxlength="5" value="<%= data.get("d_gradhtest") %>" tabindex=56></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_gradreport" size="10" maxlength="5" value="<%= data.get("d_gradreport") %>" tabindex=57></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_gradetc1" size="10" maxlength="5" value="<%= data.get("d_gradetc1") %>" tabindex=58></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_gradetc2" size="10" maxlength="5" value="<%= data.get("d_gradetc2") %>" tabindex=59></td>
        </tr>
          <tr>
            <td class="table_title" rowspan=2>��������<br>����ġ(%)�� ���� 100�̾�� �մϴ�.</td>
            <td class="table_01" rowspan=2>����ġ(%)</td>
            <td class="table_01">�հ�(%)</td>
            <td class="table_01">������</td>
            <td class="table_01">�߰���</td>
            <td class="table_01">������</td>
            <td class="table_01">������</td>
            <td class="table_01">����Ʈ</td>
            <td class="table_01">������</td>
            <td class="table_01">��Ÿ</td>
        </tr>
        <tr>
            <td class="table_02_2" ><input type="text" class="input" name="p_wscore" size="10" maxlength="5" value="" tabindex=60 readonly></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_wstep" size="10" maxlength="5" value="<%= data.get("d_wstep") %>" tabindex=61 onchange="whenChaneWValue()"></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_wmtest" size="10" maxlength="5" value="<%= data.get("d_wmtest") %>" tabindex=62 onchange="whenChaneWValue()"></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_wftest" size="10" maxlength="5" value="<%= data.get("d_wftest") %>" tabindex=63 onchange="whenChaneWValue()"></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_whtest" size="10" maxlength="5" value="<%= data.get("d_whtest") %>" tabindex=64 onchange="whenChaneWValue()"></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_wreport" size="10" maxlength="5" value="<%= data.get("d_wreport") %>" tabindex=65 onchange="whenChaneWValue()">
              <input type="hidden" name="p_wact" value="<%= data.get("d_wact") %>"></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_wetc1" size="10" maxlength="5" value="<%= data.get("d_wetc1") %>" tabindex=66 onchange="whenChaneWValue()"></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_wetc2" size="10" maxlength="5" value="<%= data.get("d_wetc2") %>" tabindex=67 onchange="whenChaneWValue()"></td>
          </tr>
        </table>
       </td></tr><tr><td align="center" valign="top">
        <br>
      <!----------------- ���������� ��� ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
        <tr>
          <td width="16%" class="table_title"><b>������û �Է����� 111</b></td>
          <td width="81%" class="table_02_2">
                <table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td>
                <input type="hidden" id="p_needinput" name="p_needinput" value="<%=p_needinput%>" />
                 <kocca_select:select name="needinput" sqlNum="0001"  param="0078" onChange="changeNeedInput"
                    selectedValue="<%=p_needinput%>" isLoad="true" all="true" isCheckBox="Y" />
                <script>
                    function changeNeedInput() {
                        $("#p_needinput").val('');
                        for (needInput_i = 0; needInput_i < document.all.needinput.length; needInput_i++) {
                            if (document.all.needinput[needInput_i].checked) {
                                $("#p_needinput").val($("#p_needinput").val()+'1');
                            } else {
                                $("#p_needinput").val($("#p_needinput").val()+'0');
                            }
                        }
                    }
                </script>
                    <td align="right" width="60px"><a href="javascript:fnPreview();"><img style="border:none" src="/images/admin/button/btn_preview.gif" alt="�Է¾�� �̸�����"/></a></td>
                    </tr>
                </table>
          </td>
        </tr>
        <tr>
          <td width="16%" class="table_title"><b>�������</b></td>
          <td width="81%" class="table_02_2">
            <textarea name="p_subjtarget" onkeyup="getObjectLength('p_subjtarget')" onchange="getObjectLength('p_subjtarget', 2000)" id="p_subjtarget" cols="90" style="width:85%" rows="3" tabindex=70><%= data.get("d_subjtarget") %></textarea> <font id="p_subjtarget_length" FONT-FAMILY="Tahoma" font-size="10px" color="#CB1F02"></font>
          </td>
        </tr>
        <tr>
          <td class="table_title"><b>��������</b></td>
          <td class="table_02_2">
            <textarea name="p_intro" onkeyup="getObjectLength('p_intro')" onchange="getObjectLength('p_intro', 4000)" id="p_intro" cols="90" style="width:85%" rows="3" tabindex=71><%= data.get("d_intro") %></textarea> <font id="p_intro_length" FONT-FAMILY="Tahoma" font-size="10px" color="#CB1F02"></font>
          </td>
        </tr>
        <tr>
          <td class="table_title"><b>��������</b></td>
          <td class="table_02_2">
        <!-- ���� Editor  -->
                <input type= "hidden" name= "p_explain"  id= "p_explain"  value= "<%=com.dunet.common.util.StringUtil.convertHtmlchars(data.getString("d_explain"))%>">
                <script language="javascript" src="/script/user_patch.js"></script>
                <script language="javascript" for="Wec" event="OnInitCompleted()">namoActiveInitCompleted('p_explain');</script>
                <script language="javascript">object_namoActivepatch('100%','500');</script>
           <!-- ���� Editor  -->
          </td>
        </tr>
      </table>
      <!----------------- ���������� ��� �� ----------------->
      <br>
      <!----------------- ���, ����Ʈ ��ư ���� ----------------->
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center"><a href="javascript:updateSubject()" tabindex=68><img src="/images/admin/button/btn_save.gif" border="0"></a></td>
          <td width=8></td>
          <td align="center"><a href="javascript:goSubjectListPage()" tabindex=69><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
            <td align="center" style="display=none">
                <a href="javascript:DeleteSubject()" tabindex=75><img src="/images/admin/button/btn_del.gif" border="0"></a></td>
        </tr>
      </table>
      <!----------------- ���, ����Ʈ ��ư �� ----------------->
      <br>
        </td>
    </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
