<%
/**
 * file name : za_KnowCode_I.jsp
 * date      : 2005/9/01
 * programmer:
 * function  : 지식공유분류코드 등록화면
 */
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.homepage.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    String  v_grcode   = box.getString("p_grcode");    
    
    String  v_classtype   = box.getStringDefault("p_classtype",  "upper");
    String  v_upperclass  = box.getStringDefault("p_upperclass", "A01");
    String  v_middleclass = box.getStringDefault("p_middleclass","001");
    String  v_classcode   = box.getString("p_classcode");
    String  v_classname   = box.getString("p_classname");

    String v_reloadlist = box.getString("p_reloadlist");  // opener reload
	String v_end = box.getString("p_end");
	String v_onload = "";
	if(v_end.equals("0")) { v_onload = "onload='javascript:onload();'"; }    
%>
<html>
<head><title>지식공유분류코드</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language="javascript">
<!--
  // 창닫음
  function onload() {
    window.self.close();
  }

  function  whenInsert(){

    if(document.form1.p_classtype.value == "upper") {
        //분류코드는 3자리이어야 하며 소문자는 대문자로 변경한다.
        if (document.form1.p_classcode.value=="") {
            alert("분류코드를 입력하세요.");
            document.form1.p_classcode.focus();
            return;
        }
        
        if (document.form1.p_classcode.value.length!=3) {
            alert("분류코드는 3자리만 입력가능합니다.");
            document.form1.p_classcode.focus();
            return;
        }
        
        //영문/숫자 체크
        var v_pattern = /[^(a-zA-Z0-9)]/;
        if (v_pattern.test(document.form1.p_classcode.value)) {
            alert("분류코드는 영문과 숫자만 입력가능합니다.");
            document.form1.p_classcode.focus();
            return;
        }
    }
    
    if (document.form1.p_classname.value=="") {
        alert("분류명칭을 입력하세요.");
        document.form1.p_classname.focus();
        return;
    }
    
    //대문자로 변경
    document.form1.p_classcode.value = document.form1.p_classcode.value.toUpperCase();
    document.form1.p_process.value = "insert";
    document.form1.p_reloadlist.value = 'true';
    document.form1.submit();
    
  }
  
  function whenSelection() {
    document.form1.p_process.value = "insertPage";
    document.form1.submit();
  }
  
  function viewSubjectClass(p_upperlay, p_middlelay, p_type) {
        if (p_type == 'upper') {
            document.all[p_upperlay].style.visibility  = "hidden";
            document.all[p_middlelay].style.visibility = "hidden";
            document.all["iscode"].style.visibility = "visible";            
        } else if (p_type == 'middle') {
            document.all[p_upperlay].style.visibility  = "visible";
            document.all[p_middlelay].style.visibility = "hidden";
            document.all["iscode"].style.visibility = "hidden";
        } //else if (p_type == 'lower') {
          //  document.all[p_upperlay].style.visibility  = "visible";
          //  document.all[p_middlelay].style.visibility = "visible";
          //  document.all["iscode"].style.visibility = "hidden";            
        //}
  }

<% if (v_reloadlist.equals("true")) { %>
opener.ReloadPage('go');
<% } %>  
-->
</script>
</head>
<body topmargin="0" leftmargin="0" bgcolor="#ffffff"  <%=v_onload%>>
<table width="552" height="337" border="0" cellpadding="0" cellspacing="10" bgcolor="#f7f7f7">
  <tr>
    <td height="251" valign=top>
      <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#cccccc">
        <tr>
          <td align="center" bgcolor="#FFFFFF">
            <!----------------- title 시작 ----------------->
              <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
                <tr> 
                  <td><img src="/images/admin/homepage/tit_knowcode.gif"></td>
                  <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
                </tr>
              </table>
          <!----------------- title 끝 ----------------->
            <br>
            <!----------------- 분류 등록 시작 ----------------->
            <table cellspacing="1" cellpadding="5" class="table_out">
            <form name="form1" method="post" action="/servlet/controller.homepage.KnowBoardServlet">
              <input type="hidden" name="p_process"     value="">
              <input type="hidden" name="p_grcode"  value="<%=v_grcode%>">       
              <input type="hidden" name="p_reloadlist" value="">              
              <tr>
                <td class="table_top_line"></td>
              </tr>
              <tr>
                <td width="8%" height="26" class="table_02_1">* 등록 코드타입<br>
                  <input type="radio" name="p_classtype" value="upper" <%=(v_classtype.equals("upper") ? "checked" : "")%> onClick="viewSubjectClass('upperclasslay', 'middleclasslay', 'upper')">
                  대분류코드
                  <input type="radio" name="p_classtype" value="middle" <%=(v_classtype.equals("middle") ? "checked" : "")%> onClick="viewSubjectClass('upperclasslay', 'middleclasslay', 'middle')">
                  소분류코드
                  <!--input type="radio" name="p_classtype" value="lower" <%=(v_classtype.equals("lower") ? "checked" : "")%> onClick="viewSubjectClass('upperclasslay', 'middleclasslay', 'lower')"-->
                  </td>
              </tr>
              <tr>
                <td height="26" class="table_02_1">
				  <SPAN ID="upperclasslay" style="visibility:<%=(v_classtype.equals("upper") ? "hidden" : "visible")%>;">
                  <%= KnowBoardAdminBean.getUpperClass(box, true, false)%><!-- getUpperclass(RequestBox, isChange, isALL)    대분류  -->
				  </SPAN> 
				  <SPAN ID="middleclasslay" style="visibility:<%=(v_classtype.equals("lower") ? "visible" : "hidden")%>;">*
                  <%= KnowBoardAdminBean.getMiddleClass(box, false,false)%><!-- getMiddleclass(RequestBox, isChange, isALL)    중분류  -->
                  </SPAN>
                </td>
              </tr>
              <tr>
                <td height="26" class="table_02_1">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr ID="iscode" style="visibility:<%if(v_classtype.equals("upper")){%>visible<%}else{%>hidden<%}%>;">
                      <td>* 분 류 코 드 : <input type="text" class="input" name="p_classcode" size=3 maxlength=3 value="<%=v_classcode%>"></td>
                    </tr>
                    <tr>
                      <td height="8"></td>
                    </tr>
                    <tr>
                      <td>* 분류코드명 : <input type="text" class="input" name="p_classname" size=20 maxlength=50 value="<%=v_classname%>"></td>
                    </tr>
                  </table>
                </td>
              </tr>
</form>
            </table>
            <!----------------- 분류 등록 끝 ----------------->
            <!----------------- 등록, 닫기 버튼 시작 ----------------->
            <table width="95%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height=6 colspan="2"></td>
                <td width="304" height=6></td>
                <td height=6></td>
              </tr>
              <tr> 
                <td colspan="4" align="right"><a href="javascript:whenInsert()"><img src="/images/admin/button/btn_apply.gif" border="0"></a>&nbsp;&nbsp;<a href="javascript:window.close()"><img src="/images/admin/button/btn_close.gif" border="0"></a></td>
              </tr>
              <tr> 
                <td height="20" colspan="4" align="left"> <br> <b>[분류코드 생성방법]</b> 
                </td>
              </tr>
              <tr> 
                <td width="84" height="20" align="left">대분류</td>
                <td height="20" colspan="3" align="left">분류코드 길이는 총 3자리로 영문+숫자의 조합으로 구성.</td>
              </tr>
              <tr> 
                <td height="20" align="left">소분류</td>
                <td height="20" colspan="3" align="left">세자리 일련번호를 권장.</td>
              </tr>
              <!--tr> 
                <td height="20" align="left">소분류</td>
                <td height="20" colspan="3" align="left">세자리 일련번호를 권장.</td>
              </tr-->
              <tr> 
                <td height="20" align="left">&nbsp;</td>
                <td height="20" colspan="3" align="left">&nbsp;</td>
              </tr>
              <tr> 
                <td height="20" colspan="4" align="left"><b>예)</b></td>
              </tr>
              <tr> 
                <td height="20" align="left">대분류</td>
                <td height="20" colspan="3" align="left">A01,B01,C01,...,A10,A20,A30,...,R10,R30,R50,...</td>
              </tr>
              <tr> 
                <td height="20" align="left">소분류</td>
                <td height="20" colspan="3" align="left">001,002,003,...,</td>
              </tr>
              <!--tr> 
                <td height="20" align="left">소분류</td>
                <td height="20" colspan="3" align="left">001,002,003,...,</td>
              </tr-->
            </table>
            <!----------------- 등록, 닫기 버튼 끝 ----------------->
            <br>
          </td>
        </tr>
      </table>
    </td>
  </tr>

  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>     

</table>
</body>
</html>