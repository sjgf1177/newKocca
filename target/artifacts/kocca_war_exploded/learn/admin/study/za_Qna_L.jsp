<%
//**********************************************************
//  1. ��      ��: ���� ���ó� QNA ����Ʈ
//  2. ���α׷���: za_Qna_L.jsp
//  3. ��      ��: ���� admin bean
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ���� 2004. 11. 26
//  7. ��      ��: 
//**********************************************************
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
    String  v_title="", v_jikwinm="", v_asgnnm="" ,v_cono="", v_inuserid="",v_inusernm="";
    String  v_indate=""; 
	String 	v_replyusernm = "";	//���� ������ �̸�
	String 	v_replyindate = ""; //���� ������
	String  v_replyassgnnm = "";//���� ������ �Ҽ�
	String  v_replyjikwinm = "";//���� ������ ����
	int	 	v_delayday = 0; //��ü��
    int   	v_seq = 0, v_anscnt = 0 ;
    int  	v_qcnt     = 0;
    int  	v_nanscnt	=0;
    int     i            = 0;
    ArrayList list1      = null;

    String  v_subj    = box.getString("p_subj");        //�����ڵ�
    String  v_year    = box.getString("p_year");         //�⵵
    String  v_subjseq = box.getString("p_subjseq");       //���� ����
    String  v_lesson  = box.getString("p_lesson");
    //DEFINED in relation to select END

    list1 = (ArrayList)request.getAttribute("qnaList");

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!--
    function qna_select(seq) {    	  
        document.ff.target = "_self";        
        document.ff.p_process.value = 'QnaDetail';
        document.ff.p_seq.value = seq;
        document.ff.submit();
    }

	function goQnaSubjseqListPage() {
		document.ff.p_process.value = 'QnaSubjseqList';
	  document.ff.submit();
	}
-->
</SCRIPT>
</head>

<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="ff" method="post" action="/servlet/controller.study.QnaAdminServlet">
		<input type="hidden" name="p_process" value="QnaDetail">
		<input type="hidden" name="p_subj"   value="<%=v_subj%>">
		<input type="hidden" name="p_year"   value="<%=v_year%>">
		<input type="hidden" name="p_subjseq"   value="<%=v_subjseq%>">
		<input type="hidden" name="p_lesson"   value="<%=v_lesson%>">
		<input type="hidden" name="p_seq"   value="">


  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top">
      <!----------------- title ���� ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/course/co_title05.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>  
	        <!----------------- title �� ----------------->
      <br>
<!--
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="/images/admin/study/icon1.gif" width="14" height="10" border="0">�����׷�
            &gt; �⵵ &gt; �������� &gt; �з� &gt; ���� &gt; ���� &gt; ����</td>
        </tr>
      </table>
      <br>
-->
      <!----------------- ����Ʈ ��ư ���� ----------------->
      <table width="97%" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td align="right" height="20"><a href="javascript:goQnaSubjseqListPage();"><img src="/images/admin/button/btn_list.gif"  border="0"></a></td>
        </tr>
        <tr>
          <td height="3"></td>
        </tr>
      </table>
      <!----------------- ����Ʈ ��ư �� ----------------->
      <!----------------- ������ ���� ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
        <tr>
          <td colspan="11" class="table_top_line"></td>
        </tr>
        <tr>
          <td width="5%" height="25" class="table_title" width='3%'><b>NO</b></td>
          <td class="table_title"><b>��������</b></td>
          <td class="table_title" width='5%'><b>����</b></td>
          <td class="table_title" width='25%'><b>�Ҽ�</b></td>
          <td class="table_title" width='5%'><b>����</b></td>
          <td class="table_title" width='5%'><b>���</b></td>
          <td class="table_title" width='5%'><b>����</b></td>
          <td class="table_title" width='7%'><b>�ۼ���</b></td>
		  <td class="table_title" width='7%'><b>��ü��</b></td>
		  <td class="table_title" width='7%'><b>������</b></td>
		  <td class="table_title" width='7%'><b>������</b></td>
        </tr>
        <%
            for(i = 0; i < list1.size(); i++) {
                QnaData data= (QnaData)list1.get(i);
                  v_seq     = data.getSeq();
                  v_title   = data.getTitle();
                  v_jikwinm = data.getJikwinm();
                  v_asgnnm  = data.getAsgnnm();
                  v_cono    = data.getCono();
                  v_inuserid= data.getInuserid();
                  v_inusernm= data.getInusernm();
                  v_indate  = FormatDate.getFormatDate(data.getIndate(),"yyyy/MM/dd");
                  v_seq     = data.getSeq();
                  v_anscnt  = data.getAnscnt();
				  v_replyusernm =  data.getReplyusernm();	//���� ������ �̸�
				  v_replyindate =  FormatDate.getFormatDate(data.getReplyindate(),"yyyy/MM/dd"); //���� ������
				  v_replyassgnnm = data.getReplyasgnnm();//���� ������ �Ҽ�
				  //v_replyjikwinm = data.getreplyjikwinm();//���� ������ ����
				  v_delayday 	= data.getDelayday();
        %>
        <tr>
          <td class="table_01" height="25"><%= list1.size() - i %></td>
          <td class="table_02_1"><a href="javascript:qna_select(<%=v_seq%>);"><%= v_title %></a></td>
          <td class="table_02_1"><% if(v_anscnt > 0 ){ out.println("Y"); } else { out.println("N"); }%></td>
          <td class="table_02_1"><%= v_asgnnm %></td>
          <td class="table_02_1"><%= v_jikwinm %></td>
          <td class="table_02_1"><%= v_cono %></td>
          <td class="table_02_1"><%= v_inusernm %></td>
          <td class="table_02_1"><%= v_indate %></td>
		  <td class="table_02_1"><%= v_delayday %></td>
		  <td class="table_02_1"><%= v_replyindate %></td>
		  <td class="table_02_1"><%= v_replyusernm %></td>
        </tr>
        <%
    			}
        if (i == 0) {
%>
            <td class="table_02_1" colspan='11'>��ϵ� ������ �����ϴ�.</td>
<%
        }
%>

      </table>
      <!----------------- ������ �� ----------------->
      <br>
    </td>
  </tr>
</table>

<%@ include file = "/learn/library/getJspName.jsp" %>
</form>
</body>
</html>
