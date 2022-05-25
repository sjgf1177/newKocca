<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

	box.put("topmenu","5");
	box.put("submenu","3");
    
    int    v_seq        = box.getInt("p_seq");
    int    v_pageno     = box.getInt("p_pageno");
    String v_searchtext = box.getString("p_searchtext");             
    String v_select     = box.getString("p_select");
    String v_selCategory = box.getString("p_selCategory");
    
    String s_userid     = box.getSession("userid");
    
    String v_title      = "";
    String v_contents   = "";
    String v_inuserid   = "";
    String v_indate     = "";
    String v_types      = "";
    String v_name       = "";
    String v_categorycd = "";
    String v_categorynm = "";
    String v_isopen     = "";
    String v_repstatus  = "";
    int    v_cnt        = 0;
    
    DataBox dbox        = (DataBox)request.getAttribute("selectQna");
    
    if(dbox != null) {
        v_inuserid          = dbox.getString("d_inuserid");
        v_name              = dbox.getString("d_name");
        v_types             = dbox.getString("d_types");
        v_indate            = dbox.getString("d_indate");
        v_title             = dbox.getString("d_title");
        v_seq               = dbox.getInt("d_seq");
        v_cnt               = dbox.getInt("d_cnt");
        v_contents          = dbox.getString("d_contents");
        v_categorycd        = dbox.getString("d_categorycd");
        v_categorynm        = dbox.getString("d_categorynm");
        v_isopen            = dbox.getString("d_isopen");
        v_repstatus         = dbox.getString("d_okyn1");
        
    }

%>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">

    //����Ʈ�������� �̵�
    function selectList() {
        document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
        document.form1.p_process.value = "";     
        document.form1.submit();    
    }      
    
    function searchList() {
        if (form1.p_searchtext.value == ""){
            alert("�˻� �� ������ �Է��� �ּ���");
        }else{
        document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
        document.form1.p_process.value = "";
        document.form1.submit();
        }
    }
    
    //������������ �̵�
    function updatePage() {
        document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }
    
    //�亯 ��� �������� �̵�
    function replyPage() {
        document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
        document.form1.p_process.value = "replyPage";
        document.form1.submit();
    }   
    
    //������ ���
    function insertcomment() {
        if(document.form2.commentqna.value==""){
            alert("�������� ����ϼ���");
            return;
        }
        document.form2.p_categorycd.value = document.form1.p_categorycd.value; // ī�װ�
        document.form2.action = "/servlet/controller.homepage.HomePageQNAServlet";
        document.form2.p_process.value = "commentInsertPage";
        document.form2.submit();
    }
    
    
    //�� ȭ�� ����
    function deleteAction() {
        if (confirm("������ �����Ͻðڽ��ϱ�?")) {
            
            document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
            document.form1.p_process.value = "delete";
            document.form1.submit();
        }
        else {
            return;
        }
    }
    
    //������ ����
    function deleteComment(v_commentseq) {
        if (confirm("������ �����Ͻðڽ��ϱ�?")) {
            document.form2.p_commentseq.value = v_commentseq;
            document.form2.action = "/servlet/controller.homepage.HomePageQNAServlet";
            document.form2.p_process.value = "deleteComment";
            document.form2.submit();
        }
        else {
            return;
        }
    }

</script>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name = "form1" method = "post" action="">
    <input type = "hidden" name = "p_seq"         value = "<%= v_seq %>">
    <%-- <input type = "hidden" name = "p_searchtext"  value = "<%= v_searchtext %>"> --%>
    <%-- <input type = "hidden" name = "p_select"      value = "<%= v_select %>"> --%>
    <input type = "hidden" name = "p_pageno"      value = "<%= v_pageno %>">
    <input type = "hidden" name = "p_selCategory" value = "<%= v_selCategory %>">
    <input type = "hidden" name = "p_process"     value = "">
    <input type = "hidden" name = "p_userid"      value = "<%= v_inuserid %>">
    <input type = "hidden" name = "p_types"       value = "<%=v_types%>">
    
    <div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0" summary="���� ���� ��ô� ȭ���� ��ġ�Դϴ�">
			<tr>
				<td class="pagenaviR"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > �н����� > <u>������ϱ�</u></td>
			</tr>
		</table>
		<div class="concept">
			<div><img src="/images/2012/sub/page4/title/qna.gif" alt="�н��� ���� �ñ��� ���� �ִٸ� �����̵� �������"></div>
			<ul class="boardsearch">
				<li class="typechoice">
					<p onclick="typechoiceopen('1')" tabindex="121" onfocus="typechoiceopen('1')"><span id="choicename">����</span><img src="/images/2012/sub/page6/arrow_down.png" align="absmiddle" alt="����"></p>
					<input type="hidden" name="p_select" id="choicetype" value="title">
					<dl id="typelist" class="typelist" style="display:none;">
						<dd onclick="searchtype('����','title')" tabindex="122" onfocus="this.style.background='#1f68b3'" onblur="this.style.background='#4898ea'" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">����</dd>
						<dd onclick="searchtype('����','content')" tabindex="123" onfocus="this.style.background='#1f68b3'" onblur="this.style.background='#4898ea'; searchtypeclose();" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">����</dd>
					</dl>
				</li>
				<li class="insert"><input type="text" name="p_searchtext" tabindex="124" class="insearch" onfocus="this.style.background='#ffffff'" title="�˻��� ������ �Է����ּ���"></li>
				<li class="output"><a href="javascript:searchList();" tabindex="125" title="�˻��� �����մϴ�"><img src="/images/2012/sub/page2/btn_course_search.gif" alt="�����˻�"></a></li>
			</ul>
		</div>
		<br>
		<dl class="skipcontent">
			<dt>���� �ٷΰ���</dt>
			<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip01" tabindex="126" title="������������ �̵��մϴ�">������ ����</a></dd>
			<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip02" tabindex="127" title="������ ���� ��ī���� ����� �亯���� �̵��մϴ�">�亯�� ����</a></dd>
		</dl>
		<br>
		<div class="viewbar" id="skip01"><h6><b><%= v_title %> </b></h6></div>
		<div class="viewcontent">
			<h6><%=v_contents.replace("\n","<BR>")%></h6>
			<%
      Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
      Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
      String i_boardStyle        = "board_view";                                // ���� ��Ÿ��
     	%>   
		  <%@ include file="/learn/user/include/zu_MultiAttach_2012_R.jsp" %>
			<table class="about" cellpadding="0" cellspacing="0" summary="�Խù� ������ Ȯ���մϴ�">
				<colgroup><col width="34"><col width="*"><col width="65"><col width="70"><col width="36"><col width="30"></colgroup>
				<tr>
					<th id="w_category">�з�</th>
					<td name="w_category"><%=v_categorynm %></td>
					<th id="w_writingdate">�ۼ�����</th>
					<td name="w_writingdate"><%= FormatDate.getFormatDate(v_indate, "yyyy.MM.dd") %></td>
					<th id="w_count">��ȸ</th>
					<td name="w_writingdate"><%=v_cnt%></td>
				</tr>
			</table>
		</div>
		<% if(v_repstatus.equals("3")){ %>
			<%@ include file="/learn/user/2012/portal/helpdesk/zu_HomePageQna_A.jsp"%> 
		<% } %>
		<div class="viewfooter">
		<%if(v_inuserid.equals(box.getSession("userid")) && !v_repstatus.equals("3")){%>
			<button type="button" onclick="javascript:updatePage();" tabindex="191" class="btn_small_linegray" title="�� ���� �����մϴ�">�����ϱ�</button>
			<button type="button" onclick="javascript:deleteAction();" tabindex="192" class="btn_small_linegray" title="�� ���� �����մϴ�">�����ϱ�</button>
		<% } %>
			<button type="button" onclick="javascript:selectList();" tabindex="193" class="btn_small_lineblue" title="������� ���ư��ϴ�">�������</button>
		</div>
	</div>
</form>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
