<%
/**
 * file name : za_SulmunTargetPaperPreview.jsp
 * date      : 2003/09/12
 * programmer:
 * function  : 설문 미리보기
 */
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.research.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    String  v_grcode    = box.getStringDefault("p_grcode",SulmunTargetBean.DEFAULT_GRCODE);
    String  v_subj      = box.getString("p_subj");
    String  v_subjseq      = box.getStringDefault("p_subjseq","0001");
    String  v_gyear      = box.getString("p_gyear");
    int     v_sulpapernum = box.getInt("p_sulpapernum");
    String  v_sulpapernm= box.getString("p_sulpapernm");

%>
<html>
<head>
<title>설문지 미리보기</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="/css/user_study_style1.css" rel="stylesheet" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<script language="JavaScript">
<!--
-->
</script>
<link href="/css/user_style_study.css" rel="stylesheet" type="text/css">
</head>
<body leftmargin="0" topmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<table cellpadding="0" cellspacing="10" bgcolor="#EEEEEE" width="660" height="100%">
    <tr>
        <td>
            <table cellpadding="0" cellspacing="1" bgcolor="#BEBEBE" class="table2" height="100%">
                <tr>
                    <td align="center" valign="top" class="body_color">
                    <br>
            		<!----------------- 타이틀 시작 ----------------->
  						<table cellspacing="0" cellpadding="0" class="open_table_out" align="center">
    						<tr> 
      							<td><img src="/images/user/study/question_title2.gif"></td>
      							<td background="/images/user/study/gongi_title_bg.gif" width=100%></td>
      							<td><img src="/images/user/study/gongi_tail.gif"></td>
    						</tr>
  						</table>
            		<!----------------- 타이틀 끝 ---------------->
<br>
<!--<table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
  <tr> 
    <td width="13"><img src="/images/user/research/icon2.gif" width="13" height="11" border="0"></td>
    <td><b>설문지명 : <%=v_sulpapernm%> / 설문지번호 : <%=v_sulpapernum%></b></td>
  </tr>
  <tr> 
    <td height="5"></td>
  </tr>
</table>-->

              <table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
                <tr> 
                  <td height="5" colspan="2"></td>
                </tr>
                <tr> 
                  <td width="69"><img src="/images/user/study/poll_leftimg.gif" width="69" height="51"></td>
                  <td><table width="540" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="72"><img src="/images/user/study/poll_pollname.gif"></td>
                        <td width="408" class="tblfont_sindotit"> <b>   <%=v_sulpapernm%>   </b></td>
                      </tr>
                      <tr > 
                        <td height="5" colspan="2" background="/images/user/study/stu_box_vline2.gif"></td>
                      </tr>
                    </table></td>
                </tr>
                <tr> 
                  <td height="5" colspan="2"></td>
                </tr>
              </table>

<!----------------- 설문조사 시작 ---------------->
<table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
  <tr> 
    <td class="board_color_line"></td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" class="open_board_table_out2" align="center">
<form name="form2" method="post" action="/servlet/controller.research.SulmunTargetPaperServlet">
  <input type="hidden" name="p_process"     value="">
  <input type="hidden" name="p_grcode"      value="<%=v_grcode%>">
  <input type="hidden" name="p_subj"        value="<%=v_subj%>">
  <input type="hidden" name="p_subjseq"        value="<%=v_subjseq%>">
  <input type="hidden" name="p_gyear"        value="<%=v_gyear%>">
  <input type="hidden" name="p_sulpapernum" value="<%=v_sulpapernum%>">
  <input type="hidden" name="p_sulpapernm" value="<%=v_sulpapernm%>">
</form>
  <tr> 
    <td> 
      <table cellspacing="1" cellpadding="3" class="table2">
      <form name="form3" method="post" action="/servlet/controller.research.SulmunTargetPaperServlet">
<% 
        ArrayList    blist = (ArrayList)request.getAttribute("PaperQuestionExampleList");
    
	for (int i=0; i < blist.size(); i++) {
        ArrayList list = (ArrayList)blist.get(i);  
        DataBox dbox = (DataBox)list.get(0);  
%>
        <tr> 
          <td class="board_title_bg0"><%="["+String.valueOf(i+1)+"]["+dbox.getString("d_distcodenm")+"] " + dbox.getString("d_sultext")%></td>
        </tr>
<%      if (dbox.getString("d_sultype").equals(SulmunTargetBean.OBJECT_QUESTION)) {   // 단일선택 
            for (int j=0; j < list.size(); j++) {
                dbox  = (DataBox)list.get(j); 
                if (dbox != null) { %>
        <tr> 
          <td class="board_text4"> 
            <input type="radio" name="<%=dbox.getInt("d_sulnum")%>" value="<%=dbox.getInt("d_selnum")%>"><%=dbox.getInt("d_selnum")%>. <%=dbox.getString("d_seltext")%></td>
        </tr>
<%              }
            }
        } else if (dbox.getString("d_sultype").equals(SulmunTargetBean.MULTI_QUESTION)) {  // 복수선택
            for (int j=0; j < list.size(); j++) {
                dbox  = (DataBox)list.get(j); 
                if (dbox != null) { %>
        <tr> 
          <td class="board_text4"> 
            <input type="checkbox" name="<%=dbox.getInt("d_sulnum")%>" value="<%=dbox.getInt("d_selnum")%>"><%=dbox.getInt("d_selnum")%>. <%=dbox.getString("d_seltext")%></td>
        </tr>
<%              } 
            }
        } else if (dbox.getString("d_sultype").equals(SulmunTargetBean.SUBJECT_QUESTION)) {  // 서술형  %>
        <tr> 
          <td class="board_text3"> 
            <textarea name="<%=dbox.getInt("d_sulnum")%>" cols="90" rows="15" class="input" maxlength="200"></textarea>
          </td>
        </tr>
<%
		} else if (dbox.getString("d_sultype").equals(SulmunTargetBean.COMPLEX_QUESTION)) {  // 복합형
            for (int j=0; j < list.size(); j++) {
                dbox  = (DataBox)list.get(j); 
                if (dbox != null) { %>
        <tr> 
          <td class="board_text4"> 
            <input type="radio" name="<%=dbox.getInt("d_sulnum")%>" value="<%=dbox.getInt("d_selnum")%>"><%=dbox.getInt("d_selnum")%>. <%=dbox.getString("d_seltext")%></td>
        </tr>
<%          }
				if (j == (list.size()-1)) {    %>
        <tr> 
          <td class="board_text4"><input type="radio" name="<%=dbox.getInt("d_sulnum")%>" value="<%=dbox.getInt("d_selnum")%>"> 기타의견</td>
        </tr>
        <tr> 
          <td class="board_text3"> 
            <textarea name="<%=dbox.getInt("d_sulnum")%>" cols="90" rows="15" class="input" maxlength="200"></textarea>
          </td>
        </tr>
<%				
				}
           } 
        } else if (dbox.getString("d_sultype").equals(SulmunTargetBean.FSCALE_QUESTION)) {  // 5점척도
            for (int j=0; j < list.size(); j++) {
                dbox  = (DataBox)list.get(j); 
                if (dbox != null) { %>
        <tr> 
          <td class="board_text4"> 
            <input type="radio" name="<%=dbox.getInt("d_sulnum")%>" value="<%=dbox.getInt("d_selnum")%>"><%=dbox.getInt("d_selnum")%>. <%=dbox.getString("d_seltext")%></td>
        </tr>
<%          
                }
           } 
        } else if (dbox.getString("d_sultype").equals(SulmunTargetBean.SSCALE_QUESTION)) {  // 7점척도
            for (int j=0; j < list.size(); j++) {
                dbox  = (DataBox)list.get(j); 
                if (dbox != null) { %>
        <tr> 
          <td class="board_text4"> 
            <input type="radio" name="<%=dbox.getInt("d_sulnum")%>" value="<%=dbox.getInt("d_selnum")%>"><%=dbox.getInt("d_selnum")%>. <%=dbox.getString("d_seltext")%></td>
        </tr>
<%          
                }
           } 
        } 
	}
%>
      </form>
      </table>
    </td>
  </tr>
</table>
<!----------------- 설문조사 끝 ---------------->
<br>
<!----------------- 제출 버튼 시작 ---------------->
<table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
  <tr>
    <td align="right"><a href="javascript:window.close()"><img src="/images/admin/button/btn_close.gif"  border="0"></a></td>
  </tr>


  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>     

</table>
<!----------------- 제출 버튼 끝 ----------------->
<br></td>
</tr> </table> </td> </tr> </table> 
</body>
</html>
