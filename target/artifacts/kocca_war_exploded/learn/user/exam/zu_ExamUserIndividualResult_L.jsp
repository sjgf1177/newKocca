<%
/**
 * file name : za_ExamIndividualResult_L.jsp
 * date      : 2003/09/07
 * programmer:
 * function  : �򰡹����� ������ ��ȸ
 */
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.exam.*" %>
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    String v_subj     = box.getString("p_subj"); 
    String v_year     = box.getString("p_year"); 
    String v_subjseq  = box.getString("p_subjseq"); 
    String v_lesson   = box.getString("p_lesson"); 
    String v_ptype    = box.getString("p_ptype"); 
    String v_branch   = box.getString("p_branch"); 
    String v_papernum = box.getString("p_papernum"); 
    String v_userid   = box.getString("p_userid");
   
    ArrayList list = (ArrayList)request.getAttribute("IndividualResultList");
    QuestionExampleData data = null;
    ExampleData      subdata = null;
    double v_grbase   = box.getDouble("p_grbase");
%>
<html>
<head>
<title>::: �ֿ��ڵ��� ������ :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/user_style_study.css" type="text/css">
</head>

<body class="body_color">
<!----------------- Ÿ��Ʋ ���� ----------------->
<table cellspacing="0" cellpadding="0" class="open_table_out" align="center">
  <tr> 
    <td><img src="/images/user/study/personal_title.gif" alt="���κ� �򰡰�� ��ȸ"></td>
    <td background="/images/user/study/gongi_title_bg.gif" width=100%></td>
    <td><img src="/images/user/study/gongi_tail.gif"></td>
  </tr>
</table>
<!----------------- Ÿ��Ʋ �� ---------------->
<br>
<table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
<tr> 
  <td><b>������ : <%=v_userid%></b></td>
</tr>
<tr> 
  <td height="5"></td>
</tr>
</table>
  <!----------------- ���κ� �򰡰�� ��ȸ ���� ---------------->
  <table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
    <tr> 
      <td class="board_color_line"></td>
    </tr>
  </table>
  <table cellspacing="0" cellpadding="0" class="open_board_table_out2" align="center">
    <tr> 
      <td> 
        <table cellspacing="1" cellpadding="3" class="table2">
<%  String v_isok = "X";
    double  v_getmark = 0;
    double  v_mark    = 0;
    for (int i=0; i<list.size(); i++) {
        data  = (QuestionExampleData)list.get(i); 
        v_getmark+= data.getGetmarks();
        v_mark   += data.getMarks(); 
				if (data.getGetmarks() == data.getMarks()) {
				    v_isok = "O";
				} else {
				    v_isok = "X";
				} %>
              <tr> 
                <td colspan="3" class="board_title_bg5"><b>[<%=(i+1)%>][<%=data.getExamtypenm()%>] - <%=data.getText()%> (<%=v_isok%>)</b></td>
                <td class="board_title_bg1" width="5%"><b>����</b></td>
                <td class="board_title_bg1" width="5%"><b>����</b></td>
                <td class="board_title_bg1" width="15%"><b>ȹ��/��������</b></td>
              </tr>
<%      for (int j=1; j<=data.size(); j++) { 
            subdata = (ExampleData)data.get(j); %>
              <tr> 
                <td class="board_text9" width="6%">&nbsp;</td>
                <td class="board_text2" width="5%"><%=j%></td>
                <td class="board_text4"><%=subdata.getSeltext()%></td>
                <td class="board_text2"><% if (subdata.getIsanswer().equals("Y")) { %>O<% } %></td>
<%          if (data.getExamtype().equals(ExamBean.SUBJECT_QUESTION) ||data.getExamtype().equals(ExamBean.STATEMENT_QUESTION)) {
                if (j==1) { %> 
                <td class="board_text2" rowspan="<%=data.size()%>"><%=subdata.getIsreply()%></td>
<%              }
            } else { %>
                <td class="board_text2"><% if (subdata.getIsreply().equals("Y")) { %>O<% } %></td>
<%          }                
            if (j==1) { %> 
                <td class="board_text2" rowspan="<%=data.size()%>"><%=data.getGetmarks()%>/<%=data.getMarks()%></td>
<%          }  %>                 
              </tr>      
<%      } 
    }  %>
              <tr> 
                <td class="board_text9">&nbsp;</td>
                <td class="board_text2">&nbsp;</td>
                <td class="board_text10">�⺻����</td>
                <td class="board_text2">&nbsp;</td>
                <td class="board_text2">&nbsp;</td>
                <td class="board_text8"><%=(float)v_grbase%></td>
              </tr>
              <tr> 
                <td class="board_text9">&nbsp;</td>
                <td class="board_text2">&nbsp;</td>
                <td class="board_text10">����ջ�</td>
                <td class="board_text2">&nbsp;</td>
                <td class="board_text2">&nbsp;</td>
                <td class="board_text8"><%=(float)(v_getmark+v_grbase)%>/<%=(float)(v_grbase+v_mark)%></td>
              </tr>
        </table>
      </td>
    </tr>
  </table>
  <!----------------- ���κ� �򰡰�� ��ȸ �� ---------------->
<br>
<!----------------- �ݱ� ��ư ���� ---------------->
<table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
  <tr>                
    <td align="right"><a href="javascript:top.etop.goExNext()"><img src="/images/user/button/btn_close.gif" alt="�ݱ�" border="0"></td>
  </tr>
</table>
<!----------------- �ݱ� ��ư �� ----------------->
<br>
</body>
</html>
