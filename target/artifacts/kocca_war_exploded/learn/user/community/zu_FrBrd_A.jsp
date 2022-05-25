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
    String  v_process    = box.getString("p_process");
    String  v_cmuno      = box.getString("p_cmuno");
    String  v_menuno     = box.getString("p_menuno");    
    String  v_brdno      = box.getString("p_brdno");     

    String  s_userid     = box.getSession("userid");
    String  s_username   = box.getSession("name");
    String  s_grcode	 = box.getSession("tem_grcode");
	String  s_grtype	 = GetCodenm.get_grtype(box,s_grcode);


    int     v_lv         = box.getInt("p_lv");
    int     v_position   = box.getInt("p_position");
    int     v_parent     = box.getInt("p_parent");
    int     v_root       = box.getInt("p_root");
    String  v_searchtext = box.getString("p_searchtext");
    String  v_select     = box.getString("p_select");
    int     v_pageno     = box.getInt("p_pageno");
    
    String  v_board_fg   = box.getStringDefault("p_brd_fg","0");
    int v_filecnt       = box.getInt("fielcnt"); // �ִ� ���� ÷�� ����
%>  
  
<%@ include file="/learn/user/community/include/cm_top.jsp"%> 
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--
//���
function uf_insertOK() {
	var v_board_fg = document.form1.p_brd_fg.value;

    if(document.form1.p_title.value ==''){
       alert('������ �Է��Ͽ����մϴ�.');document.form1.p_title.focus();return;
    }
    
    if(!CrossEditor.IsDirty()){ // ũ�ν������� ���� ������ �Է� Ȯ�� 
        alert("������ �Է��� �ּ��� !!"); 
        CrossEditor.SetFocusEditor();// ũ�ν������� Focus �̵� 
        return false; 
    } 
    document.getElementById("p_content").value = CrossEditor.GetBodyValue();
    document.form1.action = "/servlet/controller.community.CommunityFrBoardServlet";
    document.form1.p_process.value = "replyData";
    document.form1.submit();
}

//����Ʈ
function wf_listOK() {
    document.form1.action = "/servlet/controller.community.CommunityFrBoardServlet";
    document.form1.p_process.value = "selectlist";
    document.form1.submit();
}

//-->
</script>
<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name = "form1"     enctype = "multipart/form-data"   method = "post">
	<input type = "hidden" name = "p_process" value="">
	<input type = "hidden" name = "p_cmuno"       value="<%=v_cmuno%>">
	<input type = "hidden" name = "p_menuno"      value = "<%=v_menuno%>">
	<input type = "hidden" name = "p_brdno"       value = "<%=v_brdno%>">
	
	
	<input type = "hidden" name = "p_pageno"      value = "<%=v_pageno%>">
	<input type = "hidden" name = "p_searchtext"  value = "<%=v_searchtext%>">
	<input type = "hidden" name = "p_select"      value = "<%=v_select%>">
	<input type = "hidden" name = "p_lv"          value = "<%=v_lv%>">
	<input type = "hidden" name = "p_position"    value = "<%=v_position%>">
	<input type = "hidden" name = "p_parent"      value = "<%=v_parent%>">
	<input type = "hidden" name = "p_root"        value = "<%=v_root%>">
	<input type = "hidden" name = "p_brd_fg"       value = "<%=box.getString("p_brd_fg")%>">

            <h1>
            <%if(v_board_fg.equals("0")){%>
            <img src="/images/portal/community/tit_01.gif" alt="��������" class="fl_l" />
            <%}else if(v_board_fg.equals("2")){%>
            <span class="fl_l"><img src="/images/portal/community/tit_02.gif" alt="�Խ���" class="va_up2" /> (<%=(new CommunityMsMenuBean()).getSingleColumn2(v_cmuno,v_menuno,"title",v_board_fg)%>)</span>
            <%}else if(v_board_fg.equals("1")){%>
            <span class="fl_l"><img src="/images/portal/community/tit_03.gif" alt="�ڷ��" class="va_up2" /> (<%=(new CommunityMsMenuBean()).getSingleColumn2(v_cmuno,v_menuno,"title",v_board_fg)%>)</span>
            <%}%>
            </h1>

            <table class="study_write">
            <%if(v_menuno.equals("1")){%>
            <!--[if ie]><colgroup><col width="45px" /><col width="120" /><col width="55px" /><col width="400" /></colgroup><![endif]-->
            <colgroup><col width="65px" /><col width="120" /><col width="75px" /><col width="400" /></colgroup>
            <%} else { %>
            <!--[if ie]><colgroup><col width="45px" /><col width="400" /><col width="55px" /><col width="120" /></colgroup><![endif]-->
            <colgroup><col width="65px" /><col width="400" /><col width="75px" /><col width="120" /></colgroup>
            <%} %>
            <tr>
                <th class="th"><label for="subject">����</label></th>
                <td colspan="7" class="td"><input type="text" name="p_title" id="subject" class="inbox" style="width:97%;" /></td>
            </tr>
            <tr>
                <th class="th">�ۼ���</th>
                <%if(v_menuno.equals("1")){%>
                <td class="td txt"><%=s_username%></td>
                <%} else { %>
                <td class="td"><%=s_username%>
                <input type="radio" name="p_display_fg" style="vertical-align:-1px;" value = "Y" class="va_up1 mg_l15" checked /> ���� 
                <input type="radio" name="p_display_fg" style="vertical-align:-1px;" value = "N" class="va_up1 mg_l10" /> �����
                </td>
                <%} %>
                <th class="th">�ۼ�����</th>
                <td class="td stxt ff_t"><%= FormatDate.getDate("yyyy.MM.dd") %></td>
            </tr>
            
            <tr>
                <td colspan="8" class="td con">
                    <textarea  id="p_content" name="p_content" style="display:none;"></textarea>
                    <script type="text/javascript">
                        var CrossEditor = new NamoSE("contents");
                        CrossEditor.editorStart();
                        CrossEditor.SetUISize("650","400");
                    </script>
                </td>
            </tr>
            </table>
            <% if(v_filecnt>0){ %>
            <!-- ����÷�� ���� -->
            <%
            Vector i_realfileVector    = null;        // ���� ���ϸ�
            Vector i_savefileVector    = null;        // ���� ���ϸ�
            Vector i_fileseqVector     = null;        // ���� �Ϸù�ȣ
            
            int    i_fileLimit         = v_filecnt;                                   // ���� ÷�� ���ϼ�
            
            String i_formName          = "form1";                                     // Form �̸�
            String i_ServletName       = "CommunityFrBoardServlet";                        // ���� ���� �̸�
            String i_boardStyle        = "study_write";                               // �Է� ���̺� Class ��
            %>
            <%@ include file="/learn/user/portal/include/multiAttach_include.jsp" %>
            <!-- ����÷�� ���� -->
            <% } %>
            
            <p class="board_btn"><a href="javascript:uf_insertOK();" class="btn_gr"><span>���</span></a><a href="javascript:wf_listOK();" class="btn_gr"><span>���</span></a></p>

</form>
<!-- Form ���� ���� -->

<!-- footer ���� ���� -->
<%@ include file="/learn/user/community/include/cm_bottom.jsp"%>
<!-- footer ���� ���� -->

