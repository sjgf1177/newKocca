<%
//**********************************************************
//  1. ��      ��: ��������������Ʈ
//  2. ���α׷��� : za_Permission_L.jsp
//  3. ��      ��: ���������� ����Ʈ
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2004. 12. 20
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    String  v_usernm    = box.getString("p_usernm");
    String  v_subj      = box.getString("p_subj");
    String  v_subjseq   = box.getString("p_subjseq");
    String  v_year      = box.getString("p_year");

    String v_name="", v_academic="", v_major="", v_professional="", v_career="", v_majorbook="", v_intro="";
    String v_compnm="", v_comp="";

    ArrayList list = (ArrayList)request.getAttribute("select");
    

%>
<html>
<head>
<title>eIBIs</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/user_style_study.css" type="text/css">
<SCRIPT LANGUAGE = "JAVASCRIPT" SRC = "/script/cresys_lib.js"></SCRIPT>
<SCRIPT LANGUAGE = "JAVASCRIPT">
function select(){
document.form1.submit();
}
</SCRIPT>
</head>
<body>
<form name="form1" method="post" action="/servlet/controller.study.TutorInfoServlet">
<input type="hidden" name="p_subj" value="<%=v_subj%>">
<input type="hidden" name="p_subjseq" value="<%=v_subjseq%>">
<input type="hidden" name="p_year" value="<%=v_year%>">
<table cellpadding="0" cellspacing="10" bgcolor="#EEEEEE" width="800" height="100%">
  <tr> 
    <td> 
      <table cellpadding="0" cellspacing="1" bgcolor="#BEBEBE" class="table2" height="100%">
        <tr> 
           <td align="center" valign="top" class="body_color"> 

           <br>
            		<!----------------- Ÿ��Ʋ ���� ----------------->
  						<table cellspacing="0" cellpadding="0" class="open_table_out" align="center">
    						<tr> 
      							<td><img src="/images/user/study/tutor_title.gif"></td>
      							<td background="/images/user/study/gongi_title_bg.gif" width=100%></td>
      							<td><img src="/images/user/study/gongi_tail.gif"></td>
    						</tr>
  						</table>
            		<!----------------- Ÿ��Ʋ �� ---------------->
            		<br>

            <!----------------- �Խ��� ����Ʈ ���� ---------------->
            <table cellspacing="0" cellpadding="0" class="open_board_table_out1">
              <tr> 
                <td class="board_color_line"></td>
              </tr>
            </table>

            <table cellspacing="0" cellpadding="0" class="open_board_table_out2">
              <tr> 
                <td> 
                  <table cellspacing="1" cellpadding="3" class="table2">
<%                    
                for(int i = 0; i < list.size(); i++) {
                    DataBox dbox = (DataBox)list.get(i);
                    v_name          = dbox.getString("d_name");
                    v_academic      = dbox.getString("d_academic");
                    v_major         = dbox.getString("d_major");
                    v_professional  = dbox.getString("d_professional");
                    v_career        = dbox.getString("d_career");
                    v_majorbook     = dbox.getString("d_majorbook");
                    v_intro         = dbox.getString("d_intro");
                    v_compnm        = dbox.getString("d_compnm");
                    v_comp          = dbox.getString("d_comp");
                    
%>
                    <tr> 
                        <td class="board_title_bg1">����</td>
                        <td class="board_text1"><%=v_name%></td>
                    </tr>
                    <tr>
                        <td class="board_title_bg1">�Ҽ�/����</td>
                        <%
                            if(v_compnm.equals("")){
                        %>
                        <td class="board_text1"><%=v_comp%></td>
                        <%
                            } else {
                        %>
                        <td class="board_text1"><%=v_compnm%></td>                        
                        <%
                            }
                        %>
                    </tr>
                    <tr>
                        <td class="board_title_bg1">�з�</td>
                        <td class="board_text1"><%=v_academic%>&nbsp;<%=v_major%></td>
                    </tr>
                    <tr>
                        <td class="board_title_bg1">�����о�</td>
                        <td class="board_text1"><%=v_professional%></td>
                    </tr>
                    <tr>
                        <td class="board_title_bg1">���</td>
                        <td class="board_text1"><%=v_career%></td>
                    </tr>
                    <tr>
                        <td class="board_title_bg1">�ֿ����� �� ����</td>
                        <td class="board_text1"></td>
                    </tr>
                    <tr>
                        <td class="board_title_bg1">�λ縻</td>
                        <td class="board_text1"></td>
<%
                }
%>
                  </table>
                </td>
              </tr>
            </table>
            <!----------------- �Խ��� ����Ʈ �� ---------------->


            <!----------------- �ۼ�, �ݱ� ��ư ���� ---------------->
            <table cellspacing="0" cellpadding="0" class="open_board_table_out1">
              <tr>
                <td align="right"><a href="javascript:self.close()"><img src="/images/user/study/close_butt.gif" width="54" height="20" border="0"></a></td>
              </tr>
            </table>
            <!----------------- �ۼ�, �ݱ� ��ư �� ----------------->
            <br>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
