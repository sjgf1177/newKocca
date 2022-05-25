<%
//**********************************************************
//  1. ��      ��: TORON LIST
//  2. ���α׷���: zu_Toron_L.jsp
//  3. ��      ��: ��й� ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 9. 02
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");    
    String  v_subj      = box.getString("p_subj");
    String  v_year      = box.getString("p_year");
    String  v_subjseq   = box.getString("p_subjseq");
    String  v_tpcode    = "";
    String  v_title     = "";
    String  v_aduserid  = "";
    String  v_addate    = "";
    String  v_started   = "";
    String  v_ended     = "";
    String  v_name      = "";
    String  v_status    = "";
    int     v_cnt       =  0;
    int     i           =  0;
    ArrayList list      = null;
    //DEFINED class&variable END
        
    list = (ArrayList)request.getAttribute("topicList");  
%>
<html>
<head>
<title>::: ��й� :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/user_style_study.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language="javascript">
<!--
    function topicInsert(){
        document.form1.p_process.value = "TopicInsertPage";
        document.form1.action = "/servlet/controller.study.ToronServlet";
        document.form1.submit();                
    }
    
    function topicView(tpcode){
        document.form1.p_process.value = "TopicSelect";
        document.form1.p_tpcode.value = tpcode;
        document.form1.action = "/servlet/controller.study.ToronServlet";
        document.form1.submit();           
    }
-->
</script>
</head>

<body topmargin="0" leftmargin="0">
<form name="form1" method="post">
<input type="hidden" name="p_process">
<input type="hidden" name="p_subj" value="<%=v_subj%>">
<input type="hidden" name="p_year" value="<%=v_year%>">
<input type="hidden" name="p_subjseq" value="<%=v_subjseq%>">
<input type="hidden" name="p_tpcode">
<!--
<table cellpadding="0" cellspacing="10" bgcolor="#EEEEEE" width="783" height="100%">
  <tr> 
    <td> 
      <table cellpadding="0" cellspacing="1" bgcolor="#BEBEBE" class="table2">
        <tr> 
          <td align="center" valign="top" class="body_color"> 
-->

<table cellpadding="0" cellspacing="10" bgcolor="#EEEEEE" width="783" height="100%">
  <tr> 
    <td> 
      <table cellpadding="0" cellspacing="1" bgcolor="#BEBEBE" class="table2" height="100%">
        <tr> 
          <td align="center" valign="top" class="body_color"> 
          
            <br>
            <!----------------- Ÿ��Ʋ ���� ----------------->
  				<table cellspacing="0" cellpadding="0" class="open_table_out" align="center">
    				<tr> 
                      <td><img src="/images/user/study/discuss_title.gif"></td>
                      <td background="/images/user/study/gongi_title_bg.gif" width=100%></td>
                      <td><img src="/images/user/study/gongi_tail.gif"></td>
    				</tr>
  				</table>
            <!----------------- Ÿ��Ʋ �� ---------------->
            <br>            
            <!----------------- �������� ��ư ���� ----------------->
            <table cellspacing="0" cellpadding="0" class="open_board_table_out1">
              <tr> 
                <td></td>
                <td><b>�Ʒ����� ��п� ������ ������ �����Ͻʽÿ�.</b></td>
                <td align="right" width="80">
                <a href="javascript:topicInsert()"><img src="/images/user/button/btn_subject.gif" border="0"></a>
                </td>
              </tr>
			  <tr>
			  <td height=6></td>
			  <td height=6></td>
			  <td height=6></td>
			  </tr>
            </table>
            <!----------------- �������� ��ư �� ----------------->

            <!----------------- ��й� ����Ʈ ���� ---------------->
            <table cellspacing="0" cellpadding="0" class="open_board_table_out1">
              <tr> 
                <td class="board_color_line"></td>
              </tr>
            </table>

            <table cellspacing="0" cellpadding="0" class="open_board_table_out2">
              <tr> 
                <td> 
                  <table cellspacing="1" cellpadding="3" class="table2">
                    <tr> 
                      <td class="board_title_bg1" width="5%" height="28">��ȣ</td>
                      <td class="board_title_bg1" width="9%" height="28">����</td>
                      <td class="board_title_bg1" height="28">�� ��</td>
                      <td class="board_title_bg1" width="9%" height="28">������</td>
                      <td class="board_title_bg1" width="10%" height="28">������</td>
                      <td class="board_title_bg1" width="7%" height="28">��ȸ��</td>
                      <td class="board_title_bg1" width="27%" height="28">��бⰣ</td>
                    </tr>
        <% 
            for(i = 0; i < list.size(); i++) {        
                ToronData data  = (ToronData)list.get(i);              
                v_tpcode    = data.getTpcode();   
                v_title     = data.getTitle();    
                v_aduserid  = data.getAduserid(); 
                v_addate    = data.getAddate();   
                v_started   = data.getStarted();  
                v_ended     = data.getEnded();
                v_name      = data.getName();     
                v_cnt       = data.getCnt();      
                if((Integer.parseInt(v_started) < Integer.parseInt(FormatDate.getDate("yyyyMMddHH")))&&
                (Integer.parseInt(FormatDate.getDate("yyyyMMddHH")) < Integer.parseInt(v_ended))){
                    v_status = "������";
                }else{
                    v_status = "����";
                }                                
                v_addate    = FormatDate.getFormatDate(v_addate,"yyyy/MM/dd"); 
                v_started   = FormatDate.getFormatDate(v_started,"yyyy/MM/dd HH" );    
                v_ended     = FormatDate.getFormatDate(v_ended,"yyyy/MM/dd HH");                  
        %>
                    <tr> 
                      <td class="board_text1" height="27"><%= list.size() - i %></td>
                      <td class="board_text1" height="27"><!--<img src="/images/user/study/progress_butt1.gif" width="15" height="16" border="0"> -->
                        <%=v_status%></td>
                      <td class="board_text3" height="27">
                      <a href="javascript:topicView('<%=v_tpcode%>')"><%=v_title%></a>
                      </td>
                      <td class="board_text1"><%=v_name%></td>
                      <td class="board_text1"><%=v_addate%></td>
                      <td class="board_text1"><%=v_cnt%></td>
                      <td class="board_text1" height="27"><%=v_started%>��~<%=v_ended%>��</td>
                    </tr>
        <%  }  if(i == 0){ %>        
                      <tr> 
                        <td align="center" class="board_text1" colspan="7">��ϵ� ������ �����ϴ�</td>                  
                      </tr>
                 <%  } %>  
                  </table>

                </td>
              </tr>
            </table>
            <!----------------- ��й� ����Ʈ �� ---------------->
            <!----------------- �ݱ� ��ư ���� ---------------->
            <table cellspacing="0" cellpadding="0" class="open_board_table_out1">
              <tr> 
                <td height="11"></td>
              </tr>
                <td align="right">
                <a href="javascript:self.close()"><img src="/images/user/button/btn_close.gif"  border="0"></a>
                </td>
              </tr>
            </table>
            <!----------------- �ݱ� ��ư �� ----------------->

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
