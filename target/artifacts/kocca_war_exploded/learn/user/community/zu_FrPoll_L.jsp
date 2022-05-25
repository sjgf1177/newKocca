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
    String  v_cmuno      = box.getString("p_cmuno");
    String  v_menuno     = box.getString("p_menuno");    
    String  v_searchtext = box.getString("p_searchtext");
    String  v_select     = box.getString("p_select");
    String  v_brd_fg      = box.getString("p_brd_fg");   
    String  s_userid     = box.getSession("userid");
    String  s_username   = box.getSession("name");
    String  s_grcode	 = box.getSession("tem_grcode");
	String  s_grtype	 = GetCodenm.get_grtype(box,s_grcode);
	
	String v_status = "";

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

//������������̵�
function uf_moveInsertPage() {

    document.form1.action = "/servlet/controller.community.CommunityFrPollServlet";
    document.form1.p_process.value = "movewirtePage";
    document.form1.submit();
}
//�������������̵�
function uf_moveUpdatePage() {

    document.form1.action = "/servlet/controller.community.CommunityFrPollServlet";
    document.form1.p_process.value = "moveupdatePage";
    document.form1.submit();
}

//�������̵�
function goPage(pageNum) {
    document.form1.p_pageno.value = pageNum;
    document.form1.action = "/servlet/controller.community.CommunityFrPollServlet";
    document.form1.p_process.value = "movelistPage";
    document.form1.submit();
}

//��ȸ
function uf_searchOK() {
    if(document.form1.p_searchtext.value ==''){
       alert('�˻�� �Է��Ͽ����մϴ�.');document.form1.p_searchtext.focus();return;
    }

    document.form1.p_pageno.value = 1;
    document.form1.action = "/servlet/controller.community.CommunityFrPollServlet";
    document.form1.p_process.value = "movelistPage";
    document.form1.submit();
}

//���ΰ�ħ
function uf_refreshOK() {
    document.form1.action = "/servlet/controller.community.CommunityFrPollServlet";
    document.form1.p_process.value = "movelistPage";
    document.form1.submit();
}

//�������������
function uf_resultviewOK(pollno,rowseq, status) {
    document.form1.p_pollno.value = pollno;
    document.form1.p_rowseq.value = rowseq;
    document.form1.action = "/servlet/controller.community.CommunityFrPollServlet";
    if(status == "ING"){
        document.form1.p_process.value = "queryReply";
    } else {
        document.form1.p_process.value = "moveresultviewPage";
    }
    document.form1.submit();
}

//-->
</script>
<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name = "form1"    method = "post">
	<input type = "hidden" name = "p_process"     value="">
	<input type = "hidden" name = "p_cmuno"      value="<%=v_cmuno%>">
	<input type = "hidden" name = "p_pageno"      value = "">
	<input type = "hidden" name = "p_userid"      value = "">
	<input type = "hidden" name = "p_pollno"       value = "">
	<input type = "hidden" name = "p_rowseq"       value = "">
	<input type = "hidden" name = "p_brd_fg"       value = "<%=box.getString("p_brd_fg")%>">
            <h1 class="list">
                <img src="/images/portal/community/tit_05.gif" alt="��������" class="fl_l" />
                <p>
                <select name="p_select">
	                <option value="title"   <%if("title".equals(v_select)) out.print(" selected");%>>����</option>
	                <option value="name"    <%if("name".equals(v_select)) out.print(" selected");%>>�۾���</option>
                </select>
                <input type="text" class="inbox" style="width:144px;"  value="<%=v_searchtext%>" onkeypress="javascript:fnKeyPressEnter(event, 'uf_searchOK');"/><a href="javascript:uf_searchOK();"><img src="/images/portal/btn/btn_serbox_search.gif" alt="�˻�" /></a></p>
            </h1>

            <table class="board_list">
            <colgroup><col width="48px" /><col /><col width="77px" /><col width="77px" /><col width="77px" /><col width="50px" /></colgroup>
            <thead>
            <tr class="gray">
                <th><p>��ȣ</p></th>
                <th><p>����</p></th>
                <th><p>���࿩��</p></th>
                <th><p>��������</p></th>
                <th><p>��������</p></th>
                <th class="end"><p>������</p></th>
            </tr>
            </thead>
            <tbody>
			<%  if(list.size() != 0){
			      for(int i = 0; i < list.size(); i++) {
			          DataBox dbox = (DataBox)list.get(i);
			          
			          String v_pollno   = dbox.getString("d_pollno");
			          String v_title    = dbox.getString("d_title");
			          String v_fdte     = dbox.getString("d_fdte");
			          String v_tdte     = dbox.getString("d_tdte");
			          String v_name     = dbox.getString("d_name");
			          String v_tot_poll_cnt = dbox.getString("d_tot_poll_cnt");
			          String v_poll_status  = dbox.getString("d_poll_status");
			          
			          v_dispnum    = dbox.getInt("d_dispnum");
			          v_totalpage = dbox.getInt("d_totalpage");
			          
			          if(v_poll_status.equals("PRE")){
			        	  v_poll_status = "<a class=\"state\"><span class=\"ing\">������</span></a>";
			        	  v_status = "PRE";
			          } else if(v_poll_status.equals("ING")){
			              v_poll_status = "<a class=\"state\"><span class=\"ing\">����</span></a>";
			              v_status = "ING";
			          } else {
			        	  v_poll_status = "<a class=\"state\"><span class=\"finish\">�Ϸ�</span></a>";
			        	  v_status = "END";
			          }
			
			          if (!v_searchtext.equals("")&&v_select.equals("title")) {
			              v_title = StringManager.replace(dbox.getString("d_title"), v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
			          } else if(!v_searchtext.equals("")&&v_select.equals("name")){
			              v_name = StringManager.replace(dbox.getString("d_name"), v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
			          }
			
			%>
			<tr onmouseover="className='over'" onmouseout="className=' '">
                <td class="num"><%=v_dispnum%></td>
                <td class="ta_l"><a href="javascript:uf_resultviewOK(<%=dbox.getString("d_pollno")%>,1, '<%=v_status %>');"><%=v_title%></a></td>
                <td class="btn"><%=v_poll_status%></td>
                <td class="num"><%=FormatDate.getFormatDate(v_fdte, "yyyy.MM.dd")%></td>
                <td class="num"><%=FormatDate.getFormatDate(v_tdte, "yyyy.MM.dd")%></td>
                <td class="num"><%=v_tot_poll_cnt%></td>
            </tr>
			<%   }
			   } else {%>
                   <tr> 
                     <td colspan="6">�������� ������ �����ϴ�.</td>
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