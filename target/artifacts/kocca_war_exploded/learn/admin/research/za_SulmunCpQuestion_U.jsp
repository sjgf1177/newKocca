<%
//**********************************************************
//  1. ��      ��: ���� 
//  2. ���α׷���: za_SulmunCpQuestion_U.java
//  3. ��      ��: ��ü���� ����
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ��â�� 2005. 8. 30
//  7. ��      ��: 
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.research.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

	String v_end = box.getString("p_end");
	String v_onload = "";
	if(v_end.equals("0")) { v_onload = "onload='javascript:onload();'"; }
%>
<%
    String  v_gubun        = box.getStringDefault("p_gubun", SulmunCpBean.DEFAULT_SUBJ);
    String  v_grcode       = box.getString("p_grcode");          //�����ְ�
    String  v_distcode     = box.getString("p_distcode");        //�����з�
    String  v_subj         = box.getString("s_subjcourse");
    String  v_action       = box.getString("p_action");
    String  v_process      = box.getString("p_process");
	String  v_gubunnm      = "��ü����";

    ArrayList  list = (ArrayList)request.getAttribute("SulmunQuestionExampleData");
    DataBox dbox0 = (DataBox)list.get(0);
	int v_sulnum = dbox0.getInt("d_sulnum");
	int v_scalecode = dbox0.getInt("d_scalecode");
	String v_sultype = dbox0.getString("d_sultype");
	String v_apptarget = dbox0.getString("d_apptarget");
	//out.println("v_apptarget==>>"+v_apptarget);
	
    //ArrayList  list1 = (ArrayList)request.getAttribute("ScaleQuestionExampleData");

    String v_reloadlist = box.getString("p_reloadlist");

	String table1 = "";
	String table2 = "";
	String table3 = "";
	String table4 = "";
	String table5 = "";
	String table6 = "";
	//out.println("v_sultype=="+v_sultype);
	
	//���� ���� �������� üũ
	OverLapBean olbean = new OverLapBean();
	TextComBean tcbean = new TextComBean();
	
	String errvalue1 = olbean.isExitSulPaper(v_grcode,v_gubun,v_sulnum);
	String errvalue2 = olbean.isExitSulEach(v_grcode,v_gubun,v_sulnum);
	
	String errmsg1 = tcbean.isSulmunGetErrtxt(errvalue1);
	String errmsg2 = tcbean.isSulmunGetErrtxt(errvalue2);
	
	//out.println("errvalue1=====>>>"+errvalue1);
	//out.println("errvalue2=====>>>"+errvalue2);
%>

<html>
<head>
<title>������������-����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<script language="JavaScript">
<!--
function InsertQuestion() {
  ActionPage('SulmunQuestionInsert');
}
function UpdateQuestion() {
  if('<%=errvalue2%>' != '0'){
    alert("<%=errmsg2%>\n\n<%=tcbean.getScriptMsg("update.fail")%>");
    return;
  }
  ActionPage('SulmunQuestionUpdate');
}
function DeleteQuestion() {
  if('<%=errvalue1%>' != '0'){
    alert("<%=errmsg1%>\n\n<%=tcbean.getScriptMsg("update.fail")%>");
    return;
  }
  if('<%=errvalue2%>' != '0'){
    alert("<%=errmsg2%>\n\n<%=tcbean.getScriptMsg("update.fail")%>");
    return;
  }
  if (confirm("���� ������ ���� �Ͻðڽ��ϱ�?")) {
    ActionPage('SulmunQuestionDelete');
  }
}
function ActionPage(p_process) {
	  if(!chkData()) {
         return;
      }
  document.form2.p_process.value = p_process;
  document.form2.p_reloadlist.value = 'true';
  document.form2.submit();
}
function chkData() {
  if (blankCheck(document.form2.p_sultext.value)) {
    document.form2.p_sultext.focus();
    alert('������������  �Է��Ͻʽÿ�.');
    return false;
  }

  var v_selcount = 0;
  var v_seltextcnt = 0;
  
  return true;
}

<% if (v_reloadlist.equals("true")) { %>
opener.ReloadPage('go');
<% } %>
function onload() {
  window.self.close();
}
function changeScale(flag) {

  if(flag == 1){
  var v_scalecode = document.form2.p_scalecode5.options[document.form2.p_scalecode5.selectedIndex].value;
  }else{
  var v_scalecode = document.form2.p_scalecode6.options[document.form2.p_scalecode6.selectedIndex].value;
  }

  if(v_scalecode > 0){
	    document.form2.target = "openWinQuestion";
		document.form2.action = "/servlet/controller.research.SulmunCPQuestionServlet";
		document.form2.p_process.value = "SulmunQuestionUpdateS";
		document.form2.p_scalecode.value = v_scalecode;
		document.form2.submit();
   }
  }
-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0" <%=v_onload%>>

<table width="667" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
	
	
     
	<!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/research/tit_pop_sulmunman.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
	        <!----------------- title �� ----------------->
     
     
     
     <br>
      <!----------------- ������ ���� ----------------->
      <table cellpadding="0" cellspacing="0" class="table1">
        <tr>
		  <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td valign="bottom" height="20" class=sub_title>
		  <%=v_gubunnm%> ���� ����</td>
        </tr>
        <tr>
          <td height="3"></td>
        </tr>
      </table>
      <!----------------- ������ �� ----------------->
      <!----------------- ������� ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
      <form name="form2" method="post" action="/servlet/controller.research.SulmunCPQuestionServlet">
        <input type="hidden" name="p_process" value="<%=v_process%>">
        <input type="hidden" name="p_action"  value="<%=v_action%>">
        <input type="hidden" name="p_gubun"   value="<%=v_gubun%>">
        <input type="hidden" name="p_subj"    value="<%=v_subj%>">
        <input type="hidden" name="p_grcode"  value="<%=v_grcode%>">
		<input type="hidden" name="p_sulnum"  value="<%=v_sulnum%>">
        <input type="hidden" name="p_scalecode"  value="<%=v_scalecode%>">
		<input type="hidden" name="p_reloadlist"  value="">
        <tr>
          <td colspan="4" class="table_top_line"></td>
        </tr>

		<tr>
          <td class="table_title">�����з�</td>
          <td class="table_02_1"><%=CodeConfigBean.getCodeGubunSelect (SulmunCpBean.DIST_CODE, "", 1, "p_distcode", dbox0.getString("d_distcode"), "", 0)%></td>
          <td class="table_title">���</td>
          <td class="table_02_1">
          <input type="hidden" name="p_sultype"  value="1">
		  <SELECT name="p_apptarget">
            <option value=1 <%if(v_apptarget.equals("1")){out.println("selected");}%>>���־�ü</option>
            <option value=2 <%if(v_apptarget.equals("2")){out.println("selected");}%>>AES�Է�</option>
          </SELECT> 
          </td>
		</tr>
		<tr>
          <td class="table_title">����</td>
          <td class="table_02_1" valign="top" colspan="3">
            <textarea name="p_sultext" cols="60" rows="12" class="input"><%=dbox0.getString("d_sultext")%></textarea>
		  </td>
		</tr>
	   </table>

      <table cellspacing="1" cellpadding="5" class="table_out">
	    <input type="hidden" name="p_selmax6"  value="">
	    <input type="hidden" name="p_selcount6"  value="">	
		<tr>
		  <td colspan="4" class="table_title">����</td>
		</tr>
<%  
    for (int k=1; k <= 7; k++) {
       if (v_sultype.equals("1") && list.size() >= k ){
         DataBox dbox = (DataBox)list.get(k-1);   
%>
        <tr>
          <td class="table_01"><%=String.valueOf(k)%>��</td>
          <td class="table_02_1">
             <input name="p_seltext6" type="text" class="input" size="60" value='<%=StringManager.replace(dbox.getString("d_seltext"), "`", "'")%>'>
			 <input type="hidden" name="p_selpoint6"  value="<%=dbox.getInt("d_selpoint")%>">
          </td>
          <td class="table_02_1"><%=dbox.getInt("d_selpoint")%>��</td>
        </tr>
<%
	   } else {
%>
        <tr>
          <td class="table_01"><%=String.valueOf(k)%>��</td>
          <td class="table_02_1">
             <input name="p_seltext6" type="text" class="input" size="60" value=''>
			 <input type="hidden" name="p_selpoint6"  value="<%=k%>">
          </td>
          <td class="table_02_1"><%=k%>��</td>
        </tr>
<%
      }
    }
%>
	  </table>
      </form>
      <!----------------- ������� �� ----------------->
      <!----------------- ��� ��ư ���� ----------------->
      <table cellspacing="0" cellpadding="0" >
        <tr>
          <td><a href="javascript:UpdateQuestion();"><img src="/images/admin/button/btn_modify.gif" border="0"></a></td>
		  <td width=8></td>
          <td><a href="javascript:DeleteQuestion();"><img src="/images/admin/button/btn_del.gif" border="0"></a></td>
		  <td width=8></td>
          <td><a href="javascript:window.self.close();"><img src="/images/admin/button/btn_close.gif" border="0"></a></td>
        </tr>
      </table>
      <!----------------- ��� ��ư �� ----------------->
      <br>
    </td>
  </tr>

  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>     

</table>
</body>
</html>
