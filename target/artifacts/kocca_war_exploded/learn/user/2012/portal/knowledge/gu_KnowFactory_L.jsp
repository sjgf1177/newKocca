<%
//**********************************************************
//  1. ��      ��: ���İ��� �ֱ�����
//  2. ���α׷��� : gu_KnowBoard_L.jsp
//  3. ��      ��: ���İ��� �ֱ����� ����Ʈ
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 06.01.03
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.research.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.dunet.common.util.*" %>



<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    
    box.put("topmenu","8");

    String v_process= box.getString("p_process");
    // ����¡����
    int row      = Integer.parseInt(conf.getProperty("page.bulletin.row"));
    int v_pageno = box.getInt("p_pageno");
	if (v_pageno == 0) v_pageno = 1;
    int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0;
    String  v_searchtext  = box.getString("p_searchtext");
    String  v_select      = box.getString("p_select");

    int v_seq = 0, v_readcnt = 0,  i = 0,  v_cnt = 0;
    String  v_inuserid    = "", v_position = "", v_indate = "",  v_title = "", tLink = "",  v_types = "" ,v_name="";
    String  v_categorycd     = box.getString("p_categorycd");
    String s_userid          = box.getSession("userid");
    String s_usernm          = box.getSession("name");
    String v_classname1      = "";
    String v_classname2      = "";
    String v_repstatus  	 = "";
    String v_subjnm		  	 = "";
    String v_tabseq		  	 = "";
    String v_cate		  	 = "";  // 'A -�ڷ��  'B - �������丮 C - ����������
    String v_subjyear 		 = "";  
    
    String tabimg1 ="tab01.gif";
    String tabimg2 ="tab02.gif";
    String tabimg3 ="tab03.gif";
    String tabimg4 ="tab04.gif";
    String tabimg5 ="tab05.gif";

    ArrayList list = (ArrayList)request.getAttribute("selectLastList");
    
	String full_toggle = "off";
	String sub1_toggle = "off";
	String sub2_toggle = "off";
	String sub3_toggle = "off";
	String sub4_toggle = "off";
	
	String sub_navi = "";

	if (v_categorycd.equals("B0")){
		sub1_toggle = "on"; 
		sub_navi = "��ۿ���";
	} else if (v_categorycd.equals("G0")){
		sub2_toggle = "on"; 
		sub_navi = "���Ӱ���";
	} else if (v_categorycd.equals("K0")){
		sub3_toggle = "on"; 
		sub_navi = "��ȭ������";
	}else if (v_categorycd.equals("MINE")){
		sub4_toggle = "on"; 
		sub_navi = "�����ۼ��ѱ�";
	} else {
		full_toggle = "on"; 
		sub_navi = "����";
	}
	
%>

<script language="JavaScript" type="text/JavaScript">
<!--
//�Է��������� �̵�
function insertPage() {
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value = "InsertPage";
    //document.form1.p_pageno.value = "<%= v_pageno %>";
    document.form1.submit();
}

//��ȭ�� �������� �̵�
function select(seq, tabseq, userid, indate, subjyear,types) {
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value   = "selectView";
    document.form1.p_seq.value       = seq;
    document.form1.p_userid.value    = userid;
    document.form1.p_types.value     = types;
    document.form1.p_indate.value     = indate;
    document.form1.p_subjyear.value     = subjyear;
    document.form1.p_tabseq.value = tabseq;
    document.form1.submit();
}


//�˻����뿡 �´� ����Ʈ �������� �̵�
function selectList(tab) {
    if (form1.p_searchtext.value == ""){
        alert("�˻� �� ������ �Է��� �ּ���");
    }else{
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value = "ListPage";
    document.form1.p_pageno.value = "1";
    document.form1.submit();
    showTab(tab);
    }
}

//������ �̵�
function goPage(pageNum) {

    document.form1.p_pageno.value = pageNum;
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value = "ListPage";
    document.form1.submit();
}

// Tab ���ý� ����
function showTab(clickTab)
{
   //alert(clickTab);
    g_showTab(clickTab, 2);
}

function g_showTab(tabNo, count)
{

    var clickTabNo = new Number(tabNo);
    var tabCount   = new Number(count);

    if( clickTabNo == 0 || tabCount == 0 ) return;

    for(i=1; i<=tabCount; i++)
    {
        div = document.all["tab_"+i];

        if(!div) return;

        if( clickTabNo == i ) {
            // Ȱ��ȭ�� tab Ŭ���� return
            if(div.style.display == "") return;
            div.style.display = ""
        }
        else {
            // ���õ��� �ʴ� �ǵ��� ������ ����.
            if(div.style.display != "none") {
                div.style.display = "none";
            }
        }
    }
}
//-->
</script>
<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<form name = "form1" method = "post" action="">
	<div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0" summary="���� ������ �������� ��ġ�Դϴ�">
			<tr>
				<td></td>
				<td class="pagenaviR"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > �������丮 > <u><%=sub_navi %></u></td>
			</tr>
		</table>
		<div class="concept e01">
			<div><img src="/images/2012/sub/page6/title/common.gif" alt="�������� �ñ��� �� �������! �оߺ� �������Ե��� �亯�� �޾Ƶ帳�ϴ�."></div>
			<ul class="factorysearch">
				<li class="typechoice">
					<p onclick="typechoiceopen('1')" onfocus="typechoiceopen('1')" tabindex="171"><span id="choicename">����</span><img src="/images/2012/sub/page6/arrow_down.png" align="absmiddle" alt="����"></p>
					<input type="hidden" id="choicetype" value="subject">
					<input type="hidden" name="p_select" value="title">
					<dl id="typelist" class="typelist" style="display:none;">
						<dd onclick="searchtype('����')" tabindex="172" onfocus="this.style.background='#1f68b3'" onblur="this.style.background='#4898ea'" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">����</dd>
						<!-- <dd onclick="searchtype('����')" tabindex="173" onfocus="this.style.background='#1f68b3'" onblur="this.style.background='#4898ea'" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">����</dd> -->
					</dl>
				</li>
				<li class="insert"><input type="text" name="p_searchtext" tabindex="175" class="insearch" onfocus="this.style.background='#ffffff'"  value = "<%=v_searchtext%>"></li>
				<li class="output"><a href="javascript:selectList();" tabindex="176" title="�˻��� �����մϴ�"><img src="/images/2012/sub/page2/btn_course_search.gif" alt="�����˻�"></li>
			</ul>
			  <input type = "hidden" name = "p_process"     value = "<%=v_process%>">
		      <input type = "hidden" name = "p_pageno"      value = "<%=v_pageno%>">
		      <input type = "hidden" name = "p_seq"         value = "">
		      <input type = "hidden" name = "p_userid"      value = "">
		      <input type = "hidden" name = "p_tabseq"   	value = "">
		      <input type = "hidden" name = "p_types"       value = "">
		      <input type = "hidden" name = "p_categorycd"  value = "<%=v_categorycd%>">
		      <input type = "hidden" name = "p_indate"  value = "">
		      <input type = "hidden" name = "p_subjyear"  value = "">
			<ul class="pagetab">
				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage" tabindex="177" title="�������丮�� ��ü ����� Ȯ���մϴ�"><img src="/images/2012/sub/page6/tabmenu/total_<%=full_toggle %>.png" alt="����"></a></li>
				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_categorycd=B0" tabindex="178" title="��ۿ��� �о� ���ĸ��� Ȯ���մϴ�"><img src="/images/2012/sub/page6/tabmenu/cast_<%=sub1_toggle%>.png" alt="��ۿ���"></a></li>
				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_categorycd=G0" tabindex="179" title="���Ӱ��� �о� ���ĸ��� Ȯ���մϴ�"><img src="/images/2012/sub/page6/tabmenu/game_<%=sub2_toggle%>.png" alt="���Ӱ���"></a></li>
				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_categorycd=K0" tabindex="180" title="��ȭ������ �о� ���ĸ��� Ȯ���մϴ�"><img src="/images/2012/sub/page6/tabmenu/culture_<%=sub3_toggle%>.png" alt="��ȭ������"></a></li>
				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_categorycd=MINE" tabindex="181" title="ȸ������ �ۼ��� ���� Ȯ���մϴ�"><img src="/images/2012/sub/page6/tabmenu/mywrite_<%=sub4_toggle%>.png" alt="���� �ۼ��� ��"></a></li>
			</ul>
		</div>
		<div class="myclass">
			<div class="listbar">
				<table class="listrable" cellpadding="0" cellspacing="0" summary="�������丮�� ����Դϴ�">
					<colgroup><col width="50"><col width="50"><col width="*"><col width="300"><col width="80"><col width="50"><col width="50"></colgroup>
					<tr class="listhead">
						<th id="w_num">��ȣ</th>
						<th id="w_subject" colspan="2">����</th>
						<th id="w_course">���ð���</th>
						<th id="w_date">�����</th>
						<th id="w_count">��ȸ</th>						
					</tr>
					<%
	        if(list.size() != 0){
            for(i = 0; i < list.size(); i++) {
							DataBox dbox = (DataBox)list.get(i);
							v_dispnum    = dbox.getInt   ("d_dispnum");
							v_cate    	 = dbox.getString("d_cate");
							v_inuserid   = dbox.getString("d_userid");
							v_name       = dbox.getString("d_name");
							v_cnt        = dbox.getInt   ("d_cnt");
							v_indate     = dbox.getString("d_indate");
							v_subjyear   = dbox.getString("d_subjyear");
							v_title      = dbox.getString("d_title");
							v_seq        = dbox.getInt   ("d_seq");
							v_types      = dbox.getString("d_types");
							v_tabseq      = dbox.getString("d_tabseq");
							v_totalpage  = dbox.getInt   ("d_totalpage");
							v_rowcount   = dbox.getInt   ("d_rowcount");
							v_repstatus  = dbox.getString("d_okyn");
							v_subjnm  	= dbox.getString("d_subjnm");
							
							// �˻�� �־��ٸ� �ش� �κ��� �ش������ �ΰ���Ų��.
							if (!v_searchtext.equals("")&&v_select.equals("title")) {
								v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>");
							} else if(!v_searchtext.equals("")&&v_select.equals("name")){
								v_name = StringManager.replace(v_name, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>");
							}
					%>
					<tr class="listmiddle" onmouseover="this.style.background='#fbfbfb'" onmouseout="this.style.background=''">
						<td name="w_num" class="linefirst"><%=v_dispnum%></td>
						<td class="icontype">
						
						
						<%if(v_cate.equals("B") && v_repstatus.equals("4") ){ %>
						<img src="/images/2012/sub/page6/icon/icon_post.gif" alt="�Խ�">
						<%} else if(v_cate.equals("C")) { 
							if (v_repstatus.equals("2") || v_repstatus.equals("3")) {%> 
							<img src="/images/2012/sub/page6/icon/icon_answer.gif" alt="�亯�Ϸ�">
							<% }  else { %>
							<img src="/images/2012/sub/page6/icon/icon_wait.gif" alt="���">	
						<% }} %>
						
						<%if(v_cate.equals("A")){ %>
							<img src="/images/2012/sub/page6/icon/icon_data.gif" alt="�ڷ��">
						<% } %>						
						</td>
						<td name="w_subject" class="title courselist" id="bboardfocus<%=i%>"><a href="javascript:select('<%=v_seq%>','<%=v_tabseq%>','<%=v_inuserid%>','<%=v_indate%>','<%=v_subjyear%>','<%=v_cate%>')" tabindex="<%=i+200%>"  onfocus="boardfocus('b',<%=i%>)"  onblur="boardfocus('b',<%=i%>)" title="[<%=FormatDate.getFormatDate(v_indate, "yyyy.MM.dd")%>] <%=v_title%>"><%=v_title%></a></td>
						<td name="w_course" class="coursename"><%=StringManager.formatTitle(v_subjnm, 32)%></td>
						<td name="w_date"><%=FormatDate.getFormatDate(v_indate, "yyyy.MM.dd")%></td>
						<td name="w_count"><%=v_cnt%></td>
					</tr>
					<%} }else{ %>					
					<tr>
						<td colspan="6" class="nodata linefirst">��ϵ� �Խù��� �����ϴ�.</td>
					</tr>
					<%}%>
				</table>
			</div>
			<div class="boardoption"><button type="button" tabindex="221" onclick="javascript:insertPage();" class="btn_small_lineblue" title="������ �Ǵ� ���ı��� �ۼ��� �� �ֽ��ϴ�">�� �ۼ�</button></div>
			<div class="pageset">
				<%= PageUtil.re2012_printPageListDiv(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
			</div>
		</div>
	</div>
</form>	
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
	
