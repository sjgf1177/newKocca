<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    
    String  v_process    = box.getString("p_process");
    int     v_pageno     = box.getInt   ("p_pageno");
    String  v_userid     = box.getSession("userid");
    
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    
    String  v_selSeminarGubun   = box.getString("p_selSeminarGubun");

    int v_seq      = box.getInt("p_seq");

    String v_startdate    = "";
    String v_enddate      = "";
    String v_shour        = "";
    String v_ehour        = "";
    String v_propstart    = "";
    String v_propend      = "";
    String v_seminarnm    = "";
    String v_content      = "";
    String v_tname        = "";
    String v_seminargubun = "";
    String v_seminargubunnm = "";
    int    v_limitmember  = 0;
    String v_target       = "";
    String v_use          = "";
    String v_apply_yn     = "";
    String v_progress_yn  = "";

    DataBox dbox = (DataBox)request.getAttribute("selectView");

    if (dbox != null) {
    	v_startdate    = dbox.getString("d_startdate");
        v_enddate      = dbox.getString("d_enddate");
        v_shour        = dbox.getString("d_starttime");
        v_ehour        = dbox.getString("d_endtime");
        v_propstart    = dbox.getString("d_propstart");
        v_propend      = dbox.getString("d_propend"); 
        v_seminarnm    = dbox.getString("d_seminarnm");
        v_content      = dbox.getString("d_content");
        v_tname        = dbox.getString("d_tname");
        v_seminargubun = dbox.getString("d_seminargubun");
        v_seminargubunnm = dbox.getString("d_seminargubunnm");
        v_limitmember  = dbox.getInt("d_limitmember");
        v_target       = dbox.getString("d_target");
        v_use          = dbox.getString("d_useyn");
        v_apply_yn     = dbox.getString("d_apply_yn");
        v_progress_yn  = dbox.getString("d_progress_yn");

     }

%>
<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<SCRIPT LANGUAGE="JavaScript">

    function listnotice(){
    	document.nform2.p_process.value = "selectList";
        document.nform2.action = "/servlet/controller.homepage.SeminarHomePageServlet";
        document.nform2.submit();
    }

    function requestSeminar() {
        <% if (v_apply_yn.equals("Y")){ %>
             alert("�̹� ��û�ϼ̽��ϴ�.");
        <% } else { %>
    	window.open("about:blank", "popUpView", "top=0, left=0, width=740, height=320, status=no, resizable=no");

        document.nform2.action="/servlet/controller.homepage.SeminarHomePageServlet";
        document.nform2.p_process.value = "insertRequestPage";
        document.nform2.target="popUpView";
        document.nform2.submit();
        <% } %>
    }

</SCRIPT>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name="nform2" method="post">
<input type = "hidden" name = "p_process" >
<input type = "hidden" name = "p_seq" value="<%=v_seq%>">
<input type = "hidden" name = "p_pageno" value = "<%=v_pageno %>">
<input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
<input type = "hidden" name = "p_search" value = "<%=v_search %>">
<input type = "hidden" name = "p_selSeminarGubun" value = "<%=v_selSeminarGubun %>">

            <h2><img src="/images/portal/information/h2_tit4.gif" alt="��ũ��" class="fl_l" /><p class="category">Home > �������� > <strong>��ũ��</strong></p></h2>

            <p><img src="/images/portal/information/workshop_borimg.gif" alt="����������� ��ũ�� �Դϴ�. �پ��� �о� ������� ������ ������ �Ҹ��� ������ �� �ֽ��ϴ�." /></p>
            
            <table class="information_view mg_t30">
            <!--[if ie]><colgroup><col width="55px" /><col width="110px" /><col width="50px" /><col width="80px" /><col width="75px" /><col width="100px" /></colgroup><![endif]-->
            <colgroup><col width="65px" /><col width="110px" /><col width="60px" /><col width="80px" /><col width="95px" /><col width="100px" /></colgroup>
            <tr>
                <th>��ũ����</th>
                <td colspan="3" class="tit"><%=v_seminarnm%></td>
                <th>��米��</th>
                <td><%=v_tname%></td>
            </tr>
            <tr class="bo">
                <th>�з�</th>
                <td><%=v_seminargubunnm%></td>
                <th>��ũ������</th>
                <td class="num"><%=FormatDate.getFormatDate(v_startdate, "yyyy.MM.dd")+"-"+FormatDate.getFormatDate(v_enddate, "MM.dd")%></td>
                <th>��ũ�� ��û�Ⱓ</th>
                <td class="num"><%=FormatDate.getFormatDate(v_propstart, "yyyy.MM.dd")+"-"+FormatDate.getFormatDate(v_propend, "MM.dd")%></td>
            </tr>
            <tr>
                <td colspan="6" class="con">
                    <%=v_content %>
                </td>
            </tr>
            </table>

            <p class="board_btn"><% if(!v_userid.equals("") && v_progress_yn.equals("Y")) { %><a href="javascript:requestSeminar();" class="btn_violet mg_r7"><span>������û</span></a><% } %><a href="javascript:listnotice();" class="btn_gr"><span>���</span></a></p>
</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->