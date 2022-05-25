<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>


<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box       = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
	box.put("leftmenu","06");

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
var old_menu = ''; var old_cell = '';
function comment( submenu, cellbar) {

	if( old_menu != submenu ) {

		if( old_menu !='' ) {
			old_menu.style.display = 'none';
		}
		submenu.style.display = 'block';
		old_menu = submenu;
		old_cell = cellbar;

	} else {
		submenu.style.display = 'none';
		old_menu = '';
		old_cell = '';
	}
}

function move(tab){
	document.form1.p_process.value= "Help";
	document.form1.p_code.value = tab;
	document.form1.action = "/servlet/controller.homepage.HomePageHelpServlet";
	document.form1.submit();
}

</SCRIPT>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->

<form name = "form1" enctype = "multipart/form-data" method = "post" action="">
		<input type = "hidden" name = "p_process"   value = "">
		<input type = "hidden" name = "p_tab"		value = "">
		<input type = "hidden" name = "p_code"      value = "">




            <h2><img src="/images/portal/studying/h2_tit3.gif" alt="Q&A" class="fl_l" /><p class="category">Home > �н��������� > <strong>�¶��θ޴���</strong></p></h2>

            <p><img src="/images/portal/studying/qna_borimg.gif" alt="���� ���� ������ ����Ͻø�, ����ڰ� �亯�ص帳�ϴ�. ���� ���뿡 ���� ������ ������ �����ø� ������� �ۼ����ּ���. " /></p>
<!-- ������ ���� ���� -->
<%=v_content %>
<!-- ������ ���� ���� -->
</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->
