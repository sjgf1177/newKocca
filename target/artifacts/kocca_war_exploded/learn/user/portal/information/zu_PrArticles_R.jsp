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
    int     v_cnt           =  0;
    DataBox dbox = (DataBox)request.getAttribute("selectView");
    
    if (dbox != null) {
        v_title     = dbox.getString("d_title"); 
        v_content   = dbox.getString("d_content");   
        v_date      = dbox.getString("d_ldate");      
        v_name      = dbox.getString("d_name");
        v_flagYn    = dbox.getString("d_flagyn");
        v_position  = dbox.getString("d_position");
        v_url       = dbox.getString("d_url");
        v_cnt       = dbox.getInt("d_cnt");
     }  
    
%>
<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<SCRIPT LANGUAGE="JavaScript">

    function listnotice(){
    	document.nform2.p_process.value = "selectList";
        document.nform2.action = "/servlet/controller.infomation.BriefingHomePageServlet";
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

            <h2><img src="/images/portal/information/h2_tit9.gif" alt="ȫ�����" class="fl_l" /><p class="category">Home > �������� > <strong>ȫ�����</strong></p></h2>

            <p><img src="/images/portal/information/inforlatter_borimg.gif" alt="���� ������ ��ģ ���������� �����ı⸦ ���������� " /></p>
            
            <table class="information_view mg_t30">
            <!--[if ie]><colgroup><col width="25px" /><col width="170px" /><col width="40px" /><col width="80px" /><col width="35px" /><col width="50px" /></colgroup><![endif]-->
            <colgroup><col width="45px" /><col width="170px" /><col width="50px" /><col width="80px" /><col width="55px" /><col width="50px" /></colgroup>
            <tr>
                <th>����</th>
                <td colspan="5" class="tit"><%=v_title%></td>
            </tr>
            <tr class="bo">
                <th>�ۼ���</th>
                <td><%=v_name%></td>
                <th>�ۼ�����</th>
                <td class="num"><%= FormatDate.getFormatDate(v_date,"yyyy.MM.dd") %></td>
                <th>��ȸ��</th>
                <td class="num"><%=v_cnt%></td>
            </tr>
            <tr>
                <td colspan="8" class="con"><%=v_content%></td>
            </tr>
            </table>
            
            <%
            Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
            Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
            String i_boardStyle        = "information_view";                                // ���� ��Ÿ��
            %>
            <%@ include file="/learn/user/include/zu_MultiAttach_R.jsp" %> 
            
            <p class="board_btn"><a href="javascript:listnotice()" class="board_violet"><span>���</span></a></p>
            
</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->
