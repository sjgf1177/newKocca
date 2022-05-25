<%
//**********************************************************
//  1. ��      ��: ���հ������ ȭ��
//  2. ���α׷���: za_Subject_Off_I.jsp
//  3. ��      ��: ���հ������
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 11. 12
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
<%@ page import = "com.credu.homepage.*" %>
<jsp:useBean id = "code" class = "com.credu.system.CodeConfigBean"  scope = "page" />
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    //DEFINED in relation to select START
    String  ss_grcode    = box.getString("s_grcode");           //�����׷�
    String  ss_gyear     = box.getString("s_gyear");            //�⵵
    String  ss_upperclass = box.getString("s_upperclass");      //������з�
    String  ss_middleclass = box.getString("s_middleclass");    //�����ߺз�
    String  ss_lowerclass = box.getString("s_lowerclass");      //�����Һз�
    String  ss_subjcourse= box.getString("s_subjcourse");       //����
    String  ss_subjseq   = box.getString("s_subjseq");          //���� ����
    //DEFINED in relation to select END
    String  p_grcode        = box.getString("p_grcode");                    //�����׷�
    String  v_sgkind        = box.getStringDefault("p_proposetype","");    //������û���
%>
<html>
<head>
<title>���հ������</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--


function whenRndjijung() {
    if (document.form2.p_rndjijung.checked) {
        //���������� ���
        document.form2.p_rndcreditadd.disabled = false;
        document.form2.p_rndcreditdeduct.disabled = false;
        document.form2.p_rndcreditreq.disabled = true;
        document.form2.p_rndcreditchoice.disabled = true;
        document.form2.p_rndcreditreq.value = 0;
        document.form2.p_rndcreditchoice.value = 0;
    } else {
        //���������� �ƴ� ���
        document.form2.p_rndcreditadd.value = 0;
        document.form2.p_rndcreditdeduct.value = 0;
        document.form2.p_rndcreditadd.disabled = true;
        document.form2.p_rndcreditdeduct.disabled = true;
        document.form2.p_rndcreditreq.disabled = false;
        document.form2.p_rndcreditchoice.disabled = false;
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

function InsertSubject() {
    if(!chkData()) {
      return;
    }
    document.form2.s_action.value = "go";
    document.form2.p_process.value = 'insertOff';
    document.form2.p_specials.value = document.form2.p_new.value + document.form2.p_hit.value + document.form2.p_recom.value;
    document.form2.submit();
}
function goSubjectListPage() {
    document.form2.s_action.value = "go";
    document.form2.p_process.value  = 'listPage';
    document.form2.submit();
}
function chkData() {
    ff = document.form2;

  if (document.form2.p_subj.value=='ALL' || document.form2.p_subj.value=='') { 
    alert('�����ڵ带 �����ϼ���.');
    return false;
  }

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
*/


  if (!number_chk_noalert(document.form2.p_biyong.value)) {
    alert('�����ᰡ �߸��ԷµǾ����ϴ�.');
    return false;
  }
  
  if (!number_chk_noalert(document.form2.p_edudays.value)) {
    alert('�����Ⱓ�� �߸��ԷµǾ����ϴ�.');
    return false;
  }

  if (!number_chk_noalert(document.form2.p_edutimes.value)) {
    alert('�����ð��� �߸��ԷµǾ����ϴ�.');
    return false;
  }
  if (!number_chk_noalert(document.form2.p_studentlimit.value)) {
    alert('������ �߸��ԷµǾ����ϴ�.');
    return false;
  }

  if (!number_chk_noalert(document.form2.p_point.value)) {
    alert('�̼������� �߸��ԷµǾ����ϴ�.');
    return false;
  }
  if (!number_chk_noalert(document.form2.p_gradscore.value)) {
    alert('�̼�����-������ �߸��ԷµǾ����ϴ�.');
    return false;
  }

  if (!number_chk_noalert(document.form2.p_gradstep.value)) {
    alert('�̼�����-�⼮���� �߸��ԷµǾ����ϴ�.');
    return false;
  }
  
  if (!number_chk_noalert(ff.p_gradexam.value)) {
          alert('�̼�����-�򰡰� �߸��ԷµǾ����ϴ�.');
          return false;
        }

        
        if (!number_chk_noalert(ff.p_gradreport.value)) {
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
            alert('�̼�����-�򰡰� 100 �̻��Դϴ�.');
            return false;
        }
        if (ff.p_gradreport.value > 100) {
            alert('�̼�����-����Ʈ�� 100 �̻��Դϴ�.');
            return false;
        }
        
        
  if (!number_chk_noalert(document.form2.p_wstep.value)) {
    alert('����ġ-�⼮��(%)�� �߸��ԷµǾ����ϴ�.');
    return false;
  }
  if (!number_chk_noalert(document.form2.p_wftest.value)) {
    alert('����ġ-��(%)�� �߸��ԷµǾ����ϴ�.');
    return false;
  }
  if (!number_chk_noalert(document.form2.p_wreport.value)) {
    alert('����ġ-����Ʈ(%)�� �߸��ԷµǾ����ϴ�.');
    return false;
  }
  if (!number_chk_noalert(document.form2.p_wetc1.value)) {
    alert('����ġ-��Ÿ(%)�� �߸��ԷµǾ����ϴ�.');
    return false;
  }
  var weight = parseFloat(document.form2.p_wstep.value,10) + parseFloat(document.form2.p_wftest.value,10) + parseFloat(document.form2.p_wreport.value,10) + parseFloat(document.form2.p_wetc1.value,10);
  if (weight < 0) {
    alert('����ġ�� 0% ���� �����ϴ�');
    return false;
  } 
  
  if (weight > 100) {
    alert('����ġ�� 100% ���� �����ϴ�.');
    return false;
  }
  if (blankCheck(document.form2.p_subjnm.value)) {
    alert('�������� �Է��Ͻʽÿ�.');
    document.form2.p_subjnm.focus();
    return false;
  }
  return true;
}
function searchMuser() {
  var p_gubun = 'name';
  var p_key1  = document.form2.p_museridnm.value;
  var url = "/servlet/controller.library.SearchServlet?p_process=member&p_gubun="+ p_gubun +"&p_key1="+ p_key1 +"&p_key2=";
  open_window("",url,"0","0","100","100");
}
// ��� �˻� �� ó��
function receiveMember(userid, name, resno, email, cono, jikwi, jikwinm, comp, compnm, tmp1, tmp2, tmp3){
  document.form2.p_museridnm.value = name;
  document.form2.p_muserid.value   = userid;
  document.form2.p_musertel.value   = tmp3;
}

function whenSelection() {
    document.form2.p_process.value = 'insertOffPage';
    //��з� ���ý� �ߺз��� ALL�� �ʱ�ȭ
    document.form2.s_middleclass.value = '';
    document.form2.submit();
}

function whenIsgoyong() {
    //��뺸�� ��뿩��üũ
    if (document.form2.p_isgoyong.value=="Y") {
        document.form2.p_goyongprice_major.disabled = false;
//        document.form2.p_goyongprice_minor.disabled = false;
    } else {
        document.form2.p_goyongprice_major.disabled = true;
//		document.form2.p_goyongprice_minor.disabled = true;
        document.form2.p_goyongprice_major.value = 0;
//        document.form2.p_goyongprice_minor.value = 0;
    }
}
//-->
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<div id=minical OnClick="this.style.display='none';" oncontextmenu='return false'
ondragstart='return false' onselectstart='return false'
style="background : buttonface; margin: 5; margin-top: 2;border-top: 1
solid buttonhighlight;border-left: 1 solid buttonhighlight;border-right: 1
solid buttonshadow;border-bottom: 1 solid buttonshadow;width:155;display:none;position: absolute; z-index: 99">
</div>

<form name="form2" method="post" action="/servlet/controller.course.SubjectServlet"  enctype="multipart/form-data">
    <input type="hidden" name="p_process"     value="">
    <input type="hidden" name="s_action">
    
    <input type="hidden" name="s_grcode"        value="<%=ss_grcode%>">     <!--in relation to select-->
    <input type="hidden" name="s_gyear"         value="<%=ss_gyear%>">      <!--in relation to select-->
    <input type="hidden" name="s_upperclass"    value="<%=ss_upperclass%>"> <!--in relation to select-->
    <input type="hidden" name="s_middleclass"   value="<%=ss_middleclass%>"><!--in relation to select-->
    <input type="hidden" name="s_lowerclass"    value="<%=ss_lowerclass%>"><!--in relation to select-->
    <input type="hidden" name="s_subjcourse"    value="<%=ss_subjcourse%>"> <!--in relation to select-->
    <input type="hidden" name="s_subjseq"       value="<%=ss_subjseq%>">    <!--in relation to select-->

    <input type="hidden" name="p_grcode"      value="<%=p_grcode%>">
    <input type="hidden" name="p_isonoff"     value="OFF">
    <input type="hidden" name="p_specials"    value="">
    <input type="hidden" name="p_owner"       value="0101000000">
    <input type="hidden" name="p_producer"    value="0101000000">

<table width="1024" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
        <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="970" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/c_title01.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>      <!----------------- title �� ----------------->
      <%=box.getString("p_warnmsg")%><br>
      <br>
        <!----------------- ���� ���/����/����/�󼼺��� (����) ���� ----------------->
        <table cellspacing="1" cellpadding="5" class="table_out" width=970>
          <tr> 
            <td colspan="7" class="table_top_line"></td>
          </tr>
          <tr> 
            <td width="7%"  rowspan="29" class="table_title"><b>��������</b></td>
            <td colspan="6" class="dir_txt02" >(*) ǥ�ô� �ʼ� �Է��Դϴ�.</td>
          </tr>
          <tr> 
            <td class="table_01"  width="13%">��������</td>
            <td colspan="5" class="table_02_2" width="30%">���� / �����ڵ� : <input type="text" class="input" name="p_subj" size="10" maxlength="10" value="" >
              <input type="hidden" name="p_point" value="100"></td>
          </tr>
          <tr> 
            <td class="table_01">������<font color="red">(*)</font></td>
            <td width="30%" class="table_02_2"  ><input type="text" class="input" name="p_subjnm" size="38" maxlength="100" value="" tabindex=1></td>
            <td width="7%"  rowspan="9" class="table_title"><b>��������</b></td>
            <td width="3%" rowspan="4" class="table_01">��<br>��<br>��<br>�� </td>
            <td width="10%"   class="table_01">�� ��</td>
            <td width="30%"   class="table_02_2"  ><input type="text" class="input" name="p_gradscore" size="10" maxlength="5" value="0" tabindex=30></td>
          </tr>
          <tr> 
            <td class="table_01">�����з�<font color="red">(*)</font></td>
            <td class="table_02_2"> <iframe name="isubjclass" width="250" height="75"   frameborder="0"  src="/servlet/controller.library.SearchServlet?p_process=subjclass&p_formname=form2"></iframe> 
              <input type="hidden" name="p_upperclass"> <input type="hidden" name="p_middleclass"> <input type="hidden" name="p_lowerclass"> 
              <!--������û��� Default �Ϲݽ�û(1)-->
              <input type="hidden" name="p_proposetype" value="1"> </td>
            <td class="table_01">�⼮��</td>
            <td class="table_02_2"  ><input type="text" class="input" name="p_gradstep" size="10" maxlength="5" value="0" tabindex=31></td>
          </tr>

          <tr> 
            <td class="table_01">����Ư��</td>
            <td class="table_02_2">�ű� 
              <select name="p_new"  class="inputpsearch" tabindex=14>
                <option value='Y'>Y</option>
                <option value='N' selected>N</option>
              </select>
              HIT
              <select name="p_hit"  class="inputpsearch" tabindex=15>
                <option value='Y'>Y</option>
                <option value='N' selected>N</option>
              </select> 
              ��õ 
              <select name="p_recom"  class="inputpsearch" tabindex=15>
                <option value='Y'>Y</option>
                <option value='N' selected>N</option>
              </select> </td>

            <td class="table_01">��&nbsp; ��</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_gradexam" size="10" maxlength="5" value="0" tabindex=32></td>
          </tr>
          <tr> 
            <td rowspan="3" class="table_01">��米��<font color="red">(*)</font></td>
            <td    height="34" class="table_02_2" > I&nbsp;&nbsp;&nbsp;D: 
              <input name="p_muserid" type="text" class="input" size="14" maxlength=13 value=""  tabindex=16></td>

            <td class="table_01">����Ʈ</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_gradreport" size="10" maxlength="5" value="0" tabindex=33></td>
          </tr>
          <tr> 
            <td class="table_02_2"  > <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="51%">��&nbsp;&nbsp;&nbsp;��:&nbsp; <input name="p_museridnm" type="text" class="input" size="14" maxlength=13 value="" tabindex=17></td>
                  <td width="49%"><a href="javascript:searchMuser()"><img src="/images/admin/button/b_resarchbutt.gif"  border="0" tabindex=18></a></td>
                </tr>
              </table></td>

            <td rowspan="5" class="table_01">��<br>��<br>ġ<br>(%)<br> </td>
            <td class="table_01">�⼮��</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_wstep" size="10" maxlength="5" value="0" tabindex=34></td>
          </tr>
          <tr> 
            <td class="table_02_2"  >����ó: 
              <input name="p_musertel" type="text" class="input" size="22" maxlength=40 value="<%=box.getSession("comptel")%>" tabindex=19> 
            </td>
            <td class="table_01">�� ��</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_wftest" size="10" maxlength="5" value="0" tabindex=35></td>
          </tr>
          <tr> 
            <td height="31" class="table_01">������뿩��</td>
            <td class="table_02_2"  > <select name="p_isuse"  class="inputpsearch" onChange="whenIsuse()" tabindex=20>
                <option value='Y' selected>Y</option>
                <option value='N'>N</option>
              </select> </tr>
            <td class="table_01">����Ʈ</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_wreport" size="10" maxlength="5" value="0" tabindex=36></td>
          </tr>
          <tr> 
            <td class="table_01">�н��ڿ��� �����ֱ�</td>
            <td class="table_02_2" ><select name="p_isvisible"  class="inputpsearch" tabindex=21>
                <option value='Y' selected>Y</option>
                <option value='N'>N</option>
              </select></td>
            <td class="table_01">�� Ÿ</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_wetc1" size="10" maxlength="5" value="0" tabindex=37></td>
          </tr>
          <tr> 
            <td class="table_01">�����Ұ���뿩��</td>
            <td class="table_02_2"> 
              <select name="p_isintroduction"  class="inputpsearch" tabindex=28>
                <option value='Y' selected>Y</option>
                <option value='N'>N</option>
              </select> 
            </td>
            <td colspan="2" class="table_01">����ġ(%)�� ���� 100�̾�� �մϴ�.</td>
          </tr>
          <tr> 
            <td class="table_01">������</td>
            <td class="table_02_2"><input type="text" class="input" name="p_biyong" size="10" maxlength="8" value="0" tabindex=22>
              ��</td>
            <td colspan="4" rowspan="11" class="table_title">&nbsp;</td>
          </tr>
          <tr> 
            <td class="table_01">�����Ⱓ</td>
            <td class="table_02_2"><input type="text" class="input" name="p_edudays" size="5" maxlength="5" value="0" tabindex=22>
              ��</td>
          </tr>
          <tr> 
            <td class="table_01">�����ð�</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_edutimes" size="5" maxlength="5" value="0" tabindex=23>
              �ð�</td>
          </tr>
          <tr>   
            <td class="table_01">�������</td>
            <td class="table_02_2"><input type="text" class="input" name="p_placejh" size="38" maxlength="100" value="" tabindex=24></td>
          </tr>
          <tr> 
            <td class="table_01">��������</td>
            <td class="table_02_2" ><%= code.getCodeSelect("edutype","p_edutype"," tabindex=25","") %></td>
          </tr>
          <tr> 
            <td  class="table_01">������ ����</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_studentlimit" size="10" maxlength="5" value="0" tabindex=26></td>
          </tr>
          <tr> 
            <td  class="table_01">����/÷������</td>
            <td class="table_02_2" ><input type="hidden" class="input" name="p_bookname" size="38" maxlength="100" value=""> 
              <input type="file" class="input" name="p_file" size="30" maxlength="100" value="" tabindex=27> 
            </td>
          </tr>
          <tr>
            <td class="table_01">��뺸�迩��</td>
            <td class="table_02_2"> 
              <select name="p_isgoyong"  class="inputpsearch" onChange="whenIsgoyong()" tabindex=28>
                <option value='Y' >Y</option>
                <option value='N' selected>N</option>
              </select> 
            </td>
          </tr>
          <tr> 
            <td class="table_01">ȯ�ޱݾ�</td>
            <td class="table_02_2" >
              <input type="text" class="input" name="p_goyongprice_major" size="15" maxlength="10" value="" disabled tabindex=36> ��<br>
<!--             �߼ұ�� <input type="text" class="input" name="p_goyongprice_minor" size="15" maxlength="10" value="" disabled tabindex=36> �� -->
            </td>
          </tr>
<!--
          <tr> 
            <td class="table_01">���米������</td>
            <td class="table_02_2" ><select name="p_isalledu"  class="inputpsearch" tabindex=28>
                <option value='Y'>Y</option>
                <option value='N' selected>N</option>
              </select> &nbsp;(R&D �з��� ǥ��)</td>
          </tr>
-->
        </table>
        <br>
        <!----------------- ���������� ��� ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
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
          <td width="16%" class="table_title"><b>�������</b></td>
          <td width="81%" class="table_02_2">
            <textarea name="p_edumans" cols="100" rows="3" tabindex=40></textarea>
          </td>
        </tr>
        <tr>
          <td class="table_title"><b>��������</b></td>
          <td class="table_02_2">
            <textarea name="p_intro" cols="100" rows="3" tabindex=41></textarea>
          </td>
        </tr>
        <tr>
          <td class="table_title"><b>��������</b></td>
          <td class="table_02_2">
            <textarea name="p_explain" cols="100" rows="5" tabindex=42></textarea>
          </td>
        </tr>
        <tr>
          <td class="table_title"><b>���Ǳ��� �� ������</b></td>
          <td class="table_02_2">
            <textarea name="p_memo" cols="100" rows="5" tabindex=67></textarea>
          </td>
        </tr>
      </table>
      <!----------------- ���������� ��� �� ----------------->
      <br>
      <!----------------- ���, ����Ʈ ��ư ���� ----------------->
      <table  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><a href="javascript:InsertSubject()"><img src="/images/admin/button/btn_copen.gif" border="0" tabindex=43></a></td>
          <td width=8></td>
          <td><a href="javascript:goSubjectListPage()"><img src="/images/admin/button/btn_list.gif" border="0" tabindex=44></a></td>
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
