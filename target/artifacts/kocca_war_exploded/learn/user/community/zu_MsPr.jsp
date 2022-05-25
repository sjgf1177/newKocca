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

    String  v_process    = box.getStringDefault("p_process","movememberactivityPage");
    String  v_cmuno      = box.getString("p_cmuno");//������ ������������ ������ ������.
    

    String  s_userid     = box.getSession("userid");
    String  s_username   = box.getSession("name");
    String  s_grcode	 = box.getSession("tem_grcode");
	String  s_grtype	 = GetCodenm.get_grtype(box,s_grcode);


    String  content      = box.getString("content");
    String  width = "630";
    String  height = "150";
    String  v_realfile ="";
    String  v_savefile="";
    ArrayList list       = (ArrayList)request.getAttribute("list");
    if(list.size()>0){
        DataBox dbox = (DataBox)list.get(0);
        content=dbox.getString("d_contents");
        v_realfile=dbox.getString("d_realfile");
        v_savefile=dbox.getString("d_savefile");

    }

%>  
<%@ include file="/learn/user/community/include/cm_top.jsp"%> 
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--
//����
function uf_insertOK(pageNum) {
    if(!CrossEditor.IsDirty()){ // ũ�ν������� ���� ������ �Է� Ȯ�� 
        alert(" �����Ϳ� ������ �Է��� �ּ��� !!"); 
        CrossEditor.SetFocusEditor();// ũ�ν������� Focus �̵� 
        return; 
    } 

   document.getElementById("p_content").value = CrossEditor.GetBodyValue();

    document.form1.action = "/servlet/controller.community.CommunityMasterServlet";
    document.form1.p_process.value = "insertprData";
    document.form1.submit();
}

//���ϻ���
function uf_deleteFileOK(pageNum) {
    if(document.all.use_editor[0].checked) {        
        form1.content.value = ObjEditor.document.all.tags("html")[0].outerHTML;
    }else {
        form1.content.value = document.all.txtDetail.value;
    }

    document.form1.action = "/servlet/controller.community.CommunityMasterServlet";
    document.form1.p_process.value = "deleteprfileData";
    document.form1.submit();
}


//����Ʈ
function uf_listOK() {
    document.form1.action          = "/servlet/controller.community.CommunityMasterServlet";
    document.form1.p_process.value = "selectmsmainPage";
    document.form1.submit();
}

//-->
</script>
<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name = "form1"   enctype = "multipart/form-data"   method = "post">
<input type = "hidden" name = "p_process"     value="">
<input type = "hidden" name = "p_userid"      value = "">
<input type = "hidden" name = "p_cmuno"      value = "<%=v_cmuno%>">
<input type = "hidden" name = "p_pageno"      value = "">

            <h1><img src="/images/portal/community/tit_06.gif" alt="ȫ����û" /></h1>

            <table class="study_write">
             <!--[if ie]><colgroup><col width="85px" /><col width="520" /></colgroup><![endif]-->
            <colgroup><col width="105px" /><col width="420px" /></colgroup>
            
            <tr>
                <th class="th va_t"><label for="comname">�̹���</label></th>
                <%    if(v_savefile.length()>0){%>
                <td class="td in"><img id="img_photo" src="/servlet/controller.library.DownloadServlet?p_savefile=<%=v_savefile%>" width="110" height="110" /></td>
                <%    } else {%>
                <td class="td in"><img id="img_photo" src="/images/portal/thumb/thumb_110.gif" width="110" height="110" /></td>
                <%    } %>
            </tr>
            <tr>
                <th class="th"><label for="comname">�̹��� �߰�</label></th>
                <td class="td">
                    <jsp:include page="/learn/user/portal/include/singleAttach_include.jsp">
	                    <jsp:param name="i_imageFlag"           value="Y" />
	                    <jsp:param name="i_realFileName"        value="" />
	                    <jsp:param name="i_saveFileName"        value="<%=v_savefile%>" />
	                    <jsp:param name="i_targetImg"           value="img_photo" />
	                    <jsp:param name="i_inputFileParamName"  value="p_savefile" />
	                    <jsp:param name="i_formName"            value="form1" />
	                    <jsp:param name="i_ServletName"         value="CommunityMasterServlet" />
	                    <jsp:param name="i_searchOnImagePath"   value="/images/portal/btn/file_search_on.gif" />
	                    <jsp:param name="i_searchOffImagePath"  value="/images/portal/btn/file_search.gif" />
	                    <jsp:param name="i_style"               value="" />
	                </jsp:include>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="td con">
                    <textarea id="p_content" name="p_content" style="display:none"><%=StringManager.replace(content, "&", "&amp") %></textarea>
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

            <p class="board_btn"><a href="javascript:uf_insertOK();" class="btn_gr"><span>���</span></a></p>

</form>
<!-- Form ���� ���� -->

<!-- footer ���� ���� -->
<%@ include file="/learn/user/community/include/cm_bottom.jsp"%>
<!-- footer ���� ���� -->