<%
//**********************************************************
//  1. ��      ��: ������� ȭ��
//  2. ���α׷���: za_cpsubject_i.jsp
//  3. ��      ��: ������� ȭ��
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 11. 11
//  7. ��      ��: ��â�� 2004. 12. 31
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.cp.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
	String  ss_grcode	  	= box.getStringDefault("s_grcode","ALL");    	 //�����ְ�(SELECT BOX)
	String  p_grcode  		= box.getString("p_grcode");					//�����ְ�
    String  ss_upperclass   = box.getString("s_upperclass");    //������з�
    String  ss_middleclass  = box.getString("s_middleclass");   //�����ߺз�
    String  ss_lowerclass   = box.getString("s_lowerclass");    //�����Һз�
    String  ss_subjcourse   = box.getString("s_subjcourse");    //����&�ڽ�
    String  v_sgkind   		= box.getStringDefault("p_proposetype","");    //������û���
	
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
function InsertSubject() {
    if(!chkData()) {
      return;
    }
  document.form2.p_process.value = 'insert';
  document.form2.p_specials.value = document.form2.p_new.value + document.form2.p_hit.value + document.form2.p_recom.value;
  document.form2.submit();
}
function goSubjectListPage() {
  document.form2.p_process.value  = 'listPage';
  document.form2.submit();
}

function chkData() {
  if (document.form2.s_upperclass.value=='ALL') { 
    alert('��з��� �����ϼ���.');
    return false;
  }
  
  if (document.form2.s_middleclass.value=='ALL') { 
    alert('�ߺз��� �����ϼ���.');
    return false;
  }

  if (!number_chk_noalert(document.form2.p_score.value)) {
    alert('���������� �߸��ԷµǾ����ϴ�.');
    return false;
  }
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
  
  if (!number_chk_noalert(document.form2.p_bookprice.value)) {
    alert('����� �߸��ԷµǾ����ϴ�.');
    return false;
  }
  
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
    alert('����ġ-��Ÿ1(%)�� �߸��ԷµǾ����ϴ�.');
    return false;
  }
  
  if (!number_chk_noalert(document.form2.p_wetc2.value)) {
    alert('����ġ-��Ÿ2(%)�� �߸��ԷµǾ����ϴ�.');
    return false;
  }
  
  var weight =  parseFloat(document.form2.p_wstep.value,10) + parseFloat(document.form2.p_wmtest.value,10) + parseFloat(document.form2.p_wftest.value,10) + parseFloat(document.form2.p_whtest.value,10) + parseFloat(document.form2.p_wreport.value,10) + parseFloat(document.form2.p_wact.value,10) + parseFloat(document.form2.p_wetc1.value,10) + parseFloat(document.form2.p_wetc2.value,10);
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

  return true;
}
function searchCuser() {
  var p_gubun = 'name';
  var p_key1  = document.form2.p_cuseridnm.value;
  var p_key2  = 'p_cuser';
  var url = "/servlet/controller.library.SearchServlet?p_process=member&p_gubun="+ p_gubun +"&p_key1="+ p_key1 +"&p_key2="+p_key2;
  open_window("",url,"0","0","100","100");
}
function searchMuser() {
  var p_gubun = 'name';
  var p_key1  = document.form2.p_museridnm.value;
  var p_key2  = 'p_muser';
  var url = "/servlet/controller.library.SearchServlet?p_process=member&p_gubun="+ p_gubun +"&p_key1="+ p_key1 +"&p_key2="+p_key2;
  open_window("",url,"0","0","100","100");
}
// ��� �˻� �� ó��
function receiveMember(userid, name, resno, email, cono, jikwi, jikwinm, comp, compnm, tmp1, tmp2, tmp3){
  if (tmp1 == 'p_cuser') {
    document.form2.p_cuseridnm.value = name;
    document.form2.p_cuserid.value   = userid;
  } else if (tmp1 == 'p_muser') {
    document.form2.p_museridnm.value = name;
    document.form2.p_muserid.value   = userid;
  }
}
function searchProducer() {
  var p_key1  = document.form2.p_producernm.value;
  var p_key2  = 'p_producer';
  var url = "/servlet/controller.library.SearchServlet?p_process=grpcomp&p_gubun=companynm&p_key1=&p_key2="+p_key2;
  open_window("",url,"0","0","100","100");
}
function searchOwner() {
  var p_key1  = document.form2.p_ownernm.value;
  var p_key2  = 'p_owner';
  var url = "/servlet/controller.library.SearchServlet?p_process=grpcomp&p_gubun=companynm&p_key1=&p_key2="+p_key2;
  open_window("",url,"0","0","100","100");
}
// ȸ�� �˻� �� ó��
function receiveGrpComp(comp , compnm, comptype, groupnm, companynm, tmp1, tmp2, tmp3) {
  if (tmp1 == 'p_producer') {
    document.form2.p_producernm.value = compnm;
    document.form2.p_producer.value   = comp;
  } else if (tmp1 == 'p_owner') {
    document.form2.p_ownernm.value = compnm;
    document.form2.p_owner.value   = comp;
  }
}

function whenSelection() {
    document.form2.p_process.value = 'insertPage';
	//��з� ���ý� �ߺз��� ALL�� �ʱ�ȭ
	document.form2.s_middleclass.value = '';
    document.form2.submit();
}
-->
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<form name="form2" method="post" action="/servlet/controller.cp.CPCourseServlet">
    <input type="hidden" name="p_process"     value="">
	<input type="hidden" name="s_grcode"		value="<%=ss_grcode%>">
	<input type="hidden" name="p_grcode"		value="<%=p_grcode%>">	
    <input type="hidden" name="p_upperclass"  value="<%=ss_upperclass %>">
    <input type="hidden" name="p_middleclass"  value="<%=ss_middleclass%>">
    <input type="hidden" name="p_lowerclass "  value="<%=ss_lowerclass %>">
    <input type="hidden" name="s_subjcourse "  value="<%=ss_subjcourse %>">
    <input type="hidden" name="p_isonoff"     value="ON">
    <input type="hidden" name="p_specials"    value="">
    <input type="hidden" name="p_middleclass" value="0000">
    <input type="hidden" name="p_lowerclass"  value="0000">
    <input type="hidden" name="p_crdate"      value="">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
        <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/cp/cp_title02.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <%=box.getString("p_warnmsg")%><br>
      <br>
      <!----------------- ���� ���/����/����/�󼼺��� (���̹�) ���� ----------------->
        <table cellspacing="1" cellpadding="5" class="table_out">
          <tr> 
            <td colspan="8" class="table_top_line"></td>
          </tr>
          <tr> 
            <td class="table_title" width="7%" rowspan="30"><b>��������</b></td>
            <td colspan="2" class="table_01">��������</td>
            <td class="table_02_2" >���̹�</td>
            <td width="7%" rowspan="5" class="table_title"><b>URL����</b></td>
            <td colspan="2" class="table_01">���������</td>
            <td class="table_02_2"><input type="text" class="input" name="p_dir" size="38" maxlength="100" value=""></td>
          </tr>
          <tr> 
            <td colspan="2" class="table_01">������Ÿ��</td>
            <td class="table_02_2"><%=CodeConfigBean.getCodeGubunSelect ("0007", "", 1, "p_contenttype", "", "", 0)%> </td>
            <td colspan="2" class="table_01">VOD���</td>
            <td class="table_02_2"><input type="text" class="input" name="p_vodurl" size="38" maxlength="100" value=""></td>
          </tr>
          <tr> 
            <td colspan="2" class="table_01">������</td>
            <td class="table_02_2"  width="27%"><input type="text" class="input" name="p_subjnm" size="38" maxlength="100" value=""></td>
            <td colspan="2" class="table_01">�н�URL</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_eduurl" size="38" maxlength="100" value=""></td>
          </tr>
          <tr> 
            <td colspan="2" class="table_01">�����з�</td>
            <td class="table_02_2" width="27%"> 
              <!--
			    <% SelectSubjBean selectSubj = new SelectSubjBean();      %> 
			    <select name = "p_2upperclass" onChange = "" class="inputpsearch">
                <%	ArrayList upperList = selectSubj.getOnlyUpperClass(box);
                for(int k = 0; k < upperList.size(); k++) {
                    DataBox selectbox = (DataBox)upperList.get(k);
                %>
                <option value = "<%= selectbox.getString("d_upperclass")%>" <% if ((box.getString("p_upperclass").equals(selectbox.getString("d_upperclass")))) out.print("selected"); %>>
                <%= selectbox.getString("d_classname")%></option>
                <%   }  %>
              </select>  -->
              <%= SelectSubjBean.getUpperClass(box, true, true, false)%>
              <!-- getUpperclass(RequestBox, isChange, isALL, isStatisticalPage)    ������з�  -->
              <%= SelectSubjBean.getMiddleClass(box, true, true, false)%>
              <!-- getMiddleclass(RequestBox, isChange, isALL, isStatisticalPage)    �����ߺз�  -->
              <%= SelectSubjBean.getLowerClass(box, false, true, false)%>
            <td colspan="2" class="table_01">������URL</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_preurl" size="38" maxlength="100" value=""></td>
          </tr>
          <tr> 
            <td colspan="2" class="table_01">������û���</td>
            <td class="table_02_2" width="27%"> <%=CodeConfigBean.getCodeSelect("sugang_kind","p_proposetype",v_sgkind,"",0)%> </td>
            <td colspan="2" class="table_01">�н�����URL</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_conturl" size="38" maxlength="100" value=""></td>
          </tr>
          <tr> 
            <td width="2%" rowspan="3" class="table_01">��<br>
              ��<br>
              ��<br>
              �� <br> </td>
            <td height="31" class="table_01">���������ְ�����</td>
            <td class="table_02_2" ><select name="p_usesubjseqapproval"  class="inputpsearch">
                <option value='Y' <% if(box.getString("p_usesubjseqapproval").equals("Y") ||box.getString("p_usesubjseqapproval").equals("")) out.println(" selected");%>>Y</option>
                <option value='N' <% if(box.getString("p_usesubjseqapproval").equals("N")) out.println(" selected");%>>N</option>
              </select></td>
            <td width="7%" rowspan="8" class="table_title"><b>�н�����</b></td>
            <td colspan="2" class="table_01">�н����(WBT%)</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_ratewbt" size="10" maxlength="3" value="0"></td>
            <%//CodeConfigBean.getCodeGubunSelect (SubjectBean.LANGUAGE_GUBUN, "", 1, "p_language", "", "", 0)%>
          </tr>
          <tr> 
            <td   width="12%" height="31" class="table_01">������û��������</td>
            <td class="table_02_2" width="27%" ><select name="p_useproposeapproval"  class="inputpsearch">
                <option value='Y' <% if(box.getString("p_useproposeapproval").equals("Y") ||box.getString("p_useproposeapproval").equals("")) out.println(" selected");%>>Y</option>
                <option value='N' <% if(box.getString("p_useproposeapproval").equals("N")) out.println(" selected");%>>N</option>
              </select></td>
            <td colspan="2" class="table_01">�н����(VOD%)</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_ratevod" size="10" maxlength="3" value="0"></td>
          </tr>
          <tr> 
            <td   width="12%" class="table_01">�ְ������������</td>
            <td class="table_02_2" width="27%"><select name="p_usemanagerapproval"  class="inputpsearch">
                <option value='Y' <% if(box.getString("p_usemanagerapproval").equals("Y") ||box.getString("p_usemanagerapproval").equals("")) out.println(" selected");%>>Y</option>
                <option value='N' <% if(box.getString("p_usemanagerapproval").equals("N")) out.println(" selected");%>>N</option>
              </select></td>
            <td colspan="2" class="table_01">�н�ȯ��</td>
            <td class="table_02_2" width="33%" ><input type="text" class="input" name="p_env" size="38" maxlength="100" value=""></td>
          </tr>
          <tr>
            <td colspan="2" class="table_01">��������</td>
            <td class="table_02_2" >
				<input type = "radio" name = "p_isessential" value="D" checked> �Ϲ�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type = "radio" name = "p_isessential" value="S"        > ���Ӱ���<br>
            <input type = "radio" name = "p_isessential" value="W"        > ������
            <input type = "radio" name = "p_isessential" value="T"        > �����ĺ��ڰ���
			</td>
            <td colspan="2" class="table_01">&nbsp;</td>
            <td class="table_02_2" >&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="2" class="table_01">��������</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_score" size="10" maxlength="3" value="0">
              ��</td>
            <td colspan="2" class="table_01">���缳��</td>
            <td class="table_02_2" width="33%" ><input type="text" class="input" name="p_tutor" size="38" maxlength="20" value=""></td>
          </tr>
          <tr> 
            <td colspan="2" rowspan="5" class="table_01">��������<br>
              (��������) </td>
            <td height="25" class="table_02_2" >�ʼ� 
              <input type="text" class="input" name="p_rndcreditreq" size="10" maxlength="3" value="0">
              ��</td>
            <td colspan="2" class="table_01">�����</td>
            <td class="table_02_2" width="33%" ><input type="text" class="input" name="p_bookname" size="38" maxlength="100" value=""></td>
          </tr>
          <tr> 
            <td class="table_02_2" >���� 
              <input type="text" class="input" name="p_rndcreditchoice" size="10" maxlength="3" value="0">
              ��</td>
            <td colspan="2" class="table_01">1���ִ��н���</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_edulimit" size="10" maxlength="5" value="0"></td>
          </tr>
          <tr> 
            <td class="table_02_2" >���� 
              <input type="text" class="input" name="p_rndcreditadd" size="10" maxlength="3" value="0">
              ���� </td>
            <td colspan="2" class="table_01">�������ɿ���</td>
            <td class="table_02_2" ><select name="p_isablereview"  class="inputpsearch">
                <option value='Y' <% if(box.getString("p_isablereview").equals("Y") ||box.getString("p_isablereview").equals("")) out.println(" selected");%>>Y</option>
                <option value='N' <% if(box.getString("p_isablereview").equals("N")) out.println(" selected");%>>N</option>
              </select></td>
          </tr>
          <tr> 
            <td width="27%" height="34" class="table_02_2" >���� 
              <input type="text" class="input" name="p_rndcreditdeduct" size="10" maxlength="3" value="0">
              ���� </td>
            <td width="7%" rowspan="13" align="center" class="table_title"><b>��������</b></td>
            <td colspan="2" class="table_01">�̼�����</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_point" size="10" maxlength="5" value="100"></td>
          </tr>
          <tr> 
            <td height="34" class="table_02_2" ><input type="checkbox" name="p_rndjijung" value="Y">
              ������������ 
              <input type="checkbox" name="p_rndjikmu" value="Y">
              ������������</td>
            <td   width="4%" rowspan="4" class="table_01">��<br>
              ��<br>
              ��<br>
              �� </td>
            <td class="table_01">�� ��</td>
            <td class="table_02_2" width="33%" ><input type="text" class="input" name="p_gradscore" size="10" maxlength="5" value="0"></td>
          </tr>
          <tr> 
            <td colspan="2" class="table_01">����Ư��</td>
            <td class="table_02_2"  width="27%"> �ű� 
              <select name="p_new"  class="inputpsearch">
                <option value='Y' <% if(box.getString("p_new").equals("Y") ||box.getString("p_new").equals("")) out.println(" selected"); %>>Y</option>
                <option value='N' <% if(box.getString("p_new").equals("N")) out.println(" selected"); %>>N</option>
              </select>
              ��Ʈ 
              <select name="p_hit"  class="inputpsearch">
                <option value='Y' <% if(box.getString("p_hit").equals("Y") ||box.getString("p_hit").equals("")) out.println(" selected");%>>Y</option>
                <option value='N' <% if(box.getString("p_hit").equals("N")) out.println(" selected"); %>>N</option>
              </select>
              ��õ 
              <select name="p_recom"  class="inputpsearch">
                <option value='Y' <% if(box.getString("p_recom").equals("Y") ||box.getString("p_recom").equals("")) out.println(" selected");%>>Y</option>
                <option value='N' <% if(box.getString("p_recom").equals("N")) out.println(" selected");%>>N</option>
              </select> </td>
            <td class="table_01">������</td>
            <td class="table_02_2" width="33%" ><input type="text" class="input" name="p_gradstep" size="10" maxlength="5" value="0"></td>
          </tr>
          <tr> 
            <td colspan="2" class="table_01">���������</td>
            <td class="table_02_2" width="27%"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="160"> ��&nbsp;&nbsp;&nbsp;��:&nbsp; <input name="p_cuseridnm" type="text" class="input" size="14" maxlength=13 value=""> 
                    <br>
                    ���̵�:&nbsp; <input name="p_cuserid" type="text" class="input" size="14" maxlength=13 value="" readonly> 
                  </td>
                  <td><a href="javascript:searchCuser()"><img src="/images/admin/button/b_resarchbutt.gif" border="0"></a></td>
                </tr>
              </table></td>
            <td class="table_01">�� ��</td>
            <td class="table_02_2" width="33%" ><input type="text" class="input" name="p_gradexam" size="10" maxlength="5" value="0"></td>
          </tr>
          <tr> 
            <td colspan="2" class="table_01">����</td>
            <td class="table_02_2" width="27%" > <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="160"> ��&nbsp;&nbsp;&nbsp;��:&nbsp; <input name="p_museridnm" type="text" class="input" size="14" maxlength=13 value=""> 
                    <br>
                    ���̵�:&nbsp; <input name="p_muserid" type="text" class="input" size="14" maxlength=13 value="" readonly> 
                  </td>
                  <td><a href="javascript:searchMuser()"><img src="/images/admin/button/b_resarchbutt.gif" border="0"></a></td>
                </tr>
              </table></td>
            <td class="table_01">����Ʈ</td>
            <td class="table_02_2" width="33%" ><input type="text" class="input" name="p_gradreport" size="10" maxlength="5" value="0"></td>
          </tr>
          <tr> 
            <td height="31" colspan="2" class="table_01">��뿩��</td>
            <td class="table_02_2" width="27%" > <select name="p_isuse"  class="inputpsearch">
                <option value='Y' <% if(box.getString("p_isuse").equals("Y") ||box.getString("p_isuse").equals("")) out.println(" selected");%>>Y</option>
                <option value='N' <% if(box.getString("p_isuse").equals("N")) out.println(" selected");%>>N</option>
              </select> 
            <td rowspan="8" class="table_01">��<br>
              ��<br>
              ġ<br>
              (%) </td>
            <td class="table_01">������</td>
            <td class="table_02_2" width="33%" ><input type="text" class="input" name="p_wstep" size="10" maxlength="5" value="0"></td>
          </tr>
          <tr> 
            <td colspan="2" class="table_01">��Ź��������</td>
            <td class="table_02_2" width="27%" > <select name="p_isoutsourcing"  class="inputpsearch">
                <option value='Y' <% if(box.getString("p_isoutsourcing").equals("Y") ||box.getString("p_isoutsourcing").equals("")) out.println(" selected");%>>Y</option>
                <option value='N' <% if(box.getString("p_isoutsourcing").equals("N")) out.println(" selected");%>>N</option>
              </select> </td>
            <td class="table_01">�߰���</td>
            <td class="table_02_2" width="33%" ><input type="text" class="input" name="p_wmtest" size="10" maxlength="5" value="0"></td>
          </tr>
          <tr> 
            <td colspan="2" class="table_01">��뺸�迩��</td>
            <td class="table_02_2" width="27%"> <select name="p_isgoyong"  class="inputpsearch">
                <option value='Y' <% if(box.getString("p_isgoyong").equals("Y") ||box.getString("p_isgoyong").equals("")) out.println(" selected");%>>Y</option>
                <option value='N' <% if(box.getString("p_isgoyong").equals("N")) out.println(" selected");%>>N</option>
              </select> &nbsp;&nbsp;&nbsp; ȯ�ޱݾ� &nbsp;&nbsp;:&nbsp;&nbsp; <input type="text" class="input" name="p_goyongprice" size="10" maxlength="7" value="0"> 
            </td>
            <td class="table_01">������</td>
            <td class="table_02_2" width="33%" ><input type="text" class="input" name="p_wftest" size="10" maxlength="5" value="0"></td>
          </tr>
          <tr> 
            <td colspan="2" class="table_01">�������Ӽ�</td>
            <td class="table_02_2"><input type="text" class="input" name="p_framecnt" size="10" maxlength="10" value="0"></td>
            <td class="table_01">������</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_whtest" size="10" maxlength="5" value="0"></td>
          </tr>
          <tr> 
            <td colspan="2" class="table_01">������</td>
            <td class="table_02_2" width="27%"><input type="text" class="input" name="p_biyong" size="10" maxlength="7" value="0"></td>
            <td class="table_01">����Ʈ</td>
            <td class="table_02_2" width="33%" ><input type="text" class="input" name="p_wreport" size="10" maxlength="5" value="0"></td>
          </tr>
          <tr> 
            <td colspan="2" class="table_01">�н�����</td>
            <td class="table_02_2" width="27%"><input type="text" class="input" name="p_edudays" size="10" maxlength="5" value="0"></td>
            <td class="table_01">��Ƽ��Ƽ</td>
            <td class="table_02_2" width="33%" ><input type="text" class="input" name="p_wact" size="10" maxlength="5" value="0"></td>
          </tr>
          <tr> 
            <td colspan="2" class="table_01">����</td>
            <td class="table_02_2" width="27%"><input type="text" class="input" name="p_studentlimit" size="10" maxlength="5" value="0"></td>
            <td class="table_01">��Ÿ1</td>
            <td class="table_02_2" width="33%" ><input type="text" class="input" name="p_wetc1" size="10" maxlength="5" value="0"></td>
          </tr>
          <tr> 
            <td colspan="2" class="table_01">���翩��</td>
            <td class="table_02_2" ><select name="p_usebook"  class="inputpsearch">
                <option value='Y' <% if(box.getString("p_usebook").equals("Y") ||box.getString("p_usebook").equals("")) out.println(" selected");%>>Y</option>
                <option value='N' <% if(box.getString("p_usebook").equals("N")) out.println(" selected");%>>N</option>
              </select></td>
            <td class="table_01">��Ÿ2</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_wetc2" size="10" maxlength="5" value="0"></td>
          </tr>
          <tr> 
            <td height="36" colspan="2" class="table_01">�����</td>
            <td class="table_02_2" width="27%" ><input type="text" class="input" name="p_bookprice" size="10" maxlength="5" value="0"></td>
            <td colspan="4" rowspan="4" align="center" class="table_title">&nbsp;</td>
          </tr>
          <tr> 
            <td colspan="2" class="table_01">����ȸ��</td>
            <td class="table_02_2" width="27%"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="160"> �̸� : 
                    <input type="text" class="input" name="p_producernm" size="14" maxlength="13" value=""> 
                    <br>
                    �ڵ� : 
                    <input type="text" class="input" name="p_producer" size="14" maxlength="13" value="" readonly> 
                  </td>
                  <td><a href="javascript:searchProducer()"><img src="/images/admin/button/b_resarchbutt.gif" border="0"></a></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td colspan="2" class="table_01">����ȸ��</td>
            <td class="table_02_2" width="27%" > <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="160"> �̸� : 
                    <input type="text" class="input" name="p_ownernm" size="14" maxlength="13" value="" readonly> 
                    <br>
                    �ڵ� : 
                    <input type="text" class="input" name="p_owner" size="14" maxlength="13" value=""> 
                  </td>
                  <td><a href="javascript:searchOwner()"><img src="/images/admin/button/b_resarchbutt.gif" border="0"></a></td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td colspan="2" class="table_01">��������</td>
            <td class="table_02_2" width="27%" >
            <input name="p_crdate_view" id="p_crdate_view" type="text" class="datepicker_input1" size="10">
            </td>
          </tr>
        </table>
      <br>
      <!----------------- ���������� ��� ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
        <tr>
          <td width="16%" class="table_title"><b>�������</b></td>
          <td width="81%" class="table_02_2">
            <input name="p_edumans" type="text" class="input" size="118" maxlength="100">
          </td>
        </tr>
        <tr>
          <td class="table_title"><b>��������</b></td>
          <td class="table_02_2">
            <textarea name="p_intro" cols="100" rows="3"></textarea>
          </td>
        </tr>
        <tr>
          <td class="table_title"><b>��������</b></td>
          <td class="table_02_2">
            <textarea name="p_explain" cols="100" rows="5"></textarea>
          </td>
        </tr>
      </table>
      <!----------------- ���������� ��� �� ----------------->
      <br>
      <!----------------- ���, ����Ʈ ��ư ���� ----------------->
      <table width="11%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center"><a href="javascript:InsertSubject()"><img src="/images/admin/button/btn_apply.gif" border="0"></a>&nbsp;</td>
          <td align="center"><a href="javascript:goSubjectListPage()"><img src="/images/admin/button/btn_list.gif" border="0"></a>&nbsp;</td>
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
