<%
/**
 * file name : za_SulmunSubjPaperPreview.jsp
 * date      : 2003/09/12
 * programmer:
 * function  : ���� �̸�����
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

    String  v_grcode    = box.getStringDefault("p_grcode",SulmunSubjBean.DEFAULT_GRCODE);
    String  v_subj      = box.getString("p_subj");
    int     v_sulpapernum = box.getInt("p_sulpapernum");
    String  v_sulpapernm= box.getString("p_sulpapernm");
    
%>
<html>
<head>
<title>������ �̸�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="/css/user_style_study.css" rel="stylesheet" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<script language="JavaScript">
<!--
function sulmunRight(){
  document.form2.target = "openWinQuestion";
  document.form2.action.value  = '/servlet/controller.research.SulmunSubjResultServlet';
  document.form2.p_process.value = 'SulmunUserPage';
  document.form2.submit();
}
//-->
</script>
</head>
<body  leftmargin="0" topmargin="0" bottommargin="0" marginwidth="0" marginheight="0">

<table cellpadding="0" cellspacing="10" bgcolor="#EEEEEE" width="783" height="100%">
    <tr>
        <td>
            <table cellpadding="0" cellspacing="1" bgcolor="#BEBEBE" class="table2" height="100%">
                <tr>
                    <td align="center" valign="top" class="body_color">

<table cellspacing="0" cellpadding="0" class="open_board_table_out2" align="center">
<form name="form2" method="post" action="/servlet/controller.research.SulmunSubjUserServlet">

</form>
<form name="form3" method="post" action="/servlet/controller.research.SulmunSubjUserServlet">
              <br>
              <!----------------- Ÿ��Ʋ ���� ----------------->
              <table cellspacing="0" cellpadding="0" class="open_table_out" align="center">
    						<tr> 
      							<td><img src="/images/user/study/question_title2.gif"></td>
      							<td background="/images/user/study/gongi_title_bg.gif" width=100%></td>
      							<td><img src="/images/user/study/gongi_tail.gif"></td>
    						</tr>
  						</table>
            		<!----------------- Ÿ��Ʋ �� ---------------->
<br>
              <table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
                <tr> 
                  <td height="5" colspan="2"></td>
                </tr>
                <tr> 
                  <td width="69"><img src="/images/user/study/poll_leftimg.gif" width="69" height="51"></td>
                  <td><table width="540" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="72"><img src="/images/user/study/poll_pollname.gif"></td>
                        <td width="408" class="tblfont_sindotit"> <b>  �������� >> <%=v_sulpapernm%>  </b></td>
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

<!----------------- �н��� ���� ---------------->
<table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
  <tr> 
    <td class="board_color_line"></td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" class="open_board_table_out2" align="center">
  <tr> 
    <td> 
      <table cellspacing="1" cellpadding="3" class="table2">
<% 
    ArrayList    blist = (ArrayList)request.getAttribute("PaperQuestionExampleList"); 
    
	for (int i=0; i < blist.size(); i++) {
        ArrayList list = (ArrayList)blist.get(i);

        DataBox dbox = (DataBox)list.get(0);  

%>
        <tr> 
          <td class="board_title_bg0"><%="["+String.valueOf(i+1)+"]     " + dbox.getString("d_sultext")%>
		  <%if (dbox.getString("d_sultype").equals(SulmunSubjBean.MULTI_QUESTION)){%>(<%=dbox.getString("d_selmax")%>������ ���� ����)<%}%>
		  </td>
        </tr>
<%      if (dbox.getString("d_sultype").equals(SulmunSubjBean.OBJECT_QUESTION)) {   // ���ϼ��� 
            for (int j=0; j < list.size(); j++) {
                dbox  = (DataBox)list.get(j); 
                if (dbox != null) { %>
        <tr> 
          <td class="board_text4"> 
            &nbsp;&nbsp;<input type="radio" name="<%=dbox.getInt("d_sulnum")%>" value="<%=dbox.getInt("d_selnum")%>"><%=dbox.getInt("d_selnum")%>. <%=dbox.getString("d_seltext")%></td>
        </tr>
<%              }
            }
        } else if (dbox.getString("d_sultype").equals(SulmunSubjBean.MULTI_QUESTION)) {  // ��������
            for (int j=0; j < list.size(); j++) {
                dbox  = (DataBox)list.get(j); 
                if (dbox != null) { %>
        <tr> 
          <td class="board_text4"> 
            &nbsp;&nbsp;<input type="checkbox" name="<%=dbox.getInt("d_sulnum")%>" value="<%=dbox.getInt("d_selnum")%>"><%=dbox.getInt("d_selnum")%>. <%=dbox.getString("d_seltext")%></td>
        </tr>
<%              } 
            }
        } else if (dbox.getString("d_sultype").equals(SulmunSubjBean.SUBJECT_QUESTION)) {  // ������  %>
        <tr> 
          <td class="board_text3"> 
            &nbsp;&nbsp;<textarea name="<%=dbox.getInt("d_sulnum")%>" cols="90" rows="5" class="input" maxlength="200"></textarea>
          </td>
        </tr>
<%
		} else if (dbox.getString("d_sultype").equals(SulmunSubjBean.COMPLEX_QUESTION)) {  // ������
            for (int j=0; j < list.size(); j++) {
                dbox  = (DataBox)list.get(j); 
                if (dbox != null) { %>
        <tr> 
          <td class="board_text4"> 
            &nbsp;&nbsp;<input type="radio" name="<%=dbox.getInt("d_sulnum")%>" value="<%=dbox.getInt("d_selnum")%>"><%=dbox.getInt("d_selnum")%>. <%=dbox.getString("d_seltext")%></td>
        </tr>
<%          }
				if (j == (list.size()-1)) {    %>
        <tr> 
          <td class="board_text4">&nbsp;&nbsp;<input type="radio" name="<%=dbox.getInt("d_sulnum")%>" value="<%=dbox.getInt("d_selnum")%>"> ��Ÿ�ǰ�</td>
        </tr>
        <tr> 
          <td class="board_text3">
            <textarea name="<%=dbox.getInt("d_sulnum")%>|C" cols="90" rows="5" class="input" maxlength="200"></textarea>
          </td>
        </tr>
<%				
				}
           } 
        } else if (dbox.getString("d_sultype").equals(SulmunSubjBean.FSCALE_QUESTION)) {  // 5��ô��
            for (int j=0; j < list.size(); j++) {
                dbox  = (DataBox)list.get(j); 
                if (dbox != null) { %>
        <tr> 
          <td class="board_text4"> 
            &nbsp;&nbsp;<input type="radio" name="<%=dbox.getInt("d_sulnum")%>" value="<%=dbox.getInt("d_selnum")%>"><%=dbox.getInt("d_selnum")%>. <%=dbox.getString("d_seltext")%></td>
        </tr>
<%          
                }
           } 
        } else if (dbox.getString("d_sultype").equals(SulmunSubjBean.SSCALE_QUESTION)) {  // 7��ô��
            for (int j=0; j < list.size(); j++) {
                dbox  = (DataBox)list.get(j); 
                if (dbox != null) { %>
        <tr> 
          <td class="board_text4"> 
            &nbsp;&nbsp;<input type="radio" name="<%=dbox.getInt("d_sulnum")%>" value="<%=dbox.getInt("d_selnum")%>"><%=dbox.getInt("d_selnum")%>. <%=dbox.getString("d_seltext")%></td>
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
<!----------------- �������� �� ---------------->
<br>
<!----------------- ���� ��ư ���� ---------------->
<table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
  <tr>
    <td align="right"><a href="javascript:window.close()"><img src="/images/admin/exam/close1_butt.gif" width="37" height="18" border="0"></a></td>
  </tr>
</table>
<!----------------- ���� ��ư �� ----------------->
<br></td>
</tr> </table> </td> </tr> </table> 
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>