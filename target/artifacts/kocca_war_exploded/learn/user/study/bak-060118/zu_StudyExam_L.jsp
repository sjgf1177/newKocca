<%
//**********************************************************
//  1. ��      ��: ���� �� ����Ʈ
//  2. ���α׷���: zu_StudyExam_L.jsp
//  3. ��      ��: ���� �� ����Ʈ
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004.2.27
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    String v_promotion  = (String)request.getAttribute("promotion");       //����������
    String v_progress   = (String)request.getAttribute("progress");       // �ڱ�������
    String v_mylesson   = (String)request.getAttribute("mylesson");       // �ڱ�����
	int v_mylesson1 = 0;
	if(!v_mylesson.equals("")){
	     v_mylesson1 = Integer.parseInt(v_mylesson);
	}
%>
<html>
<head>
<title>::: �� :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/user_style_study.css" type="text/css">
<SCRIPT LANGUAGE = "JAVASCRIPT" SRC = "/script/hhi_lib.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
<!--
    function init() {
        this.moveTo(0,0);
        this.resizeTo(800,600);
    }

// ���� ���� 
function examWright(plessonstart, p_lesson, p_examtype, p_papernum, p_userretry){

    document.form1.action = "/servlet/controller.exam.ExamUserServlet";
    document.form1.p_process.value = 'ExamUserPaperListPage';
    document.form1.p_lessonstart.value = plessonstart;  // ���� ���� 
    document.form1.p_lesson.value = p_lesson;
    document.form1.p_examtype.value = p_examtype;
    document.form1.p_papernum.value = p_papernum;
    document.form1.p_userretry.value = p_userretry;
	document.form1.submit();


}

// �������
function IndividualResult(lesson, type, papernum) {
  window.self.name = "winIndividualResult";
  farwindow = window.open("", "openIndividualResult", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes, resizable=yes,copyhistory=no, width=680, height=600, top=0, left=0");
  document.form1.target = "openIndividualResult";
  document.form1.action = "/servlet/controller.exam.ExamUserServlet";
  document.form1.p_process.value = "ExamUserPaperResult";
  
  //document.form1.p_subj.value     = p_subj; 
  //document.form1.p_gyear.value    = p_year; 
  //document.form1.p_subjseq.value  = p_subjseq; 
  document.form1.p_lesson.value     = lesson; 
  document.form1.p_examtype.value   = type; 
  document.form1.p_papernum.value   = papernum; 
  //document.form1.p_userid.value   = p_userid;
  
  document.form1.submit();
  farwindow.window.focus();
  document.form1.target = window.self.name;
}

// ���� ���� 
//function examInformation(p_subj, p_year, p_subjseq, p_examtype, p_lesson, p_papernum){
//
//    document.form1.action = "/servlet/controller.exam.ExamUserServlet";
//    document.form1.p_process.value = 'ExamUserPaperResult';
//    document.form1.p_subj.value = p_subj;
//    document.form1.p_year.value = p_year;
//    document.form1.p_subjseq.value = p_subjseq;
//    document.form1.p_examtype.value = p_examtype;
//    document.form1.p_lesson.value = p_lesson;
//    document.form1.p_papernum.value = p_papernum;
//	document.form1.submit();
//
//
//}
//-->
</SCRIPT>
</head>

<body topmargin="0" leftmargin="0" onLoad='init();'>
<table cellpadding="0" cellspacing="10" bgcolor="#EEEEEE" width="770" height="100%" align="center">
  <tr> 
    <td> 
      <table cellpadding="0" cellspacing="1" bgcolor="#BEBEBE" class="table2" height="100%">
        <tr> 
          <td align="center" valign="top" class="body_color"> 

 	 		        <br>
            		<!----------------- Ÿ��Ʋ ���� ----------------->
  						<table cellspacing="0" cellpadding="0" class="open_table_out" align="center">
    						<tr> 
      							<td><img src="/images/user/study/valuation_title.gif"></td>
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
<%
         ArrayList blist = (ArrayList)request.getAttribute("ExamUserList");
         ArrayList list = (ArrayList)request.getAttribute("ExamUserResultList");
         ArrayList list1 = (ArrayList)request.getAttribute("ExamUserRetryList");
  
		 DataBox dbox01 = null;
		 DataBox dbox02 = null;
		 if(blist.size() > 0){
		     dbox01 = (DataBox)blist.get(0);
		 }else{
		     dbox01 = new DataBox("resoponsebox");
		 }

		 int count = 0;
%>
 <form name="form1" method="post" action="/servlet/controller.exam.ExamUserServlet">
        <input type="hidden" name="p_process" value="">
        <input type="hidden" name="p_action"  value="">
        <input type="hidden" name="p_subj"    value="<%=dbox01.getString("d_subj")%>">
        <input type="hidden" name="p_year"   value="">
        <input type="hidden" name="p_grcode"  value="<%=dbox01.getString("d_grcode")%>">
        <input type="hidden" name="p_gyear"   value="<%=dbox01.getString("d_year")%>">
        <input type="hidden" name="p_subjseq"  value="<%=dbox01.getString("d_subjseq")%>">
        <input type="hidden" name="p_lesson"  value="">
        <input type="hidden" name="p_papernum"  value="">
        <input type="hidden" name="p_examtype"  value="">
        <input type="hidden" name="p_userretry"  value="">
        <input type="hidden" name="p_userid"  value="<%=box.getSession("userid")%>">

        

        
        
        
    <input type="hidden" name="p_lessonstart"   value="">          
</form>
              <tr> 
                <td> 
                  <table cellspacing="1" cellpadding="3" class="table2">
                    <tr> 
                      <td class="board_title_bg1" width="5%">��ȣ</td>
                      <td class="board_title_bg1" width="6%">����</td>
					  					<td class="board_title_bg1" width="19%">��������</td>
                      <td class="board_title_bg1" width="7%">������</td>
                      <td class="board_title_bg1" width="7%">����</td>
                      <td class="board_title_bg1" width="10%">������ ����</td>
					  	<td class="board_title_bg1" width="10%">����</td>
					  	<td class="board_title_bg1" width="10%">��������</td>					  
						<td class="board_title_bg1" width="10%">�������</td>						  					
                      <td class="board_title_bg1" width="15%">������/��������</td>
					</tr>
<%
        for (int i=0; i<blist.size(); i++) {
            DataBox dbox = (DataBox)blist.get(i);   

			String isExam = (String)list.get(i);
			String isRetry = (String)list1.get(i);
			int v_retry = 0;
			String v_retry2 = "";

			if(isRetry.equals("-1")){		//		���� �ش� �򰡸� ���� �������� �������
			   v_retry = dbox.getInt("d_retrycnt");
			} else if(isRetry.equals("0")){		//		������ �򰡰� �ִ� ��� �� ���� ��  �����ð� �������
			   v_retry = Integer.parseInt(isRetry);
			   v_retry2 = "-";
			}
	//		else if(isRetry.equals("1")){		//		������ �򰡰� �ִ� ��� �� ���� ��  �����ð� �������
	//		   v_retry = Integer.parseInt(isRetry);
	//		}
		     else if(!isRetry.equals("X")) {
//			   v_retry = Integer.parseInt(isRetry)-1;
			   v_retry = Integer.parseInt(isRetry);
			 }
			 else if(isRetry.equals("X")) {
			   v_retry2 = "-";
			 }

				count ++; 
%>
                    <tr> 
				      <td  class=board_text1><%=String.valueOf(count)%></td>
				      <td  class=board_text1><%=dbox.getString("d_lesson")%></td>
<%
//    if(dbox.getString("d_examtype").equals("E")){
%>
					  <td  class=board_text1>
					  <%if(Double.parseDouble(v_progress)>=Double.parseDouble(dbox.getString("d_progress"))) {  //  ������������ �Ѿ ���
								if(!isRetry.equals("X")) {			//		�����ð� �ִ� �� ���
									if(v_retry > 0 || !v_retry2.equals("-")) {		%>
					  <a href="javascript:examWright('<%=dbox.getString("d_lessonstart")%>', '<%=dbox.getString("d_lesson")%>','<%=dbox.getString("d_examtype")%>','<%=dbox.getString("d_papernum")%>','<%=v_retry%>')" class="b">[Ŭ��]&nbsp;<%=dbox.getString("d_examtypenm")%></a>
					  <%			}
									else {	%>
										<%=dbox.getString("d_examtypenm")%>
					  <%			}	
								}
								else {			//		�����ð� ���� �� ��� �������� ���⿩�θ� üũ
									if(isExam.equals("0")) {%>
					  <a href="javascript:examWright('<%=dbox.getString("d_lessonstart")%>','<%=dbox.getString("d_lesson")%>','<%=dbox.getString("d_examtype")%>','<%=dbox.getString("d_papernum")%>','<%=v_retry%>')"><%=dbox.getString("d_examtypenm")%>[Ŭ��]&nbsp;</a>
					   <%			}
									else {	%>
										<%=dbox.getString("d_examtypenm")%>
					  <%			}
								}
							}else{%>
					  <%=dbox.getString("d_examtypenm")%>
					  <%}%>
					  <!-- a href="javascript:examInformation('<%=dbox.getString("d_subj")%>', '<%=dbox.getString("d_year")%>' , '<%=dbox.getString("d_subjseq")%>', '<%=dbox.getString("d_examtype")%>','<%=dbox.getString("d_lesson")%>','<%=dbox.getString("d_papernum")%>')" class="b">[Ŭ��]&nbsp;<%=dbox.getString("d_examtypenm")%></a -->
					  
					  </td>
					  
				      <td  class=board_text1><%=String.valueOf(dbox.getInt("d_examcnt"))%></td>
					  <td  class=board_text1><%=String.valueOf(dbox.getString("d_totalscore"))%></td>
				      <td  class=board_text1><%=isRetry.equals("X") ||  isRetry.equals("0")? v_retry2 : v_retry+""%></td>
					  <%if((Double.parseDouble(v_progress)>=Double.parseDouble(dbox.getString("d_progress"))) && (v_retry>0 || !v_retry2.equals("-"))){%>
                      <td  class=board_text1><font color="red">���ð���</font></td>
					  <%}else if((Double.parseDouble(v_progress)<Double.parseDouble(dbox.getString("d_progress")))){%>
                      <td  class=board_text1><font color="red">�����̴�</font></td>
					  <%}else if(isExam.equals("1")){%>
                      <td  class=board_text1><font color="red">���ÿϷ�</font></td>
					  <%}else if(isRetry.equals("X") && isExam.equals("0")){%>
                      <td  class=board_text1><font color="red">���ð���</font></td>
					  <%}%>
				      <td  class=board_text1><%=dbox.getString("d_score")%></td>					  
					  <td  class=board_text1>
<%if(dbox.getString("d_isopenanswer").equals("Y")){%>					  
  <%if(dbox.getString("d_score").equals("-")){%>-
  <%}else{%>
	<a href="javascript:IndividualResult('<%=dbox.getString("d_lesson")%>','<%=dbox.getString("d_examtype")%>','<%=dbox.getString("d_papernum")%>')" class="b">					  
	�������
	</a>		
  <%}%>			          
<%}else{%>
-
<%}%>

					  </td>				      
				      <td  class=board_text1><%=v_progress%> / <%=dbox.getString("d_progress")%></td>
				      
					</tr>
<%
//	 } else {	
%>
			<!--		  <td  class=board_text3>
					  <%//if(isExam.equals("0") && (v_mylesson1>=Integer.parseInt(dbox.getString("d_lesson"))) ){%>
					  <a href="javascript:examWright('<%//=dbox.getString("d_lesson")%>','<%//=dbox.getString("d_examtype")%>','<%//=dbox.getString("d_papernum")%>','<%//=v_retry%>')"><%//=dbox.getString("d_examtypenm")%></a>
					  <%//}else{%>
					  <%//=dbox.getString("d_examtypenm")%>
					  <%//}%>
					  </td>
				      <td  class=board_text1><%//=String.valueOf(dbox.getInt("d_examcnt"))%></td>
					  <td  class=board_text1><%//=String.valueOf(dbox.getString("d_totalscore"))%></td>
				      <td  class=board_text1><%//=v_retry%></td>
					  <%//if((v_mylesson1>=Integer.parseInt(dbox.getString("d_lesson"))) && v_retry>0){%>
                      <td  class=board_text1><font color="red">���ð���</font></td>
					  <%//}else if((v_mylesson1<Integer.parseInt(dbox.getString("d_lesson")))){%>
                      <td  class=board_text1><font color="red">�ش����� �н��� ����</font></td>
					  <%//}else if(isExam.equals("1")){%>
                      <td  class=board_text1><font color="red">���ÿϷ�</font></td>
					  <%//}%>
				      <td  class=board_text1></td>
					</tr>-->
<%
//	 }						  
%>

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
                <td height="11" colspan="3"></td>
              </tr>
              <tr> 
                <td align="center"></td>
                <td align="right" width="61">
                </td>
                <td align="right" width="65"><a href="javascript:self.close()"><img src="/images/user/button/btn_close.gif"  border="0"></a></td>
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
</body>
</html>
