<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage   = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.io.*" %>
<%@ page import = "com.credu.community.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.cp.*" %>
<%@ page import = "com.credu.system.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process    = box.getString("p_process");
    String  v_cmuno      = box.getString("p_cmuno");
    String  v_menuno     = box.getString("p_menuno");    
    String  v_searchtext = box.getString("p_searchtext");
    String  v_select     = box.getString("p_select");

    String  s_userid     = box.getSession("userid");
    String  s_username   = box.getSession("name");

    String  s_grcode	 = box.getSession("tem_grcode");
	String  s_grtype	 = GetCodenm.get_grtype(box,s_grcode);
    int     v_pageno     = box.getInt("p_pageno");
		//
	String  v_board_fg	 = box.getStringDefault("p_brd_fg","0");

    DataBox dbox       = (DataBox)request.getAttribute("selectView");

    int v_filecnt       = box.getInt("fielcnt"); // �ִ� ���� ÷�� ����
     
     int v_brdno = box.getInt("p_brdno");


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
    
	//if(!CrossEditor.IsDirty()){ // ũ�ν������� ���� ������ �Է� Ȯ�� 
    //    alert("������ �Է��� �ּ��� !!"); 
        //CrossEditor.SetFocusEditor();// ũ�ν������� Focus �̵� 
        //return false; 
    //} 

    document.getElementById("p_content").value = CrossEditor.GetBodyValue();
	document.form1.p_brd_fg.value= v_board_fg;
    document.form1.action = "/servlet/controller.community.CommunityFrBoardServlet";
    document.form1.p_process.value = "updateData";
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
<form name = "form1"    enctype = "multipart/form-data"    method = "post">
<input type = "hidden" name = "p_process"     value="">
<input type = "hidden" name = "p_cmuno"       value="<%=v_cmuno%>">
<input type = "hidden" name = "p_menuno"      value="<%=v_menuno%>">
<input type = "hidden" name = "p_pageno"      value = "">
<input type = "hidden" name = "p_userid"      value = "">
<input type = "hidden" name = "p_brdno"       value = "<%=box.getInt("p_brdno") %>">
<input type = "hidden" name = "p_rowseq"      value = "">
<input type = "hidden" name = "p_pageno"      value = "<%=v_pageno%>">
<input type = "hidden" name = "p_searchtext"  value = "<%=v_searchtext%>">
<input type = "hidden" name = "p_select"      value = "<%=v_select%>">
<input type = "hidden" name = "p_brd_fg"       value = "<%=box.getString("p_brd_fg")%>">

            <%if(v_board_fg.equals("0")){%>
            <img src="/images/portal/community/tit_01.gif" alt="��������" class="fl_l" />
            <%}else if(v_board_fg.equals("2")){%>
            <span class="fl_l" style="font-size:12px;font-weight:bold;"><img src="/images/portal/community/tit_02.gif" alt="�Խ���" class="va_up2" /> (<%=(new CommunityMsMenuBean()).getSingleColumn2(v_cmuno,v_menuno,"title",v_board_fg)%>)</span>
            <%}else if(v_board_fg.equals("1")){%>
            <span class="fl_l" style="font-size:12px;font-weight:bold;"><img src="/images/portal/community/tit_03.gif" alt="�ڷ��" class="va_up2" /> (<%=(new CommunityMsMenuBean()).getSingleColumn2(v_cmuno,v_menuno,"title",v_board_fg)%>)</span>
            <%}%>

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
                <td colspan="7" class="td"><input type="text" name="p_title" id="subject" class="inbox" style="width:97%;" value="<%=dbox.getString("d_title") %>" /></td>
            </tr>
            <tr>
                <th class="th">�ۼ���</th>
                <%if(v_menuno.equals("1")){%>
                <td class="td txt"><%=dbox.getString("d_name")%></td>
                <%} else { %>
                <td class="td"><%=dbox.getString("d_name")%>
                <input type="radio" name="p_display_fg" style="vertical-align:-1px;" value = "Y" class="va_up1 mg_l15" <%=dbox.getString("d_display_fg").equals("Y") ? "checked" : "" %> /> ���� 
                <input type="radio" name="p_display_fg" style="vertical-align:-1px;" value = "N" class="va_up1 mg_l10" <%=!dbox.getString("d_display_fg").equals("Y") ? "checked" : "" %> /> �����
                </td>
                <%} %>
                <th class="th">�ۼ�����</th>
                <td class="td stxt ff_t"><%=FormatDate.getFormatDate(dbox.getString("d_register_dte"), "yyyy/MM/dd")%></td>
            </tr>
            
            <tr>
                <td colspan="8" class="td con">
                    <textarea id="p_content" name="p_content" style="display:none;"><%=StringManager.replace(dbox.getString("d_content"), "&", "&amp") %></textarea>
					<script type="text/javascript">
					    var CrossEditor = new NamoSE("contents");
					    var contentValue = document.getElementById("p_content").value; // Hidden �� ����
					    CrossEditor.editorStart();
					    CrossEditor.SetUISize("650","400");
					    CrossEditor.SetBodyValue(contentValue); // ������ ���� ������ ����
					</script>
                </td>
            </tr>
            </table>
            <!-- ����÷�� ���� -->
            <%
            Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
            Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
            Vector i_fileseqVector     = (Vector)dbox.getObject("d_fileno");          // ���� �Ϸù�ȣ
            
            int    i_fileLimit         = v_filecnt;             // ���� ÷�� ���ϼ�
            
            String i_formName          = "form1";                                     // Form �̸�
            String i_ServletName       = "CommunityFrBoardServlet";                   // ���� ���� �̸�
            String i_boardStyle        = "study_write";                               // �Է� ���̺� Class ��
            %>
            <%@ include file="/learn/user/portal/include/multiAttach_include.jsp" %>
            <!-- ����÷�� ���� -->
            
            <p class="board_btn"><a href="javascript:uf_insertOK();" class="btn_gr"><span>����</span></a><a href="javascript:wf_listOK();" class="btn_gr"><span>���</span></a></p>

</form>
<!-- Form ���� ���� -->

<!-- footer ���� ���� -->
<%@ include file="/learn/user/community/include/cm_bottom.jsp"%>
<!-- footer ���� ���� -->
