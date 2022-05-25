<%
//**********************************************************
//  1. ��      ��: �ڽ���� ȭ��-��Ÿ�׽�Ʈ�ý���
//  2. ���α׷���: za_BetaSubject_U.jsp
//  3. ��      ��: �ڽ���� ȭ��-��Ÿ�׽�Ʈ�ý���
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2004. 12. 27
//  7. ��      ��: 
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.beta.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    String  ss_subjcourse   = box.getStringDefault("s_subjcourse","ALL");    //����&�ڽ�
    String  v_search        = box.getString("p_search");    //�˻���
    BetaSubjectData data = (BetaSubjectData)request.getAttribute("SubjectData");
%>
<html>
<head>
<title>��������</title>
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
function UpdateSubject() {
    if(!chkData()) {
      return;
    }
  document.form2.p_process.value = 'update';
  document.form2.submit();
}
function DeleteSubject() {
  if (confirm("���������� ���� �Ͻðڽ��ϱ�?")) {
    document.form2.p_process.value = 'delete';
    document.form2.submit();
  }
}
function goSubjectListPage() {
  document.form2.p_process.value  = 'listPage';
  document.form2.submit();
}
function chkData() {
  if (!number_chk_noalert(document.form2.p_framecnt.value)) {
    alert('�������Ӽ��� �߸��ԷµǾ����ϴ�.');
    return false;
  }
  if (!number_chk_noalert(document.form2.p_edudays.value)) {
    alert('�н������� �߸��ԷµǾ����ϴ�.');
    return false;
  }
  if (!number_chk_noalert(document.form2.p_edulimit.value)) {
    alert('1���ִ��н����� �߸��ԷµǾ����ϴ�.');
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

// ���������� ȸ�� �˻� �� ó��
function searchBetaCompany() {
  var p_key1 = document.form2.p_betacompany.value;
  var p_key2 = 'p_betacompany';
  var url = "/servlet/controller.library.SearchServlet?p_process=betacompany&p_companynm&p_key1=&p_key2="+p_key2;
  open_window("",url,"0","0","100","100");
}


// ȸ�� ������ ó��
function receiveBetaComp(comp,compnm,userid,usernm,tmp1) {
    if (tmp1 == 'p_betacompany') {
        document.form2.p_betacompanyno.value = comp;
        document.form2.p_betacompany.value = compnm;
        document.form2.p_betauserid.value = userid;
        document.form2.p_betausernm.value = usernm;
    }
}
-->
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">

<form name="form2" method="post" action="/servlet/controller.beta.BetaSubjectServlet">
    <input type="hidden" name="p_process"      value="">
    <input type="hidden" name="s_subjcourse "  value="<%=ss_subjcourse %>">
    <input type="hidden" name="p_subj"         value="<%=data.getSubj()%>">
    <input type="hidden" name="p_crdate"       value="<%=data.getCrdate()%>">
    <input type="hidden" name="p_search"       value="<%=v_search%>">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
        <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/beta/b_title01.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
      <%=box.getString("p_warnmsg")%><br>
      <br>
	          <!-------------������ ����-------------------------->
 <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
            <td class=sub_title>����/����/�󼼺���(���̹�)</td>
        </tr>
        <tr> 
          <td height=6></td>
          <td height=6></td>
        </tr>
      </table> 
        <!--------------������ ��---------------------------->
      <!----------------- ���� ���/����/����/�󼼺��� (���̹�) ���� ----------------->
        <table cellspacing="1" cellpadding="5" class="table_out">
          <tr> 
            <td colspan="9" class="table_top_line"></td>
          </tr>
          <tr> 
            <td class="table_title" width="20%">�����ڵ�</td>
            <td class="table_02_2"  width="80%"><%=data.getSubj()%></td>
          </tr>
          <tr> 
            <td class="table_title" width="20%">������</td>
            <td class="table_02_2"  width="80%"><input type="text" class="input" name="p_subjnm" size="38" maxlength="100" value="<%=data.getSubjnm()%>"></td>
          </tr>
          <tr>
            <td class="table_title">������Ÿ��</td>
            <td class="table_02_2"><%=CodeConfigBean.getCodeGubunSelect ("0007", "", 1, "p_contenttype", data.getContenttype(), "", 0)%> </td>
          </tr>
          <tr> 
            <td class="table_title">���������</td>
            <td class="table_02_2"><input type="text" class="input" name="p_dir" size="38" maxlength="100" value="<%=data.getDir()%>"></td>            
          </tr>
          <tr>
            <td class="table_title">VOD���</td>
            <td class="table_02_2"><input type="text" class="input" name="p_vodurl" size="38" maxlength="100" value="<%=data.getVodurl()%>"></td>
          </tr>
          <tr> 
            <td class="table_title">�н�URL</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_eduurl" size="38" maxlength="100" value=""></td>
          </tr>
          <tr> 
            <td class="table_title">������URL</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_preurl" size="38" maxlength="100" value="<%=data.getPreurl()%>"></td>
          </tr>
          <tr> 
            <td class="table_title">1���ִ��н���</td>
            <td class="table_02_2" ><input type="text" class="input" name="p_edulimit" size="10" maxlength="5" value="<%=data.getEdulimit()%>"></td>
          </tr>
          <tr> 
            <td class="table_title">�������Ӽ�</td>
            <td class="table_02_2"><input type="text" class="input" name="p_framecnt" size="10" maxlength="10" value="<%=data.getFramecnt()%>"></td>
          </tr>
          <tr> 
            <td class="table_title">�н�����</td>
            <td class="table_02_2" width="27%"><input type="text" class="input" name="p_edudays" size="10" maxlength="5" value="<%=data.getEdudays()%>"></td>
          </tr>
          <tr> 
            <td height="31" class="table_title">��뿩��</td>
            <td class="table_02_2" width="27%" > <select name="p_isuse"  class="inputpsearch">
                <option value='Y' <% if(data.getIsuse().equals("Y") ||data.getIsuse().equals("")) out.println(" selected");%>>Y</option>
                <option value='N' <% if(data.getIsuse().equals("N") ||data.getIsuse().equals("")) out.println(" selected");%>>N</option>
              </select> 
          </tr>
          <!--tr> 
            <td class="table_title">���������</td>
            <td class="table_02_2" width="27%"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="160"> ��&nbsp;&nbsp;&nbsp;��:&nbsp; <input name="p_cuseridnm" type="text" class="input" size="14" maxlength=13 value="<%=data.getCuseridnm()%>"> 
                    <br>
                    ���̵�:&nbsp; <input name="p_cuserid" type="text" class="input" size="14" maxlength=13 value="<%=data.getCuserid()%>" readonly> 
                  </td>
                  <td><a href="javascript:searchCuser()"><img src="/images/admin/course/search2_butt.gif" width="37" height="18" border="0"></a></td>
                </tr>
              </table>
            </td>
          </tr>
          <tr> 
            <td class="table_title">����ȸ��</td>
            <td class="table_02_2" width="27%">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                        <td width="160"> �̸� : 
                        <input type="text" class="input" name="p_producernm" size="14" maxlength="13" value="<%=data.getProducernm()%>"> 
                        <br>
                        �ڵ� : 
                        <input type="text" class="input" name="p_producer" size="14" maxlength="13" value="<%=data.getProducer()%>" readonly> 
                        </td>
                        <td><a href="javascript:searchProducer()"><img src="/images/admin/course/search2_butt.gif" width="37" height="18" border="0"></a></td>
                    </tr>
                </table>
            </td>
          </tr-->
          <!--------------������ ����ȸ��/����� ��ȸ/����------------------>
          <tr> 
            <td class="table_title">����ȸ��</td>
            <td class="table_02_2" width="27%">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                        <td width="200"> ȸ�� : 
                        <input type="text" class="input" name="p_betacompany" size="14" maxlength="13" value="<%=data.getCompanynm()%>"> 
                        <br>
                        �ڵ� : 
                        <input type="text" class="input" name="p_betacompanyno" size="14" maxlength="13" value="<%=data.getCompany()%>" readonly>
                        <br>
                        ����� ID :
                        <input type="text" class="input" name="p_betauserid" size="10" maxlength="10" value="<%=data.getCuserid()%>" readonly>
                        <br>
                        ����ڼ��� :
                        <input type="text" class="input" name="p_betausernm" size="10" maxlength="10" value="<%=data.getCuseridnm()%>" readonly>
                        </td>
                        <td><a href="javascript:searchBetaCompany()"><img src="/images/admin/button/btn_inquiry.gif" border="0"></a></td>
                    </tr>
                </table>
            </td>
          </tr>
          <!--------------������ ����ȸ��/����� ���� ��-------------------->
          <tr> 
            <td class="table_title">��������</td>
            <td class="table_02_2" width="27%" >
            <input name="p_crdate_view" id="p_crdate_view" type="text" class="datepicker_input1" size="10" value="<%=FormatDate.getFormatDate(data.getCrdate(),"yyyy-MM-dd")%>">
            </td>
          </tr>
        </table>
      <br>
      <br>
      <!----------------- ���, ����Ʈ ��ư ���� ----------------->
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="center"><a href="javascript:javascript:UpdateSubject()"><img src="/images/admin/button/btn_apply.gif" border="0"></a></td>
		  <td width=8></td>
          <td align="center"><a href="javascript:goSubjectListPage()"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
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
