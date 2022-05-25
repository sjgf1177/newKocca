<%
//**********************************************************
//  1. ��      ��: ���İ��� �ֱ�����
//  2. ���α׷���: gu_KnowBoard_U.jsp
//  3. ��      ��: ���İ��� �ֱ����� ����
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: �̳��� 06.01.03
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.dunet.common.util.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
		RequestBox box = (RequestBox)request.getAttribute("requestbox");

		box.put("topmenu","99");
		
		String v_title      = "";
		String v_contents   = "";
		String v_usernm     = "";
		String v_inuserid   = "";
		String v_indate     = "";
		String v_types      = "";
		String v_categorycd = "";
		String v_isopen     = "";
		String content      = "";
		String v_subjnm     = "";
		String v_tgubun		= "";
		String v_tabseq		= "";
		String v_cnt		= "";
		String v_area		= "";
		String v_subj		= "";
		String v_subjseq	= "";
		String v_year		= "";
		String v_lesson		= "";
		
		
		int     v_seq        = box.getInt("p_seq");
		String  v_searchtext = box.getString("p_searchtext");
		String  v_select     = box.getString("p_select");
		int     v_pageno     = box.getInt("p_pageno");
		String  v_selCategory = box.getString("p_selCategory");
		
		String  width        = "650";
		String  height       = "200";   
		
		String  s_name = box.getSession("name");
		
		DataBox dbox = (DataBox)request.getAttribute("SelectView");
		if(dbox != null) {
		    v_usernm       = dbox.getString("d_name");
		    v_categorycd = dbox.getString("d_categorycd");
		    
		    v_tgubun	 = dbox.getString("d_gubun");
		    v_tabseq	 = dbox.getString("d_tabseq");
		    v_seq        = dbox.getInt("d_seq");
		    v_types      = dbox.getString("d_types");
		    v_title      = dbox.getString("d_title");
		    content      = dbox.getString("d_contents");
		    v_indate     = dbox.getString("d_indate");
		    v_inuserid   = dbox.getString("d_inuserid");
		    v_cnt		 = dbox.getString("d_cnt");
		    v_subjnm  	 = dbox.getString("d_subjnm");
		    v_area		 = dbox.getString("d_area");
		    v_subj		 = dbox.getString("d_subj");
		    v_subjseq	 = dbox.getString("d_subjseq");
			v_year		 = dbox.getString("d_year");
			v_lesson	 = dbox.getString("d_lesson");

		    String s_userid  = box.getSession("userid");    
		}
		
		String full_toggle = "off";
		String sub1_toggle = "off";
		String sub2_toggle = "off";
		String sub3_toggle = "off";
		String sub4_toggle = "off";
		String sub5_toggle = "off";

		String sub_navi = "";

		if (v_categorycd.equals("C0")){
			sub1_toggle = "on"; 
			sub_navi = "����";
		}else if (v_categorycd.equals("B0")){
			sub2_toggle = "on"; 
			sub_navi = "��ۿ���";
		} else if (v_categorycd.equals("G0")){
			sub3_toggle = "on"; 
			sub_navi = "���Ӱ���";
		} else if (v_categorycd.equals("K0")){
			sub4_toggle = "on"; 
			sub_navi = "��ȭ������";
		}else if (v_categorycd.equals("MINE")){
			sub5_toggle = "on"; 
			sub_navi = "�����ۼ��ѱ�";
		} else {
			full_toggle = "on"; 
			sub_navi = "����";
		}

		String sFileExt ="";
		String imgExt ="";
%>

<script language="JavaScript" type="text/JavaScript">
<!--

//����� ������ ����
function update() {
	var frm = document.form1;

    

    if (blankCheck(frm.p_title.value)) {
        alert("������ �Է��ϼ���!");
        frm.p_title.focus();
        return;
    }                
    
    if (realsize(frm.p_title.value) > 100) {
        alert("������ �ѱ۱��� 50�ڸ� �ʰ����� ���մϴ�.");
        frmp_title.focus();
        return;
    }
/*
    if (frm.p_categorycd.options[frm.p_categorycd.selectedIndex].value == "") {
        alert("�з��� �����ϼ���!");
        frm.p_categorycd.focus();
        return;
    }
*/
    //document.getElementById("txtfield4").value = CrossEditor.GetBodyValue();	
    
    frm.p_searchtext.value    = "";
    frm.p_select.value        = "";
    frm.p_selCategory.value   = "";
    frm.p_pageno.value        =  1;

    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value = "update";
    document.form1.submit(); 

}

//����Ʈ ȭ������ �̵�
function cancel() {
     document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
     document.form1.p_process.value = "ListPage";
     document.form1.submit();
}

//�󳻿� üũ
function blankCheck( msg ) {
    var mleng = msg.length;
    chk=0;

    for (i=0; i<mleng; i++) {
        if ( msg.substring(i,i+1)!=' ' && msg.substring(i,i+1)!='\n' && msg.substring(i,i+1)!='\r') chk++;
    }
    if ( chk == 0 ) return (true);

    return (false);
}

//���� ������ üũ
function realsize( value ) {
    var len = 0;
    if ( value == null ) return 0;
    for(var i=0;i<value.length;i++){
        var c = escape(value.charAt(i));
        if ( c.length == 1 ) len ++;
        else if ( c.indexOf("%u") != -1 ) len += 2;
        else if ( c.indexOf("%") != -1 ) len += c.length/3;
    }
    return len;
}

//����÷�ο� ���� ����
function File_CancelKeyInput()
{
    if(event.keyCode == 9){ // Tab key�� ���
        return true;
    }else{
        alert('[ã�ƺ���] ��ư�� �̿��� ÷���Ͻ� ������ �����ϼ���.\n\n��θ� �������� �߸� �Է��Ͻ� ��� ���ε尡 ����� �̷������ �ʽ��ϴ�.');
        return false;
    }
}


// ī�װ� ����
function openCategory(){
    window.self.name = "winSelectList";
    open_window("openwinSelectList","","100","100","390","400","","","","yes","");
    document.form1.target = "openwinSelectList";
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value = "OpenCategoryPage";
    document.form1.submit();
    document.form1.target = window.self.name;

}
//-->
</script>
          <!-- center start -->
 
<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<!-- ���� �� ���� -->
<form name = "form1" enctype = "multipart/form-data" method = "post" action="">
		    
		    <input type = "hidden" name = "p_searchtext"  value = "">
		    <input type = "hidden" name = "p_select"      value = "">
		    <input type = "hidden" name = "p_selCategory" value = "">    
		    <input type = "hidden" name = "p_pageno"      value = "">
		    <input type = "hidden" name = "p_catecd"      value = "">
		    <input type = "hidden" name = "p_process"     value = "">
		    <input type = "hidden" name = "p_userid"      value = "">
		    <input type = "hidden" name = "p_upfilecnt"   value = "">
		    <input type = "hidden" name = "p_tgubun"      value = "<%=v_tgubun %>">
		    <input type = "hidden" name = "p_tabseq"      value = "<%=v_tabseq %>">
		    <input type = "hidden" name = "p_seq"         value = "<%=v_seq %>">
		    <input type = "hidden" name = "p_types"       value = "<%=v_types %>">
		    <input type = "hidden" name = "p_subj"        value = "<%=v_subj %>">
		    <input type = "hidden" name = "p_subjseq"     value = "<%=v_subjseq %>">
		    <input type = "hidden" name = "p_year"        value = "<%=v_year %>">
		    <input type = "hidden" name = "p_lesson"      value = "<%=v_lesson %>">
		    
	
    
	<div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0" summary="���� ������ �������� ��ġ�Դϴ�">
			<tr>
				<td class="pagetitle"></td>
				<td class="pagenavi"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > �������丮 > <u>����</u></td>
			</tr>
		</table>
		<div class="concept e01">
			<div><img src="/images/2012/sub/page6/title/common.png" alt="�������� �ñ��� �� �������! �оߺ� �������Ե��� �亯�� �޾Ƶ帳�ϴ�."></div>
			<!--
			<div><img src="/images/2012/sub/page3/title/offline_making.gif" alt="�������ΰ��� ���Ӱ��� �о�"></div>
			<div><img src="/images/2012/sub/page3/title/offline_culture.gif" alt="�������ΰ��� ��ȹâ�� �о�"></div>
			-->
			<ul class="factorysearch">
				<li class="typechoice">
					<p onclick="typechoiceopen('1')" onfocus="typechoiceopen('1')" tabindex="171"><span id="choicename">����</span><img src="/images/2012/sub/page6/arrow_down.png" align="absmiddle" alt="����"></p>
					<input type="hidden" id="choicetype" value="subject">
					<dl id="typelist" class="typelist" style="display:none;">
						<dd onclick="searchtype('����')" tabindex="172" onfocus="this.style.background='#1f68b3'" onblur="this.style.background='#4898ea'" onmouseover="this.style.background='#1f68b3'" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">����</dd>
						<dd onclick="searchtype('����')" tabindex="173" onfocus="this.style.background='#1f68b3'" onblur="this.style.background='#4898ea'" onmouseover="this.style.background='#1f68b3'" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">����</dd>
						<dd onclick="searchtype('�ۼ���')" tabindex="174" onfocus="this.style.background='#1f68b3'" onblur="this.style.background='#4898ea'; searchtypeclose();" onmouseover="this.style.background='#1f68b3'" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">�ۼ���</dd>
					</dl>
				</li>
				<li class="insert"><input type="text" class="insearch" tabindex="175" onfocus="this.style.background='#ffffff'" title="�˻��� ������ �Է����ּ���"></li>
				<li class="output"><input type="image" src="/images/2012/sub/page2/btn_course_search.gif" tabindex="176" title="�˻�� �Է� �� Ŭ�����ּ���" alt="�����˻�"></li>
			</ul>
			<ul class="pagetab">
				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage" tabindex="177" title="�������丮�� ��ü ����� Ȯ���մϴ�"><img src="/images/2012/sub/page6/tabmenu/add/total_<%=full_toggle %>.png" alt="����"></a></li>
				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=B0" tabindex="178" title="��ۿ��� �о� ���ĸ��� Ȯ���մϴ�"><img src="/images/2012/sub/page6/tabmenu/add/cast_<%=sub2_toggle%>.png" alt="��ۿ���"></a></li>
				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=G0" tabindex="179" title="���Ӱ��� �о� ���ĸ��� Ȯ���մϴ�"><img src="/images/2012/sub/page6/tabmenu/add/game_<%=sub3_toggle%>.png" alt="���Ӱ���"></a></li>
				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=K0" tabindex="180" title="��ȭ������ �о� ���ĸ��� Ȯ���մϴ�"><img src="/images/2012/sub/page6/tabmenu/add/culture_<%=sub4_toggle%>.png" alt="��ȭ������"></a></li>
<!--				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=C0" tabindex="181" title="���� �� ���ĸ��� Ȯ���մϴ�"><img src="/images/2012/sub/page6/tabmenu/add/homeqna_<%=sub1_toggle%>.png" alt="����"></a></li>-->
				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=MINE" tabindex="182" title="ȸ������ �ۼ��� ���� Ȯ���մϴ�"><img src="/images/2012/sub/page6/tabmenu/add/mywrite_<%=sub5_toggle%>.png" alt="���� �ۼ��� ��"></a></li>
			</ul>
		</div>
		<div class="myclass">
			<div class="writepost">
				<table class="writeform" cellspacing="0" cellpadding="0" summary="����Ͻ� ���� ������ �� �ֽ��ϴ�">
					<colgroup><col width="120"><col width="*"></colgroup>
					<tr>
						<th id="w_course"><h5>������</h5></th>
						<td name="w_course"><%=v_subjnm%></td>
					</tr>
					<tr>
						<th id="w_subject"><h5>����</h5></th>
						<td name="w_subject"><input type="text" tabindex="201" id="txtfield2" name="p_title" onfocus="choicefield('2');" class="txt" title="������ �Է����ּ���" value="<%=dbox.getString("d_title") %>"></td>
					</tr>
					<tr>
						<th id="w_content"><h5>����</h5></th>
						<td name="w_content"><textarea id="txtfield4" tabindex="202" name="content" onfocus="choicefield('4');" title="������ �Է����ּ���"><%=StringManager.replace(dbox.getString("d_contents"), "&", "&amp") %></textarea></td>
					</tr>
				</table>
			</div>
			<div class="writefooter">
				 <a href="javascript:update();" tabindex="203" title="�� ���� ������ �Ϸ��ϰ� ������� ���ư��ϴ�"><img src="/images/2012/sub/page6/btn_modify_confirm.gif" align="absmiddle" alt="�� ���� �����մϴ�"></a>
				<a href="javascript:history.go(-1)" tabindex="204" title="������ ����ϰ� ������������ ���ư��ϴ�"><img src="/images/2012/sub/page6/btn_modify_cancel.gif" align="absmiddle" alt="�� ������ ����մϴ�"></a>
			</div>
		</div>
	</div>
	
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>