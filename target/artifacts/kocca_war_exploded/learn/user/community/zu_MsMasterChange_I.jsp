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

    String  v_process      = box.getStringDefault("p_process","gomsmemberPop");
    String  v_cmuno      = box.getString("p_cmuno");//������ ������������ ������ ������.
     String  v_static_cmuno      = box.getString("p_static_cmuno");//������ ������������ ������ ������.   

    String  s_userid     = box.getSession("userid");
    String  s_username   = box.getSession("name");
    String  s_grcode	 = box.getSession("tem_grcode");
	String  s_grtype	 = GetCodenm.get_grtype(box,s_grcode);

    ArrayList list       = (ArrayList)request.getAttribute("list");
    
    DataBox dbox = (DataBox)list.get(0);

%>  
<%@ include file="/learn/user/community/include/cm_top.jsp"%> 
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--

//����Ʈ
function uf_listOK() {
    document.form1.action          = "/servlet/controller.community.CommunityMasterServlet";
    document.form1.p_process.value = "selectmsmainPage";
    document.form1.submit();
}
//����
function uf_saveOK() {
   if(document.form1.p_kor_name.value ==''){
      alert('������ ����Ÿ�� �Է��Ͽ����մϴ�.');document.form1.p_kor_name.focus();return;
   }

   document.form1.action          = "/servlet/controller.community.CommunityMasterServlet";
   document.form1.p_process.value = "updatemasterchangeData";
   document.form1.submit();
}
//ȸ������
function uf_msPopMember() {
   open_window('msPopMember', '/servlet/controller.community.CommunityPopUpServlet?p_process=gomsmembernonePop&p_static_cmuno=<%=v_static_cmuno%>&p_cmuno=<%=v_cmuno%>&p_cbxflag=R', 100, 100, 750, 530, 'no', 'no', 'no', 'no', 'no');
  
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
	<input type = "hidden" name = "p_tmp_userid">
	<input type = "hidden" name = "p_email">

            <h1><img src="/images/portal/community/tit_10.gif" alt="�����ͺ���" /></h1>

            <table class="list">
            <colgroup><col width="120px" /><col /></colgroup>
            <thead>
            <tr>
                <th class="ta_l">���縶����</th>
                <td class="ta_l end"><%=dbox.getString("d_kor_name")%>(������) </td>
            </tr>
            <tr>
                <th class="ta_l">�����Ҹ�����</th>
                <td class="ta_l in end"><input name="p_kor_name" type="text" class="inbox fl_l mg_r6" style="width:295px;" readonly/> <p class="mg_t1"><a href="javascript:uf_msPopMember();" class="board_btn"><span>ȸ���˻�</span></a></p></td>
            </tr>
            </thead>
            </table>

            <p class="board_btn"><a href="javascript:uf_saveOK();" class="btn_gr"><span>����</span></a></p>

</form>
<!-- Form ���� ����-->

<!-- footer ���� ���� -->
<%@ include file="/learn/user/community/include/cm_bottom.jsp"%>
<!-- footer ���� ����-->
