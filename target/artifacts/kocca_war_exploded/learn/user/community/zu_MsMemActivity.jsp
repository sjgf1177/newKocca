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

    String  v_process      = box.getStringDefault("p_process","movememberactivityPage");
    String  v_cmuno      = box.getString("p_cmuno");//������ ������������ ������ ������.
    
    String  v_searchtext = box.getString("p_searchtext");
    String  v_select     = box.getString("p_select");

    String  s_userid     = box.getSession("userid");
    String  s_username   = box.getSession("name");
    String  s_grcode	 = box.getSession("tem_grcode");
	String  s_grtype	 = GetCodenm.get_grtype(box,s_grcode);

    int v_dispnum    = 0;
    int v_totalpage  = 0;
    int v_rowcount   = 1;
    int v_upfilecnt  = 0;
    int v_pageno             = box.getInt("p_pageno");
    int row = Integer.parseInt(conf.getProperty("page.bulletin.row"));

    ArrayList list       = (ArrayList)request.getAttribute("list");

%>  

<%@ include file="/learn/user/community/include/cm_top.jsp"%> 
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--
//�������̵�
function goPage(pageNum) {
    document.form1.p_pageno.value = pageNum;
    document.form1.action = "/servlet/controller.community.CommunityMasterServlet";
    document.form1.p_process.value = "movememberactivityPage";
    document.form1.submit();
}

//��ȸ
function uf_searchOK() {
    document.form1.p_pageno.value  = 1;
    document.form1.action          = "/servlet/controller.community.CommunityMasterServlet";
    document.form1.p_process.value = "movememberactivityPage";
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
	<input type = "hidden" name = "p_pageno"      value = "">

            <h1><img src="/images/portal/community/tit_12.gif" alt="ȸ��Ȱ����Ȳ" /></h1>

            <p class="searchbox mg_tn">
                <select name="p_select">
                    <option value="userid"   <%if("userid".equals(v_select)) out.print(" selected");%>>���̵�</option>
                    <option value="kor_name" <%if("kor_name".equals(v_select)) out.print(" selected");%>>����</option>
                </select>
                <input name="p_searchtext" type="text" class="inbox" style="width:285px;" value="<%=v_searchtext%>" onkeypress="javascript:fnKeyPressEnter(event, 'uf_searchOK');" />
                <input type="image" src="/images/portal/btn/btn_serbox_search.gif" class="va_m mg_r12" alt="�˻�" onclick="uf_searchOK();"/>
            </p>

            <table class="list">
            <!--[if ie]><colgroup><col width="122px" /><col width="175px" /><col width="127px" /><col width="140" /></colgroup><![endif]-->
            <colgroup><col width="122px" /><col width="155px" /><col width="127px" /><col width="140" /></colgroup>
            <thead>
            <tr>
                <th class="end">����</th>
                <th class="end">�̸���</th>
                <th class="end">���</th>
                <th class="end">������</th>
            </tr>
            </thead>
            <tbody>
			<%  
			if(list.size() != 0){
			    for(int i = 0; i < list.size(); i++) {
			        DataBox dbox = (DataBox)list.get(i);
			        v_totalpage  = dbox.getInt("d_totalpage");
			
			        String v_title  =dbox.getString("d_title");
			        String v_name   =dbox.getString("d_kor_name");
			
			        if (!v_searchtext.equals("")&&v_select.equals("userid")) {
			            v_title = StringManager.replace(dbox.getString("d_userid"), v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
			        } else if(!v_searchtext.equals("")&&v_select.equals("kor_name")){
			            v_name = StringManager.replace(dbox.getString("d_kor_name"), v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
			        }
			
			%>
			<tr>
                <td class="end"><%=v_name%></td>
                <td class="ta_l end"><%=dbox.getString("d_email")%></td>
                <td class="end"><%=dbox.getString("d_grade_kor_nm")%></td>
                <td class="num end"><%=FormatDate.getFormatDate(dbox.getString("d_license_dte"), "yyyy.MM.dd")%></td>
            </tr>
			<%    }
			    } else {%>
            <tr> 
                <td class="end" colspan=4>Ȱ������ ȸ���� �������� �ʽ��ϴ�..</td>
            </tr>
            <% }%>
            </tbody>
            </table>
            
        <!-- ����¡ ���� ���� -->
         <%= PageUtil.printPageSizeListDivNoPagesize(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
        <!-- ����¡ ���� ���� -->
                  
</form>
<!-- Form ���� ���� -->

<!-- footer ���� ���� -->
<%@ include file="/learn/user/community/include/cm_bottom.jsp"%>
<!-- footer ���� ���� -->