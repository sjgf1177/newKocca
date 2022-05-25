<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.cp.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
	
	int     v_tabseq        = box.getInt("p_tabseq");
	int     v_seq           = box.getInt("p_seq");
	int     v_pageno        = box.getInt("p_pageno");
	
	String  v_searchtext    = box.getString("p_searchtext");
	String  v_search        = box.getString("p_search");
	
	String  v_date          = "";
	String  v_title         = "";
	String  v_content       = "";
	String  v_name          = "";
	String  v_flagYn        = "";
	String  v_position      = "";
	String  v_indate        = "";
	String  v_realfile      = "";
	String  v_savefile      = "";
	int     v_cnt           =  0;
	
	DataBox dbox = (DataBox)request.getAttribute("selectView");
	
	if (dbox != null) {
	    v_title     = dbox.getString("d_title"); 
	    v_content   = dbox.getString("d_content");   
	    v_date      = dbox.getString("d_ldate");      
	    v_name      = dbox.getString("d_name");
	    v_flagYn    = dbox.getString("d_flagyn");
	    v_position  = dbox.getString("d_position");
	    v_indate    = dbox.getString("d_indate");
	    v_realfile  = dbox.getString("d_realfile");
	    v_savefile  = dbox.getString("d_savefile");
	    v_cnt       = dbox.getInt("d_cnt");
	 }  

%>
<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--

//����Ʈ�������� �̵�
function selectList() {
    document.form1.action = "/servlet/controller.infomation.GalleryHomePageServlet";
    document.form1.p_process.value = "selectList";     
    document.form1.submit();    
}      

//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name = "form1" method = "post" action="">
	<input type = "hidden" name = "p_seq"         value = "<%= v_seq %>">
	<input type = "hidden" name = "p_tabseq"         value = "<%= v_tabseq %>">
	<input type = "hidden" name = "p_searchtext"  value = "<%= v_searchtext %>">
	<input type = "hidden" name = "p_select"      value = "<%= v_search %>">
	<input type = "hidden" name = "p_pageno"      value = "<%= v_pageno %>">
	<input type = "hidden" name = "p_process"     value = "">
                  
            <h2><img src="/images/portal/information/h2_tit6.gif" alt="������������" class="fl_l" /><p class="category">Home > �������� > <strong>������ ������</strong></p></h2>

            <p><img src="/images/portal/information/gallery_borimg.gif" alt="������������������ ���������� ��ǰ�� �����Ͻ� �� �ֽ��ϴ�" /></p>
            
            <table class="information_view mg_t30">
            <!--[if ie]><colgroup><col width="38px" /><col width="170px" /><col width="25px" /><col width="60px" /><col width="25px" /><col width="50px" /></colgroup><![endif]-->
            <colgroup><col width="58px" /><col width="170px" /><col width="45px" /><col width="60px" /><col width="45px" /><col width="50px" /></colgroup>
            <tr>
                <th>����</th>
                <td colspan="5" class="tit"><%= v_title %></td>
            </tr>
            <tr class="bo">
                <th>�Ҽ�/�̸�</th>
                <td><%=v_position %> / <%=v_name%></td>
                <th>�ۼ���</th>
                <td class="num"><%= FormatDate.getFormatDate(v_indate, "yyyy.MM.dd") %></td>
                <th>��ȸ</th>
                <td class="num"><%=v_cnt %></td>
            </tr>
            <tr>
            	<td colspan='6' align="center">
            		<img src="/servlet/controller.library.DownloadServlet?p_savefile=<%=v_savefile %>" border="0" alt="" />
            	</td>
            </tr>
            <tr>
                <td colspan="6" class="con">
                    <%=v_content%>
                </td>
            </tr>
            </table>

            <p class="board_btn"><a href="javascript:selectList();" class="board_violet"><span>���</span></a></p>
</form>
<!-- Form ���� ���� -->

<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->
