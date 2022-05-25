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
    String  s_userid     = box.getSession("userid");
    String  s_username   = box.getSession("name");
    String  s_email      = box.getSession("email");
    String  v_type_l     = box.getString("p_type_l");

    String  s_grcode	 = box.getSession("tem_grcode");
	String  s_grtype	 = GetCodenm.get_grtype(box,s_grcode);

%>  

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--
//�Ű���
function uf_insertOK() {

    if(!CrossEditor.IsDirty()){ // ũ�ν������� ���� ������ �Է� Ȯ�� 
        alert("�Ű����� �Է��Ͽ����մϴ� !!"); 
        CrossEditor.SetFocusEditor();// ũ�ν������� Focus �̵� 
        return false; 
    } 

    document.getElementById("p_content").value = CrossEditor.GetBodyValue();

    if(document.form1.p_cmu_nm.value ==''){
       alert('Ŀ�´�Ƽ�� �����Ͽ����մϴ�.');return;
    }
    document.form1.action = "/servlet/controller.community.CommunityFrPoliceServlet";
    document.form1.p_process.value = "insert";
    document.form1.submit();
}
//Ŀ�´�Ƽ ã��
function uf_findCummunity() {
   open_window('cmuDupCheck', '/servlet/controller.community.CommunityPopUpServlet?p_process=menucmufindPage', 100, 100, 750, 500, 'no', 'no', 'no', 'no', 'no');
  
}
//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name = "form1"   enctype = "multipart/form-data" method = "post">
<input type = "hidden" name = "p_process" value="">
<input type = "hidden" name = "p_cmuno" value="">
<input type = "hidden" name = "p_email" value="<%=s_email%>">
<input type = "hidden" name = "p_dupchk" value="<%=box.getStringDefault("p_dupchk","N")%>">

            <h2><img src="/images/portal/community/h2_tit3.gif" alt="�Ұ���Ŀ�´�Ƽ�Ű�" class="fl_l" /><p class="category">Home > Ŀ�´�Ƽ > <strong>�Ұ���Ŀ�´�Ƽ�Ű�</strong></p></h2>

            <p><img src="/images/portal/community/statement_borimg.gif" alt="�Ұ���Ŀ�´�Ƽ�Ű�" /></p>

            <table class="study_write mg_t30">
            <!--[if ie]><colgroup><col width="55px" /><col width="500" /><col width="55px" /><col width="120" /></colgroup><![endif]-->
            <colgroup><col width="75px" /><col width="400" /><col width="75px" /><col width="120" /></colgroup>
            <tr>
                <th class="th"><label for="subject">������ ��</label></th>
                <td colspan="7" class="td txt"><%=s_username%>(<%=s_email%>)</td>
            </tr>
            <tr>
                <th class="th"><label for="file">Ŀ�´�Ƽ��</label></th>
                <td class="td"><input type="text" name="p_cmu_nm" id="file" class="inbox fl_l mg_r6" style="width:300px;" readonly disabled/><p class="mg_t1"><a href="javascript:uf_findCummunity();" class="board_btn"><span>�˻�</span></a></p></td>
            </tr>
            
            <tr>
                <td colspan="8" class="td con">
                    <textarea  id="p_content" name="p_content" style="display:none;"></textarea>
                    <script type="text/javascript">
                        var CrossEditor = new NamoSE("contents");
                        CrossEditor.editorStart();
                    </script>
                </td>
            </tr>
            </table>

            <p class="board_btn"><a href="javascript:uf_insertOK();" class="btn_gr"><span>�Ű��ϱ�</span></a><!--a href="javascript:alert('������������');" class="btn_gr"><span>���</span></a></p-->
            
</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->
