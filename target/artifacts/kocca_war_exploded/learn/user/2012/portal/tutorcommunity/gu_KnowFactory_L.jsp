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
	RequestBox box = null;
	box = (RequestBox)request.getAttribute("requestbox");
	
    box.put("topmenu","99");
    
	String  v_process		= box.getString("p_process");
	int     v_pageno		= box.getInt("p_pageno");
	if (v_pageno == 0) v_pageno = 1;
	int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0;
    int     v_pagesize		= box.getInt("p_pagesize");
    int		v_totalrowcount =  0;
    int row					= Integer.parseInt(conf.getProperty("page.bulletin.row"));
    String  v_searchtext	= box.getString("p_searchtext");
    String  v_select		= box.getString("p_select");
    String	v_category		= box.getString("p_area");
    
	String	v_tgubun = "";
	String	v_tabseq = "";
	String	v_seq = "";
	String	v_types = "";
	String	v_title = "";
	String	v_indate = "";
	String	v_inuserid = "";
	String	v_cnt = "";
	String	v_name = "";
	String	v_subj = "";
	String	v_subjseq = "";
	String	v_year = "";
	String	v_lesson = "";
	String	v_subjnm = "";
	String	v_area = "";
	String	v_upperclass = "";
	String	v_middleclass = "";
	String	v_lowerclass = "";
	String	v_answercnt = "";
	int	v_commentcnt = 0;
	String	ss_tgubun = box.getString("ss_tgubun");
	
	ArrayList list = (ArrayList)request.getAttribute("selectLastList");
	
	String full_toggle = "off";
	String sub1_toggle = "off";
	String sub2_toggle = "off";
	String sub3_toggle = "off";
	String sub4_toggle = "off";
	String sub5_toggle = "off";
	
	String sub_navi = "";

	if (v_category.equals("C0")){
		sub1_toggle = "on"; 
		sub_navi = "����";
	}else if (v_category.equals("B0")){
		sub2_toggle = "on"; 
		sub_navi = "��ۿ���";
	} else if (v_category.equals("G0")){
		sub3_toggle = "on"; 
		sub_navi = "���Ӱ���";
	} else if (v_category.equals("K0")){
		sub4_toggle = "on"; 
		sub_navi = "��ȭ������";
	}else if (v_category.equals("MINE")){
		sub5_toggle = "on"; 
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
function select(tgubun, tabseq, seq, subj, subjseq, year, lesson, types) {
	
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value	= "selectView";
    document.form1.p_tgubun.value	= tgubun;
    document.form1.p_tabseq.value	= tabseq;
    document.form1.p_seq.value		= seq;
    document.form1.p_types.value    = types;
    document.form1.p_subj.value     = subj;
    document.form1.p_year.value     = year;
    document.form1.p_subjseq.value	= subjseq;
    document.form1.p_lesson.value	= lesson;
    
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
function sstgubun_listpage(){
	document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value = "ListPage";
    document.form1.submit();
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
				<td class="pagenaviR"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > Ŀ�´�Ƽ > <u><%=sub_navi %></u></td>
			</tr>
		</table>
		<div class="concept e01">
			<div><img src="/images/2012/sub/page6/title/common.png" alt="�������� �ñ��� �� �������! �оߺ� �������Ե��� �亯�� �޾Ƶ帳�ϴ�."></div>
			<ul class="factorysearch">
				<li class="typechoice">
					<p onclick="typechoiceopen('1')" onfocus="typechoiceopen('1')" tabindex="171"><span id="choicename">����</span><img src="/images/2012/sub/page6/arrow_down.png" align="absmiddle" alt="����"></p>
					<input type="hidden" id="choicetype" value="subject">
					<input type="hidden" name="p_select" value="title">
					<dl id="typelist" class="typelist" style="display:none;">
						<dd onclick="searchtype('����')" tabindex="172" onfocus="this.style.background='#1f68b3'" onblur="this.style.background='#4898ea'" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">����</dd>
					</dl>
				</li>
				<li class="insert"><input type="text" name="p_searchtext" tabindex="175" class="insearch" onfocus="this.style.background='#ffffff'"  value = "<%=v_searchtext%>"></li>
				<li class="output"><a href="javascript:selectList();" tabindex="176" title="�˻��� �����մϴ�"><img src="/images/2012/sub/page2/btn_course_search.gif" alt="�����˻�"></li>
			</ul>
			  <input type = "hidden" name = "p_process"     value = "<%=v_process%>">
		      <input type = "hidden" name = "p_pageno"      value = "<%=v_pageno%>">
		      <input type = "hidden" name = "p_tgubun"      value = "">
		      <input type = "hidden" name = "p_tabseq"   	value = "">
		      <input type = "hidden" name = "p_seq"         value = "">
		      <input type = "hidden" name = "p_types"       value = "">
		      <input type = "hidden" name = "p_area"  value = "<%=v_category%>">
		      <input type = "hidden" name = "p_subj"  value = "">
		      <input type = "hidden" name = "p_year"  value = "">
		      <input type = "hidden" name = "p_subjseq"  value = "">
		      <input type = "hidden" name = "p_lesson"  value = "">
			<ul class="pagetab">
				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage" tabindex="177" title="�������丮�� ��ü ����� Ȯ���մϴ�"><img src="/images/2012/sub/page6/tabmenu/add/total_<%=full_toggle %>.png" alt="����"></a></li>
				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=B0" tabindex="178" title="��ۿ��� �о� ���ĸ��� Ȯ���մϴ�"><img src="/images/2012/sub/page6/tabmenu/add/cast_<%=sub2_toggle%>.png" alt="��ۿ���"></a></li>
				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=G0" tabindex="179" title="���Ӱ��� �о� ���ĸ��� Ȯ���մϴ�"><img src="/images/2012/sub/page6/tabmenu/add/game_<%=sub3_toggle%>.png" alt="���Ӱ���"></a></li>
				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=K0" tabindex="180" title="��ȭ������ �о� ���ĸ��� Ȯ���մϴ�"><img src="/images/2012/sub/page6/tabmenu/add/culture_<%=sub4_toggle%>.png" alt="��ȭ������"></a></li>
<!--				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=C0" tabindex="181" title="���� �� ���ĸ��� Ȯ���մϴ�"><img src="/images/2012/sub/page6/tabmenu/add/homeqna_<%=sub1_toggle%>.png" alt="����"></a></li>-->
				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=MINE" tabindex="182" title="ȸ������ �ۼ��� ���� Ȯ���մϴ�"><img src="/images/2012/sub/page6/tabmenu/add/mywrite_<%=sub5_toggle%>.png" alt="���� �ۼ��� ��"></a></li>
			</ul>
		</div>
		<div style="margin-top: 10px;text-align: right;">
		</div>
		<div class="myclass">
			<div class="listbar">
				<table class="listrable" cellpadding="0" cellspacing="0" summary="�������丮�� ����Դϴ�">
					<colgroup><col width="50"><col width="50"><col width="*"><col width="300"><col width="80"><col width="50"></colgroup>
					<tr class="listhead">
						<th id="w_num">��ȣ</th>
						<th><select name="ss_tgubun" onchange="javascript:sstgubun_listpage();">
				<option value="ALL">��ü</option>
				<option value="Q" <%if(ss_tgubun.equals("Q")) out.println("selected"); %>>����</option>
				<option value="I" <%if(ss_tgubun.equals("I")) out.println("selected"); %>>����</option>
				<option value="D" <%if(ss_tgubun.equals("D")) out.println("selected"); %>>�ڷ�</option>
				<option value="T" <%if(ss_tgubun.equals("T")) out.println("selected"); %>>���</option>
			</select></th>
						<th id="w_subject" colspan="1">����</th>
						<th id="w_course">���ð���</th>
						<th id="w_date">�����</th>
						<th id="w_count">��ȸ</th>						
					</tr>
					<%
					if(list.size() > 0 ){
						for(int i = 0; i < list.size(); i++) {
							DataBox dbox = (DataBox)list.get(i);
							
							v_tgubun		= dbox.getString("d_tgubun");
							v_tabseq		= dbox.getString("d_tabseq");
							v_seq			= dbox.getString("d_seq");
							v_types			= dbox.getString("d_types");
							v_title			= dbox.getString("d_title");
							v_inuserid		= dbox.getString("d_inuserid");
							v_cnt			= dbox.getString("d_cnt");
							v_name			= dbox.getString("d_name");
							v_indate		= dbox.getString("d_indate");
							v_subj			= dbox.getString("d_subj");
							v_subjseq		= dbox.getString("d_subjseq");
							v_year			= dbox.getString("d_year");
							v_lesson		= dbox.getString("d_lesson");
							v_subjnm		= dbox.getString("d_subjnm");
							v_area			= dbox.getString("d_area");
							v_upperclass	= dbox.getString("d_upperclass");
							v_middleclass	= dbox.getString("d_middleclass");
							v_lowerclass	= dbox.getString("d_loserclass");
							v_answercnt		= dbox.getString("d_answercnt");
							v_commentcnt	= dbox.getInt("d_commentcnt");
							
							
							v_dispnum   = dbox.getInt("d_dispnum");
			                v_totalpage = dbox.getInt("d_totalpage");
			                v_totalrowcount = dbox.getInt("d_totalrowcount");
			                
			                String t_addate = v_indate.substring(0,8);
							String t_agodate = dbox.getString("d_agodate").substring(0,8);
							int c_addate = Integer.parseInt(t_addate);
							int c_agodate = Integer.parseInt(t_agodate);
							boolean new_che = false;
							String new_tag = "";
							if(c_addate-c_agodate > 0){
								new_che = true;
								new_tag = "<img src=\"/images/2012/main/icon/icon_newnotice.gif\" alt=\"new\">";
							}
							
			                String v_tgubunnm = "";
							if(v_tgubun.equals("T")){v_tgubunnm = "<img src=\"/images/factory/icon_tutorcom_t.gif\" alt=\"���\" />";}
							else if(v_tgubun.equals("Q")){v_tgubunnm = "<img src=\"/images/factory/icon_tutorcom_q.gif\" alt=\"����\" />";}
							else if(v_tgubun.equals("C")){v_tgubunnm = "<img src=\"/images/factory/icon_tutorcom_c.gif\" alt=\"����\" />";}
							else if(v_tgubun.equals("D")){v_tgubunnm = "<img src=\"/images/factory/icon_tutorcom_d.gif\" alt=\"�ڷ�\" />";}
							else if(v_tgubun.equals("I")){v_tgubunnm = "<img src=\"/images/factory/icon_tutorcom_i.gif\" alt=\"����\" />";}
							else if(v_tgubun.equals("R")){v_tgubunnm = "<img src=\"/images/factory/icon_tutorcom_r.gif\" alt=\"����\" />";}
							else if(v_tgubun.equals("N")){v_tgubunnm = "<img src=\"/images/factory/icon_tutorcom_n.gif\" alt=\"����\" />";}
							
							// �˻�� �־��ٸ� �ش� �κ��� �ش������ �ΰ���Ų��.
							//if (!v_searchtext.equals("")) {
							//	v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">"+v_searchtext+"</font>");
							//}
					%>
					<tr class="listmiddle<%if(v_tgubun.equals("N"))out.print("2");%>" onmouseover="this.style.background='#fbfbfb'" onmouseout="this.style.background=''">
						<td name="w_num" class="linefirst"><%=v_dispnum%></td>
						<td class="icontype"><%=v_tgubunnm %></td>
						<td name="w_subject" class="title courselist" id="bboardfocus<%=i%>">
							<a href="javascript:select('<%=v_tgubun%>','<%=v_tabseq%>','<%=v_seq%>','<%=v_subj%>','<%=v_subjseq%>','<%=v_year%>','<%=v_lesson%>','<%=v_types%>')" tabindex="<%=i+200%>"  onfocus="boardfocus('b',<%=i%>)"  onblur="boardfocus('b',<%=i%>)" title="[<%=FormatDate.getFormatDate(v_indate, "yyyy.MM.dd")%>] <%=v_title%>">
								<%=StringManager.formatTitle(v_title,32)%><%if(new_che)%> <%=new_tag %>
							</a><span style="color:#fc5f00;"><%if(v_commentcnt > 0)out.print(" ["+v_commentcnt+"]"); %><%if(!v_answercnt.equals("0") && (v_tgubun.equals("Q")||v_tgubun.equals("R")))out.print(" �亯 "+v_answercnt+""); %></span>
						</td>
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
				<%= PageUtil.re2012_printPageListDiv(v_totalpage, v_pageno, 0, 15, v_rowcount) %>
			</div>
		</div>
	</div>
</form>	
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>