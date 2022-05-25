<%
/**
 * file name : za_ExamPreview.jsp
 * date      : 2003/09/12
 * programmer:
 * function  : �򰡹����� �̸�����
 */
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.exam.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
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
    String v_subjnm   = GetCodenm.get_subjnm(v_subj);
    
    String v_userid   = box.getString("p_userid"); 
    String v_error_msg= box.getString("p_error_msg"); 
   
    ArrayList list = (ArrayList)request.getAttribute("PaperQuestionExampleList");
    QuestionExampleData data = null;
    ExampleData      subdata = null;
    QuestionTextData textdata = null;

   // String v_urldir = conf.getProperty("url.upload"); �򰡿� ��ϵ� �̹��� ��� 
   String v_urldir = "/upload/bulletin/";
    
    String s_gadmin = box.getSession("gadmin");
%>
<html>
<head>
<title>::: �ֿ��ڵ��� ������ :::</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/user_style_study.css" type="text/css">
<script language="JavaScript">
<!--
function whenSubmit(){
  var i=0;
  var b_name="";
  var c_name="";
  var c_value="";
  var b_type=""; 
  var result="";
  var temp=""; 
  var textarr ="";
  var answercnt=0;
  var replycnt =0;
  
  for(i=0;i<document.form3.length;i++) {
    c_name  = document.form3.elements[i].name;
    c_value = document.form3.elements[i].value;
    if (i == 0) {
      b_name=c_name;
    } else {
      if (c_name != b_name) {
        answercnt++;
        if (b_type=="text" || temp !="") {
          replycnt++;
        }
        if (answercnt==1) {
          result = temp;
        } else {
          result = result + ","+ temp;
        }
        b_name = c_name;
        temp = "";
      }
    }
    if (document.form3.elements[i].type=="checkbox") {
      b_type="checkbox";
      if (document.form3.elements[i].checked==true) {
        temp = temp+c_value+':';
      }
    } else if (document.form3.elements[i].type=="radio") {
      b_type="radio";
      if (document.form3.elements[i].checked==true) {
        temp = c_value;
      }
    } else if (document.form3.elements[i].type=="text"||document.form3.elements[i].type=="textarea") {
      b_type="text";
      temp  = "";
      textarr = c_value.split(",");
      for(var j=0; j<textarr.length; j++) {
        temp = temp + textarr[j];
      }
    }
  }
  if (b_type=="text" || temp !="") {
    replycnt++;
  }
  answercnt++;
  if (answercnt==1) {
    result = temp;    
  } else {
    result = result + ","+ temp;
  }
  
  if (replycnt < answercnt) {
    alert("Ǯ������ ������ �ֽ��ϴ�.��� ������ �����ֽñ� �ٶ��ϴ�.");
    return;
  }
  document.form2.p_answer.value = result;
  document.form2.p_process.value = "UserResultInsert";
  document.form2.submit();
}
function whenAdminSubmit(){
  alert('�������Դϴ�.');
  top.etop.goExNext();
}
-->
</script>
</head>
<body>
<!----------------- Ÿ��Ʋ ���� ----------------->
<table cellspacing="0" cellpadding="0" class="open_table_out" align="center">
  <tr>                 
    <td background="/images/user/research/b_title_dot.gif"><img src="/images/user/study/exam_title1.gif" width="240" height="37" border="0"></td>
  </tr>
  <tr><td height="7"></td></tr>
</table>
<!----------------- Ÿ��Ʋ �� ---------------->
<br>
<table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
  <tr> 
    <td width="13"><img src="/images/user/research/icon2.gif" width="13" height="11" border="0"></td>
    <td><b>������ : [<%=v_subjnm%>] ���� : [<%=v_year%>] ���� : [<%=v_subjseq%>] ���� : [<%=v_lesson%>] ��Ÿ�� : [<%=GetCodenm.get_codenm(ExamBean.PTYPE, v_ptype)%>]</b></td>
  </tr>
  <tr> 
    <td height="5"></td>
  </tr>
</table>
<!----------------- �н��� ���� ---------------->
<table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
  <tr> 
    <td class="board_color_line"></td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" class="open_board_table_out2" align="center">
<form name="form2" method="post" action="/servlet/controller.exam.ExamServlet">
  <input type="hidden" name="p_process"   value="">
  <input type="hidden" name="p_subj"      value="<%=v_subj%>">
  <input type="hidden" name="p_year"      value="<%=v_year%>">
  <input type="hidden" name="p_subjseq"   value="<%=v_subjseq%>">
  <input type="hidden" name="p_lesson"    value="<%=v_lesson%>">
  <input type="hidden" name="p_ptype"     value="<%=v_ptype%>">
  <input type="hidden" name="p_branch"    value="<%=v_branch%>">
  <input type="hidden" name="p_papernum"  value="<%=v_papernum%>">
  <input type="hidden" name="p_userid"    value="<%=v_userid%>">
  <input type="hidden" name="p_answer"    value="">
</form>
  <tr> 
    <td> 
      <table cellspacing="1" cellpadding="3" class="table2">
      <form name="form3" method="post" action="/servlet/controller.exam.ExamServlet">
<%  for (int i=0; i < list.size(); i++) {
        data = (QuestionExampleData)list.get(i);%>
        <tr> 
          <td class="board_title_bg5"><%="["+String.valueOf(i+1)+"]" + data.getText()%></td>
        </tr>

<%
    if (data.getAddseq() != 0) {
         textdata = ExamBean.getQuestionTextData(v_subj, data.getAddseq());
%>

<!-- ����, �����̹���, ��������, ���������� ����  ����-->
        <tr> 
          <td class="board_text4"><%=textdata.getAddtext()%></td>
        </tr>
<%  if (!textdata.getImgurl().equals("")) {              %> 
        <tr> 
          <td bgcolor="#FFFFFF"> 
            <table cellspacing="0" cellpadding="0" class="img_table_out">
              <tr> 
                <td> 
                  <table cellspacing="2" cellpadding="2">
                    <tr> 
                      <td class="img_table" height="26"><img src='<%=v_urldir+textdata.getImgurl()%>'></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
<%      }  %>  
<%      if (!textdata.getMediaurl().equals("")) { %> 
        <tr> 
          <td class="board_text4"> <img src="/images/user/study/voice_icon1.gif" width="20" height="17" border="0"><a href="<%=v_urldir+textdata.getMediaurl()%>" target="_new"><%=textdata.getRealmediaurl()%></a></td>
        </tr>
<%      }  %>  
<%  }                                               %>
<!-- ����, �����̹���, ��������, ���������� ���� ��-->


<!-- �������� �̹���, ����, ������ ���� ���� -->
<%      if (!data.getImgurl().equals("")) { %> 
        <tr> 
          <td bgcolor="#FFFFFF"> 
            <table cellspacing="0" cellpadding="0" class="img_table_out">
              <tr> 
                <td> 
                  <table cellspacing="2" cellpadding="2">
                    <tr> 
                      <td class="img_table" height="26"><img src='<%=v_urldir+data.getImgurl()%>'></td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </td>
        </tr>
<%      }  %>  
<%      if (!data.getMediaurl().equals("")) { %> 
        <tr> 
          <td class="board_text4"> <img src="/images/user/study/voice_icon1.gif" width="20" height="17" border="0"><a href="<%=v_urldir+data.getMediaurl()%>" target="_new"><%=data.getRealmediaurl()%></a></td>
        </tr>
<%      }  %>  
<%      if (!data.getRefurl1().equals("")) { %> 
        <tr> 
          <td class="board_text3"> <img src="/images/user/study/meida_icon1.gif" width="20" height="17" border="0"><a href="<%=v_urldir+data.getRefurl1()%>" target="_new"><%=data.getRealrefurl1()%></a></td>
        </tr>
<%      }  %>        
<!-- �������� �̹���, ����, ������ ���� �� -->

<%      if (data.getExamtype().equals(ExamBean.OBJECT_QUESTION)) {   // ������ 
            for (int j=1; j <= data.size(); j++) {
                subdata  = (ExampleData)data.get(j); 
                if (subdata != null) { %>
        <tr> 
          <td class="board_text4"> 
            <input type="radio" name="<%=data.getExamnum()%>" value="<%=subdata.getSelnum()%>" class='inputradio'><%=subdata.getSelnum()%>. <%=subdata.getSeltext()%></td>
        </tr>
<%              }
            }
        } else if (data.getExamtype().equals(ExamBean.MULTI_QUESTION)) {  // �ٴ��
            for (int j=1; j <= data.size(); j++) {
                subdata  = (ExampleData)data.get(j); 
                if (subdata != null) { %>
        <tr> 
          <td class="board_text4"> 
            <input type="checkbox" name="<%=data.getExamnum()%>" value="<%=subdata.getSelnum()%>" class='inputradio'><%=subdata.getSelnum()%>. <%=subdata.getSeltext()%></td>
        </tr>
<%              } 
            }
        } else if (data.getExamtype().equals(ExamBean.SUBJECT_QUESTION)) {  // �ְ���  %>
        <tr> 
          <td class="board_text3"> 
            <textarea name="<%=data.getExamnum()%>" cols="90" rows="15" class="input"></textarea>
          </td>
        </tr>
<%      }
    } %>
      </form> 
      </table>
    </td>
  </tr>
</table>
<!----------------- �н��� �� ---------------->
<br>
<!----------------- ���� ��ư ���� ---------------->
<table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
  <tr>                
    <td align="right">
<%  if (list.size() > 0) { %>
<%      if (s_gadmin.equals("ZZ")) { %>      
      <a href="javascript:whenSubmit()">
<%      } else { %>      
      <a href="javascript:whenAdminSubmit()">      
<%      }  %>      
      <img src="/images/user/study/presentation_butt1.gif" width="54" height="20" border="0"></a>      
<%  } %>
    </td>
  </tr>
<%  if (!v_error_msg.equals("")) { %> 
  <tr>                
    <td align="left"><%=v_error_msg%></td>
  </tr>
  <tr>                
    <td align="right"><a href="javascript:top.etop.goExNext();"><img src="/images/user/study/presentation_butt1.gif" width="54" height="20" border="0"></a></td>
  </tr>
<%  } %>
</table>
<!----------------- ���� ��ư �� ----------------->
<br>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
