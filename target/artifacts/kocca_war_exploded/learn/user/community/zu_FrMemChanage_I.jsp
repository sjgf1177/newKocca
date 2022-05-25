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

    String  v_process      = box.getStringDefault("p_process","movePage");
    String  v_cmuno      = box.getString("p_cmuno");
    

    String  s_userid     = box.getSession("userid");
    String  s_username   = box.getSession("name");
    String  content      = box.getString("content");
    String  s_grcode	 = box.getSession("tem_grcode");
	String  s_grtype	 = GetCodenm.get_grtype(box,s_grcode);
%>  
  
<%@ include file="/learn/user/community/include/cm_top.jsp"%> 
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--
//���
function uf_insertOK() {
    document.form1.action = "/servlet/controller.community.CommunityFrMemberServlet";
    document.form1.p_process.value = "updateData";
    document.form1.submit();
}

//�̸��ϼ���
function uf_updateEmailOK() {
    document.form1.action = "/servlet/controller.community.CommunityFrMemberServlet";
    document.form1.p_process.value = "updateEmailData";
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

            <h1><img src="/images/portal/community/tit_18.gif" alt="������������" /></h1>

            <table class="list">
            <colgroup><col width="100px" /><col /></colgroup>
            <thead>
            <tr>
                <th class="ta_l">����</th>
                <td class="ta_l end"><%=userInfo.getString("d_kor_name")%> </td>
            </tr>
            <tr>
                <th class="ta_l">ȸ����ȭ��ȣ</th>
                <td class="ta_l in end"><input type="text" class="inbox fl_l mg_r6" style="width:295px;" value="<%=userInfo.getString("d_office_tel")%>" readonly/></td>
            </tr>
            <tr>
                <th class="ta_l">������ȭ��ȣ</th>
                <td class="ta_l in end"><input type="text" class="inbox fl_l mg_r6" style="width:295px;" value="<%=userInfo.getString("d_tel")%>" readonly/></td>
            </tr>
            <tr>
                <th class="ta_l">�޴���</th>
                <td class="ta_l in end"><input type="text" class="inbox fl_l mg_r6" style="width:295px;" value="<%=userInfo.getString("d_mobile")%>" readonly/></td>
            </tr>
            <tr>
                <th class="ta_l">�ѽ���ȣ</th>
                <td class="ta_l in end"><input type="text" class="inbox fl_l mg_r6" style="width:295px;" value="<%=userInfo.getString("d_fax")%>" readonly/></td>
            </tr>
            <tr>
                <th class="ta_l">������</th>
                <td class="ta_l in end"><input type="text" class="inbox fl_l mg_r6" style="width:295px;" value="<%=userInfo.getString("d_duty")%>" readonly/></td>
            </tr>
            <tr>
                <th class="ta_l">�ٹ���</th>
                <td class="ta_l in end"><input type="text" class="inbox fl_l mg_r6" style="width:295px;" value=""<%=userInfo.getString("d_wk_area")%>" readonly/></td>
            </tr>
            <tr>
                <th class="ta_l">�̸���</th>
                <td class="ta_l in end"><input type="text" class="inbox fl_l mg_r6" style="width:295px;" value="<%=userInfo.getString("d_email")%>" readonly/></td>
            </tr>
            </thead>
            </table>
            
            
            <table class="study_write bo_tn">
            <tr>
                <td class="td con"><textarea name="p_content" style="height:170px;" title="���� �Է¶�"><%=userInfo.getString("d_intro") %></textarea></td>
            </tr>
            </table>
            
            <p class="board_btn"><a href="javascript:uf_insertOK();" class="btn_gr"><span>����</span></a></p>
            
</form>
<!-- Form ���� ���� -->

<!-- footer ���� ���� -->
<%@ include file="/learn/user/community/include/cm_bottom.jsp"%>
<!-- footer ���� ���� -->
