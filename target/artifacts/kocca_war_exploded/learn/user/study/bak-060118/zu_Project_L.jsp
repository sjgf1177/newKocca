<%
//**********************************************************
//  1. ��      ��: PROJECT LIST
//  2. ���α׷���: zu_Project_L.jsp
//  3. ��      ��: ����Ʈ ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 9. 04
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
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.course.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");    
    String  v_subj      = box.getString("p_subj");
    String  v_year      = box.getString("p_year");
    String  v_subjseq   = box.getString("p_subjseq");    
    String  v_lesson    = "";
    String  v_title     = "";
    String  v_reptype   = "";
    String  v_projgrp   = "";    
    String  v_rep_value = "";
    String  v_jud_value = "";
    int     v_ordseq    =  0;    
    int     v_projseq   =  0;
    int     v_score     =  0;
    int     v_score2    =  0;
    int     v_cnt       =  0;
    int     i           =  0;
    ArrayList list      = null;
    //DEFINED class&variable END       
   
    list = (ArrayList)request.getAttribute("projectList");     
/*
    SubjseqData dataseq = new SubjseqData();
    GrseqBean bean   = new GrseqBean();
    
    dataseq = bean.SelectSubjseqData(box);
*/
%>
<html>
<head>
<title>::: REPORT :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/user_style_study.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
    // ����Ʈ ����
    function whenRrojectSubmit(projseq, ordseq,lesson,reptype,projgrp,getcnt) {
        form = document.form1;
        form.action='/servlet/controller.study.ProjectServlet';
        form.p_process.value = 'ProjectHandlingPage';        
        form.p_projseq.value = projseq;        
        form.p_ordseq.value = ordseq;
        form.p_lesson.value = lesson;
        form.p_reptype.value = reptype;
        form.p_projgrp.value = projgrp;
        form.p_getcnt.value = getcnt;        
        document.form1.submit();
    }    
    function whenCoworkerJudge(ordseq,lesson,reptype,projgrp) {
        form = document.form1;
        form.action='/servlet/controller.study.ProjectServlet';
        form.p_process.value = 'ProjectJudgePage';        
        form.p_ordseq.value = ordseq;
        form.p_lesson.value = lesson;
        form.p_reptype.value = reptype;
        form.p_projgrp.value = projgrp;
        document.form1.submit();
    }
-->
</SCRIPT>
</head>

<body topmargin="0" leftmargin="0">
<form name="form1" method="post">
<input type="hidden" name="p_process">
<input type="hidden" name="p_subj" value="<%=v_subj%>">
<input type="hidden" name="p_year" value="<%=v_year%>">
<input type="hidden" name="p_subjseq" value="<%=v_subjseq%>">
<input type="hidden" name="p_projseq">
<input type="hidden" name="p_ordseq">
<input type="hidden" name="p_lesson">
<input type="hidden" name="p_reptype">
<input type="hidden" name="p_projgrp">
<input type="hidden" name="p_getcnt"><!--���ⰹ��-->


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
      <td><img src="/images/user/study/report_title.gif"></td>
      <td background="/images/user/study/gongi_title_bg.gif" width=100%></td>
      <td><img src="/images/user/study/gongi_tail.gif"></td>
    </tr>
  </table>

<BR>
            <!----------------- ����Ʈ ����Ʈ ���� ---------------->
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
                        <td class="board_title_bg1" height="28">�� ��</td>
                        <td class="board_title_bg1" width="12%" height="28">���⿩��</td>
                        <td class="board_title_bg1" width="15%" height="28">�������/����</td>
                        <td class="board_title_bg1" width="11%" height="28">��Ÿ</td>
                      </tr>
                      <% 
            for(i = 0; i < list.size(); i++) {        
                ProjectData data  = (ProjectData)list.get(i);                             
                v_ordseq        = data.getOrdseq();     
                v_projseq       = data.getProjseq();
                v_lesson        = data.getLesson();     
                v_title         = data.getTitle();      
                v_reptype       = data.getReptype();    
                v_projgrp       = data.getProjgrp();        
                v_score         = data.getScore();      //����
                v_score2        = data.getScore2();     //�������
                v_cnt           = data.getCnt();
                if(v_cnt == 0){ 
                    v_rep_value = "������";    
                    v_jud_value = "����";
                }else{                  
                    v_rep_value = "����";  
                    v_jud_value = v_score2 + "";
                 }
                    
              if(v_reptype.equals("C")){
          %>
                      <% }else{ %>
                      <tr> 
                        <td class="board_text1" height="27"><%= i + 1 %></td>
                        <td class="board_text3" height="27"><a href="javascript:whenRrojectSubmit('<%=v_projseq%>', '<%=v_ordseq%>','<%=v_lesson%>','<%=v_reptype%>','<%=v_projgrp%>', '<%=v_cnt%>')"><%=v_title%></a></td>
                        <td class="board_text1" height="27"><font color="#EC0000"><%=v_rep_value%></font></td>
                        <td class="board_text1" height="27"><font color="#EC0000"><%=v_jud_value%></font> / <%=v_score%></td>
                        <td class="board_text1" height="27"> <a href="javascript:whenRrojectSubmit('<%=v_projseq%>', '<%=v_ordseq%>','<%=v_lesson%>','<%=v_reptype%>','<%=v_projgrp%>', '<%=v_cnt%>')"><img src="/images/user/button/report_send_butt1.gif"  border="0"></a> 
                        </td>
                      </tr>
                      <% }
            } %>
                    </table>

                </td>
              </tr>
            </table>
            <!----------------- ����Ʈ  ����Ʈ �� ---------------->

            <!----------------- ���ư���, �ݱ� ��ư ���� ---------------->
            <table cellspacing="0" cellpadding="0" class="open_board_table_out1">
              <tr> 
                <td height="11"></td>
              </tr>
              <tr> 
                <td align="right">
                <a href="javascript:self.close()"><img src="/images/user/button/btn_close.gif" border="0"></a>
                </td>
              </tr>
            </table>
            <!----------------- ���ư���, �ݱ� ��ư �� ----------------->

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
