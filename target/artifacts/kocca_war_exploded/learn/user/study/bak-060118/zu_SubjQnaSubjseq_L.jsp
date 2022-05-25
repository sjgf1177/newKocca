<%
//**********************************************************
//  1. ��      ��: SUBJ QNA LIST
//  2. ���α׷���: zu_SubjQnaSubjseq_L.jsp
//  3. ��      ��: ���� admin bean
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: �迵�� 2003. 9. 1
//  7. ��      ��:
//**********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
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
    String  ss_grcode    = box.getString("ss_grcode");        //�����׷�
    String  ss_gyear     = box.getString("ss_gyear");         //�⵵
    String  ss_grseq     = box.getString("ss_grseq");         //��������
    String  ss_uclass    = box.getString("ss_uclass");        //�����з�
    String  ss_subjcourse= box.getString("ss_subjcourse");    //����&�ڽ�
    String  ss_subjseq   = box.getString("ss_subjseq");       //���� ����

    String  v_process   = box.getString("p_process");    
    String  v_lesson		= "";
    String  v_lessonnm  = "";
    int  v_qcnt     = 0;    
    int  v_nanscnt	=0;
    int     i            = 0; 
    ArrayList list1      = null; 
    //DEFINED class&variable END

    String v_gadminYn = (String)request.getAttribute("GadminYn");  // ��ڿ��� 1:���,0:�н���
    //DEFINED in relation to select START
    String  v_subj    = box.getString("p_subj");        //�����ڵ�
    String  v_year     = box.getString("p_year");         //�⵵
    String  v_subjseq   = box.getString("p_subjseq");       //���� ����
    //DEFINED in relation to select END
    
    list1 = (ArrayList)request.getAttribute("SubjqnaSubjseqList");
        
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/user_style_study.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!--
   function qnalist_select(lesson,lessonnm) {
        document.ff.target = "rightFrame";
        document.ff.action='/servlet/controller.study.SubjQnaStudyServlet';
        document.ff.p_process.value = 'SubjQnaList';
        document.ff.p_subj.value = '<%=v_subj%>';                
        document.ff.p_year.value = '<%=v_year%>';     
        document.ff.p_subjseq.value = '<%=v_subjseq%>';  
        document.ff.p_lesson.value = lesson;
        document.ff.p_lessonnm.value = lessonnm;
        document.ff.submit();
        
    }

	function goQnaSubjListPage() {	  
	  document.ff.submit();
	}    
-->    	
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="ff" method="post" action="/servlet/controller.study.SubjQnaStudyServlet">
		<input type="hidden" name="p_process"    value="SubjQnaList">
		<input type="hidden" name="p_subj"       value="">
		<input type="hidden" name="p_year"       value="">
		<input type="hidden" name="p_subjseq"    value="">
		<input type="hidden" name="p_lesson"     value="">
		<input type="hidden" name="p_lessonnm"   value="">
		<input type="hidden" name="s_grcode"     value="<%=ss_grcode%>">
		<input type="hidden" name="s_gyear"      value="<%=ss_gyear%>">
		<input type="hidden" name="s_grseq"      value="<%=ss_grseq%>">
		<input type="hidden" name="s_uclass"     value="<%=ss_uclass%>">
		<input type="hidden" name="s_subjcourse" value="<%=ss_subjcourse%>">
		<input type="hidden" name="s_subjseq"    value="<%=ss_subjseq%>">
		<input type="hidden" name="p_gadminYn"   value="<%=v_gadminYn%>">

  <table width="270" border="0" cellspacing="0" cellpadding="0">
    <tr>
    <td align="center" valign="top"> 

      <br>
      <br>

      
      <!----------------- �������ú� ������Ȳ ��ȸ ���� ----------------->
      
      <table cellspacing="0" cellpadding="0" class="open_board_table_out1" align="center">
        <tr> 
            <td class="board_color_line"></td>
        </tr>
      </table>
      
      <table width="97%"  class="open_board_table_out2" border="0" cellspacing="1" cellpadding="5">
        
        <tr> 
          <td class="board_title_bg1" width="7%"><b>����</b></td>
          <td class="board_title_bg1"><b>���ø�</b></td>
          <td class="board_title_bg1" width="10%"><b>������</b></td>
          <td class="board_title_bg1" width="10%"><b>�����䰹��</b></td>
        </tr>
        
        <%
            for(i = 0; i < list1.size(); i++) {
                QnaData data= (QnaData)list1.get(i);
                v_qcnt     	= data.getQcnt();    
                v_nanscnt   =	data.getNoanscnt(); 
                v_lesson    = data.getLesson();
                v_lessonnm  = data.getLessonnm();

        %>        
        <tr> 
          <td class="board_text6" align="center"><%= v_lesson %></td>
          <td class="board_text1"><a href="javascript:qnalist_select('<%=v_lesson%>','<%=v_lessonnm%>');"><%= v_lessonnm%></a></td>
          <td class="board_text1"><%= v_qcnt %></td>
          <td class="board_text1"><%= v_nanscnt %></td>
        </tr>
        <%
    			}
        %>

      </table>
      <!----------------- �������ú� ������Ȳ ��ȸ �� ----------------->
      <br>
    </td>
  </tr>
</table>

</form>
</body>
</html>
