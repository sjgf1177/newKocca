<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.dunet.common.util.*" %>


<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

	box.put("topmenu","5");
	box.put("submenu","1");

    ArrayList list1 = null;
    ArrayList list2 = null;

    int     v_tabseq   = box.getInt("p_tabseq");
    int     v_seq      = box.getInt("p_seq");     
    String  v_process  = box.getString("p_process");

    // �˻�
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");

    int    v_cnt       = 0;            // ��ȸ��
    String v_gubun     = "";           // ��ü����
    String v_startdate = "";           // �˾�����������
    String v_enddate   = "";           // �˾�����������
    String v_adtitle   = "";           // ����
    String v_adcontent = "";           // ����
    String v_addate    = "";           // �����
    String v_adname    = "";           // �����
    String v_luserid   = "";
    String v_gubun_view = "";
    String v_loginyn    = "";           // �α�������
    String v_useyn      = "";           // �������
    String v_grcodecd   = "";           // ��� �����׷�
    String v_isall      = "";           // ��ü ���� ����
    String v_onoffgubun = "";           // �¿�������
    int v_popwidth   = 0;               // �˾�����
    int v_popheight  = 0;               // �˾�����
    int v_popxpos    = 0;               // �˾�x��ġ
    int v_popypos    = 0;               // �˾�y��ġ
    
    String v_popup   = "";               // �˾�����
    String v_uselist = "";               // ����Ʈ���
    String v_useframe= "";               // �����ӻ��
    
    String v_upfile    ="";
    //String v_realfile  ="";
    
    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������
    int v_rowcount  = 0;
    int v_upfilecnt = 0;
    int v_pageno    = box.getInt("p_pageno");
	int v_pagesize = box.getInt("p_pagesize");

	int	 v_totalrowcount =  0;

    String s_userid   = box.getSession("userid");
    String s_username = box.getSession("name");

    list2 = (ArrayList)request.getAttribute("selectNoticeList");
    
    String left_menu = "helpdesk";
   
%>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<SCRIPT type="text/javascript" LANGUAGE="JavaScript">
<!--
    function go(index) {
        document.nform1.p_pageno.value = index;
        document.nform1.action = "/servlet/controller.homepage.HomeNoticeServlet";
        document.nform1.p_process.value = "List";
        document.nform1.submit();
    }

    //������ ����
    function goPage(pageNum) {
        document.nform1.p_pageno.value = pageNum;
        document.nform1.action = "/servlet/controller.homepage.HomeNoticeServlet";
        document.nform1.p_process.value = "List";
        document.nform1.submit();
    }

	function pagesize(pageSize) {
		document.nform1.action = "/servlet/controller.homepage.HomeNoticeServlet";
		document.nform1.p_pageno.value = 1;
		document.nform1.p_pagesize.value = pageSize;
		document.nform1.p_process.value = "List";
		document.nform1.submit();
	}

    //����Ʈ ��ȸ
    function select() {
        document.nform1.p_pageno.value = 0;
        document.nform1.action = "/servlet/controller.homepage.HomeNoticeServlet";
        document.nform1.p_process.value = "List";
        document.nform1.submit();
    }

    //�󼼺���
    function selectView(seq) {

        document.nform1.action = "/servlet/controller.homepage.HomeNoticeServlet";
        document.nform1.p_process.value = "selectView";
        document.nform1.p_seq.value= seq;
        document.nform1.submit();
    }

//-->
</SCRIPT>
<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name="nform1" method="post" action="/" onsubmit="javascript:select();">
  <input type = "hidden" name = "p_process">
  <input type = "hidden" name = "p_pageno"  value="<%=v_pageno%>"> 
  <input type = "hidden" name = "p_seq"    >
  <input type="hidden" name="p_pagesize"  value="<%=v_pagesize%>">
  
	<div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0" summary="���� ������ �������� ��ġ�Դϴ�">
			<tr>
				<td class="pagenaviR"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > �н����� > <u>��������</u></td>
			</tr>
		</table>
		<div class="concept">
			<div><img src="/images/2012/sub/page4/title/notice.gif" alt="�ѱ���������ī���̿��� ���ϴ� ȸ���Ե��� ���� �پ��� ����"></div>
			<ul class="boardsearch">
				<li class="typechoice">
					<p onclick="typechoiceopen('1')" tabindex="171" onfocus="typechoiceopen('1')"><span id="choicename">����</span><img src="/images/2012/sub/page6/arrow_down.png" align="absmiddle" alt="����"></p>
					<input type="hidden" name="p_search" id="choicetype" value="adtitle">
					<dl id="typelist" class="typelist" style="display:none;">
						<dd onclick="searchtype('����','adtitle')" tabindex="172" onfocus="this.style.background='#1f68b3'" onblur="this.style.background='#4898ea'" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">����</dd>
						<dd onclick="searchtype('����','adcontent')" tabindex="173" onfocus="this.style.background='#1f68b3'" onblur="this.style.background='#4898ea'; searchtypeclose();" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">����</dd>
					</dl>
				</li>
				<li class="insert"><input type="text" tabindex="174" name="p_searchtext" class="insearch" onfocus="this.style.background='#ffffff'" title="�˻��� ������ �Է����ּ���"></li>
				<li class="output"><a href="javascript:select();" tabindex="175" title="�˻��� �����մϴ�"><img  src="/images/2012/sub/page2/btn_course_search.gif" alt="�����˻�"></a></li>
			</ul>
		</div>
		<div class="myclass">
			<div class="listbar">
				<table class="listrable" cellpadding="0" cellspacing="0" summary="�ѱ���������ī���� ���ҽ� ����Դϴ�">
					<colgroup><col width="50"><col width="90"><col width="*"><col width="100"><col width="50"></colgroup>
					<tr class="listhead">
						<th>��ȣ</th>
						<th>�з�</th>
						<th>����</th>
						<th>�ۼ���</th>
						<th>��ȸ</th>
					</tr>
					<%
					if(list2.size() != 0){
						for( int i = 0; i < list2.size(); i++) {
							DataBox dbox = (DataBox)list2.get(i);
							v_seq      = dbox.getInt("d_seq");
							v_cnt      = dbox.getInt("d_cnt");
							v_adtitle  = dbox.getString("d_adtitle");
							v_addate   = dbox.getString("d_addate");
							v_adname   = dbox.getString("d_adname");
							v_upfilecnt = dbox.getInt("d_filecnt");
							v_dispnum   = dbox.getInt("d_dispnum");
							v_totalpage = dbox.getInt("d_totalpage");
							v_totalrowcount = dbox.getInt("d_totalrowcount");
							v_rowcount  = dbox.getInt("d_rowcount");
							v_isall     = dbox.getString("d_isall");
							v_onoffgubun = dbox.getString("d_onoffgubun");
								if( v_onoffgubun.equals("C") ) {
								v_onoffgubun = "<img src=\"/images/2012/sub/page4/icon/icon_online.gif\" alt=\"�¶���\">";
								/* } else if( v_onoffgubun.equals("C") ) {
									v_onoffgubun = "<img src=\"/images/2012/sub/page4/icon/icon_offline.gif\" alt=\"��������\">";*/
								} else {
									v_onoffgubun = "<img src=\"/images/2012/sub/page4/icon/icon_offline.gif\" alt=\"��������\">";
								}
								
								v_addate = FormatDate.getFormatDate(v_addate, "yyyy.MM.dd");
								v_adtitle = StringUtil.getByteString(v_adtitle, 100);
					%>
					<tr class="listmiddle" onmouseover="this.style.background='#fbfbfb'" onmouseout="this.style.background=''">
						<td class="linefirst"><%=v_dispnum%></td>
						<td><%=v_onoffgubun %></td>
						<td class="title" id="bboardfocus<%=i%>">
							<a href="javascript:selectView(<%=v_seq%>)" onfocus="boardfocus('b',<%=i%>)" onblur="boardfocus('b',<%=i%>)" tabindex="<%=i+176%>" title="[<%=v_addate%>] <%=v_adtitle%>"><%=v_adtitle%></a>
						</td>
						<td><%=v_addate%></td>
						<td><%=v_cnt%></td>
					</tr>
					<% } }else{%>
						<tr><td colspan="7" class="nodata linefirst">��ϵ� �Խù��� �����ϴ�.</td></tr>
					<% }%>
				</table>
			</div>
			<div class="pageset">
				<%= PageUtil.re2012_printPageListDiv(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
			</div>
		</div>
	</div>
	<input type="submit" class="close" title="����">
</form>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>

