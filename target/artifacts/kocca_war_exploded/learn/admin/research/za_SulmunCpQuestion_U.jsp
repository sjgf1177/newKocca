<%
//**********************************************************
//  1. 제      목: 설문 
//  2. 프로그램명: za_SulmunCpQuestion_U.java
//  3. 개      요: 업체설문 수정
//  4. 환      경: JDK 1.4
//  5. 버      젼: 1.0
//  6. 작      성: 이창훈 2005. 8. 30
//  7. 수      정: 
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
    String  v_grcode       = box.getString("p_grcode");          //교육주관
    String  v_distcode     = box.getString("p_distcode");        //문제분류
    String  v_subj         = box.getString("s_subjcourse");
    String  v_action       = box.getString("p_action");
    String  v_process      = box.getString("p_process");
	String  v_gubunnm      = "업체설문";

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
	
	//수정 삭제 가능인지 체크
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
<title>설문문제관리-수정</title>
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
  if (confirm("설문 문제를 삭제 하시겠습니까?")) {
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
    alert('설문문제명을  입력하십시요.');
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
	
	
     
	<!----------------- title 시작 ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/research/tit_pop_sulmunman.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
	        <!----------------- title 끝 ----------------->
     
     
     
     <br>
      <!----------------- 과정명 시작 ----------------->
      <table cellpadding="0" cellspacing="0" class="table1">
        <tr>
		  <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td valign="bottom" height="20" class=sub_title>
		  <%=v_gubunnm%> 문제 수정</td>
        </tr>
        <tr>
          <td height="3"></td>
        </tr>
      </table>
      <!----------------- 과정명 끝 ----------------->
      <!----------------- 문제등록 시작 ----------------->
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
          <td class="table_title">설문분류</td>
          <td class="table_02_1"><%=CodeConfigBean.getCodeGubunSelect (SulmunCpBean.DIST_CODE, "", 1, "p_distcode", dbox0.getString("d_distcode"), "", 0)%></td>
          <td class="table_title">대상</td>
          <td class="table_02_1">
          <input type="hidden" name="p_sultype"  value="1">
		  <SELECT name="p_apptarget">
            <option value=1 <%if(v_apptarget.equals("1")){out.println("selected");}%>>외주업체</option>
            <option value=2 <%if(v_apptarget.equals("2")){out.println("selected");}%>>AES입력</option>
          </SELECT> 
          </td>
		</tr>
		<tr>
          <td class="table_title">문제</td>
          <td class="table_02_1" valign="top" colspan="3">
            <textarea name="p_sultext" cols="60" rows="12" class="input"><%=dbox0.getString("d_sultext")%></textarea>
		  </td>
		</tr>
	   </table>

      <table cellspacing="1" cellpadding="5" class="table_out">
	    <input type="hidden" name="p_selmax6"  value="">
	    <input type="hidden" name="p_selcount6"  value="">	
		<tr>
		  <td colspan="4" class="table_title">보기</td>
		</tr>
<%  
    for (int k=1; k <= 7; k++) {
       if (v_sultype.equals("1") && list.size() >= k ){
         DataBox dbox = (DataBox)list.get(k-1);   
%>
        <tr>
          <td class="table_01"><%=String.valueOf(k)%>번</td>
          <td class="table_02_1">
             <input name="p_seltext6" type="text" class="input" size="60" value='<%=StringManager.replace(dbox.getString("d_seltext"), "`", "'")%>'>
			 <input type="hidden" name="p_selpoint6"  value="<%=dbox.getInt("d_selpoint")%>">
          </td>
          <td class="table_02_1"><%=dbox.getInt("d_selpoint")%>점</td>
        </tr>
<%
	   } else {
%>
        <tr>
          <td class="table_01"><%=String.valueOf(k)%>번</td>
          <td class="table_02_1">
             <input name="p_seltext6" type="text" class="input" size="60" value=''>
			 <input type="hidden" name="p_selpoint6"  value="<%=k%>">
          </td>
          <td class="table_02_1"><%=k%>점</td>
        </tr>
<%
      }
    }
%>
	  </table>
      </form>
      <!----------------- 문제등록 끝 ----------------->
      <!----------------- 등록 버튼 시작 ----------------->
      <table cellspacing="0" cellpadding="0" >
        <tr>
          <td><a href="javascript:UpdateQuestion();"><img src="/images/admin/button/btn_modify.gif" border="0"></a></td>
		  <td width=8></td>
          <td><a href="javascript:DeleteQuestion();"><img src="/images/admin/button/btn_del.gif" border="0"></a></td>
		  <td width=8></td>
          <td><a href="javascript:window.self.close();"><img src="/images/admin/button/btn_close.gif" border="0"></a></td>
        </tr>
      </table>
      <!----------------- 등록 버튼 끝 ----------------->
      <br>
    </td>
  </tr>

  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>     

</table>
</body>
</html>
