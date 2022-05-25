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
    
    box.put("topmenu","4");
    box.put("submenu","4");

    ArrayList list1 = null;
    ArrayList list2 = null;

    String  v_process  = box.getString("p_process");

    // �˻�
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    
    String  v_selClsfCd   = box.getString("p_selClsfCd");
    String  v_selDtlCd   = box.getString("p_selDtlCd");
    
    int v_pageno    = box.getInt("p_pageno");
    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������
    int v_rowcount  = 0;
    int v_pagesize = box.getInt("p_pagesize");
	int	 v_totalrowcount =  0;
    
    int    v_seq     = 0;              // �Ϸù�ȣ
    int    v_cnt     = 0;              // ��ȸ��

    String v_gubun           = "";
    String v_clsfcd          = "";
    String v_clsfnm          = "";
    String v_dtlcd           = "";
    String v_dtlnm           = "";
    String v_title           = "";
    String v_professor       = "";
    String v_usechk          = "";
    String v_userid          = "";
    String v_name            = "";
    String v_useyn           = "";
    String v_indate          = "";
    String v_fileyn          = "";
    
    String s_userid   = box.getSession("userid");
    String s_username = box.getSession("name");
    
    list2 = (ArrayList)request.getAttribute("selectList");
   
%>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->

<SCRIPT LANGUAGE="JavaScript">
<!--
    function go(index) {
        document.nform1.p_pageno.value = index;
        document.nform1.target  =   "_self";
        document.nform1.action = "/servlet/controller.infomation.SpecialCourseHomePageServlet";
        document.nform1.p_process.value = "selectList";
        document.nform1.submit();
    }

    //������ ����
    function goPage(pageNum) {
        document.nform1.p_pageno.value = pageNum;
        document.nform1.target  =   "_self";
        document.nform1.action = "/servlet/controller.infomation.SpecialCourseHomePageServlet";
        document.nform1.p_process.value = "selectList";
        document.nform1.submit();
    }

    //����Ʈ ��ȸ
    function select() {
        document.nform1.p_pageno.value = 0;
        document.nform1.target  =   "_self";
        document.nform1.action = "/servlet/controller.infomation.SpecialCourseHomePageServlet";
        document.nform1.p_process.value = "selectList";
        document.nform1.submit();
    }

    //�󼼺���
    function selectView(seq) {
    	document.nform1.target  =   "_self";
        document.nform1.action = "/servlet/controller.infomation.SpecialCourseHomePageServlet";
        document.nform1.p_process.value = "selectView";
        document.nform1.p_seq.value= seq;
        document.nform1.submit();
    }

//-->
</SCRIPT>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name="nform1" method="post" onsubmit="javascript:select();">
    <input type = "hidden" name = "p_process">
    <input type = "hidden" name = "p_pageno"  value="<%=v_pageno%>"> 
    <input type = "hidden" name = "p_seq"    >
    <input type = "hidden" name = "p_selClsfCd" value="<%=v_selClsfCd%>">
	
    <div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0">
			<tr>
				<td class="pagetitle"></td>
				<td class="pagenavi"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > �������ΰ��� > <u>�����ڷ��</u></td>
			</tr>
		</table>
		
		<%
				String full_toggle = "off";
				String sub1_toggle = "off";
				String sub2_toggle = "off";
				String sub3_toggle = "off";				
				
				if ("SC2".equals(v_selClsfCd))        { sub1_toggle = "on"; 
				} else if ("SC".equals(v_selClsfCd)) { sub2_toggle = "on"; 				
				} else if ("SC1".equals(v_selClsfCd)) { sub3_toggle = "on"; 					
				} else { full_toggle = "on"; 				
				}
		%>
			
		<div class="concept c02">
			<div><img src="/images/2012/sub/page3/title/offline_pds.gif" alt="�����ڷ��"></div>
			<ul class="factorysearch">
				<li class="typechoice">
					<p onclick="typechoiceopen('1')"><span id="choicename">����</span><img src="/images/2012/sub/page6/arrow_down.png" align="absmiddle" alt="����"></p>
					<input type="hidden" id="choicetype" value="subject">
					<dl id="typelist" class="typelist" style="display:none;">
						<dd onclick="searchtype('����')" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">����</dd>
						<dd onclick="searchtype('����')" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">����</dd>
						<dd onclick="searchtype('�ۼ���')" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">�ۼ���</dd>
						<dd onclick="searchtype('�з�')" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">�з�</dd>
					</dl>
				</li>
				<li class="insert"><input type="text" tabindex="11-1" name="p_searchtext" class="insearch" onfocus="this.style.background='#ffffff'" title="�˻��� ������ �Է����ּ���"></li>
				<li class="output"><input tabindex="11-2" onClick="javascript:select();" type="image" src="/images/2012/sub/page2/btn_course_search.gif" title="�˻��� �����մϴ�" alt="�����˻�"></li>
			</ul>
			<ul class="pagetab">
				<li><a href="/servlet/controller.infomation.SpecialCourseHomePageServlet?p_process=selectList&&p_selClsfCd=ALL" tabindex="12-1" title="�����ڷ���� ��ü ����� Ȯ���մϴ�"><img src="/images/2012/sub/page3/tabmenu/total_<%=full_toggle%>.png" alt="��ü"></a></li>
				<li><a href="/servlet/controller.infomation.SpecialCourseHomePageServlet?p_process=selectList&p_selClsfCd=SC2" tabindex="12-2" title="����̷� ���� �ڷḸ�� Ȯ���մϴ�"><img src="/images/2012/sub/page3/tabmenu/casttheory_<%=sub1_toggle%>.png" alt="��ۿ���"></a></li>
				<li><a href="/servlet/controller.infomation.SpecialCourseHomePageServlet?p_process=selectList&p_selClsfCd=SC" tabindex="12-3" title="���Ư�� ���� �ڷḸ�� Ȯ���մϴ�"><img src="/images/2012/sub/page3/tabmenu/castsp_<%=sub2_toggle%>.png" alt="���Ӱ���"></a></li>
				<li><a href="/servlet/controller.infomation.SpecialCourseHomePageServlet?p_process=selectList&p_selClsfCd=SC1" tabindex="12-4" title="������� ���� �ڷḸ�� Ȯ���մϴ�"><img src="/images/2012/sub/page3/tabmenu/castmaking_<%=sub3_toggle%>.png" alt="��ȭ������"></a></li>
			</ul>
		</div>
		<div class="myclass">
			<div class="listbar">
				<table class="listrable" cellpadding="0" cellspacing="0">
					<colgroup><col width="50"><col width="100"><col width="160"><col width="*"><col width="60"><col width="80"><col width="60"><col width="50"></colgroup>
					<tr class="listhead">
						<th>����</th>
						<th>�з�</th>
						<th>���κз�</th>
						<th>����</th>
						<th>�ۼ���</th>
						<th>�ۼ�����</th>
						<th>÷������</th>
						<th>��ȸ</th>
					</tr>
					
					 <%
						if(list2.size() != 0){
						  for( int i = 0; i < list2.size(); i++) {
						
						    DataBox dbox     = (DataBox)list2.get(i);
						    
						    v_gubun           = dbox.getString("d_gubun");  
						    v_seq             = dbox.getInt   ("d_seq");            
						    v_clsfcd          = dbox.getString("d_clsfcd");       
						    v_clsfnm          = dbox.getString("d_clsfnm");
						    v_dtlcd           = dbox.getString("d_dtlcd");        
						    v_dtlnm           = dbox.getString("d_dtlnm");        
						    v_title           = dbox.getString("d_title");        
						    v_professor       = dbox.getString("d_professor");    
						    v_userid          = dbox.getString("d_userid");       
						    v_name            = dbox.getString("d_name");
						    v_useyn           = dbox.getString("d_useyn"); 
						    v_indate          = dbox.getString("d_indate");
						    v_cnt             = dbox.getInt   ("d_cnt");
						    v_fileyn          = dbox.getString("d_fileyn");
						    v_dispnum        = dbox.getInt("d_dispnum");
						    v_totalpage      = dbox.getInt("d_totalpage");
						    v_rowcount       = dbox.getInt("d_rowcount");
						    
						    //if (!v_searchtext.equals("")&&v_search.equals("title")) {
						    if (!v_searchtext.equals("")) {
						        v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
						    } 
							v_totalrowcount = dbox.getInt("d_totalrowcount");
							v_rowcount	  = dbox.getInt("d_rowcount");
					%>        
			
					<tr class="listmiddle" onmouseover="this.style.background='#fbfbfb'" onmouseout="this.style.background=''">
						<td class="linefirst"><%=v_dispnum%></td>
						<td><%=v_clsfnm%></td>
						<td><%=v_dtlnm%></td>
						<td class="title" id="bboardfocus<%=i%>">
							<a href="javascript:selectView(<%=v_seq%>)" onfocus="boardfocus('b',<%=i%>)" onblur="boardfocus('b',<%=i%>)" tabindex="<%=i+12%>" title="[<%=FormatDate.getFormatDate(v_indate, "yyyy.MM.dd") %>] <%=v_title%>"><%=v_title%></a>
						</td>
						<td><%=v_professor%></td>
						<td><%=FormatDate.getFormatDate(v_indate, "yyyy.MM.dd") %></td>
						<td><%if(v_fileyn.equals("Y")){%><img src="/images/portal/ico/ico_file.gif" alt="file"><% } else { %>-<% } %></td>
						<td><%=v_cnt%></td>
					
					</tr>
					<% }}else{%>
				      <tr><td colspan="8" class="nodata" class="linefirst">��ϵ� �Խù��� �����ϴ�.</td></tr>
					<% } %>
				
				</table>
			</div>
			<div class="pageset">
				<%= PageUtil.re2012_printPageListDiv(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
			</div>
		</div>
	</div>
</form>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
