<%
//**********************************************************
//  1. ��      ��: ���ǰ��ι� > ���ǻ�㳻��
//  2. ���α׷��� : gu_MyQnaCounsel_L.jsp
//  3. ��      ��: ���� ��㳻��
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.11.25
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

	box.put("topmenu","2");
	box.put("submenu","5");

    if (box == null) box = RequestManager.getBox(request);
    
    String  ss_userid     = box.getSession("userid");    
    int		v_no = 0;
    String  v_sdate       = "";
    String  v_types       = "";
    String  v_type        = "";
    String  v_typenm      = ""; 
    String  v_title       = "";
    String  v_status      = "";
    String  v_status_view = "";
    String  v_status_class = "";
    String  v_searchtext  = box.getString("p_searchtext");   
    String  v_select      = box.getString("p_select");   
    String  p_type        = box.getString("p_type");   
    String  v_edustart    = "";
    String  v_eduend      = "";
    String  v_subj      	= "";
    String  v_subjseq   	= "";
    String  v_year      	= "";
    String  v_userid      	= "";
    String	sScriptString	= "";

     
    int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0, v_tabseq = 0;
    
    // ����¡����
    int row      = Integer.parseInt(conf.getProperty("page.bulletin.row"));
    int v_pageno = box.getInt("p_pageno");   
        
    ArrayList blist2 = (ArrayList)request.getAttribute("MyQnaCounselListPage");  // �н�����
      
%>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--
function press_enter(e) { 
	if (e.keyCode =='13'){  selectList();  }
}

//�˻����뿡 �´� ����Ʈ �������� �̵�
function selectList() {
	//if (form1.p_searchtext.value == ""){
	//	alert("�˻� �� ������ �Է��� �ּ���");
	//}else{
    	document.form1.action = "/servlet/controller.study.MyQnaServlet";
    	document.form1.p_process.value = "MyQnaCounselListPage";
        document.form1.p_pageno.value = "1";
    	document.form1.submit();
	//}
}

//��ȭ�� �������� �̵�
function select(tabseq, seq,  userid, types) {
	document.form1.action = "/servlet/controller.study.MyQnaServlet";
	document.form1.p_process.value   = "MyQnaSiteViewPage";
	document.form1.p_tabseq.value    = tabseq;
	document.form1.p_seq.value       = seq;
	document.form1.p_userid.value    = userid;
	document.form1.p_types.value     = types;
    //document.form1.p_upfilecnt.value = upfilecnt;
	document.form1.submit();
}


//������ �̵�
function goPage(pageNum) {

	document.form1.p_pageno.value = pageNum;
	document.form1.action = "/servlet/controller.study.MyQnaServlet";
	document.form1.p_process.value = "MyQnaCounselListPage";
	document.form1.submit();

}


//Q&A��ȭ�� �������� �̵�
function viewHomeqna(seq, upfilecnt, userid, types, type) {
	document.form1.action				= "/servlet/controller.study.MyQnaServlet";
	document.form1.p_process.value		= "MyQnaCounselHomeQnaViewPage";
	document.form1.p_seq.value			= seq;
	document.form1.p_userid.value		= userid;
	document.form1.p_types.value		= types;
	document.form1.pp_type.value		= type;
	document.form1.p_upfilecnt.value	= upfilecnt;
	document.form1.submit();


}

//�������� ��ȭ�� �������� �̵�
function viewQna(seq,subj,year,subjseq) {
	document.form1.action = "/servlet/controller.study.MyQnaServlet";
	document.form1.p_process.value = "MyQnaCounselQnaViewPage";
	document.form1.p_seq.value     = seq;
	document.form1.p_subj.value    = subj;
	document.form1.p_year.value    = year;
	document.form1.p_subjseq.value = subjseq;
	document.form1.submit();
}

//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<%
	String full_toggle = "off";
	String sub1_toggle = "off";
	String sub2_toggle = "off";
	String sub3_toggle = "off";
	String sub4_toggle = "off";
	
	if ("PQ".equals(p_type))        { sub1_toggle = "on"; 
	} else if ("MM".equals(p_type)) { sub2_toggle = "on"; 				
	} else if ("SUBJ".equals(p_type)) { sub3_toggle = "on"; 	
	} else { full_toggle = "on"; 				
	}
%>

<!-- Form ���� ���� -->
<form name="form1" method="post" action="/servlet/controller.study.MyQnaServlet" onsubmit="javascript:selectList();">
  <input type = "hidden" name = "p_process"		value = "">
  <input type = "hidden" name = "p_pageno"		value = "<%= v_pageno %>">
  <input type = "hidden" name = "p_seq"			value = "">
  <input type = "hidden" name = "p_userid"		value = "">
  <input type = "hidden" name = "p_upfilecnt"	value = "">
  <input type = "hidden" name = "p_types"		value = "">
  <input type = "hidden" name = "pp_type"		value = "">
  <input type = "hidden" name = "p_tabseq"		value = "">
  <input type = "hidden" name = "p_subj">
  <input type = "hidden" name = "p_year">
  <input type = "hidden" name = "p_subjseq">
  
	<div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0">
			<tr>
				<td class="pagetitle"></td>
				<td class="pagenavi"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > ���ǰ��ǽ� ><u>���� ����</u></td>
			</tr>
		</table>
		<div class="concept a05">
			<div class="titlemsg"><img src="/images/2012/sub/page1/title/my_counsel.gif" alt="���� ��㳻��"></div>
			<ul class="pagetab">
				<li><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage&p_type=ALL" tabindex="171" title="ȸ���Բ��� ����Ͻ� ��ü ����� Ȯ���� �� �ֽ��ϴ�"><img src="/images/2012/sub/page1/tabmenu/total_<%=full_toggle%>.png" alt="��ü"></a></li>
				<li><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage&p_type=PQ" tabindex="172" title="����Ʈ �̿� ���� ��ϸ��� Ȯ���մϴ�"><img src="/images/2012/sub/page1/tabmenu/site_<%=sub1_toggle%>.png" alt="����Ʈ �̿� ����"></a></li>
				<li><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage&p_type=MM" tabindex="173" title="1:1��� ��ϸ��� Ȯ���մϴ�"><img src="/images/2012/sub/page1/tabmenu/to_<%=sub2_toggle%>.png" alt="1:1���"></a></li>
				<li><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage&p_type=SUBJ" tabindex="174" title="�������� ��ϸ��� Ȯ���մϴ�"><img src="/images/2012/sub/page1/tabmenu/course_<%=sub3_toggle%>.png" alt="����������"></a></li>
			</ul>
		</div>
		<div class="myclass">
			<div class="listbar">
				<table class="listrable" cellpadding="0" cellspacing="0">
					<colgroup><col width="50"><col width="140"><col width="*"><col width="100"><col width="120"></colgroup>
					<tr class="listhead">
						<th>����</th>
						<th>�з�</th>
						<th>����</th>
						<th>�ۼ�����</th>
						<th>�亯����</th>
					</tr>
					
					<%
	        for (int i=0; i<blist2.size(); i++) {
            DataBox dbox = (DataBox)blist2.get(i);  
            v_dispnum	= dbox.getInt("d_dispnum"); 
            v_no		= dbox.getInt("d_no");
            v_sdate		= dbox.getString("d_sdate");
            v_types		= dbox.getString("d_types");
            v_totalpage	= dbox.getInt("d_totalpage");
            v_title		= dbox.getString("d_title");
            v_type		= dbox.getString("d_type");
            v_status	= dbox.getString("d_status");
            v_userid	= dbox.getString("d_userid");
            v_subj		= dbox.getString("d_subj");
            v_year		= dbox.getString("d_year");
            v_subjseq	= dbox.getString("d_subjseq");
            
            int i_upfilecnt = dbox.getInt("d_upfilecnt");
			            
						if (!v_searchtext.equals("")&&v_select.equals("title")) {
							v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
						}
						
				        if (v_type.equals("PQ")) {
				        	v_typenm = "Ȩ������";
				        } else if (v_type.equals("BU") || v_type.equals("CU") || v_type.equals("OO") || v_type.equals("MM")) {
				        	v_typenm = "1vs1���";
				        } else if (v_type.equals("OFF")) {
				        	v_typenm = "�������";
				        } else if (v_type.equals("SUBJ")) {
				        	v_typenm = "����������";
				        } else {
				        	v_typenm = "";
				        }
			
				        //vc_status  1 : ��ó��, 2 : ó����, 3 : �Ϸ�
				        if (v_status.equals("1")) {
				            v_status_view	= "��ó��";
				            v_status_class	= "pre";
				        } else if (v_status.equals("2")) {
				            v_status_view	= "�亯��";
				            v_status_class	= "ing";
				        } else if (v_status.equals("3")) {
				            v_status_view	= "�亯�Ϸ�";
				            v_status_class	= "finish";
				        } else {
				            v_status_view	= "��ó��";
				            v_status_class	= "pre";
				        }
				        
				        //�󼼺��� ��ũ �����
				        /*
				        if ("OFF".equals(v_type)) {
				        	sScriptString	= "viewCounsel('" + v_no + "');";
				        } else
				        */
				        if ("PQ".equals(v_type) || "BU".equals(v_type) || "CU".equals(v_type) || "OO".equals(v_type) || "MM".equals(v_type)) {
				        	sScriptString	= "viewHomeqna('" + v_no + "', '" + v_upfilecnt + "', '" + v_userid + "', '" + v_types + "', '" + v_type + "');";	
				        } else if ("SUBJ".equals(v_type)) {
				        	sScriptString	= "viewQna('" + v_no + "', '" + v_subj + "', '" + v_year + "', '" + v_subjseq + "');";	
				        }
					%>
					<tr class="listmiddle" onmouseover="this.style.background='#fbfbfb'" onmouseout="this.style.background=''">
						<td class="linefirst"><%= v_dispnum %></td>
						<td><%= v_typenm %></td>
						<td class="title" id="bboardfocus<%=i+1%>"><a href="javascript:<%= sScriptString %>" onfocus="boardfocus('b',<%=i+1%>)" onblur="boardfocus('b',<%=i+1%>)" tabindex="<%="2"+i+"1"%>" title="<%=FormatDate.getFormatDate(v_sdate, "yyyy.MM.dd")%> <%= v_title %>"><%= v_title %></a></td>
						<td><%=FormatDate.getFormatDate(v_sdate, "yyyy.MM.dd")%></td>
						<td><button type="button" tabindex="<%="2"+i+"2"%>" onclick="javascript:<%= sScriptString %>" class="btn_nomal_whitegray" title="�����Ͻ� ���뿡 ���� �亯�� �غ����Դϴ�"><%= v_status_view %></button></td>
					</tr>
					<%} %>
					<%	if(blist2.size() == 0){	 %>
				  <tr><td colspan="5" align="center" class="linefrist">�ش��ϴ� ����Ÿ��  �����ϴ�.</td></tr>
				  <% } %>	
				</table>
			</div>
		</div>
	</div>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
