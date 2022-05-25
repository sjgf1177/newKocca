<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>


<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box       = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    String  v_process     = box.getString("p_process");
    String  v_tem_grcode   = box.getSession("tem_grcode");
    
    String v_content    = "";
    String v_code       = "";
    String v_title      = "";
    
    DataBox dbox = (DataBox)request.getAttribute("selectView");
    if (dbox != null) {
        v_content    = dbox.getString("d_content");
        v_code       = dbox.getString("d_code");
        v_title      = dbox.getString("d_title");
     }
    
%>
<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<SCRIPT>

function insertPage(){
    document.form1.p_process.value= "insertPage";
    document.form1.action = "/servlet/controller.tutor.OffExpertHomePageServlet";
    document.form1.submit();
}

</SCRIPT>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name = "form1" enctype = "multipart/form-data" method = "post" action=""> 
        <input type = "hidden" name = "p_process"   value = "">
        <input type = "hidden" name = "p_tab"       value = "">

            <h2><img src="/images/portal/information/h2_tit10.gif" alt="����������ϱ�" class="fl_l" /><p class="category">Home > �������� > <strong>����������ϱ�</strong></p></h2>

            <p><img src="/images/portal/information/professional_borimg.gif" alt="������������� �����η� Ȯ�� �� �������� Ȱ���� ���� ������ ��� �ý����� �����ϰ� �ֽ��ϴ�. Ź���� �ɷ°� ������ �ִ� �е��� ���� ������ �ٶ��ϴ�" /></p>

            <ul class="tabwrap mg_t30">
                <li><a href="javascript:insertPage();" class="tab_information"><span>������ ����ϱ�</span></a></li>
                <li><a class="tab_information tab_information_on"><span>������ ��ϱ���</span></a></li>
            </ul>
            
<!-- �� -->
<%=v_content %>
<p class="board_btn ag_c mg_t30"><a href="javascript:insertPage();" class="btn_violet mg_r7"><span>���</span></a></p>
</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->