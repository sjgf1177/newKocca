<%
/**
 * file name : za_SulmunContentsPaperPreview.jsp
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

    String  v_grcode    = box.getStringDefault("p_grcode",SulmunContentsBean.DEFAULT_GRCODE);
    String  v_subj      = box.getString("p_subj");
    int     v_sulpapernum = box.getInt("p_sulpapernum");
    String  v_sulpapernm= box.getString("p_sulpapernm");
    
%>
<html>
<head>
<title>���� �̸�����</title>
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
		<td align="center">������ �򰡼����� ������ ��ģ �����е��� �ش������ ǰ���� ���� �򰡸� �Ͽ� �����ϱ� �����Դϴ�.<br>
���� ���� �������� �����ϱ� ���Ͽ� �� ��������� �ͱ���̰ڽ��ϴ�.</td>
	</tr>
  <tr> 
    <td height="5"></td>
  </tr>
</table>
<br>

              <table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
                <tr> 
                  <td height="5" colspan="2"></td>
                </tr>
                <tr> 
                  <td width="69"><img src="/images/user/study/poll_leftimg.gif" width="69" height="51"></td>
                  <td><table width="480" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td width="72"><img src="/images/user/study/poll_pollname.gif"></td>
                        <td width="408" class="tblfont_sindotit"> <b>  <%=v_sulpapernm%> </b></td>
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
<form name="form2" method="post" action="/servlet/controller.research.SulmunContentsPaperServlet">
  <input type="hidden" name="p_process"     value="">
  <input type="hidden" name="p_grcode"      value="<%=v_grcode%>">
  <input type="hidden" name="p_subj"        value="<%=v_subj%>">
  <input type="hidden" name="p_sulpapernum" value="<%=v_sulpapernum%>">
</form>
  <tr> 
    <td> 
      <table cellspacing="1" cellpadding="3" class="table2">
      <form name="form3" method="post" action="/servlet/controller.research.SulmunContentsPaperServlet">
<% 
        ArrayList    blist = (ArrayList)request.getAttribute("PaperQuestionExampleList");
    
	for (int i=0; i < blist.size(); i++) {
        ArrayList list = (ArrayList)blist.get(i);  
        DataBox dbox = (DataBox)list.get(0);  
%>
        <tr> 
          <td class="board_title_bg0"><%="["+String.valueOf(i+1)+"]["+dbox.getString("d_distcodenm")+"] " + dbox.getString("d_sultext")%></td>
        </tr>
<%  
            for (int j=0; j < list.size(); j++) {
                dbox  = (DataBox)list.get(j); 
%>
		<tr> 
          <td class="board_text4"> 
            <input type="radio" name="<%=dbox.getInt("d_sulnum")%>" value="<%=dbox.getInt("d_selnum")%>"><%=dbox.getInt("d_selnum")%>. <%=dbox.getString("d_seltext")%></td>
        </tr>
<%      }
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
    <td align="right"><a href="javascript:window.close()"><img src="/images/admin/button/btn_close.gif"  border="0"></a></td>
  </tr>


  <tr><td><%@ include file = "/learn/library/getJspName.jsp" %></td></tr>     

</table>
<!----------------- ���� ��ư �� ----------------->

<br></td>
</tr> </table> </td> </tr> </table> 
</body>
</html>
