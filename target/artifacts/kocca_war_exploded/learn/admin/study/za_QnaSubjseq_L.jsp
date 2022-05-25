<%
//**********************************************************
//  1. ��      ��: QNA DATA
//  2. ���α׷���: za_QnaSubjseq_L.jsp
//  3. ��      ��: ���� admin bean
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ����� 2003. 8. 18
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

    //DEFINED in relation to select START
    String  v_subj    = box.getString("p_subj");        //�����ڵ�
    String  v_year     = box.getString("p_year");         //�⵵
    String  v_subjseq   = box.getString("p_subjseq");       //���� ����
    //DEFINED in relation to select END
    
    list1 = (ArrayList)request.getAttribute("qnaSubjseqList");
        
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!--
   function qnalist_select(lesson) {
        document.ff.target = "_self";
        document.ff.action='/servlet/controller.study.QnaAdminServlet';
        document.ff.p_process.value = 'QnaList';
        document.ff.p_subj.value = '<%=v_subj%>';                
        document.ff.p_year.value = '<%=v_year%>';     
        document.ff.p_subjseq.value = '<%=v_subjseq%>';  
        document.ff.p_lesson.value = lesson;
        document.ff.submit();
    }

	function goQnaSubjListPage() {	  
	  document.ff.submit();
	}    
-->    	
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="ff" method="post" action="/servlet/controller.study.QnaAdminServlet">
		<input type="hidden" name="p_process" value="QnaSubjList">
		<input type="hidden" name="p_subj"   value="">
		<input type="hidden" name="p_year"   value="">
		<input type="hidden" name="p_subjseq"   value="">
		<input type="hidden" name="p_lesson"   value="">
		<input type="hidden" name="s_grcode"      value="<%=ss_grcode%>">
		<input type="hidden" name="s_gyear"       value="<%=ss_gyear%>">
		<input type="hidden" name="s_grseq"       value="<%=ss_grseq%>">
		<input type="hidden" name="s_uclass"      value="<%=ss_uclass%>">
		<input type="hidden" name="s_subjcourse"  value="<%=ss_subjcourse%>">
		<input type="hidden" name="s_subjseq"     value="<%=ss_subjseq%>">


  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top"> 

      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/co_title05.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>      <!----------------- title �� ----------------->
      <br>
<!--
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="/images/admin/study/icon1.gif" width="14" height="10" border="0">�����׷� 
            &gt; �⵵ &gt; �������� &gt; �з� &gt; ���� &gt; ����</td>
        </tr>
      </table>

      <br>
-->
      <!----------------- ����Ʈ ��ư ���� ----------------->
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr> 
          <td align="right" height="20"><a href="javascript:goQnaSubjListPage();"><img src="/images/admin/button/btn_list.gif" border="0"></a></td>
        </tr>
        <tr> 
          <td height="3"></td>
        </tr>
      </table>
      <!----------------- ����Ʈ ��ư �� ----------------->      
      <!----------------- �������ú� ������Ȳ ��ȸ ���� ----------------->
      <table width="97%"  class="table_out" border="0" cellspacing="1" cellpadding="5">
        <tr> 
          <td colspan="5" class="table_top_line"></td>
        </tr>
        <tr> 
          <td width="5%" height="25" class="table_title"><b>NO</b></td>
          <td class="table_title" width="7%"><b>����</b></td>
          <td class="table_title"><b>���ø�</b></td>
          <td class="table_title" width="10%"><b>������</b></td>
          <td class="table_title" width="10%"><b>�����䰹��</b></td>
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
          <td class="table_01" height="25"><%= list1.size() - i %></td>
          <td class="table_02_1"><%= v_lesson %></td>
          <td class="table_02_1"><a href="javascript:qnalist_select('<%=v_lesson%>');"><%= v_lessonnm%></a></td>
          <td class="table_02_1"><%= v_qcnt %></td>
          <td class="table_02_1"><%= v_nanscnt %></td>
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

<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
