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
    String  ss_grcode   = box.getString("s_grcode");           //�����׷�
    String  ss_gyear     = box.getString("s_gyear");            //�⵵
    String  ss_upperclass = box.getString("s_upperclass");    //������з�
    String  ss_middleclass = box.getString("s_middleclass");    //�����ߺз�
    String  ss_lowerclass = box.getString("s_lowerclass");    //�����Һз�
    String  ss_subjcourse= box.getString("s_subjcourse");      //����
    String  ss_subjseq   = box.getString("s_subjseq");        //���� ����
    //DEFINED in relation to select END

    String  v_sgkind        = box.getStringDefault("p_proposetype",""); //������û���
%>
<html>
<head>
<title>���հ��� ���</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>

<SCRIPT LANGUAGE="JavaScript">
<!--

//��� ����
function InsertSubject() {
    if(!chkData()) {
      return;
    }

    document.form1.s_action.value = "go";
    document.form1.p_process.value = 'insert';
    document.form1.p_specials.value = document.form1.p_new.value + document.form1.p_hit.value + document.form1.p_recom.value + document.form1.p_lecture.value;
    document.form1.submit();
}
//��� ��

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

  if( document.form1.p_area[0].checked == false && document.form1.p_area[1].checked == false && document.form1.p_area[2].checked == false ) {
    alert("�����ڵ� ������ �����ϼ���.");
    return false;
  }

  if (document.form1.p_subj.value=='ALL' || document.form1.p_subj.value=='') {
    alert('�����ڵ带 �����ϼ���.');
    return false;
  }

  if (document.form1.p_upperclass.value=='ALL' || document.form1.p_upperclass.value=='') {
    alert('��з��� �����ϼ���.');
    return false;
  }

  if (document.form1.p_middleclass.value=='ALL' || document.form1.p_middleclass.value=='') {
    alert('�ߺз��� �����ϼ���.');
    return false;
  }
  if (document.form1.p_lowerclass.value=='ALL' || document.form1.p_middleclass.value=='') {
    document.form1.p_lowerclass.value='000';
  }
  if (!number_chk_noalert(document.form1.p_biyong.value)) {
    alert('�����ᰡ �߸��ԷµǾ����ϴ�.');
    return false;
  }
  if (!number_chk_noalert(document.form1.p_edudays.value)) {
    alert('�н������� �߸��ԷµǾ����ϴ�.');
    return false;
  }
/*
  if (!number_chk_noalert(document.form1.p_point.value)) {
    alert('�̼������� �߸��ԷµǾ����ϴ�.');
    return false;
    }
*/
  if (!number_chk_noalert(document.form1.p_studentlimit.value)) {
    alert('������ �߸��ԷµǾ����ϴ�.');
    return false;
  }
/*
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
*/
  if (!number_chk_noalert(document.form1.p_goyongpricemajor.value)) {
    alert('ȯ�޾��� �߸��ԷµǾ����ϴ�.');
    return false;
  }

  if (!number_chk_noalert(document.form1.p_edulimit.value)) {
        alert('1���ִ��н����� �߸��ԷµǾ����ϴ�.');
        return false;
  }

//  if (!number_chk_noalert(document.form1.p_goyongpriceminor.value)) {
//  alert('ȯ�޾�(�߼ұ��)�� �߸��ԷµǾ����ϴ�.');
//  return false;
//  }
/*  if (!number_chk_noalert(document.form1.p_wstep.value)) {
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

  if (!whenChaneWValue()) return false;
  */
  if (blankCheck(document.form1.p_subjnm.value)) {
    alert('�������� �Է��Ͻʽÿ�.');
    document.form1.p_subjnm.focus();
    return false;
  }

 if (document.form1.p_explain.value.length==0) {
        alert('���������� �Է��Ͻʽÿ�.');
        return false;
 }
 /*
  var weight = document.form1.p_wscore.value=weight;
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
      var url = "/servlet/controller.course.SubjectServlet?p_process=buyBagPreviewPage&p_needinput="+$("#p_needinput").val();
      alert(url);
      return;

      open_window("",url,"0","0","720","600",'','','','true');
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
  open_window("",url,"0","0","100","100",'','','','true');
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

      var weight =  parseFloat(document.form1.p_wstep.value,10)
        + parseFloat(document.form1.p_wmtest.value,10) + parseFloat(document.form1.p_wftest.value,10)
        + parseFloat(document.form1.p_whtest.value,10) + parseFloat(document.form1.p_wreport.value,10)
        + parseFloat(document.form1.p_wact.value,10) + parseFloat(document.form1.p_wetc1.value,10)
        + parseFloat(document.form1.p_wetc2.value,10);
      document.form1.p_wscore.value=weight;
      return true;
}
-->
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<div id=minical OnClick="this.style.display='none';" oncontextmenu='return false'
ondragstart='return false' onselectstart='return false'
style="background : buttonface; margin: 5; margin-top: 2;border-top: 1
solid buttonhighlight;border-left: 1 solid buttonhighlight;border-right: 1
solid buttonshadow;border-bottom: 1 solid buttonshadow;width:155;display:none;position: absolute; z-index: 99">
</div>

<form name="form1" enctype="multipart/form-data" method = "POST" action="/servlet/controller.off.OffRecruitAdminServlet">
    <input type="hidden" name="p_process"    value="">
    <input type="hidden" name="s_grcode"        value="<%=ss_grcode%>">  <!--in relation to select-->
    <input type="hidden" name="s_gyear"      value="<%=ss_gyear%>">   <!--in relation to select-->
    <input type="hidden" name="s_upperclass"    value="<%=ss_upperclass%>"> <!--in relation to select-->
    <input type="hidden" name="s_middleclass"   value="<%=ss_middleclass%>"><!--in relation to select-->
    <input type="hidden" name="s_lowerclass"    value="<%=ss_lowerclass%>"><!--in relation to select-->
    <input type="hidden" name="s_subjcourse"    value="<%=ss_subjcourse%>"><!-- in relation to select-->
    <input type="hidden" name="s_subjseq"      value="<%=ss_subjseq%>"> <!--in relation to select-->
    <input type="hidden" name="s_action">

    <input type="hidden" name="p_specials"  value="">

    <input type="hidden" name="p_isoutsourcing" value="N">
    <input type="hidden" name="p_edulimit" value="0">
    <input type="hidden" name="p_musertel" value="">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr>
          <td><img src="/images/admin/portal/s.1_off12.gif" ></td>
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
            <td class="table_01">�����ڵ�<font color="red">(*)</font></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_subj" size="10" maxlength="10" value="�ڵ�����" readonly>
                 <kocca_select:select name="p_area" sqlNum="0002"  param="101" type="2.2"
                    onChange="" attr=" " selectedValue='' isLoad="true" all="none" />
            </td>
          </tr>
          <tr>
            <td  class="table_01">������<font color="red">(*)</font></td>
            <td class="table_02_2"><input type="text" class="input" name="p_subjnm" size="38" maxlength="100" value="" tabindex=""></td>
          </tr>
          <tr>
            <td class="table_01">�����з�<font color="red">(*)</font></td>
            <td height="50" class="table_02_2">
            <script type="text/javascript">
            var isFirst = 0;
            function fnSearchBoxs_middleclass() {
                if(isFirst++>0)
                changep_lowerclass($("#p_upperclass").val(), $("#p_middleclass").val());
            }
            </script>
                ��з� <kocca_select:select name="p_upperclass" sqlNum="off.0002"  param=" "
                onChange="changep_middleclass(this.value);" attr=" " selectedValue="<%= ss_upperclass %>" isLoad="true" all="true" /><br/>
                �ߺз� <kocca_select:select name="p_middleclass" sqlNum="off.0003"  param="<%= ss_upperclass %>"
                onChange="fnSearchBoxs_middleclass();" afterScript="fnSearchBoxs_middleclass" attr=" " selectedValue="<%= ss_middleclass %>" isLoad="true" all="true" /><br/>
                �Һз� <kocca_select:select name="p_lowerclass" sqlNum="off.0004"  param="<%= ss_upperclass %>"  param2="<%= ss_middleclass %>"
                onChange="" attr=" " selectedValue="<%=ss_lowerclass %>" isLoad="true" all="true" />
              <input type="hidden" name="p_proposetype" value="1">
            </td>
          </tr>

          <tr>
            <td class="table_01">��������°��ɿ���</td>
            <td height="50" class="table_02_2">
              <select name="p_suryoyn"  class="inputpsearch" tabindex=17>
                <option value='Y'>Y</option>
                <option value='N' selected>N</option>
              </select>
                <input type="text" class="input" name="p_suryotitle" size="38" maxlength="100" value="" tabindex="">
            </td>
          </tr>
          <tr>
            <td class="table_01">�����˻���</td>
            <td height="50" class="table_02_2">
                <input type="text" class="input" name="p_search_nm" size="60" maxlength="100" value="" tabindex="" >
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
             Ư��
              <select name="p_lecture"  class="inputpsearch" tabindex=18>
                <option value='Y'>Y</option>
                <option value='N' selected>N</option>
              </select>
            </td>
          </tr>
          <tr>
            <td  class="table_01">
                <!--����-->��米�� &nbsp;
                <a href="javascript:searchMuser()" tabindex="21"><img src="/images/admin/button/b_resarchbutt.gif" align="absmiddle" border="0"></a>
            </td>
            <td height="34" class="table_02_2" >
                    <div id="muserList"></div>
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
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
          </tr>
          <tr>
            <td height="31" class="table_01">�б��뿩��</td>
            <td class="table_02_2" > <select name="p_isterm"  class="inputpsearch" onChange="whenIsuse()" tabindex=26>
                <option value='Y' selected>Y</option>
                <option value='N'>N</option>
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
          </tr>
          <tr>
            <td class="table_01">�н��ڿ��� �����ֱ�</td>
            <td class="table_02_2" ><select name="p_isvisible"  class="inputpsearch" tabindex=27>
                <option value='Y' selected>Y</option>
                <option value='N'>N</option>
              </select>           <select style='display:none;' name="p_isintroduction"  class="inputpsearch" tabindex=28>
                <option value='Y' selected>Y</option>
                <option value='N'>N</option>
              </select>
              </td>
          </tr>
          <tr>
            <td class="table_01">�����Ⱓ</td>
            <td class="table_02_2">
                <input type="text" class="input" name="p_edudays" size="10" maxlength="5" value="0" tabindex=28>
                <select name="p_edudaystype"  class="inputpsearch" tabindex=28>
                    <option value='Y' selected>��</option>
                    <option value='M'>����</option>
                    <option value='W'>��</option>
                    <option value='D'>��</option>
                </select>
              </td>
          </tr>
          <tr>
            <td class="table_01">�������</td>
            <td class="table_02_2"><input type="text" class="input" name="p_place" size="50" value="" tabindex=29></td>
          </tr>
          <tr>
            <td  class="table_01">��������</td>
            <td class="table_02_2"><input type="text" class="input" name="p_studentlimit" size="10" maxlength="5" value="0" tabindex=30>
              ��</td>
          </tr>
          <tr>
            <td  class="table_01">�������� �����</td>
            <td class="table_02_2"><input type="text" class="input" name="p_studentwait" size="10" maxlength="5" value="0" tabindex=31>
              ��</td>
          </tr>
          <tr>
            <td class="table_01">������</td>
            <td class="table_02_2"><input type="text" class="input" name="p_biyong" size="10" maxlength="7" value="0" tabindex=32>
              ��</td>
          </tr>
          <tr>
            <td class="table_01">�̴��ǰ��� ��õ��</td>
            <td class="table_02_2"><input type="text" class="input" name="p_hitnumber" size="10" maxlength="7" value="0" tabindex=32></td>
          </tr>
          <tr>
            <td class="table_01">��뺸�迩��</td>
            <td class="table_02_2">
              <select name="p_isgoyong"  class="inputpsearch" onChange="whenIsgoyong()" tabindex=33>
                <option value='Y' >Y</option>
                <option value='N' selected>N</option>
              </select>
            </td>
          </tr>
          <tr>
            <td  class="table_01">ȯ�ޱݾ�</td>
            <td class="table_02_2" >
              ��Ը���(300���̻���) : <input type="text" class="input" name="p_goyongpricemajor" size="15" maxlength="10" value="0" disabled tabindex=34> ��
              &nbsp;&nbsp;&nbsp;�켱�������(�߼ұ��) : <input type="text" class="input" name="p_goyongpriceminor" size="15" maxlength="10" value="0" disabled tabindex=34> ��
            </td>
          </tr>
          <tr>
            <td class="table_01">������������</td>
            <td class="table_02_2">
              <select name="p_isunit">
                <option value='N'>N</option>
                <option value='Y'>Y</option>
              </select>
            </td>
          </tr>
        </table>
       </td></tr><tr><td align="center" valign="top"><br>
       <input type="hidden" name="p_point" value="100">
        <input type="hidden" name="p_gradscore" value="0">
        <input type="hidden" name="p_gradstep" value="0" >
        <input type="hidden" name="p_gradexam" value="0" >
        <input type="hidden" name="p_gradftest" value="0" >
        <input type="hidden" name="p_gradhtest" value="0" >
        <input type="hidden" name="p_gradreport" value="0" >
        <input type="hidden" name="p_gradetc1" value="0" >
        <input type="hidden" name="p_gradetc2" value="0" >
        <input type="hidden" name="p_wact" value="0">
        <input type="hidden" name="p_wscore" value="0" >
        <input type="hidden" name="p_wstep" value="0" >
        <input type="hidden" name="p_wmtest" value="0" >
        <input type="hidden" name="p_wftest" value="0" >
        <input type="hidden" name="p_whtest" value="0" >
        <input type="hidden" name="p_wreport" value="0" >
        <input type="hidden" name="p_wetc1" value="0" >
        <input type="hidden" name="p_wetc2" value="0" >
       <!--
        <table cellspacing="1" cellpadding="5" class="table_out" border="0">
          <tr>
            <td class="table_title" rowspan=2>��������</td>
            <td class="table_01" rowspan=2>�̼�����<input type="hidden" name="p_point" value="100"></td>
            <td class="table_01">����</td>
            <td class="table_01">�⼮</td>
            <td class="table_01">�߰���</td>
            <td class="table_01">������</td>
            <td class="table_01">������</td>
            <td class="table_01">����Ʈ</td>
            <td class="table_01">������</td>
            <td class="table_01">��Ÿ</td>
        </tr>
        <tr>
            <td class="table_02_2" ><input type="text" class="input" name="p_gradscore" size="10" maxlength="5" value="0" tabindex=52></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_gradstep" size="10" maxlength="5" value="0" tabindex=53></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_gradexam" size="10" maxlength="5" value="0" tabindex=54></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_gradftest" size="10" maxlength="5" value="0" tabindex=55></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_gradhtest" size="10" maxlength="5" value="0" tabindex=56></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_gradreport" size="10" maxlength="5" value="0" tabindex=57></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_gradetc1" size="10" maxlength="5" value="0" tabindex=58></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_gradetc2" size="10" maxlength="5" value="0" tabindex=59></td>
        </tr>
          <tr>
            <td class="table_title" rowspan=2>��������<br>����ġ(%)�� ���� 100�̾�� �մϴ�.</td>
            <td class="table_01" rowspan=2>����ġ(%)</td>
            <td class="table_01">�հ�(%)</td>
            <td class="table_01">�⼮</td>
            <td class="table_01">�߰���</td>
            <td class="table_01">������</td>
            <td class="table_01">������</td>
            <td class="table_01">����Ʈ</td>
            <td class="table_01">������</td>
            <td class="table_01">��Ÿ</td>
        </tr>
        <tr>
            <td class="table_02_2" ><input type="text" class="input" name="p_wscore" size="10" maxlength="5" value="0" tabindex=60 readonly></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_wstep" size="10" maxlength="5" value="0" tabindex=61 onchange="whenChaneWValue()"></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_wmtest" size="10" maxlength="5" value="0" tabindex=62 onchange="whenChaneWValue()"></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_wftest" size="10" maxlength="5" value="0" tabindex=63 onchange="whenChaneWValue()"></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_whtest" size="10" maxlength="5" value="0" tabindex=64 onchange="whenChaneWValue()"></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_wreport" size="10" maxlength="5" value="0" tabindex=65 onchange="whenChaneWValue()">
              <input type="hidden" name="p_wact" value="0"></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_wetc1" size="10" maxlength="5" value="0" tabindex=66 onchange="whenChaneWValue()"></td>
            <td class="table_02_2" ><input type="text" class="input" name="p_wetc2" size="10" maxlength="5" value="0" tabindex=67 onchange="whenChaneWValue()"></td>
          </tr>
        </table>
       </td></tr><tr><td align="center" valign="top">
        <br>
         -->
      <!----------------- ���������� ��� ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
        <tr>
          <td width="16%" class="table_title"><b>������û �Է�����</b></td>
          <td width="81%" class="table_02_2">
                <table><tr><td width="80%">
                <input type='hidden' id='p_needinput' name='p_needinput' value="10000010000"/>
                 <kocca_select:select name="needinput" sqlNum="0001"  param="0078" onChange="changeNeedInput"
                    selectedValue="10000010000" isLoad="true" all="true" isCheckBox="Y" />
                <script>
                    function changeNeedInput() {
                        $("#p_needinput").val('');
                        for (needInput_i = 0; needInput_i < document.form1.needinput.length; needInput_i++) {
                            if (document.form1.needinput[needInput_i].checked) {
                                $("#p_needinput").val($("#p_needinput").val()+'1');
                            } else {
                                $("#p_needinput").val($("#p_needinput").val()+'0');
                            }
                        }
                    }
                </script>
                    </td><td width="5%">&nbsp;</td>
                    <td><a href="javascript:fnPreview();"><img style="border:none" src="/images/admin/button/btn_preview.gif" alt="�Է¾�� �̸�����"/></a></td>
                    </tr>
                </table>
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
            <!-- ���� Editor
               <p align="left">
                        <input name="p_explain" type="hidden"/>
                        <script language = "javascript" src = "/script/user_patch.js"></script>
                        <script language='javascript'>object_namopatch('100%','350');</script>
               </p>
               <!-- ���� Editor  -->
                <!-- ���� ��Ƽ�� ������  ���� -->
                <input name="p_explain" type="hidden"/>
                <script language="javascript" src="/script/user_patch.js"></script>
                <script language="javascript">object_namoActivepatch('100%','350');</script>
                <!-- ���� ��Ƽ�� ������  ���� -->
          </td>
        </tr>
        <tr>
          <td class="table_title"><b>����ȭ���̹���</b></td>
          <td class="table_02_2">
            <input name="p_submainfile" type="file" class="input" size="118" maxlength="100" tabindex=65>
          </td>
        </tr>
      </table>
      <!----------------- ���������� ��� �� ----------------->
      <br>
      <!----------------- ���, ����Ʈ ��ư ���� ----------------->
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center"><a href="javascript:InsertSubject()" tabindex=68><img src="/images/admin/button/btn_copen.gif" border="0"></a></td>
          <td width=8></td>
          <td align="center"><a href="javascript:goSubjectListPage()" tabindex=69><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
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
