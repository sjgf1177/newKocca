<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage   = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "com.credu.community.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process    = box.getStringDefault("p_process","selectmain");
    
    String  v_searchtext = box.getString("p_searchtext");
    String  v_select     = box.getString("p_select");
    String  v_cmuno      = box.getString("p_cmuno");

    String  s_userid     = box.getSession("userid");
    String  s_username   = box.getSession("name");
    String  s_grcode	 = box.getSession("tem_grcode");
	String  s_grtype	 = GetCodenm.get_grtype(box,s_grcode);

    //��������
    ArrayList listDirectBrd     = (ArrayList)request.getAttribute("listDirectBrd");

    //�Խñ�
    ArrayList listBrd     = (ArrayList)request.getAttribute("listBrd");

    //��ǥ��������
    int v_userpollcnt    = Integer.parseInt(String.valueOf(request.getAttribute("userpollcnt")));
    ArrayList listPoll       = (ArrayList)request.getAttribute("listPoll");
    
    System.out.println("listPoll : " + listPoll);
    //System.out.println("listPoll.size() : " + listPoll.size());
    
    ArrayList detailList = null;
    ArrayList cntList   = null;
    
    DataBox masterBox   = null;
    DataBox questionBox = null;
    DataBox detailBox   = null;
    DataBox cntBox      = null;
    if(listPoll !=null && listPoll.size() != 0){
    	masterBox       = (DataBox)listPoll.get(0);  //����Ʈ
    	questionBox     = (DataBox)listPoll.get(1);  //�׸�
    	detailList      = (ArrayList)listPoll.get(2);  //���ʵ�
    	cntList         = (ArrayList)listPoll.get(3);  //������
    }

    String  v_title      = "";
    String  v_fdte       = "";
    String  v_tdte       = "";
    String  v_pollno     = "";
    int     v_apply_cnt  = 0;

    if(masterBox != null){
        v_pollno     = masterBox.getString("d_pollno");
        v_title      = masterBox.getString("d_title");
        v_fdte       = masterBox.getString("d_fdte");
        v_tdte       = masterBox.getString("d_tdte");
        v_apply_cnt  = masterBox.getInt("d_apply_cnt");
    }
    
    
    // �����׸�
    String v_questno            = "";
    String v_need_question      = "";
    String v_item_cnt           = "";
    
    if(questionBox != null ){
        v_questno            = questionBox.getString("d_questno");
        v_need_question      = questionBox.getString("d_need_question");
        v_item_cnt           = questionBox.getString("d_item_cnt");
    }
    
%>  


<%@ include file="/learn/user/community/include/cm_top.jsp"%> 
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--
//��ȸ
function uf_searchOK() {
    if(document.form1.p_searchtext.value ==''){
       alert('�˻�� �Է��Ͽ����մϴ�.');document.form1.p_searchtext.focus();return;
    }

    document.form1.action = "/servlet/controller.community.CommunityFrBoardServlet";
    document.form1.p_process.value = "totalsearchPage";
    document.form1.submit();
}

//�Խ��Ǻ���
function uf_viewOK(menuno,brdno) {
    document.form1.action = "/servlet/controller.community.CommunityFrBoardServlet?p_menuno="+menuno+"&p_brdno="+brdno;
    document.form1.p_process.value = "viewPage";
    document.form1.submit();
}
//�Խ��Ǹ���Ʈ���̵�
function uf_brdlistOK(menuno) {
    document.form1.action = "/servlet/controller.community.CommunityFrBoardServlet?menuno="+menuno;
    document.form1.p_process.value = "selectlist";
    document.form1.submit();
}

//�������̵�
function goPage() {
    document.form1.action = "/servlet/controller.community.CommunityFrPollServlet?p_pageno=1";
    document.form1.p_process.value = "movelistPage";
    document.form1.submit();
}

//���� �亯
function uf_replyData() {
	<% if(userInfo == null) { %>
	alert("ȸ������ �����Դϴ�.");
    <% } else { %>
    if(uf_validcheck() == -1) return;
    document.form1.action = "/servlet/controller.community.CommunityFrPollServlet";
    document.form1.p_process.value = "replyIndexData";
    document.form1.submit();
    <% } %>
}

//�����亯���������̵�
function uf_replyOK(pollno,rowseq) {
	<% if(userInfo == null) { %>
    alert("ȸ������ �����Դϴ�.");
    <% } else { %>
    document.form1.p_pollno.value = pollno;
    document.form1.p_rowseq.value = rowseq;
    document.form1.action = "/servlet/controller.community.CommunityFrPollServlet";
    document.form1.p_process.value = "queryReply";
    document.form1.submit();
    <% } %>
}

//�������������
function uf_resultviewOK(pollno) {
	<% if(userInfo == null) { %>
	alert("ȸ������ �����Դϴ�.");
	<% } else { %>
    document.form1.p_pollno.value = pollno;
    document.form1.action = "/servlet/controller.community.CommunityFrPollServlet";
    document.form1.p_process.value = "moveresultviewPage";
    document.form1.submit();
    <% } %>
}

//-->
</script>
<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name = "form1"    method = "post">
	<input type = "hidden" name = "p_process"     value="">
	<input type = "hidden" name = "p_userid"      value = "">
	<input type = "hidden" name = "p_cmuno"       value = "<%=v_cmuno%>">
	<input type = "hidden" name = "p_rowseq"      value = "">
	<input type = "hidden" name = "p_pollno"      value = "">

<% if(v_tmp_layout_fg.equals("1")) { %>
<%@ include file="/learn/user/community/zu_MyIndex_A.jsp"%>
<%} else if(v_tmp_layout_fg.equals("2")) { %>
<%@ include file="/learn/user/community/zu_MyIndex_B.jsp"%>
<%} %>


	
</form>
<!-- Form ���� ���� -->

<!-- footer ���� ���� -->
<%@ include file="/learn/user/community/include/cm_bottom.jsp"%>
<!-- footer ���� ���� -->