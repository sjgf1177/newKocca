<%
/**
 * file name : za_Scale_I.jsp
 * date      : 2003/08/20
 * programmer:
 * function  : 설문 문항관리 - 디테일페이지
 */
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

	String  v_scaletype  = box.getStringDefault("p_scaletype",ScaleBean.DEFAULT_TYPE);

    String  v_grcode    = box.getString("p_grcode");        //교육주관
	
//    ScaleQuestionExampleData  data = (ScaleQuestionExampleData)request.getAttribute("ScaleQuestionExampleData");
   
    String v_reloadlist = box.getString("p_reloadlist");

%>
<html>
<head>
<title>척도 관리-등록</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<script language="JavaScript">
<!--
function scaleview() {
        document.form2.target = "openWinScale";
		document.form2.action = "/servlet/controller.research.ScaleServlet";
		document.form2.p_process.value = "ScaleListPage";
		document.form2.submit();
}
function InsertScale() {
  ActionPage('ScaleInsert');
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
  if (blankCheck(document.form2.p_scalename.value)) {
    document.form2.p_scalename.focus();
    alert('척도명을  입력하십시요.');
    return false;
  }

  var v_sgubun = document.form2.p_sgubun.options[document.form2.p_sgubun.selectedIndex].value;

  var v_seltextcnt1 = 0;
  var v_seltextcnt2 = 0;

  if (v_sgubun == "5"){
    for (k=0; k<5; k++) {
      if (!blankCheck(document.form2.p_seltext1[k].value)) {
        v_seltextcnt1++;
      }
    }
    if (v_seltextcnt1 < 5) {
      alert('척도 보기를  입력하십시요.');
      return false;
     }
    for (k=0; k<5; k++) {
      if (!blankCheck(document.form2.p_selpoint1[k].value)) {
        v_seltextcnt2++;
      }
    }
    if (v_seltextcnt2 < 5) {
      alert('척도 점수를  입력하십시요.');
      return false;
     }	 
  } else if (v_sgubun == "7") {
    for (k=0; k<7; k++) {
      if (!blankCheck(document.form2.p_seltext2[k].value)) {
        v_seltextcnt1++;
      }
    }
    if (v_seltextcnt1 < 7) {
      alert('척도 보기를  입력하십시요.');
      return false;
     }
    for (k=0; k<7; k++) {
      if (!blankCheck(document.form2.p_selpoint2[k].value)) {
        v_seltextcnt2++;
      }
    }
    if (v_seltextcnt2 < 7) {
      alert('척도 점수를  입력하십시요.');
      return false;
     }	 
  }

  return true;
}


<% if (v_reloadlist.equals("true")) { %>
//this.ReloadPage('go');
<% } %>
-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<table width="667" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top"> 
      <!----------------- title 시작 ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/research/tit_pop_sulmun.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title 끝 ----------------->
      <br>
	          <!-------------소제목 시작-------------------------->
 <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>등록</td>
        </tr>
        <tr> 
          <td height=6></td>
          <td height=6></td>
        </tr>
      </table> 
        <!--------------소제목 끝---------------------------->
      <!----------------- 문제등록 시작 ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
      <form name="form2" method="post" action="/servlet/controller.research.ScaleServlet">
        <input type="hidden" name="p_process" value="">
        <input type="hidden" name="p_scaletype"    value="<%=v_scaletype%>">
        <input type="hidden" name="p_grcode"  value="<%=v_grcode%>">
        <input type="hidden" name="p_reloadlist"  value="">
        <tr>
          <td colspan="4" class="table_top_line"></td>
        </tr>
<script language="JavaScript">
<!--
function display() {
    
	var v_sgubun = document.form2.p_sgubun.options[document.form2.p_sgubun.selectedIndex].value;
	if(v_sgubun=="5"){ 
		sgubun1.style.display="";
        sgubun2.style.display="none";
    }else if(v_sgubun=="7"){ 
		sgubun1.style.display="none";
        sgubun2.style.display="";
    }
}
-->
</script>
		<tr>
          <td class="table_title">척도분류</td>
          <td class="table_02_1" colspan="3">
		  <SELECT name="p_sgubun" onchange="display();"> 
            <option value=5 checked>5점척도</option> 
            <option value=7>7점척도</option> 
          </SELECT> 
          </td>
		</tr>
		<tr>
          <td class="table_title">문제</td>
          <td class="table_02_1" valign="top" colspan="3">
            <textarea name="p_scalename" cols="60" rows="2" class="input"></textarea>
		  </td>
	   </table>

      <table cellspacing="1" cellpadding="5" class="table_out" ID="sgubun1" STYLE="display:">
		<tr>
		  <td class="table_title">No.</td>
		  <td class="table_title">보기</td>
		  <td class="table_title">점수</td>
		</tr>
        <tr>
          <td class="table_01">1번</td>
          <td class="table_02_1">
             <input name="p_seltext1" type="text" class="input" size="60" value="">
          </td>
          <td class="table_02_1">
             <input name="p_selpoint1" type="text" class="input" size="3" value="">점
          </td>
        </tr>
        <tr>
          <td class="table_01">2번</td>
          <td class="table_02_1">
             <input name="p_seltext1" type="text" class="input" size="60" value="">
          </td>
          <td class="table_02_1">
             <input name="p_selpoint1" type="text" class="input" size="3" value="">점
          </td>
        </tr>
        <tr>
          <td class="table_01">3번</td>
          <td class="table_02_1">
             <input name="p_seltext1" type="text" class="input" size="60" value="">
          </td>
          <td class="table_02_1">
             <input name="p_selpoint1" type="text" class="input" size="3" value="">점
          </td>
        </tr>
        <tr>
          <td class="table_01">4번</td>
          <td class="table_02_1">
             <input name="p_seltext1" type="text" class="input" size="60" value="">
          </td>
          <td class="table_02_1">
             <input name="p_selpoint1" type="text" class="input" size="3" value="">점
          </td>
        </tr>
        <tr>
          <td class="table_01">5번</td>
          <td class="table_02_1">
             <input name="p_seltext1" type="text" class="input" size="60" value="">
          </td>
          <td class="table_02_1">
             <input name="p_selpoint1" type="text" class="input" size="3" value="">점
          </td>
        </tr>
	  </table>
      <table cellspacing="1" cellpadding="5" class="table_out" ID="sgubun2" STYLE="display:none">
		<tr>
		  <td class="table_title">No.</td>
		  <td class="table_title">보기</td>
		  <td class="table_title">점수</td>
		</tr>
        <tr>
          <td class="table_01">1번</td>
          <td class="table_02_1">
             <input name="p_seltext2" type="text" class="input" size="60" value="">
          </td>
          <td class="table_02_1">
             <input name="p_selpoint2" type="text" class="input" size="3" value="">점
          </td>
        </tr>
        <tr>
          <td class="table_01">2번</td>
          <td class="table_02_1">
             <input name="p_seltext2" type="text" class="input" size="60" value="">
          </td>
          <td class="table_02_1">
             <input name="p_selpoint2" type="text" class="input" size="3" value="">점
          </td>
        </tr>
        <tr>
          <td class="table_01">3번</td>
          <td class="table_02_1">
             <input name="p_seltext2" type="text" class="input" size="60" value="">
          </td>
          <td class="table_02_1">
             <input name="p_selpoint2" type="text" class="input" size="3" value="">점
          </td>
        </tr>
        <tr>
          <td class="table_01">4번</td>
          <td class="table_02_1">
             <input name="p_seltext2" type="text" class="input" size="60" value="">
          </td>
          <td class="table_02_1">
             <input name="p_selpoint2" type="text" class="input" size="3" value="">점
          </td>
        </tr>
        <tr>
          <td class="table_01">5번</td>
          <td class="table_02_1">
             <input name="p_seltext2" type="text" class="input" size="60" value="">
          </td>
          <td class="table_02_1">
             <input name="p_selpoint2" type="text" class="input" size="3" value="">점
          </td>
        </tr>
        <tr>
          <td class="table_01">6번</td>
          <td class="table_02_1">
             <input name="p_seltext2" type="text" class="input" size="60" value="">
          </td>
          <td class="table_02_1">
             <input name="p_selpoint2" type="text" class="input" size="3" value="">점
          </td>
        </tr>
        <tr>
          <td class="table_01">7번</td>
          <td class="table_02_1">
             <input name="p_seltext2" type="text" class="input" size="60" value="">
          </td>
          <td class="table_02_1">
             <input name="p_selpoint2" type="text" class="input" size="3" value="">점
          </td>
        </tr>
	  </table>

      </form>
	  <!----------------- 문제등록 끝 ----------------->
      <!----------------- 등록 버튼 시작 ----------------->
      <table cellspacing="0" cellpadding="0" >
        <tr>
          <td align="right" style="padding-top=10"><a href="javascript:InsertScale()"><img src="/images/admin/button/btn_apply.gif" border="0"></a></td>
		  <td width=8></td>
          <td align="right" style="padding-top=10"><a href="javascript:scaleview()"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
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
