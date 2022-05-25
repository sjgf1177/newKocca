<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage   = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "com.credu.community.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process    = box.getString("p_process");
    String  v_faq_type   = box.getStringDefault("p_faq_type","DIRECT");
    int     v_faqno      = box.getInt("p_faqno");
    
    String  v_searchtext = box.getString("p_searchtext");
    String  v_select     = box.getString("p_select");
    int     v_pageno     = box.getInt("p_pageno");
    int     v_rowseq     = box.getInt("p_rowseq");
    String  s_userid     = box.getSession("userid");
    String  s_username   = box.getSession("name");
	
    String  s_grcode	 = box.getSession("tem_grcode");
	String  s_grtype	 = GetCodenm.get_grtype(box,s_grcode);

    String ems_url = conf.getProperty("ems.url.value"); // ����


    ArrayList list         = (ArrayList)request.getAttribute("list");
    ArrayList viewfaq      =new ArrayList();
    //ArrayList viewfaqfile  =new ArrayList();
    //ArrayList viewfaqbefore=new ArrayList();
    //ArrayList viewfaqnext  =new ArrayList();
    //ArrayList viewfaqreplay=new ArrayList();
    
    if(list.size() != 0){
       viewfaq       = (ArrayList)list.get(0);  
       //viewfaqfile   = (ArrayList)list.get(1);  
       //viewfaqbefore = (ArrayList)list.get(2);  
       //viewfaqnext   = (ArrayList)list.get(3);  
       //viewfaqreplay = (ArrayList)list.get(4);  

    }
 
    DataBox dbox = (DataBox)viewfaq.get(0);

%>  

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--
//����Ʈ�� �̵�
function wf_listOK() {
    document.form1.action = "/servlet/controller.community.CommunityDirectServlet";
    document.form1.p_process.value = "selectList";
    document.form1.submit();
}

//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name = "form1"    method = "post">
	<input type = "hidden" name = "p_process"      value="">
	<input type = "hidden" name = "p_faq_type"     value="<%=v_faq_type%>">
	<input type = "hidden" name = "p_pageno"       value = "<%=v_pageno%>">
	<input type = "hidden" name = "p_searchtext"   value = "<%=v_searchtext%>">
	<input type = "hidden" name = "p_select"       value = "<%=v_select%>">
	<input type = "hidden" name = "p_userid"       value = "">
	<input type = "hidden" name = "p_rplno"        value = "">
	<input type = "hidden" name = "p_faqno"        value = "<%=v_faqno%>">
	<input type = "hidden" name = "p_lv"           value = "<%=dbox.getInt("d_lv")%>">
	<input type = "hidden" name = "p_position"     value = "<%=dbox.getInt("d_position")%>">
	<input type = "hidden" name = "p_parent"       value = "<%=dbox.getInt("d_parent")%>">
	
	<input type = "hidden" name = "p_root"         value = "<%=dbox.getInt("d_root")%>">
	
	<input type = "hidden" name = "p_checks"       value="<%=dbox.getString("d_register_userid")%>,,,">
	<input type = "hidden" name = "userLoginID"    value="<%=box.getSession("userid")%>">
	
	<input type = "hidden" name = "p_rowseq"       value = "<%=v_rowseq%>">

            <h2><img src="/images/portal/community/h2_tit1.gif" alt="��������" class="fl_l" /><p class="category">Home > Ŀ�´�Ƽ > <strong>��������</strong></p></h2>

            <p><img src="/images/portal/community/notic_borimg.gif" alt="��������" /></p>

            <table class="study_view mg_t30">
            <!--[if ie]><colgroup><col width="55px" /><col width="250px" /><col width="40px" /><col width="80px" /><col width="40px" /><col width="80px" /></colgroup><![endif]-->
            <colgroup><col width="75px" /><col width="250px" /><col width="60px" /><col width="80px" /><col width="60px" /><col width="80px" /></colgroup>
            <tr>
                <th>����</th>
                <td colspan="5" class="tit"><%=dbox.getString("d_title") %></td>
            </tr>
            <tr class="bo">
                <th>�ۼ���</th>
                <td><%=dbox.getString("d_name") %></td>
                <th>�ۼ���</th>
                <td class="num"><%=FormatDate.getFormatDate(dbox.getString("d_register_dte"), "yyyy.MM.dd") %></td>
                <th>��ȸ</th>
                <td class="num"><%=dbox.getInt("d_read_cnt") %></td>
            </tr>
            <tr>
                <td colspan="6" class="con"><%=dbox.getString("d_content") %></td>
            </tr>
            <!-- ����÷�� ���� -->
            <%
	            Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
	            Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
	            String i_boardStyle        = "study_view";                                // ���� ��Ÿ��
            %>
            <%@ include file="/learn/user/include/zu_MultiAttach_R.jsp" %>
            <!-- ����÷�� ����-->
            </table>

            <p class="board_btn"><a href="javascript:wf_listOK()" class="btn_gr"><span>���</span></a></p>
           
</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->