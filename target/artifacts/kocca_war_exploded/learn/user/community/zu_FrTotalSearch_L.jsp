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

    String  v_searchtext = box.getString("p_searchtext");
    String  v_select     = box.getString("p_select");
    String  v_cmuno      = box.getString("p_cmuno");

    String  s_userid     = box.getSession("userid");
    String  s_username   = box.getSession("name");

    ArrayList list       = (ArrayList)request.getAttribute("list");

    int v_dispnum    = 0;
    int v_totalpage  = 0;
    int v_rowcount   = 1;
    int v_upfilecnt  = 0;
    int v_pageno             = box.getInt("p_pageno");
    int row = Integer.parseInt(conf.getProperty("page.bulletin.row"));
    
    String  v_title       = "";
    String  v_name        = "";  
    String  v_new_state   = "";  
    String  v_replyTitle  = "";  
    String  v_secret      = "";  
    String  v_register_dte  = "";
    
    int     v_brd_fg      = 0;
    int     i_datediff    = 0;  
    int     v_menuno      = 0;
    int     v_brdno       = 0;
    int     v_rowseq      = 0;
    int     v_file_cnt    = 0;
    int     v_read_cnt    = 0;
    int     v_lv          = 0;

%>  
<%@ include file="/learn/user/community/include/cm_top.jsp"%> 
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--
//��ȸ
function uf_searchOK(pageNum) {

	document.form1.p_pageno.value = pageNum;
    document.form1.action = "/servlet/controller.community.CommunityFrBoardServlet";
    document.form1.p_process.value = "totalsearchPage";
    document.form1.submit();
}
//����ȭ�������̵�
function uf_viewOK(menuno,brdno,rowseq, brd_fg) {
    document.form1.p_menuno.value = menuno;
    document.form1.p_brdno.value = brdno;
    document.form1.p_rowseq.value = rowseq;
    document.form1.p_brd_fg.value = brd_fg;
    document.form1.action = "/servlet/controller.community.CommunityFrBoardServlet";
    document.form1.p_process.value = "viewPage";
    document.form1.submit();
}
//�������̵�
function goPage(pageNum) {
    document.form1.p_pageno.value = pageNum;
    document.form1.action = "/servlet/controller.community.CommunityFrBoardServlet";
    document.form1.p_process.value = "totalsearchPage";
    document.form1.submit();
}
//-->
</script>
<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name = "form1"   enctype = "multipart/form-data" method = "post">
<input type = "hidden" name = "p_process"   value = "">
<input type = "hidden" name = "p_cmuno"     value = "<%=v_cmuno %>">
<input type = "hidden" name = "p_pageno"    value = "">
<input type = "hidden" name = "p_brdno"     value = "">
<input type = "hidden" name = "p_rowseq"    value = "">
<input type = "hidden" name = "p_menuno"    value = "">
<input type = "hidden" name = "p_brd_fg"    value = "">

            <h1 class="list">
            <span class="fl_l"><img src="/images/portal/community/tit_22.gif" alt="�Խ���" class="va_up2" /></span>
                <p><select name="p_select">
                <option value="title"   <%if("title".equals(v_select)) out.print(" selected");%>>����</option>
                <option value="content" <%if("content".equals(v_select)) out.print(" selected");%>>����</option>
                <option value="name"    <%if("name".equals(v_select)) out.print(" selected");%>>�۾���</option>
                </select>
                <input type="text" name="p_searchtext" class="inbox" style="width:144px;" onkeypress="javascript:fnKeyPressEnter(event, 'uf_searchOK');"/>
                <a href="javascript:uf_searchOK();"><img src="/images/portal/btn/btn_serbox_search.gif" alt="�˻�" /></a></p>
            </h1>

            <table class="board_list">
            <colgroup><col width="48px" /><col /><col width="62px" /><col width="77px" /><col width="63px" /><col width="44px" /></colgroup>
            <thead>
            <tr class="gray">
                <th><p>��ȣ</p></th>
                <th><p>����</p></th>
                <th><p>�ۼ���</p></th>
                <th><p>�ۼ�����</p></th>
                <th><p>÷��</p></th>
                <th class="end"><p>��ȸ</p></th>
            </tr>
            </thead>
            <tbody>
            <%  
            if(list.size() != 0){
                for(int i = 0; i < list.size(); i++) {
                    DataBox dbox = (DataBox)list.get(i);
                    
                    v_title       = dbox.getString("d_title");
                    v_name        = dbox.getString("d_name");
                    v_new_state   = dbox.getString("d_new_state");
                    v_replyTitle  = dbox.getString("d_replyTitle");
                    v_secret      = dbox.getString("d_secret");
                    v_register_dte= dbox.getString("d_register_dte");
                    
                    v_menuno      = dbox.getInt("d_menuno");
                    v_brdno       = dbox.getInt("d_brdno");
                    v_rowseq      = dbox.getInt("d_rowseq");
                    v_file_cnt    = dbox.getInt("d_file_cnt");
                    v_read_cnt    = dbox.getInt("d_read_cnt");
                    v_lv          = dbox.getInt("d_lv");
                    v_brd_fg      = dbox.getInt("d_brd_fg");
                    
                    v_totalpage = dbox.getInt("d_totalpage");
                    v_dispnum   = dbox.getInt("d_dispnum");

                    if (!v_searchtext.equals("")&&v_select.equals("title")) {
                        v_title = StringManager.replace(dbox.getString("d_title"), v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
                    } else if(!v_searchtext.equals("")&&v_select.equals("name")){
                        v_name = StringManager.replace(dbox.getString("d_name"), v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
                    }
                    
                    i_datediff= FormatDate.datediff("date",FormatDate.getFormatDate(dbox.getString("d_register_dte"), "yyyyMMdd"), FormatDate.getDate("yyyyMMdd"));
            
                    if(i_datediff < 4){
                      v_new_state="<img src='/images/portal/ico/ico_board_n.gif' align=absbottom>";
                    }
                    
                    if(dbox.getInt("d_lv") > 1){
                        for(int j=1;j < dbox.getInt("d_lv");j++){
                            v_replyTitle +="&nbsp;&nbsp;";
                        }
                        v_replyTitle += "<img src=\"/images/portal/community/ico_re.gif\" align=\"absbottom\">";
                    }
                    
                    if(dbox.getString("d_display_fg").equals("N")){
                        v_secret    = "<img src=\"/images/portal/ico/ico_board_s.gif\" />";                             
                    }
            
            %>
            <tr onmouseover="className='over'" onmouseout="className=' '">
                <td class="num"><%=v_dispnum%></td>
                <td class="ta_l"><a href="javascript:uf_viewOK(<%=v_menuno %>,<%=v_brdno%>,<%=v_rowseq%>,<%=v_brd_fg %>);"><%=v_replyTitle%><%=v_title%><%=v_new_state%><%=v_secret %></a></td>
                <td><%=v_name%></td>
                <td class="num"><%=FormatDate.getFormatDate(v_register_dte, "yyyy.MM.dd")%></td>
                <td><%=v_file_cnt > 0 ? "<img src=\"/images/portal/ico/ico_file.gif\" alt=\"file\" />" : "-" %></td>
                <td class="num"><%=v_read_cnt%></td>
            </tr>
            <%
                }
            } else {
            %>
            <tr> 
              <td colspan=6>��� �� �Խù��� �����ϴ�.</td>
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
