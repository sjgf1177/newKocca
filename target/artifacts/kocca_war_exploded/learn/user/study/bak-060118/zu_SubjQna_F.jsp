<%
//**********************************************************
//  1. ��      ��: SUBJ QNA FRAME
//  2. ���α׷���: zu_SubjQna_F.jsp
//  3. ��      ��: ���� ���� ������
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: S.W.Kang 2004. 12. 08
//  7. ��      ��:
//**********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page import = "com.credu.library.*" %>
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String v_subj       = box.getString("p_subj");
    String v_year       = box.getString("p_year");
    String v_subjseq    = box.getString("p_subjseq");
    
%>
<script language="javascript">
    function init() {
        this.moveTo(0,0);
        this.resizeTo(1000,750);
    }
init();
</script>


<html>
<head>
<title>eIBIs</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
</head>
  <frameset cols="290,*" frameborder="NO" border="0" framespacing="0" rows="*"> 
    <frame name="leftFrame" src="/servlet/controller.study.SubjQnaStudyServlet?p_process=SubjQnaSubjseqList&p_subj=<%= v_subj%>&p_year=<%= v_year %>&p_subjseq=<%= v_subjseq %>" frameborder="NO" scrolling="AUTO">
    <frame name="rightFrame" src="/learn/user/study/zu_SubjQna_B.jsp"frameborder="YES" scrolling="AUTO">
  </frameset>
<noframes> 
<body bgcolor="#FFFFFF" text="#000000" >
</body>
</noframes> 
</html>
