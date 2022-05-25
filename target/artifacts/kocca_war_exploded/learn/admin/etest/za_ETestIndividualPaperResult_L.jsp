<%
/**
 * file name : za_ETestIndividualPaperResult_L.jsp
 * date      : 2003/09/07
 * programmer:
 * function  : �򰡹����� ������ ��ȸ
 */
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.etest.*" %>
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    
    float v_grbase = 0.0f;
    String v_score = "";

    String v_subj     = box.getString("p_subj"); 
    String v_year     = box.getString("p_year"); 
    String v_subjseq  = box.getString("p_subjseq"); 
    String v_papernum = box.getString("p_papernum"); 
    String v_userid   = box.getString("p_userid");
   
%>
<html>
<head>
<title>::: �ֿ��ڵ��� ���簳�߿� :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/user_style_study.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!--
function ETestClose() {
    self.close()  
}
//-->
</SCRIPT>
</head>

<body class="body_color">
<!----------------- Ÿ��Ʋ ���� ----------------->
<table cellspacing="0" cellpadding="0" class="open_table_out" align="center">
  <tr>                 
      <td background="/images/user/research/b_title_dot.gif"><img src="/images/user/study/controller_exam_title1.gif" width="240" height="37" border="0"></td>
  </tr>
  <tr><td height="7"></td></tr>
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
<%  
    ArrayList blist = (ArrayList)request.getAttribute("UserPaperResult");
            
    for (int i=0; i<blist.size(); i++) {
        ArrayList list = (ArrayList)blist.get(i);  
        DataBox dbox = (DataBox)list.get(0); 
        
        String v_isanswer = "X";
	ArrayList answerList = new ArrayList();

	if (dbox.getString("d_answer_gr").equals("0.0")) {
	    v_isanswer = "X";
	} else {
	    v_isanswer = "O";
	} 
	StringTokenizer st = new StringTokenizer(dbox.getString("d_answer"), ":");
	if(dbox.getString("d_etesttype").equals(ETestBean.MULTI_QUESTION)) {		//		�ٴ�� ���
            while(st.hasMoreElements()) {
                answerList.add(st.nextToken());//System.out.println("v_answer " + v_answer);
            }
	}
        float v_answer_gr = (float)dbox.getDouble("d_answer_gr");
        v_grbase = (float)dbox.getDouble("d_grbase");
        v_score = dbox.getString("d_score");
	
	%>
              <tr> 
                <td colspan="3" class="board_title_bg5"><b>[<%=(i+1)%>]  <%=dbox.getString("d_text")%> (<%=v_isanswer%>)</b></td>
                <td class="board_title_bg1" width="5%"><b>����</b></td>
                <td class="board_title_bg1" width="5%"><b>����</b></td>
                <td class="board_title_bg1" width="15%"><b>ȹ������</b></td>
              </tr>
<%    for (int j=0; j < list.size(); j++) {
                dbox  = (DataBox)list.get(j); 
                if (dbox != null) {   %>
              <tr> 
                <td class="board_text9" width="6%">&nbsp;</td>
                <td class="board_text2" width="5%"><%=j+1%></td>
                <td class="board_text4"><%=dbox.getString("d_seltext")%></td>
                <td class="board_text2"><% if (dbox.getString("d_isanswer").equals("Y")) { %><font color='red'><b>O</b></font><% } %></td>
<%               
                    if (dbox.getString("d_etesttype").equals(ETestBean.SUBJECT_QUESTION)) {
                        if (j==0) { %> 
                <td class="board_text2" rowspan="<%=list.size()%>"><%=dbox.getString("d_answer")%></td>
<%                   }
                   }else { %>
                <td class="board_text2">
                <%   if(dbox.getString("d_etesttype").equals(ETestBean.MULTI_QUESTION)) {		//		�ٴ�� ���
                            for(int k=0; k<answerList.size(); k++) {
                                if (((String)answerList.get(k)).equals(dbox.getString("d_selnum"))) { %>O<% } %>
                <%	    }
                        }
			else {
			    if (dbox.getString("d_answer").equals(dbox.getString("d_selnum"))) { %>O<% } %>
		<%	}	%>
				</td>
<%               }                
                    if (j==0) { %> 
                <td class="board_text2" rowspan="<%=list.size()%>"><%=dbox.getString("d_answer_gr")%></td>
<%               }  %>                 
              </tr>      
<%          } 
        }  
   }    %>
              <tr> 
                <td colspan="5" class="board_title_bg1">�⺻����</td>
                <td class="board_text8"><%=v_grbase%></td>
              </tr>
              <tr> 
                <td colspan="5" class="board_title_bg1">��  ��</td>
                <td class="board_text8"><%=v_score%>
                </td>
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
    <td align="right"><a href="javascript:ETestClose()"><img src="/images/user/study/close_butt.gif" width="54" height="20" border="0"></td>
  </tr>
</table>
<!----------------- �ݱ� ��ư �� ----------------->
<br>
</body>
</html>
