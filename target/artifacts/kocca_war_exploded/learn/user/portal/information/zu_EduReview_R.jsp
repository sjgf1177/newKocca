<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    
    String  v_process    = box.getString("p_process");
    int     v_tabseq     = box.getInt   ("p_tabseq");
    int     v_pageno     = box.getInt   ("p_pageno");
    String  v_userid     = box.getSession("userid");
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");

    int v_seq      = box.getInt("p_seq");

    String  v_date          = "";
    String  v_title         = "";
    String  v_content       = "";
    String  v_name          = "";
    String  v_flagYn        = "";
    String  v_position      = "";
    String  v_url           = "";
    String  v_writeuserid   = "";
    int     v_cnt           =  0;
    DataBox dbox = (DataBox)request.getAttribute("selectView");
    
    if (dbox != null) {
        v_title     = dbox.getString("d_title"); 
        v_content   = dbox.getString("d_content");
        v_date      = dbox.getString("d_ldate").substring(0,4)+"/"+dbox.getString("d_ldate").substring(4,6)+"/"+dbox.getString("d_ldate").substring(6,8);;      
        v_name      = dbox.getString("d_name");
        v_flagYn    = dbox.getString("d_flagyn");
        v_position  = dbox.getString("d_position");
        v_url       = dbox.getString("d_url");
        v_cnt       = dbox.getInt("d_cnt");
        if(v_userid.equals(dbox.getString("d_userid")))
            v_writeuserid="true";
        else
            v_writeuserid="false";
     }  
    
%>
<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<SCRIPT LANGUAGE="JavaScript">

//����Ʈȭ������ �̵�
function selectList() {
    document.nform2.action = "/servlet/controller.infomation.EduReviewHomePageServlet";
    document.nform2.target = "_self";
    document.nform2.p_process.value = "selectList";     
    document.nform2.submit();    
}  

function del()
{
    if(!confirm("���� ���� �Ͻðڽ��ϱ�?"))
        return;
    
    document.nform2.action = "/servlet/controller.infomation.EduReviewHomePageServlet";
    document.nform2.target = "_self";
    document.nform2.p_process.value = "delete";     
    document.nform2.submit();
}

function edit()
{
    document.nform2.action = "/servlet/controller.infomation.EduReviewHomePageServlet";
    document.nform2.target = "_self";
    document.nform2.p_process.value = "editPage";     
    document.nform2.submit();
}
</SCRIPT>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name="nform2" method="post">
	<input type = "hidden" name = "p_process" >
	<input type = "hidden" name = "p_seq" value="<%=v_seq%>">
	<input type = "hidden" name = "p_tabseq" value="<%=v_tabseq%>">
	<input type = "hidden" name = "p_pageno" value = "<%=v_pageno %>">
	<input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
	<input type = "hidden" name = "p_search" value = "<%=v_search %>">

            <h2><img src="/images/portal/information/h2_tit8.gif" alt="�����ı�" class="fl_l" /><p class="category">Home > �������� > <strong>�����ı�</strong></p></h2>

            <p><img src="/images/portal/information/edulatter_borimg.gif" alt="���� ������ ��ģ ���������� �����ı⸦ ���������� " /></p>
            
            <table class="information_view mg_t30" >
            <!--[if ie]>
            <colgroup>
	            <col width="45px" /><col width="150px" />
	            <col width="40px" /><col width="80px" />
	            <col width="60px" /><col width="80px" />
	            <col width="65px" /><col width="80px" />
            </colgroup>
            <![endif]-->
            <colgroup>
	            <col width="45px" /><col width="150px" />
	            <col width="45px" /><col width="80px" />
	            <col width="90px" /><col width="80px" />
	            <col width="45px" /><col width="45px" />
            </colgroup>
            <tr>
                <th>����</th>
                <td colspan="7" class="tit"><%=v_title%></td>
            </tr>
            <tr class="bo">
                <th>�Ҽ�</th>
                <td><%=v_position %></td>
                <th>�̸�</th>
                <td><%=v_name%></td>
                <th>�ۼ�����</th>
                <td class="num"><%=v_date%></td>
                <th>��ȸ</th>
                <td class="num"><%=v_cnt%></td>
            </tr>
            <tr>
                <td colspan="8" class="con"><%=v_content%></td>
            </tr>
            </table>

            <%
            Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
            Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
            String i_boardStyle        = "information_view";                          // ���� ��Ÿ��
            %>
            <%@ include file="/learn/user/include/zu_MultiAttach_R.jsp" %> 
            
            <p class="board_btn">
                <% if(v_writeuserid.equals("true")) {%>
                <a href="javascript:edit();" class="board_violet"><span>����</span></a>
                <a href="javascript:del();" class="board_violet"><span>����</span></a>
                <%}%>
                <a href="javascript:selectList();" class="board_violet"><span>���</span></a>
            </p>
</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->