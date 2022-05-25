<%
/**
 * file name : gu_JindanUserList_L.jsp
 * date      : 2005/12/14
 * programmer:	lyh
 * function  : 진단테스트 list 출력
 */
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.exam.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
	box.put("leftmenu","04"); 
    ArrayList list = (ArrayList)request.getAttribute("JindanUserList");

	DataBox dbox = null;
    
%>
<!------- 상단 로고,메뉴,유저정보 파일 시작 ------------>
<%@ include file="/learn/user/game/include/topApply.jsp"%>
<!------- 상단 로고,메뉴,유저정보 파일 끝  ------------->

<SCRIPT LANGUAGE="JavaScript">
<!--

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

	function historyGo(classname, class1, class2, class3){

			window.open("", "selfHistory", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 720, height = 680, top=0, left=0");
			document.frm1.target = "selfHistory"
			document.frm1.action = "/servlet/controller.jindan.JindanUserServlet?p_process=JindanHistoryUserResultView";
			document.frm1.submit();

		}


//-->
</SCRIPT>
<!-- title -->
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="35" align="right"  background="/images/user/game/apply/<%=tem_subimgpath%>/tit_selftest.gif" class="location" ><img src="/images/user/game/common/location_bl.gif"> 
      HOME > 수강신청 > 나의 진단이력 보기</td>
  </tr>
  <tr> 
    <td height="20"></td>
  </tr>
</table>
<!-- tab -->
<table width="720" border="0" cellspacing="0" cellpadding="0">
	<FORM METHOD=POST name="frm1">
	
  <tr> 
    <td width="102"><a href="/servlet/controller.jindan.JindanUserServlet?p_process=JindanUserList" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image23','','/images/user/game/apply/tab_self_on.gif',1)"><img src="/images/user/game/apply/tab_self.gif" name="Image23" border="0"></a></td>
    <td width="378" valign="top"><img src="/images/user/game/apply/tab_selfmy_on.gif"></td>
    <td width="240">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="3"><img src="/images/user/game/apply/self_line.gif"></td>
  </tr>
</table>
<table width="720" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td><img src="/images/user/game/apply/selfjindan_text.gif" ></td>
  </tr>
  <tr> 
    <td height="20"></td>
  </tr>
</table>
<!-- 문제1 -->
<table width="720" border="2" cellspacing="0" 
                         cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
  <tr  class="linecolor_course"> 
    <td height="3" colspan="5" class="linecolor_app"></td>
  </tr>
  <tr> 
    <td width="46" class="tbl_gtit2">NO<br></td>
    <td width="351" class="tbl_gtit">중분류<br></td>
    <td width="91" class="tbl_gtit2">소분류</td>
    <td width="124"  class="tbl_gtit">진단일</td>
    <td width="64"  class="tbl_gtit">평균점수</td>
  </tr>
  <tr> 
    <td height="5" colspan="5" ></td>
  </tr>
  <tr> 
    <td class="tbl_grc">1</td>
    <td class="tbl_bleft">게임프로그래밍</td>
    <td class="tbl_grc"><img src="/images/user/game/apply/class01.gif"></td>
    <td class="tbl_grc"><a href="javascript:historyGo()">2005/12/21</a></td>
    <td class="tbl_grc">65.0</td>
  </tr>
  <tr> 
    <td height="26" class="tbl_grc">2</td>
    <td class="tbl_bleft">게임프로그래밍</td>
    <td class="tbl_grc"><img src="/images/user/game/apply/class02.gif"></td>
    <td class="tbl_grc"><a href="javascript:historyGo()">2005/12/21</a></td>
    <td class="tbl_grc">35.0</td>
  </tr>
	</FORM>
</table>

<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->