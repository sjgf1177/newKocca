<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    
    box.put("topmenu","5");
    box.put("submenu","7");
    
    ArrayList list1 = null;
    ArrayList list2 = null;

    String  v_process  = box.getString("p_process");

    // �˻�
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    
    String  v_selSeminarGubun   = box.getString("p_selSeminarGubun");
    
    int v_pageno    = box.getInt("p_pageno");
    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������
    int v_rowcount  = 0;
	int v_pagesize = box.getInt("p_pagesize");
    
    int    v_seq     = 0;              // �Ϸù�ȣ
    int    v_cnt     = 0;              // ��ȸ��

    String v_title     = "";           // ����
    String v_content   = "";           // ����
    String v_indate    = "";           // �����
    String v_name      = "";           // �����
    String v_startdate = "";           // �̺�Ʈ ������
    String v_enddate   = "";           // �̺�Ʈ ������
    String v_winneryn  = "";           // ��û�� ����
    String v_isall     = "";
    String v_status    = "";
    String v_bannerimg = "";
    
    String s_userid   = box.getSession("userid");
    String s_username = box.getSession("name");
    
    list1 = (ArrayList)request.getAttribute("selectList1");
    list2 = (ArrayList)request.getAttribute("selectList2");
   
%>    
<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<SCRIPT LANGUAGE="JavaScript">
<!--
    function go(index) {
        document.nform1.p_pageno.value = index;
        document.nform1.action = "/servlet/controller.homepage.EventHomePageServlet";
        document.nform1.p_process.value = "selectList";
        document.nform1.submit();
    }

    //������ ����
    function goPage(pageNum) {
        document.nform1.p_pageno.value = pageNum;
        document.nform1.action = "/servlet/controller.homepage.EventHomePageServlet";
        document.nform1.p_process.value = "selectList";
        document.nform1.submit();
    }

    //����Ʈ ��ȸ
    function select() {
        document.nform1.p_pageno.value = 0;
        document.nform1.action = "/servlet/controller.homepage.EventHomePageServlet";
        document.nform1.p_process.value = "selectList";
        document.nform1.submit();
    }

    //�󼼺���
    function selectView(seq) {

        document.nform1.action = "/servlet/controller.homepage.EventHomePageServlet";
        document.nform1.p_process.value = "selectView";
        document.nform1.p_seq.value= seq;
        document.nform1.submit();
    }

    function viewPassContent(seq) {

    	window.open("about:blank", "popUpView", "top=0, left=0, width=400, height=330, status=no, resizable=no, scrollbars=auto");

        document.nform1.action="/servlet/controller.homepage.EventHomePageServlet";
        document.nform1.p_process.value = "selectViewPass";
        document.nform1.p_seq.value = seq;
        document.nform1.target="popUpView";
        document.nform1.submit();
        
        document.nform1.target="_self";
    }

//-->
</SCRIPT>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name="nform1" method="post" onsubmit="javascript:select();" action="">
    <input type = "hidden" name = "p_process">
    <input type = "hidden" name = "p_pageno"  value="<%=v_pageno%>"> 
    <input type = "hidden" name = "p_seq"    >
    
   <div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0" summary="���� �����ô� �������� ��ġ�Դϴ�">
			<tr>
				<td class="pagenaviR"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > �н����� > <u>�̺�Ʈ</u></td>
			</tr>
		</table>
		<div class="concept">
			<div><img src="/images/2012/sub/page4/title/event.gif" alt="�ѱ���������ī���̿��� �����ϴ� ���� �̺�Ʈ�� �����غ�����"></div>
			<ul class="boardsearch">
				<li class="typechoice">
					<p onclick="typechoiceopen('1')" tabindex="171" onfocus="typechoiceopen('1')"><span id="choicename">����</span><img src="/images/2012/sub/page6/arrow_down.png" align="absmiddle" alt="����"></p>
					<input type="hidden" id="choicetype" value="subject">
					<input type="hidden" name="p_search" value="title">
					<dl id="typelist" class="typelist" style="display:none;">
						<dd onclick="searchtype('����')" tabindex="172" onfocus="this.style.background='#1f68b3'" onblur="this.style.background='#4898ea'" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">����</dd>
						<dd onclick="searchtype('����')" tabindex="173" onfocus="this.style.background='#1f68b3'" onblur="this.style.background='#4898ea'; searchtypeclose();" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">����</dd> 
					</dl>
				</li>
				<li class="insert"><input type="text" tabindex="174" name="p_searchtext" class="insearch" onfocus="this.style.background='#ffffff'" title="�˻��� ������ �Է����ּ���"></li>
				<li class="output"><a href="javascript:select();" tabindex="175" title="�˻��� �����մϴ�"><img src="/images/2012/sub/page2/btn_course_search.gif" alt="�����˻�"></a></li>
			</ul>
		</div>
		<div class="event">
			<img src="/images/2012/sub/page4/subject_playevent.gif" class="category" alt="�������� �̺�Ʈ">
			<table class="eventlist" cellpadding="0" cellspacing="0" summary="���� �������� �̺�Ʈ�� ����Դϴ�">
				<colgroup><col width="210"><col width="280"><col width="210"><col width="280"></colgroup>
				<tr>
				<%
					if(list1.size() != 0){
						for( int i = 0; i < list1.size(); i++) {
						    DataBox dbox     = (DataBox)list1.get(i);
						    
						    v_seq       = dbox.getInt("d_seq");
						    v_cnt       = dbox.getInt("d_cnt");
						    v_title     = dbox.getString("d_title");
						    v_startdate = dbox.getString("d_strdate");
						    v_enddate   = dbox.getString("d_enddate");
						    v_indate    = dbox.getString("d_indate");
						    v_name      = dbox.getString("d_name");
						    v_winneryn  = dbox.getString("d_winneryn");
						    v_isall     = dbox.getString("d_isall");
						
						    v_dispnum        = dbox.getInt("d_dispnum");
						    v_totalpage      = dbox.getInt("d_totalpage");
						    v_rowcount       = dbox.getInt("d_rowcount");
						    v_bannerimg       = dbox.getString("d_bannerimg");
						    
						    if(v_winneryn.equals("C")){
						    	v_winneryn = "�̹�ǥ";
						    	v_status = "�Ϸ�";
						    } else if(v_winneryn.equals("Y")){
						        v_winneryn = "<a href='javascript:viewPassContent("+v_seq+")'><img src='/images/portal/homepage_renewal/library/btn_dok.jpg' width='90' height='21' alt='��÷��Ȯ��' /></a>";
						        v_status = "�Ϸ�";
						    } else if(v_winneryn.equals("N")){
						    	v_winneryn = "�̹�ǥ";
						    	v_status = "����";
						    } else if(v_winneryn.equals("A")){
						    	v_winneryn = "�̹�ǥ";
		                        v_status = "����";
		                    } 
						    
						    
						    //if (!v_searchtext.equals("")&&v_search.equals("title")) {
						    	/*
						    if (!v_searchtext.equals("")) {
						    	v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
						    } 
						    	*/
				%>      
					<th><div><img src="http://edu.kocca.or.kr/upload/event/<%=v_bannerimg%>" alt="<%=FormatDate.getFormatDate(v_startdate, "yyyy.MM.dd")%> ~ <%=FormatDate.getFormatDate(v_enddate, "yyyy.MM.dd")%> <%=v_title%>"></div></th>
					<td>
						<h4><%=v_title%></h4>
						<h5><img src="/images/2012/sub/page4/icon_eventdate.gif" alt="�̺�Ʈ�Ⱓ"> <%=FormatDate.getFormatDate(v_startdate, "yyyy.MM.dd")%> ~ <%=FormatDate.getFormatDate(v_enddate, "yyyy.MM.dd")%></h5>
						<p>
							<a href="javascript:selectView(<%=v_seq%>)" tabindex="<%=i+180%>" title="<%=FormatDate.getFormatDate(v_startdate, "yyyy.MM.dd")%> ~ <%=FormatDate.getFormatDate(v_enddate, "yyyy.MM.dd")%> <%=v_title%>�� ���� �̺�Ʈ �󼼳����� Ȯ���մϴ�"><img src="/images/2012/sub/page4/btn_eventdetail.gif" alt="�̺�Ʈ�󼼺���"></a>
							<!-- <a href="#"><img src="/images/2012/sub/page4/btn_notchoice.gif" alt="�̹�ǥ"></a> -->
						</p>
					</td>
					
				<% }} %>
				
				<% if (list1.size() == 0) { %>					
					<td colspan="4" class="noevent">
						���� �������� �̺�Ʈ�� �����ϴ�.
					</td>
				<% } %>		
				<% if (list1.size() % 2 == 1) { %>	
					<th></th><td>&nbsp;</td>		
				<% } %>			
				</tr>
			</table>
			
			<img src="/images/2012/sub/page4/subject_stopevent.gif" class="category" alt="����� �̺�Ʈ">
			<table class="eventlist" cellpadding="0" cellspacing="0" summary="���� �������� �̺�Ʈ�� ����Դϴ�">
				<colgroup><col width="210"><col width="280"><col width="210"><col width="280"></colgroup>
				<tr>
				
				 <%
					if(list2.size() != 0){
						for( int i = 0; i < list2.size(); i++) {
						    DataBox dbox     = (DataBox)list2.get(i);
						    
						    v_seq       = dbox.getInt("d_seq");
						    v_cnt       = dbox.getInt("d_cnt");
						    v_title     = dbox.getString("d_title");
						    v_startdate = dbox.getString("d_strdate");
						    v_enddate   = dbox.getString("d_enddate");
						    v_indate    = dbox.getString("d_indate");
						    v_name      = dbox.getString("d_name");
						    v_winneryn  = dbox.getString("d_winneryn");
						    v_isall     = dbox.getString("d_isall");
						
						    v_dispnum        = dbox.getInt("d_dispnum");
						    v_totalpage      = dbox.getInt("d_totalpage");
						    v_rowcount       = dbox.getInt("d_rowcount");
						    v_bannerimg       = dbox.getString("d_bannerimg");
						    
						    /*
						    if(v_winneryn.equals("C")){
						    	v_winneryn = "�̹�ǥ";
						    	v_status = "�Ϸ�";
						    } else if(v_winneryn.equals("Y")){
						        v_winneryn = "<a href='javascript:viewPassContent("+v_seq+")'><img src='/images/portal/homepage_renewal/library/btn_dok.jpg' width='90' height='21' alt='��÷��Ȯ��' /></a>";
						        v_status = "�Ϸ�";
						    } else if(v_winneryn.equals("N")){
						    	v_winneryn = "�̹�ǥ";
						    	v_status = "����";
						    } else if(v_winneryn.equals("A")){
						    	v_winneryn = "�̹�ǥ";
		                        v_status = "����";
		                    } 
						    */
						    
						    //if (!v_searchtext.equals("")&&v_search.equals("title")) {
						    /*
						    if (!v_searchtext.equals("")) {
						    	v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
						    } 
						    */
					%>      
			
					<th><div><img src="http://edu.kocca.or.kr/upload/event/<%=v_bannerimg%>" alt="<%=FormatDate.getFormatDate(v_startdate, "yyyy.MM.dd")+"~"+FormatDate.getFormatDate(v_enddate, "MM.dd")%> <%=v_title%>"></div></th>
					<td>
						<h4><%=StringManager.formatTitle(v_title, 52)%></h4>
						<h5><img src="/images/2012/sub/page4/icon_eventfinish.gif" alt="�̺�Ʈ����"> <%=FormatDate.getFormatDate(v_startdate, "yyyy.MM.dd")+"~"+FormatDate.getFormatDate(v_enddate, "MM.dd")%></h5>
						<p>
							<a href="javascript:selectView(<%=v_seq%>)" tabindex="<%="2"+i+"1"%>" title="[����� �̺�Ʈ] <%=v_title%>�� ���� �̺�Ʈ �󼼳����� Ȯ���մϴ�"><img src="/images/2012/sub/page4/btn_eventdetail.gif" alt="�̺�Ʈ�󼼺���"></a>
							<% if(v_winneryn.equals("Y")){ %>
							<a href="javascript:viewPassContent(<%=v_seq%>)" tabindex="<%="2"+i+"2"%>" title="[����� �̺�Ʈ] <%=v_title%>�� ���� ��÷�ڸ� Ȯ���մϴ� (��â)"><img src="/images/2012/sub/page4/btn_choicepeople.gif" alt="��÷�ڹ�ǥ"></a> 
							<% } %>
						</p>
					</td>
					<% if ((i+1)%2 == 0) {%> </tr><tr> <% } %>
					
					<% }} %>
				</tr>
			</table>
			<div class="clearL"></div>
			<div class="pageset">
				<%= PageUtil.re2012_printPageListDiv(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
			</div>
		</div>
	</div>
</form>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
