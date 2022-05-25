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

    String  v_process      = box.getStringDefault("p_process","movePage");
    String  v_cmuno      = box.getString("p_cmuno");
    

    String  s_userid     = box.getSession("userid");
    String  s_username   = box.getSession("name");

%>  
  
<%@ include file="/learn/user/community/include/cm_top.jsp"%> 
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--
//���
function uf_insertOK() {

    if(document.form1.content.value ==''){
       alert('������ �Է��Ͽ����մϴ�.');document.form1.content.focus();return;
    }
    document.form1.action = "/servlet/controller.community.CommunityIndexServlet";
    document.form1.p_process.value = "updatememout";
    document.form1.submit();
}
//-->
</script>
<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name = "form1"    method = "post">
<input type = "hidden" name = "p_process"     value="">
<input type = "hidden" name = "p_userid"      value = "">
<input type = "hidden" name = "p_cmuno"      value = "<%=v_cmuno%>">

            <h1><img src="/images/portal/community/tit_15.gif" alt="Ŀ�´�Ƽ Ż��" /></h1>

            <table class="study_write">
            <!--[if ie]><colgroup><col width="40px" /><col /></colgroup><![endif]-->
            <colgroup><col width="60px" /><col /></colgroup>
            <tr>
                <th class="th"><label for="subject">����</label></th>
                <td class="td txt"><%=s_username%></td>
            </tr>
            <tr>
                <td colspan="2" class="td con"><textarea name="content" rows="25" cols="90" title="���� �Է¶�"></textarea></td>
            </tr>
            </table>

            <p class="board_btn"><a href="javascript:uf_insertOK();" class="btn_gr"><span>Ȯ��</span></a></p>
            
</form>
<!-- Form ���� ���� -->

<!-- footer ���� ���� -->
<%@ include file="/learn/user/community/include/cm_bottom.jsp"%>
<!-- footer ���� ���� -->
