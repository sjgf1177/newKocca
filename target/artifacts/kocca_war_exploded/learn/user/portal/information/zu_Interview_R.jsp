<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    
    String  v_process   = box.getString("p_process");
    int     v_pageno    = box.getInt   ("p_pageno");
    
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    
    int     v_tabseq    = box.getInt("p_tabseq");
    int     v_seq       = box.getInt("p_seq");


    int    v_cnt        = 0;            // ��ȸ��
    String v_title      = "";           // ����
    String v_content    = "";           // ����
    String v_date       = "";           // �����
    String v_name       = "";           // �����
    String v_userid     = "";           // userid
    String v_comptext   = "";           // �Ҽ�
    String v_target     = "";
    String v_targetnm   = "";

    String v_useyn      = "";           // �������
    String v_month      = "";           // �ش��
    
    String v_realfile   = "";
    String v_savefile   = "";
    
    DataBox dbox = (DataBox)request.getAttribute("selectView");
    
    if (dbox != null) {    
        v_cnt           = dbox.getInt("d_cnt");
        v_title         = dbox.getString("d_title"); 
        v_comptext      = dbox.getString("d_comptext"); 
        v_content       = dbox.getString("d_contents");
        v_date          = dbox.getString("d_indate");   
        v_name          = dbox.getString("d_lname");
        v_useyn         = dbox.getString("d_useyn");    
        v_realfile      = dbox.getString("d_realfile");
        v_savefile      = dbox.getString("d_savefile");
        v_target        = dbox.getString("d_target");
        v_targetnm      = dbox.getString("d_targetnm");
        
        v_date     = FormatDate.getFormatDate(v_date, "yyyy.MM.dd");
     }  

%>
<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<SCRIPT LANGUAGE="JavaScript">

    function listnotice(){
        document.nform2.p_process.value = "selectList";
        document.nform2.action = "/servlet/controller.homepage.KOpenPowerHomePageServlet";
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

            <h2><img src="/images/portal/information/h2_tit7.gif" alt="���ͺ�" class="fl_l" /><p class="category">Home > �������� > <strong>���ͺ�</strong></p></h2>

            <p><img src="/images/portal/information/interview_borimg.gif" alt="������ �� ������� ������ ���ͺ並 ����������" /></p>
            
            <table class="information_view mg_t30">
            <!--[if ie]><colgroup><col width="25px" /><col width="200px" /><col width="50px" /><col width="70px" /><col width="25px" /><col width="30px" /></colgroup><![endif]-->
            <colgroup><col width="45px" /><col width="200px" /><col width="60px" /><col width="70px" /><col width="45px" /><col width="30px" /></colgroup>
            <tr>
                <th>����</th>
                <td class="tit"><%=v_title%></td>
                <th>���ͺ���</th>
                <td colspan="3"><%=v_targetnm%></td>
            </tr>
            <tr class="bo">
                <th>�Ҽ�</th>
                <td><%=v_comptext%></td>
                <th>�ۼ���</th>
                <td class="num"><%=v_date%></td>
                <th>��ȸ</th>
                <td class="num"><%=v_cnt %></td>
            </tr>
            <tr>
                <td colspan="6" class="con">
                    <%=v_content %>
                </td>
            </tr>
            </table>
            
            <table class="information_view bo_tn">
            <colgroup><col width="65px" /><col width="625px" /></colgroup>
            <tr class="bgn">
                <th class="th">÷������</th>
                <td colspan="7" class="td pd_ln">
            		<p>
                    <img src="/images/portal/ico/ico_file.gif" alt="file" class="mg_r6 va_t" />
                    <a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_savefile%>&p_realfile=<%= v_realfile%>'><%= v_realfile%></a>
                    <input type = "hidden" name = "p_savefile"  value = <%=v_savefile%>>
                    </p>
                </td>
            </tr>
            </table>
            
            <p class="board_btn"><a href="javascript:listnotice();" class="board_violet"><span>���</span></a></p>            
</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>