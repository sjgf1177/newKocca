<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

	box.put("topmenu","4");
	box.put("submenu","4");
    
    String  v_process    = box.getString("p_process");
    int     v_pageno     = box.getInt   ("p_pageno");
    String  v_userid     = box.getSession("userid");
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    String  v_selClsfCd   = box.getString("p_selClsfCd");
    String  v_selDtlCd    = box.getString("p_selDtlCd");

    int v_seq      = box.getInt("p_seq");

    int v_cnt               = 0;
    String v_gubun          = "";
    String v_clsfcd         = "";
    String v_dtlcd          = "";
    String v_clsfnm         = "";
    String v_dtlnm          = "";
    String v_title          = "";
    String v_content        = "";
    String v_professor      = "";
    String v_pictureurl     = "";
    String v_useyn          = "";
    String v_indate         = "";
    String v_usernm         = "";


    DataBox dbox = (DataBox)request.getAttribute("selectView");

    if (dbox != null) {
    	v_gubun          = dbox.getString("d_gubun");  
        v_clsfcd         = dbox.getString("d_clsfcd");      
        v_dtlcd          = dbox.getString("d_dtlcd");       
        v_clsfnm         = dbox.getString("d_clsfnm");      
        v_dtlnm          = dbox.getString("d_dtlnm");
        v_title          = dbox.getString("d_title");       
        v_content        = dbox.getString("d_content");     
        v_professor      = dbox.getString("d_professor");   
        v_pictureurl     = dbox.getString("d_pictureurl"); 
        v_indate         = dbox.getString("d_indate");
        v_usernm         = dbox.getString("d_name");
        v_userid         = dbox.getString("d_userid");
        v_useyn          = dbox.getString("d_useyn");
        v_cnt            = dbox.getInt   ("d_cnt");  

     }
%>
<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<SCRIPT LANGUAGE="JavaScript">

    function listnotice(){
    	document.nform2.p_process.value = "selectList";
        document.nform2.action = "/servlet/controller.infomation.SpecialCourseHomePageServlet";
        document.nform2.submit();
    }

</SCRIPT>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name="nform2" method="post">
<input type = "hidden" name = "p_process" >
<input type = "hidden" name = "p_seq" value="<%=v_seq%>">
<input type = "hidden" name = "p_pageno" value = "<%=v_pageno %>">
<input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
<input type = "hidden" name = "p_search" value = "<%=v_search %>">
<input type = "hidden" name = "p_selClsfCd" value = "<%=v_selClsfCd %>">
<input type = "hidden" name = "p_selDtlCd" value = "<%=v_selDtlCd %>">

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
		

	<div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0">
			<tr>
				<td class="pagetitle"></td>
				<td class="pagenavi"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > �������ΰ��� > <u>�����ڷ��</u></td>
			</tr>
		</table>
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
				<li class="insert"><input type="text" tabindex="11-1" class="insearch" onfocus="this.style.background='#ffffff'" title="�˻��� ������ �Է����ּ���"></li>
				<li class="output"><input type="image" src="/images/2012/sub/page2/btn_course_search.gif" tabindex="11-2" title="�˻��� �����մϴ�" alt="�����˻�"></li>
			</ul>
			<ul class="pagetab">
				<li><a href="/servlet/controller.infomation.SpecialCourseHomePageServlet?p_process=selectList&&p_selClsfCd=ALL" tabindex="12-1" title="�����ڷ���� ��ü ����� Ȯ���մϴ�"><img src="/images/2012/sub/page3/tabmenu/total_<%=full_toggle%>.png" alt="��ü"></a></li>
				<li><a href="/servlet/controller.infomation.SpecialCourseHomePageServlet?p_process=selectList&p_selClsfCd=SC2" tabindex="12-2" title="����̷� ���� �ڷḸ�� Ȯ���մϴ�"><img src="/images/2012/sub/page3/tabmenu/casttheory_<%=sub1_toggle%>.png" alt="��ۿ���"></a></li>
				<li><a href="/servlet/controller.infomation.SpecialCourseHomePageServlet?p_process=selectList&p_selClsfCd=SC" tabindex="12-3" title="���Ư�� ���� �ڷḸ�� Ȯ���մϴ�"><img src="/images/2012/sub/page3/tabmenu/castsp_<%=sub2_toggle%>.png" alt="���Ӱ���"></a></li>
				<li><a href="/servlet/controller.infomation.SpecialCourseHomePageServlet?p_process=selectList&p_selClsfCd=SC1" tabindex="12-4" title="������� ���� �ڷḸ�� Ȯ���մϴ�"><img src="/images/2012/sub/page3/tabmenu/castmaking_<%=sub3_toggle%>.png" alt="��ȭ������"></a></li>
			
			</ul>
		</div>
		<div class="viewbar"><h6><b><%=v_title%></b></h6></div>
		<div class="viewcontent">
			<h6><%=v_content%></h6>
			<!-- <ul class="fileload">
				
				<li><img src="/images/2012/common/icon/icon_hwp.gif" id="exticon" align="absmiddle" alt="�ѱ۹���"> <a href="javascript:filetypecheck('ȫ�浿�� ���ϴ� ���̳��� ����.xls');">ȫ�浿�� ���ϴ� ���̳��� ����.doc</a></li>
				
				<img src="/images/2012/common/icon/icon_doc.gif" align="absmiddle" alt="���幮��">
				<img src="/images/2012/common/icon/icon_ppt.gif" align="absmiddle" alt="���������̼�">
				<img src="/images/2012/common/icon/icon_xls.gif" align="absmiddle" alt="������Ʈ">
				<img src="/images/2012/common/icon/icon_idk.gif" align="absmiddle" alt="�� �� ���� ��������">
				
			</ul> -->
			<table class="about" cellpadding="0" cellspacing="0">
				<colgroup><col width="60"><col width="*"><col width="50"><col width="70"><col width="65"><col width="60"></colgroup>
				<tr>
					<th>���κз�</th>
					<td><%=v_clsfnm %></td>
					<th>�ۼ���</th>
					<td><%=v_professor%></td>
					<th>�ۼ�����</th>
					<td><%=v_indate%></td>
				</tr>
			</table>
		</div>
		<div class="viewfooter">
			<button type="button" onclick="javascript:listnotice();" tabindex="20" class="btn_small_lineblue" title="������� ���ư��ϴ�">�������</button>
		</div>
	</div>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
