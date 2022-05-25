<%
/**
 * file name : za_DamunSubjOBMember_I.jsp
 * date      : 2003/09/25
 * programmer:
 * function  : �ٸ��� ����� ���κ� ���
 */
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.multiestimate.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

	String v_end = box.getString("p_end");
	String v_onload = "";
	if(v_end.equals("0")) { v_onload = "onload='javascript:onload();'"; }

    String  v_subjnm    = box.getString("p_subjnm");

    String  v_subjuserid    = box.getString("p_subjuserid");

    String  v_asgnnm    = box.getString("p_asgnnm");
    String  v_jikupnm    = box.getString("p_jikupnm");
    String  v_cono    = box.getString("p_cono");
    String  v_name    = box.getString("p_name");

    String  ss_upperclass  = box.getStringDefault("s_upperclass","ALL");
    String  ss_middleclass = box.getStringDefault("s_middleclass","ALL");
    String  ss_lowerclass  = box.getStringDefault("s_lowerclass","ALL");
    String  ss_subjcourse  = box.getStringDefault("s_subjcourse","ALL");

    String  ss_grcode       = box.getString("s_grcode");
	String  ss_gyear       = box.getString("s_gyear");
	int  ss_damunpapernum       = box.getInt("s_damunpapernum");
    String  ss_subjseq    = box.getString("s_subjseq");
	
    String  v_action     = box.getString("p_action");
    String  v_process = box.getString("p_process");

    String  ss_searchtype = box.getString("s_searchtype");
    String  ss_searchtext = box.getString("s_searchtext");

	
    String v_reloadlist = box.getString("p_reloadlist");    
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<script language="JavaScript">
<!--
function MemberSearch(p_action) {
  if (p_action == 'go') {
    if (chkData() == false) {
      return; 
    }
  }
  document.form2.p_process.value = 'MemberSubjOBListPage';
  document.form2.p_action.value  = p_action;
  document.form2.submit();
}
function chkData() {
  if (blankCheck(document.form2.s_searchtext.value)) {
    alert('�˻�� �Է��Ͻʽÿ�.');
    document.form2.s_searchtext.focus();
    return false;
  }
}
function InsertDamunSubjMember() {

  var chkselected = chkSelected();
  if (chkselected < 1) {
    alert('����ڸ� �����ϼ���');
    return;
  }

  document.form2.p_process.value = 'DamunOBMemberInsert';
    document.form2.p_reloadlist.value = 'true';
  document.form2.p_action.value  = 'insert';
  document.form2.submit();
}
function chkSelected() {
  var selectedcnt = 0;
  if(document.form2.all['p_checks'] == '[object]') {
    if (document.form2.p_checks.length > 0) {
      for (i=0; i<document.form2.p_checks.length; i++) {
        if (document.form2.p_checks[i].checked == true) {
	      selectedcnt++;
	    }  
      }
    } else {
      if (document.form2.p_checks.checked == true) {
	    selectedcnt++;
      }
    }
  }
  return selectedcnt; 
}
function whenSelection(p_action) {
  document.form2.p_process.value = 'MemberSubjOBListPage';
  document.form2.p_action.value  = p_action;
  document.form2.submit();
}
<% if (v_reloadlist.equals("true")) { %>
opener.ReloadPage();
<% } %>
function onload() {
  window.self.close();
}
-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0" <%=v_onload%>>
<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/multiestimate/m_title03.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title �� ----------------->
	    <br>
	    <!----------------- ����, ����, ���۽ð�, ����, �ҿ�ð� ���� ----------------->
	    <table cellspacing="0" cellpadding="3" class="open_form_table_out">
      <form name="form2" method="post" action="/servlet/controller.multiestimate.DamunSubjMemberServlet">
        <input type="hidden" name="p_process" value="">
        <input type="hidden" name="p_action"  value="">
        <input type="hidden" name="s_subjuserid"       value="<%=v_subjuserid%>">
        <input type="hidden" name="s_grcode"       value="<%=ss_grcode%>">
        <input type="hidden" name="s_subj"       value="<%=ss_subjcourse%>">
        <input type="hidden" name="s_subjcourse"       value="<%=ss_subjcourse%>">
        <input type="hidden" name="s_gyear"       value="<%=ss_gyear%>">
        <input type="hidden" name="s_subjseq"    value="<%=ss_subjseq%>">
        <input type="hidden" name="s_upperclass"       value="<%=ss_upperclass%>">
        <input type="hidden" name="s_damunpapernum"       value="<%=ss_damunpapernum%>">
        <input type="hidden" name="p_subjuserid"       value="<%=v_subjuserid%>">
		<input type="hidden" name="p_grcode"       value="<%=ss_grcode%>">
        <input type="hidden" name="p_subj"       value="<%=ss_subjcourse%>">
        <input type="hidden" name="p_gyear"       value="<%=ss_gyear%>">
        <input type="hidden" name="p_subjseq"    value="<%=ss_subjseq%>">
        <input type="hidden" name="p_upperclass"       value="<%=ss_upperclass%>">
        <input type="hidden" name="p_damunpapernum"       value="<%=ss_damunpapernum%>">
		<input type="hidden" name="p_asgnnm"     value="<%=v_asgnnm%>">
		<input type="hidden" name="p_jikupnm"     value="<%=v_jikupnm%>">
		<input type="hidden" name="p_cono"     value="<%=v_cono%>">
		<input type="hidden" name="p_name"     value="<%=v_name%>">
        <input type="hidden" name="p_reloadlist" value="">

	      <tr> 
	        <td bgcolor="#C6C6C6" align="center"> 
	          <table cellspacing="0" cellpadding="0" class="open_form_table_bg">
              <tr> 
                <td height="7"></td>
              </tr>
              <tr> 
                <td align="center"> 
                  <table class="form_table" cellspacing="0" cellpadding="0" width="99%">
                    <tr> 
                      <td>
                      ȸ�� <%= SelectCompBean.getCompany(box, true, true)%>&nbsp;<% //-- getCompany(RequestBox, isChange, isALL) ---%>
                      ���� <%= SelectCompBean.getGpm(box, true, true)%>&nbsp;<% //-- getGpm(RequestBox, isChange, isALL) ---%>
                      �μ� <%= SelectCompBean.getDept(box, true, true)%>&nbsp;<% //-- getDept(RequestBox, isChange, isALL) ---%>
                      �� <%= SelectCompBean.getPart(box, false, true)%>&nbsp;<% //-- getPart(RequestBox, isChange, isALL) ---%>
                      ���� <%= SelectCompBean.getJikwi(box, false, true)%>&nbsp;<% //-- getJikwi(RequestBox, isChange, isALL) ---%>
		      <%@ include file="/learn/admin/include/za_GoButton.jsp" %>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td height="7"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <!----------------- ����, ����, ���۽ð�, ����, �ҿ�ð� �� ----------------->
      <br>
      <!----------------- �з� ���� ----------------->
      <table width="98%" cellpadding="0" cellspacing="0" class="table1">
        <tr> 
          <td width="85"> �з� 
            <select name="s_searchtype" class="input">
              <option value="1" <% if (ss_searchtype.equals("1")) { %>selected<% } %>>���</option>
              <option value="3" <% if (ss_searchtype.equals("3")) { %>selected<% } %>>����</option>
            </select>
          </td>
          <td width="138"> 
            <input name="s_searchtext" type="text" class="input" value="<%=ss_searchtext%>">
          </td>
          <td valign="middle"><a href="javascript:MemberSearch('go')" class="c"><img src="/images/admin/multiestimate/search3_butt.gif" width="58" height="18" border="0"></a></td>
        </tr>
        <tr> 
          <td height="7"></td>
        </tr>
      </table>
      <!----------------- �з� �� ----------------->
      <!----------------- ���κ� ��� ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="open_table_out">
        <tr> 
          <td colspan="7" class="table_top_line"></td>
        </tr>
        <tr> 
          <td class="table_title_01">�Ҽ�</td>
          <td class="table_title_01">����</td>
          <td class="table_title_01">ID</td>
          <td class="table_title_01">���</td>
          <td class="table_title_01">����</td>
          <td class="table_title_01">�з�</td>
          <td class="table_title_01">���</td>
        </tr>
<%  
       if(!v_process.equals("DamunOBMemberInsertPage")){
         ArrayList list = (ArrayList)request.getAttribute("MemberSubjList");
            for (int i=0; i<list.size(); i++) {
                DataBox dbox  = (DataBox)list.get(i); %>
        <tr>
          <td class="table_02_1"><%=dbox.getString("d_asgnnm")%></td>
          <td class="table_02_1"><%=dbox.getString("d_jikwinm")%></td>
          <td class="table_02_1"><%=dbox.getString("d_cono")%></td>
          <td class="table_02_1"><%=dbox.getString("d_userid")%></td>
          <td class="table_02_1"><%=dbox.getString("d_name")%></td>
          <td class="table_02_1">
		  <SELECT name="p_relation"> 
            <option value=1>���</option> 
            <option value=2>����</option> 
            <option value=3>����</option> 
          </SELECT> 	  
		  </td>
          <td class="table_02_1">
            <input type="checkbox" name="p_checks" value="<%=dbox.getString("d_userid")%>">
          </td>
        </tr>
<%      }
	  }
%>
       </form>   
      </table>
      <!----------------- ���κ� ��� �� ----------------->
      <!----------------- ���, �ݱ� ��ư ���� ----------------->
      <table cellspacing="0" cellpadding="0" class="table1">
        <tr> 
          <td align="right" style="padding-top=10"><a href="javascript:InsertDamunSubjMember('')"><img src="/images/admin/multiestimate/record1_butt.gif" width="37" height="18" border="0"></a></td>
        </tr>
      </table>
      <!----------------- ���, �ݱ� ��ư �� ----------------->
      <br>
    </td>
  </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
