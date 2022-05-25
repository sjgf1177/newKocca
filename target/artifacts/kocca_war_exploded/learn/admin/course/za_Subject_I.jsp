<%
//**********************************************************
//  1. ��      ��: ������� ȭ��
//  2. ���α׷���: za_Subject_I.jsp
//  3. ��      ��: ������� ȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 12. 11
//  7. ��      ��:
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
    String  ss_grcode    = box.getString("s_grcode");           //�����׷�
    String  ss_gyear     = box.getString("s_gyear");            //�⵵
    String  ss_upperclass = box.getStringDefault("s_upperclass", "ALL");      //������з�
    String  ss_middleclass = box.getString("s_middleclass");    //�����ߺз�
    String  ss_lowerclass = box.getString("s_lowerclass");      //�����Һз�
    String  ss_subjcourse= box.getString("s_subjcourse");       //����
    String  ss_subjseq   = box.getString("s_subjseq");          //���� ����
    //DEFINED in relation to select END

    String  v_sgkind        = box.getStringDefault("p_proposetype","");    //������û���
%>
<html>
<head>
<title>���̹��������</title>
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
    $("#p_crdate_view").datepicker({defaultDate: new Date(),showOn: "both",showAnim: "blind",showOptions: {direction: 'horizontal'},duration: 200})
});
<!--

//��� ����
function InsertSubject() {
    if(!chkData()) {
      return;
    }

    if ( confirm("������ ����Ͻðڽ��ϱ�?") ) {
        document.form2.s_action.value = "go";
        document.form2.p_process.value = 'insert';
        document.form2.p_specials.value = document.form2.p_new.value + document.form2.p_hit.value + document.form2.p_recom.value; // �ű� / �α� / ��õ
        document.form2.submit();
    } else {
        return;
    }
}
//��� ��

function goSubjectListPage() {
    document.form2.s_action.value = "go";
    document.form2.p_process.value  = 'listPage';
    document.form2.submit();
}


//���� üũ ����

function whenUsebook() {
    //���翩�� üũ
    if (document.form2.p_usebook.value=="Y") {
        document.form2.p_bookname.disabled = false;
        document.form2.p_bookprice.disabled = false;
    } else {
        document.form2.p_bookname.disabled = true;
        document.form2.p_bookname.value = "";
        document.form2.p_bookprice.disabled = true;
        document.form2.p_bookprice.value = 0;
    }
}

function whenIsgoyong() {
    //��뺸�� ��뿩��üũ
    if (document.form2.p_isgoyong.value=="Y") {
        document.form2.p_goyongprice_major.disabled = false;
//        document.form2.p_goyongprice_minor.disabled = false;
    } else {
        document.form2.p_goyongprice_major.disabled = true;
//        document.form2.p_goyongprice_minor.disabled = true;
        document.form2.p_goyongprice_major.value = 0;
//        document.form2.p_goyongprice_minor.value = 0;
    }
}

function whenIsuse() {
    //������뿩��
    if (document.form2.p_isuse.value=="Y") {
        document.form2.p_isvisible.disabled = false;
    } else {
        document.form2.p_isvisible.disabled = true;
        document.form2.p_isvisible.value = "N";
    }
}

function whenIsordinary() {
    //���,���� ����üũ
    if (document.form2.p_isordinary.value=="Y") {
        document.form2.p_sphere1.disabled = false;
        document.form2.p_sphere2.disabled = true;
        document.form2.p_sphere2.value = "ALL";
    } else {
        document.form2.p_sphere1.disabled = true;
        document.form2.p_sphere1.value = "ALL";
        document.form2.p_sphere2.disabled = false;
    }
}


/**
 * �ڷ� ����� ��ȿ�� ���θ� Ȯ���Ѵ�.
 */
function chkData() {
    ff = document.form2;

    if (document.form2.p_upperclass.value=='ALL' || document.form2.p_upperclass.value=='') {
        alert('��з��� �����ϼ���.');
        return false;
    }

    if (document.form2.p_middleclass.value=='ALL' || document.form2.p_middleclass.value=='') {
        alert('�ߺз��� �����ϼ���.');
        return false;
    }

    if (document.form2.p_lowerclass.value=='ALL' || document.form2.p_middleclass.value=='') {
        document.form2.p_lowerclass.value='000';
    }
    /*
      if (document.form2.p_lowerclass.value=='ALL' || document.form2.p_lowerclass.value=='') {
        alert('�Һз��� �����ϼ���.');
        return false;
      }

      //����ȸ�� üũ
      if (document.form2.p_owner.value=="") {
        alert("������ ����ȸ�縦 �����ϼ���.");
        return;
      }
    */
      //if (!number_chk_noalert(document.form2.p_score.value)) {
      //  alert('���������� �߸��ԷµǾ����ϴ�.');
      //  return false;
      //}
    if (!number_chk_noalert(document.form2.p_ratewbt.value)) {
        alert('�н����(WBT%)�� �߸��ԷµǾ����ϴ�.');
        return false;
    }

    if (!number_chk_noalert(document.form2.p_ratevod.value)) {
        alert('�н����(VOD%)�� �߸��ԷµǾ����ϴ�.');
        return false;
    }

    if (!number_chk_noalert(document.form2.p_framecnt.value)) {
        alert('�������Ӽ��� �߸��ԷµǾ����ϴ�.');
        return false;
    }

    if (!number_chk_noalert(document.form2.p_biyong.value)) {
        alert('�����ᰡ �߸��ԷµǾ����ϴ�.');
        return false;
    }

    if (!number_chk_noalert(document.form2.p_edudays.value)) {
        alert('�н������� �߸��ԷµǾ����ϴ�.');
        return false;
    }

    if (!number_chk_noalert(document.form2.p_edutimes.value)) {
        alert('�н��ð��� �߸��ԷµǾ����ϴ�.');
        return false;
    }

    if (!number_chk_noalert(document.form2.p_point.value)) {
        alert('�̼������� �߸��ԷµǾ����ϴ�.');
        return false;
    }

    if (!number_chk_noalert(document.form2.p_studentlimit.value)) {
        alert('������ �߸��ԷµǾ����ϴ�.');
        return false;
    }

    if (!number_chk_noalert(document.form2.p_gradscore.value)) {
        alert('�̼�����-������ �߸��ԷµǾ����ϴ�.');
        return false;
    }

    if (!number_chk_noalert(document.form2.p_gradstep.value)) {
        alert('�̼�����-�������� �߸��ԷµǾ����ϴ�.');
        return false;
    }

    if (!number_chk_noalert(document.form2.p_gradexam.value)) {
        alert('�̼�����-�򰡰� �߸��ԷµǾ����ϴ�.');
        return false;
    }

    if (!number_chk_noalert(document.form2.p_gradreport.value)) {
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


    if (!number_chk_noalert(document.form2.p_bookprice.value)) {
        alert('����� �߸��ԷµǾ����ϴ�.');
        return false;
    }

    if (!number_chk_noalert(document.form2.p_goyongprice_major.value)) {
        alert('ȯ�޾��� �߸��ԷµǾ����ϴ�.');
        return false;
    }

    //  if (!number_chk_noalert(document.form2.p_goyongprice_minor.value)) {
    //    alert('ȯ�޾�(�߼ұ��)�� �߸��ԷµǾ����ϴ�.');
    //    return false;
    //  }

    if (!number_chk_noalert(document.form2.p_wstep.value)) {
        alert('����ġ-������(%)�� �߸��ԷµǾ����ϴ�.');
        return false;
    }

    if (!number_chk_noalert(document.form2.p_wmtest.value)) {
        alert('����ġ-�߰���(%)�� �߸��ԷµǾ����ϴ�.');
        return false;
    }

    if (!number_chk_noalert(document.form2.p_wftest.value)) {
        alert('����ġ-������(%)�� �߸��ԷµǾ����ϴ�.');
        return false;
    }

    if (!number_chk_noalert(document.form2.p_whtest.value)) {
        alert('����ġ-������(%)�� �߸��ԷµǾ����ϴ�.');
        return false;
    }

    if (!number_chk_noalert(document.form2.p_wreport.value)) {
        alert('����ġ-����Ʈ(%)�� �߸��ԷµǾ����ϴ�.');
        return false;
    }

    if (!number_chk_noalert(document.form2.p_wact.value)) {
        alert('����ġ-��Ƽ��Ƽ(%)�� �߸��ԷµǾ����ϴ�.');
        return false;
    }

    if (!number_chk_noalert(document.form2.p_edulimit.value)) {
        alert('1���ִ��н����� �߸��ԷµǾ����ϴ�.');
        return false;
    }

    if (!number_chk_noalert(document.form2.p_wetc1.value)) {
        alert('����ġ-������(%)�� �߸��ԷµǾ����ϴ�.');
        return false;
    }

    if (!number_chk_noalert(document.form2.p_wetc2.value)) {
        alert('����ġ-��Ÿ(%)�� �߸��ԷµǾ����ϴ�.');
        return false;
    }

    var weight = parseFloat(document.form2.p_wstep.value,10) + parseFloat(document.form2.p_wmtest.value,10) + parseFloat(document.form2.p_wftest.value,10) + parseFloat(document.form2.p_whtest.value,10) + parseFloat(document.form2.p_wreport.value,10) + parseFloat(document.form2.p_wact.value,10) + parseFloat(document.form2.p_wetc1.value,10) + parseFloat(document.form2.p_wetc2.value,10);

    if (weight < 100) {
        alert('����ġ�� 100% ���� �����ϴ�');
        return false;
    } else if (weight > 100) {
        alert('����ġ�� 100% ���� �����ϴ�.');
        return false;
    }

    if (blankCheck(document.form2.p_subjnm.value)) {
        alert('�������� �Է��Ͻʽÿ�.');
        document.form2.p_subjnm.focus();
        return false;
    }

    var v_crdate = make_date(form2.p_crdate_view.value);
    form2.p_crdate.value = v_crdate;

    if (document.form2.p_isordinary.value == "Y") {         // ����ϰ��
        document.form2.p_sphere.value = document.form2.p_sphere1.value;
    } else {                                                // �����ϰ��
        document.form2.p_sphere.value = document.form2.p_sphere2.value;
    }

    return true;
}

//��������� �˻�
function searchCuser() {
  var p_gubun = 'name';
  var p_key1  = document.form2.p_cuseridnm.value;
  var p_key2  = 'p_cuser';
  var url = "/servlet/controller.library.SearchServlet?p_process=member&p_gubun="+ p_gubun +"&p_key1="+ p_key1 +"&p_key2="+p_key2;
  open_window("",url,"0","0","100","100");
}

function performBuyBagPreviewPage() {
      var url = "/servlet/controller.course.SubjectServlet?p_process=buyBagPreviewPage&p_needinput="+$("#p_needinput").val();
      open_window("",url,"0","0","720","400","","","","yes");
}

// ��� �˻� �� ó��
function receiveMember(userid, name, resno, email, cono, jikwi, jikwinm, comp, compnm, tmp1, tmp2, tmp3){
  if (tmp1 == 'p_cuser') {
    document.form2.p_cuseridnm.value = name;
    document.form2.p_cuserid.value   = userid;
  } else if (tmp1 == 'p_muser') {
    document.form2.p_museridnm.value = name;
    document.form2.p_muserid.value   = userid;
    document.form2.p_musertel.value   = tmp3;
  }
}


//��米�� �˻�
function searchMuser() {
  var p_gubun = 'name';
  var p_key1  = '';//document.form2.p_museridnm.value;
  var p_key2  = '1';
  var url = "/servlet/controller.library.SearchServlet?p_process=tutor&p_gubun="+ p_gubun +"&p_key1="+ p_key1 +"&p_key2="+p_key2;
  open_window("",url,"0","0","100","100");
}
// ��米�� �˻� �� ó��
function receiveTutor(userid, name, resno, email, phone, tmp1, tmp2, tmp3, tmp4, tmp5){
    addMuser(userid, name);
//  document.form2.p_museridnm.value = name;
//  document.form2.p_muserid.value   = userid;
//  document.form2.p_musertel.value   = phone;
}

//����ȸ�� �˻�
function searchProducer() {
  var p_key1  = document.form2.p_producernm.value;
  var p_key2  = '';
//  var p_key2  = 'p_producer';
  var url = "/servlet/controller.library.SearchServlet?p_process=grpcomp&p_gubun=companynm&p_key1=&p_key2="+p_key2;
  open_window("",url,"0","0","100","100");
}

//����ȸ�� �˻�
function searchOwner() {
  var p_key1  = document.form2.p_ownernm.value;
  var p_key2  = 'p_owner';
  var url = "/servlet/controller.library.SearchServlet?p_process=grpcomp&p_gubun=companynm&p_key1=&p_key2="+p_key2;
  open_window("",url,"0","0","100","100");
}
// ȸ�� �˻� �� ó��
function receiveGrpComp(comp , compnm, comptype, groupnm, companynm, tmp1, tmp2, tmp3) {
//  if (tmp1 == 'p_producer') {
  if (tmp1 == '') {
    document.form2.p_producernm.value = compnm;
    document.form2.p_producer.value   = comp;
  } else if (tmp1 == 'p_owner') {
    document.form2.p_ownernm.value = compnm;
    document.form2.p_owner.value   = comp;
  }
}

// ���߼Һз� ����
function whenSelection() {
    document.form2.p_process.value = 'insertPage';
    //��з� ���ý� �ߺз��� ALL�� �ʱ�ȭ
    document.form2.s_middleclass.value = '';
    document.form2.submit();
}

    /**
     * ����� ��뿩�� ���� ���� ����� URL ���� ������.
     */
    function fnSetMobileUrlStatus( mobileUseYn ) {
        if( mobileUseYn == "Y" ) {
            $("#oMobilePreurl").attr("disabled", false);
        } else {
            $("#oMobilePreurl").attr("disabled", true);
        }
    }
    $(function() {
    	$("#oUpperclass").bind("change", function(){
            var param = "type=sqlID&sqlID=selectBox.subjAttMiddleList&param=" + $(this).val();
            $.ajaxSetup({cache:false});
            $.ajax({
                    type : "get"
                ,   url : "/learn/admin/common/za_GetSelectBoxAjaxResult.jsp"
                ,   dataType : "json"
                ,   data : param
                ,   success : fnSetMiddleClass
                ,   complete : function(arg1, arg2) {
                        // alert("complete : " + arg1);
                    }
                ,   error :  function(arg1, arg2) {
                        // alert("error : " + arg1);
                    }
            });
        });

        $("#oMiddleclass").bind("change", function(){
            var param = "type=sqlID&sqlID=selectBox.subjAttLowerList&param=" + $("#oUpperclass").val() + "," + $(this).val();
            $.ajaxSetup({cache:false});
            $.ajax({
                    type : "get"
                ,   url : "/learn/admin/common/za_GetSelectBoxAjaxResult.jsp"
                ,   dataType : "json"
                ,   data : param
                ,   success : fnSetLowerClass
                ,   complete : function(arg1, arg2) {
                        // alert("complete : " + arg1);
                    }
                ,   error :  function(arg1, arg2) {
                        // alert("error : " + arg1);
                    }
            });
        });
    });

    /**
     * �˻����ǿ��� ��з� ���ý� callback function
     */
    function fnSetMiddleClass( result ) {
        $("#oMiddleclass").empty();
        $("#oMiddleclass").append("<option value=\"\">== ��ü ==</option>");
        $("#oLowerclass").empty();
        $("#oLowerclass").append("<option value=\"\">== ��ü ==</option>");

        if ( result.selectBoxList.length > 0 ) {
            $.each( result.selectBoxList, function() {
                $("#oMiddleclass").append("<option value=\"" + this.d_code + "\">" + this.d_codenm + "</option>");
            });

        }
    }


    /**
     * �˻����ǿ��� �ߺз� ���ý� callback function
     */
    function fnSetLowerClass( result ) {
        $("#oLowerclass").empty();
        $("#oLowerclass").append("<option value=\"\">== ��ü ==</option>");

        if ( result.selectBoxList.length > 0 ) {
            $.each( result.selectBoxList, function() {
                $("#oLowerclass").append("<option value=\"" + this.d_code + "\">" + this.d_codenm + "</option>");
            });

        }
    }
-->
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<form id="oSubjRegForm" name="form2" enctype="multipart/form-data" method="POST" action="/servlet/controller.course.SubjectServlet">
    <input type="hidden" name="p_process"     value="">
    <input type="hidden" name="s_grcode"        value="<%=ss_grcode%>">     <!--in relation to select-->
    <input type="hidden" name="s_gyear"         value="<%=ss_gyear%>">      <!--in relation to select-->
    <input type="hidden" name="s_upperclass"    value="<%=ss_upperclass%>"> <!--in relation to select-->
    <input type="hidden" name="s_middleclass"   value="<%=ss_middleclass%>"><!--in relation to select-->
    <input type="hidden" name="s_lowerclass"    value="<%=ss_lowerclass%>"><!--in relation to select-->
    <input type="hidden" name="s_subjcourse"    value="<%=ss_subjcourse%>"> <!--in relation to select-->
    <input type="hidden" name="s_subjseq"       value="<%=ss_subjseq%>">    <!--in relation to select-->
    <input type="hidden" name="s_action">

    <input type="hidden" name="p_isonoff"     value="ON">
    <input type="hidden" name="p_specials"    value="">
    <input type="hidden" name="p_crdate"      value="">

    <input type="hidden" name = "p_isoutsourcing" value="N">
    <input type="hidden" name="p_edulimit" value="0">
    <input type="hidden" name="p_musertel" value="">
    <input type="hidden" name="s_area" value="ALL" />

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/course/c_title01.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <%=box.getString("p_warnmsg")%><br>
      <br>
      <!----------------- ���� ���/����/����/�󼼺��� (���̹�) ���� ----------------->
        <table cellspacing="1" cellpadding="5" class="table_out" border="0">
          <tr>
            <td colspan="8" class="table_top_line"></td>
          </tr>
          <tr>
            <td class="table_title" rowspan="27"><b>��������</b></td>
            <td colspan="7" class="table_01"><font color="red">(*)</font> ǥ�ô� �ʼ� �Է��Դϴ�.</td>
          </tr>
          <tr>
            <td class="table_01">�����ڵ�</td>
            <td class="table_02_2" ><font color="red">�ڵ�����</font>
                 <kocca_select:select name="p_area" sqlNum="0002"  param="101" type="2.2"
                    onChange="" attr=" " selectedValue="G0" isLoad="true" all="none" />
            </td>
            <td  rowspan="4" class="table_title"><b>����������</b></td>
            <td colspan="2" class="table_01">���������</td>
            <td class="table_02_2" ><%=CodeConfigBean.getCodeGubunSelect ("0056", "", 1, "p_contentgrade", "A", " tabindex=1", 0)%></td>
          </tr>
          <tr>
            <td class="table_01">������Ÿ��<font color="red">(*)</font></td>
            <td class="table_02_2"><%=CodeConfigBean.getCodeGubunSelect ("0007", "", 1, "p_contenttype", "N", " tabindex=1", 0)%> </td>
            <td colspan="2" rowspan="2" class="table_01">����ȸ��</td>
            <td class="table_02_2" >�̸� :
              <input type="text" class="input" name="p_producernm" size="14" maxlength="13" value="" tabindex=41>
              &nbsp; <a href="javascript:searchProducer()"><img src="/images/admin/button/b_resarchbutt.gif" align="absmiddle" border="0" tabindex=42></a></td>
          </tr>
          <tr>
            <td  class="table_01">������<font color="red">(*)</font></td>
            <td class="table_02_2"><input type="text" class="input" name="p_subjnm" size="38" maxlength="100" value="" tabindex=""></td>
            <td class="table_02_2">�ڵ� :
              <input type="text" class="input" name="p_producer" size="14" maxlength="13" value="" readonly></td>
          </tr>
          <tr>
            <td class="table_01">�����з�<font color="red">(*)</font></td>
            <td height="50" class="table_02_2">
            <%@ taglib uri="/tags/KoccaTaglib" prefix="kocca" %>
	��з� 
	<kocca:selectBox name="p_upperclass" id="oUpperclass" optionTitle="== ��ü ==" type="sqlID" sqlID="selectBox.subjAttUpperList" selectedValue="<%= ss_upperclass %>" isLoad="true" /><br/>
	�ߺз� 
<%
    if ( !ss_middleclass.equals("") ) {
%>
									<kocca:selectBox  name="p_middleclass" id="oMiddleclass" optionTitle="== ��ü ==" type="sqlID" sqlID="selectBox.subjAttMiddleList" param="<%= ss_upperclass %>" selectedValue="<%= ss_middleclass %>" isLoad="true" /><br/>
<%
    } else {
%>
                                    <select name="p_middleclass" id="oMiddleclass">
                                    	<option value="">== ��ü ==</option>
                                    </select><br/>
<%
    }
%>	
	�Һз�
<%
    if ( !ss_lowerclass.equals("") ) {
%>
                                    <kocca:selectBox name="p_lowerclass" id="oLowerclass" optionTitle="== ��ü ==" type="sqlID" sqlID="selectBox.subjAttLowerList" param="<%= ss_upperclass + ',' + ss_middleclass %>" selectedValue="<%= ss_lowerclass %>" isLoad="true" /><br/>
<%
    } else {
%>
                                    <select name="p_lowerclass" id="oLowerclass">
                                        <option value="">== ��ü ==</option>
                                    </select>
<%
    }
%>	
	
              <!--������û��� Default �Ϲݽ�û(1)-->
              <input type="hidden" name="p_proposetype" value="1">
            <td colspan="2" class="table_01">��������</td>
            <td class="table_02_2" ><input name="p_crdate_view" id="p_crdate_view" type="text" class="datepicker_input1" size="10" tabindex=45></td>
          </tr>

          <tr>
            <td class="table_01">��������</td>
            <td height="50" class="table_02_2">
                 <%-- <kocca_select:select name="p_subjtype" sqlNum="0001"  param="0076" selectedValue="" isLoad="true" all="false" isCheckBox="N" /> --%>
                 <kocca:selectBox name="p_subjtype" id="p_subjtype" optionTitle="== ��ü ==" type="sqlID" sqlID="code.list.0001" param="0076" selectedValue="" isLoad="true" /><br/>
              <td class="table_title"><b>�̴���<br>��õ����</b></td>
              <td colspan="2" class="table_01">��õ��</td>
              <td class="table_02_2" ><input type="text" name="hitnumber" value="0" size="10"></td>
          </tr>
          <tr>
            <td class="table_01">�⺻/�ǹ�</td>
            <td height="50" class="table_02_2" colspan="5">
                <select id="oBizType" name="bizType">
                    <option value="">-- ���� --</option>
                    <option value="F01">�⺻</option>
                    <option value="F02">�ǹ�</option>
                </select>
            </td>
          </tr>
          <tr>
            <td class="table_01">�ڵ����ο���</td>
            <td height="50" class="table_02_2" colspan="5">
                <input name="p_autoconfirm" type="radio" value="Y" class="input">�� <input name="p_autoconfirm" type="radio" class="input" value="N" checked>�ƴϿ�
                &nbsp;&nbsp;&nbsp;&nbsp;(���ý� ������û�� ���ÿ� ����)
            </td>
          </tr>
          <tr>
            <td class="table_01">��������°��ɿ���</td>
            <td height="50" class="table_02_2" colspan="5">
              <select name="p_suryoyn"  class="inputpsearch" tabindex=17>
                <option value='Y'>Y</option>
                <option value='N' selected>N</option>
              </select>
                <input type="text" class="input" name="p_suryotitle" size="38" maxlength="100" value="" tabindex="">
            </td>
          </tr>
          <tr>
            <td class="table_01">�����˻���</td>
            <td height="50" class="table_02_2" colspan="5">
                <input type="text" class="input" name="p_search_nm" size="60" maxlength="100" value="" tabindex="" ></td>
            </td>
          </tr>
          <tr>
            <td  class="table_01">����Ư��</td>
            <td class="table_02_2"> �ű�
              <select name="p_new"  class="inputpsearch" tabindex=17>
                <option value='Y'>Y</option>
                <option value='N' selected>N</option>
              </select>
              HIT
              <select name="p_hit"  class="inputpsearch" tabindex=15>
                <option value='Y'>Y</option>
                <option value='N' selected>N</option>
              </select>
              ��õ
              <select name="p_recom"  class="inputpsearch" tabindex=18>
                <option value='Y'>Y</option>
                <option value='N' selected>N</option>
              </select>
            </td>
            <td rowspan="3" class="table_title"><b>�н�����</b></td>
            <td colspan="2" class="table_01">�н����(WBT%)</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_ratewbt" size="10" maxlength="3" value="0" tabindex=46></td>
          </tr>
          <tr>
            <td  rowspan="2" class="table_01"><!--����-->��米��<font color="red">(*)</font></td>
            <td height="34" class="table_02_2" >
                <a href="javascript:searchMuser()" tabindex="21"><img src="/images/admin/button/b_resarchbutt.gif" align="absmiddle" border="0"></a>
            </td>
            <td colspan="2" class="table_01">�н����(VOD%)</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_ratevod" size="10" maxlength="3" value="0" tabindex=47></td>
          </tr>
          <tr>
            <td height="34" class="table_02_2" >
                    <div id="muserList"></div>
<script>
<!--
//muserList.1
    $(document).ready(function()    {
        listMuser();
    });
    function listMuser() {
        $.post("/servlet/controller.common.TagServlet"
                , {sqlNum:"muserList.1", param:"",type:4,objNm:"muser"}
                , function(data) {
                    $("#muserList").html(data);
                });
    }
    function addMuser(id, name) {
        var innerDiv = $("#muserList").html();
        if (innerDiv.indexOf("�������")!=-1) innerDiv = "";
        innerDiv = innerDiv + "<div id='muserDiv' class='muserClass'>"+name+"("+id+")"
                +"<img alt='����' src='/images/admin/templet/b_atop.gif' align='absMiddle' vspace='10' border='0' onclick=\"upmUser(this);\"/>"
                +"<img alt='�Ʒ���' src='/images/admin/templet/b_adown.gif' align='absMiddle' vspace='10' border='0' onclick=\"downmUser(this);\"/>"
                +"<img alt='����' src='/images/admin/button/btn_del.gif' align='absMiddle' vspace='10' border='0' id=muserDelete onclick=\"$('#muserCnt').val($('#muserCnt').val()*1-1);$(this).parent().remove();\"><input type='hidden' name='muser' value='"+id+"'/></div>";
        $("#muserList").html(innerDiv);
    }
    function upmUser(selectedDiv) {
        var selectedDiv = $($(selectedDiv).parent());
        var inHtml = selectedDiv.html();

        if(selectedDiv.prev().html()!=null) {
            selectedDiv.html(selectedDiv.prev().html());
            selectedDiv.prev().html(inHtml);
        }
    }
    function downmUser(selectedDiv) {
        var selectedDiv = $($(selectedDiv).parent());
        var inHtml = selectedDiv.html();
        if(selectedDiv.next().html()!=null) {
            selectedDiv.html(selectedDiv.next().html());
            selectedDiv.next().html(inHtml);
        }
    }
-->
</script>
            </td>
            <td colspan="2" class="table_01">�������ɿ���</td>
            <td class="table_02_2" ><select name="p_isablereview"  class="inputpsearch" tabindex=51>
                <option value='Y' <% if(box.getString("p_isablereview").equals("Y") ||box.getString("p_isablereview").equals("")) out.println(" selected");%>>Y</option>
                <option value='N' <% if(box.getString("p_isablereview").equals("N")) out.println(" selected");%>>N</option>
              </select>
              / �����Ⱓ : <input type="text" class="input" name="p_reviewdays" size="3" maxlength="3" value="0" tabindex=51>
                           <select name="p_reviewtype"  class="inputpsearch" tabindex=51>
                                <option value="D">��</option>
                                <option value="W">��</option>
                                <option value="M">����</option>
                                <option value="Y">��</option>
                           </select>
            </td>
          </tr>
          <tr>
            <td height="31" class="table_01">������뿩��</td>
            <td class="table_02_2" > <select name="p_isuse"  class="inputpsearch" onChange="whenIsuse()" tabindex=26>
                <option value='Y' selected>Y</option>
                <option value='N'>N</option>
              </select>
            </td>
            <td rowspan="14" class="table_title"><b>��������</b></td>
            <td rowspan="6" class="table_01">��<br>��<br>��<br>�� </td>
            <td  class="table_01">�� ��
              <input type="hidden" name="p_point" value="100"></td>
            <td class="table_02_2" > <input type="text" class="input" name="p_gradscore" size="10" maxlength="5" value="0" tabindex=52></td>
          </tr>
          <tr>
            <td class="table_01">�н��ڿ��� �����ֱ�</td>
            <td class="table_02_2" ><select name="p_isvisible"  class="inputpsearch" tabindex=27>
                <option value='Y' selected>Y</option>
                <option value='N'>N</option>
              </select></td>
            <td class="table_01">������</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_gradstep" size="10" maxlength="5" value="0" tabindex=53></td>
          </tr>
          <tr>
            <td class="table_01">�����Ұ���뿩��</td>
            <td class="table_02_2">
              <select name="p_isintroduction"  class="inputpsearch" tabindex=28>
                <option value='Y' selected>Y</option>
                <option value='N'>N</option>
              </select>
            </td>
            <td class="table_01">�߰���</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_gradexam" size="10" maxlength="5" value="0" tabindex=54></td>
          </tr>
          <tr>
            <td  class="table_01">�������Ӽ�</td>
            <td class="table_02_2"><input type="text" class="input" name="p_framecnt" size="10" maxlength="10" value="0" tabindex=30></td>
            <td class="table_01">������</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_gradftest" size="10" maxlength="5" value="0" tabindex=55></td>
          </tr>
          <tr>
            <td class="table_01">������</td>
            <td class="table_02_2"><input type="text" class="input" name="p_biyong" size="10" maxlength="7" value="0" tabindex=31>
              ��</td>
            <td class="table_01">������</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_gradhtest" size="10" maxlength="5" value="0" tabindex=56></td>
          </tr>
          <tr>
            <td class="table_01">�н�����</td>
            <td class="table_02_2"><input type="text" class="input" name="p_edudays" size="10" maxlength="5" value="0" tabindex=32></td>
            <td class="table_01">����Ʈ</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_gradreport" size="10" maxlength="5" value="0" tabindex=57></td>
          </tr>
          <tr>
            <td  class="table_01">�н��Ⱓ</td>
            <td class="table_02_2"><input type="text" class="input" name="p_eduperiod" size="5" maxlength="2" value="0" tabindex=32> ��</td>
            <td rowspan="8" class="table_01">��<br>
              ��<br>
              ġ<br>
              (%)<br> <font color="red">(*)</font></td>

            <td class="table_01">������</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_wstep" size="10" maxlength="5" value="0" tabindex=58></td>
          </tr>
          <tr>
            <td class="table_01">�н��ð�</td>
            <td class="table_02_2"><input type="text" class="input" name="p_edutimes" size="10" maxlength="5" value="0" tabindex=33>
              �ð�</td>
            <td class="table_01">�߰���</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_wmtest" size="10" maxlength="5" value="0" tabindex=59></td>
          </tr>
          <tr>
            <td  class="table_01">����</td>
            <td class="table_02_2"><input type="text" class="input" name="p_studentlimit" size="10" maxlength="5" value="0" tabindex=34>
              ��</td>
            <td class="table_01">������</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_wftest" size="10" maxlength="5" value="0" tabindex=60></td>
          </tr>
          <tr>
            <td class="table_01">���翩��</td>
            <td class="table_02_2" ><select name="p_usebook"  class="inputpsearch" onChange="whenUsebook()" tabindex=35>
                <option value='Y' >Y</option>
                <option value='N' selected>N</option>
              </select></td>
            <td class="table_01">������</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_whtest" size="10" maxlength="5" value="0" tabindex=61></td>
          </tr>
          <tr>
            <td height="36" class="table_01">�����</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_bookname" size="38" maxlength="100" value="" disabled tabindex=36></td>
            <td class="table_01">����Ʈ</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_wreport" size="10" maxlength="5" value="0" tabindex=62>
              <input type="hidden" name="p_wact" value="0"></td>
          </tr>
          <tr>
            <td height="36" class="table_01">�����</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_bookprice" size="10" maxlength="5" value="0" disabled tabindex=38>
              ��</td>
            <td class="table_01">������</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_wetc1" size="10" maxlength="5" value="0" tabindex=63></td>
          </tr>
          <tr>
            <td class="table_01">��뺸�迩��</td>
            <td class="table_02_2">
              <select name="p_isgoyong"  class="inputpsearch" onChange="whenIsgoyong()" tabindex=28>
                <option value='Y' >Y</option>
                <option value='N' selected>N</option>
              </select>
            </td>
            <td class="table_01">��Ÿ</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_wetc2" size="10" maxlength="5" value="0" tabindex=64></td>
          </tr>
          <tr>
            <td class="table_01">ȯ�ޱݾ�</td>
            <td class="table_02_2" >
              <input type="text" class="input" name="p_goyongprice_major" size="15" maxlength="10" value="" disabled tabindex=36> ��<br>
              <!--<input type="text" class="input" name="p_goyongprice_minor" size="15" maxlength="10" value="" disabled tabindex=36> ��-->
            </td>
            <td colspan="2" class="table_01">����ġ(%)�� ���� 100�̾�� �մϴ�.</td>
          </tr>
        <tr>
            <td class="table_title" rowspan="3"><b></b></td>
            <td class="table_01">���/����</td>
            <td class="table_02_2" colspan="5">
                <select name="p_isordinary" onChange="whenIsordinary()" >
                    <option value='N'>����</option>
                    <option value='Y'>���</option>
                </select>&nbsp;&nbsp;&nbsp;&nbsp; <br>
                �о�(���) <%=CodeConfigBean.getCodeGubunSelect ("0067", "", 1, "p_sphere1", "", "disabled", 2)%><br>
                �о�(����) <%=CodeConfigBean.getCodeGubunSelect ("0068", "", 1, "p_sphere2", "", "", 2)%>
                <input type="hidden" name="p_sphere" value="">
            </td>
        </tr>
        <tr>
            <td class="table_01">��ũ��</td>
            <td class="table_02_2" colspan="5">
              <select name="p_isworkshop">
                <option value='N'>N</option>
                <option value='Y'>Y</option>
              </select>
            </td>
        </tr>
        <tr>
            <td class="table_01">������������</td>
            <td class="table_02_2" colspan="5">
              <select name="p_isunit">
                <option value='N'>N</option>
                <option value='Y'>Y</option>
              </select>  ���� : <input type="text" class="input" name="p_degree" id="p_degree" size="4" maxlength="4" value="0"> ��
            </td>
        </tr>

        <tr>
            <td class="table_title" rowspan="5"><b>URL ����</b></td>
            <td class="table_01">�н� URL</td>
            <td class="table_02_2" colspan="5">
                <input type="text" class="input" name="p_eduurl" size="100" maxlength="150" value=""  tabindex=36>
            </td>
        </tr>
        <tr>
            <td class="table_01">�̸����� URL</td>
            <td class="table_02_2" colspan="5">
                <input type="text" class="input" name="p_preurl" size="100" maxlength="150" value=""  tabindex=36>
                <br>
                WIDTH:<input type="text" class="input" name="p_prewidth" size="8" maxlength="4" value="1024"> &nbsp;
                HEIGHT:<input type="text" class="input" name="p_preheight" size="8" maxlength="4" value="768">
            </td>
        </tr>
        <tr>
            <td class="table_01">�н����� URL</td>
            <td class="table_02_2" colspan="5">
                <input type="text" class="input" name="p_conturl" size="100" maxlength="150" value=""  tabindex=36>
            </td>
        </tr>
        <tr>
            <td class="table_01">����� ��뿩��</td>
            <td class="table_02_2" colspan="5">
                <select id="oMobileUseYn" name="mobileUseYn" onchange="fnSetMobileUrlStatus(this.value);">
                    <option value="Y">��</option>
                    <option value="N">�ƴϿ�</option>
                </select>
            </td>
        </tr>
        <tr>
            <td class="table_01">����� �̸����� URL</td>
            <td class="table_02_2" colspan="5">
                <input type="text" class="input" id="oMobilePreurl" name="p_mobile_preurl" size="100" maxlength="150" value=""  tabindex=36>
            </td>
          </tr>
        </table>
        <br>
      <!----------------- ���������� ��� ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
        <tr>
          <td width="16%" class="table_title"><b>������û �Է�����</b></td>
          <td width="81%" class="table_02_2">
                <table><tr><td width="80%">
                <input type='hidden' id='p_needinput' name='p_needinput' value="1000000"/>
                 <kocca_select:select name="needinput" sqlNum="0001"  param="0078" onChange="changeNeedInput" type="2"
                    selectedValue="1000000" isLoad="true" all="true" isCheckBox="Y" />
                <script>
                    function changeNeedInput() {
                        $("#p_needinput").val('');
                        for (needInput_i = 0; needInput_i < document.all.needinput.length; needInput_i++) {
                            if (document.all.needinput[needInput_i].checked) $("#p_needinput").val($("#p_needinput").val()+'1');
                            else $("#p_needinput").val($("#p_needinput").val()+'0');
                        }
                    }
                </script>
                    </td><td width="5%">&nbsp;</td>
                    <td><a href="javascript:performBuyBagPreviewPage();"><img style="border:none" src="/images/admin/button/btn_preview.gif" alt="�Է¾�� �̸�����"/></a></td>
                    </tr>
                </table>
          </td>
        </tr>
        <tr>
          <td width="16%" class="table_title"><b>�Ұ��̹���</b></td>
          <td width="81%" class="table_02_2">
            <input name="p_introducefile" type="file" class="input" size="118" maxlength="100" tabindex=65>
          </td>
        </tr>
        <tr>
          <td width="16%" class="table_title"><b>����</b></td>
          <td width="81%" class="table_02_2">
            <input name="p_informationfile" type="file" class="input" size="118" maxlength="100" tabindex=65>
          </td>
        </tr>
        <tr>
          <td width="16%" class="table_title"><b>����ȭ���̹���</b></td>
          <td width="81%" class="table_02_2">
            <input name="p_submainfile" type="file" class="input" size="118" maxlength="100" tabindex=65>
          </td>
        </tr>
        <tr>
          <td width="16%" class="table_title"><b>�������</b></td>
          <td width="81%" class="table_02_2">
            <textarea name="p_edumans"  id="p_edumans" onkeyup="getObjectLength('p_edumans')" onchange="getObjectLength('p_edumans', 4000)" style="width:88%" rows="3" tabindex=65></textarea> <font id="p_edumans_length" FONT-FAMILY="Tahoma" font-size="10px" color="#CB1F02"></font>
          </td>
        </tr>
        <tr>
          <td class="table_title"><b>��������</b></td>
          <td class="table_02_2">
            <textarea name="p_intro" id="p_intro" onkeyup="getObjectLength('p_intro')" onchange="getObjectLength('p_intro', 4000)" style="width:88%" rows="3" tabindex=66></textarea> <font id="p_intro_length" FONT-FAMILY="Tahoma" font-size="10px" color="#CB1F02"></font>
          </td>
        </tr>
        <tr>
          <td class="table_title"><b>��������</b></td>
          <td class="table_02_2">
            <textarea name="p_explain" id="p_explain" onkeyup="getObjectLength('p_explain')" onchange="getObjectLength('p_explain', 4000)" style="width:88%" rows="5" tabindex=67></textarea> <font id="p_explain_length" FONT-FAMILY="Tahoma" font-size="10px" color="#CB1F02"></font>
          </td>
        </tr>
        <tr>
          <td class="table_title"><b>���Ǳ��� �� ������</b></td>
          <td class="table_02_2">
            <textarea name="p_memo" id="p_memo" onkeyup="getObjectLength('p_memo')" onchange="getObjectLength('p_memo', 4000)" style="width:88%" rows="5" tabindex=67></textarea> <font id="p_memo_length" FONT-FAMILY="Tahoma" font-size="10px" color="#CB1F02"></font>
          </td>
        </tr>
        <tr>
          <td class="table_title"><b><label for="p_subjsummary">��������</label></b></td>
          <td class="table_02_2">
            <input type="text" name="p_subjsummary" id="p_subjsummary" value="" maxlength="100" size="100" class="input" />
          </td>
        </tr>
        <tr>
          <td class="table_title"><b><label for="p_subjtags">TAGS</label></b></td>
          <td class="table_02_2">
            <input type="text" name="p_subjtags" id="p_subjtags" value="" maxlength="80" size="100" class="input" />
          </td>
        </tr>
      </table>
      <!----------------- ���������� ��� �� ----------------->
      <br>
      <!----------------- ���, ����Ʈ ��ư ���� ----------------->
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center"><a href="javascript:InsertSubject()" tabindex="68"><img src="/images/admin/button/btn_copen.gif" border="0"></a></td>
          <td width="8"></td>
          <td align="center"><a href="javascript:goSubjectListPage()" tabindex="69"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
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
