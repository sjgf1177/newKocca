<%
//**********************************************************
//  1. ��      ��: ���İ��� �ֱ�����
//  2. ���α׷��� : gu_KnowBoard_I.jsp
//  3. ��      ��: ���İ��� �ֱ����� ���
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��:
//  6. ��      ��: �̳��� 06.01.03
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.dunet.common.util.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />


<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    
    box.put("topmenu","8");

    String v_process= box.getString("p_process");
    int    v_pageno     = box.getInt("p_pageno");
    String v_categorycd = box.getString("p_categorycd");            // request ī�װ�
    String v_selCategory = box.getString("p_selCategory");
    int v_seq = box.getInt("p_seq");
    String v_searchtext = box.getString("p_searchtext");
    String v_select     = box.getString("p_select");
    int    v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�

    String content      = "";
    String width        = "650";
    String height       = "200";

    String s_userid     = box.getSession("userid");
    String s_name       = box.getSession("name");
    

	String full_toggle = "off";
	String sub1_toggle = "off";
	String sub2_toggle = "off";
	String sub3_toggle = "off";
	String sub4_toggle = "off";
	
	if (v_categorycd.equals("CB")){
		sub1_toggle = "on"; 
	} else if (v_categorycd.equals("CG")){
		sub2_toggle = "on"; 
	} else if (v_categorycd.equals("CK")){
		sub3_toggle = "on"; 
	}else if (v_categorycd.equals("MINE")){
		sub4_toggle = "on"; 
	} else {
		full_toggle = "on"; 		
	}
%>
<script language="JavaScript" type="text/JavaScript">
<!--
 //����Ʈȭ������ �̵�
function selectList() {
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value = "ListPage";
    document.form1.submit();
}

//��ȭ�� �������� �̵�
function select(seq, upfilecnt, userid, types) {
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value   = "selectView";
    document.form1.p_seq.value       = seq;
    document.form1.p_userid.value    = userid;
    document.form1.p_types.value     = types;
    document.form1.p_upfilecnt.value = upfilecnt;
    document.form1.submit();
}

//���� ��ȸ
function whenSelection(p_action) {

 	//var v_grcode, v_subj, v_upperclass, v_middleclass, v_lowerclass;
	//v_grcode      = document.form1.s_grcode.options[document.form1.s_grcode.selectedIndex].value;	
 	//v_subj        = document.form1.s_subjcourse.value;
 	document.form1.p_catecd.value  = document.form1.s_subjcourse.value;
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

 //�����͸� �Է��Ѵ�.
function insert() {
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

    //document.getElementById("txtfield4").value = CrossEditor.GetBodyValue();	
    
    frm.p_searchtext.value    = "";
    frm.p_select.value        = "";
    frm.p_selCategory.value   = "";
    frm.p_pageno.value        =  1;
    
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value = "insert";
    document.form1.submit();    
}

//�Է� ������ ������ üũ
function blankCheck( msg ) {
    var mleng = msg.length;
    chk=0;

    for (i=0; i<mleng; i++) {
        if ( msg.substring(i,i+1)!=' ' && msg.substring(i,i+1)!='\n' && msg.substring(i,i+1)!='\r') chk++;
    }
    if ( chk == 0 ) return (true);

    return (false);
}

//���ڼ��� üũ
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

//-->
</script>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
	<div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0">
			<tr>
				<td class="pagetitle"></td>
				<td class="pagenavi"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > �������丮 > <u>����</u></td>
			</tr>
		</table>
		<div class="concept e01">
			<div><img src="/images/2012/sub/page6/title/common.gif" alt="�������ΰ��� ��ۿ��� �о�"></div>
			<!--
			<div><img src="/images/2012/sub/page3/title/offline_making.gif" alt="�������ΰ��� ���Ӱ��� �о�"></div>
			<div><img src="/images/2012/sub/page3/title/offline_culture.gif" alt="�������ΰ��� ��ȹâ�� �о�"></div>
			-->
			<ul class="factorysearch">
				<li class="typechoice">
					<p onclick="typechoiceopen('1')" onfocus="typechoiceopen('1')" tabindex="171"><span id="choicename">����</span><img src="/images/2012/sub/page6/arrow_down.png" align="absmiddle" alt="����"></p>
					<input type="hidden" id="choicetype" value="subject">
					<dl id="typelist" class="typelist" style="display:none;">
						<dd onclick="searchtype('����')" tabindex="172" onfocus="this.style.background='#1f68b3'" onblur="this.style.background='#4898ea'" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">����</dd>
						<dd onclick="searchtype('����')" tabindex="173" onfocus="this.style.background='#1f68b3'" onblur="this.style.background='#4898ea'" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">����</dd>
						<dd onclick="searchtype('�ۼ���')" tabindex="174" onfocus="this.style.background='#1f68b3'" onblur="this.style.background='#4898ea'; searchtypeclose();" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">�ۼ���</dd>
					</dl>
				</li>
				<li class="insert"><input type="text" class="insearch" tabindex="175" onfocus="this.style.background='#ffffff'" title="�˻��� ������ �Է����ּ���"></li>
				<li class="output"><input type="image" src="/images/2012/sub/page2/btn_course_search.gif" tabindex="176" title="�˻�� �Է� �� Ŭ�����ּ���" alt="�����˻�"></li>
			</ul>
			<ul class="pagetab">
				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage" tabindex="177" title="�������丮�� ��ü ����� Ȯ���մϴ�"><img src="/images/2012/sub/page6/tabmenu/total_<%=full_toggle %>.png" alt="����"></a></li>
				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_categorycd=B0" tabindex="178" title="��ۿ��� �о� ���ĸ��� Ȯ���մϴ�"><img src="/images/2012/sub/page6/tabmenu/cast_<%=sub1_toggle%>.png" alt="��ۿ���"></a></li>
				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_categorycd=G0" tabindex="179" title="���Ӱ��� �о� ���ĸ��� Ȯ���մϴ�"><img src="/images/2012/sub/page6/tabmenu/game_<%=sub2_toggle%>.png" alt="���Ӱ���"></a></li>
				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_categorycd=K0" tabindex="180" title="��ȭ������ �о� ���ĸ��� Ȯ���մϴ�"><img src="/images/2012/sub/page6/tabmenu/culture_<%=sub3_toggle%>.png" alt="��ȭ������"></a></li>
				<li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_categorycd=MINE" tabindex="181" title="ȸ������ �ۼ��� ���� Ȯ���մϴ�"><img src="/images/2012/sub/page6/tabmenu/mywrite_<%=sub4_toggle%>.png" alt="���� �ۼ��� ��"></a></li>
			</ul>
		</div>
		<div class="myclass">
		<!-- ���� �� ���� -->
		<form name = "form1" enctype = "multipart/form-data" method = "post" action="">
	    <input type = "hidden" name = "p_seq"           value = "<%= v_seq %>">
	    <input type = "hidden" name = "p_searchtext"    value = "<%=v_searchtext %>">
	    <input type = "hidden" name = "p_select"        value = "<%=v_select %>">
	    <input type = "hidden" name = "p_selCategory"   value = "<%=v_selCategory %>">    
	    <input type = "hidden" name = "p_pageno"        value = "<%=v_pageno %>">		   
	    <input type = "hidden" name = "p_process"       value = "">
	    <input type = "hidden" name = "p_userid"      value = "">
	    <input type = "hidden" name = "p_upfilecnt"   value = "">
	    <input type = "hidden" name = "p_types"       value = "">
	    <input type = "hidden" name = "p_categorycd"  value = "<%=v_categorycd%>">
			<div class="writepost">
				<table class="writeform" cellspacing="0" cellpadding="0" summary="���ο� ���� �ۼ��� �� �ֽ��ϴ�">
					<colgroup><col width="120"><col width="*"></colgroup>
					<tr>
						<th id="w_course"><h5>������</h5></th>
						<td name="w_course"><%= SelectSubjBean.getSubj3(box,v_categorycd)%></td>
					</tr>
					<tr>
						<th id="w_subject"><h5>����</h5></th>
						<td name="w_subject"><input type="text" tabindex="201" name="p_title" id="txtfield2" onfocus="choicefield('2');" class="txt" title="������ �Է����ּ���"></td>
					</tr>
					<tr>
						<th id="w_content"><h5>����</h5></th>
						<td name="w_content"><textarea id="txtfield3" tabindex="202" name="content" onfocus="choicefield('3');" title="������ �Է����ּ���"></textarea></td>
					</tr>
				</table>
			</div>
			<div class="writefooter">
				<a href="javascript:insert();" tabindex="203" title="�ۼ��� ���� ���ε��ϰ� ������� ���ư��ϴ�"><img src="/images/2012/sub/page6/btn_confirm.gif" align="absmiddle" alt="�ۼ��� ���� ����մϴ�"></a>
				<a href="javascript:selectList();" tabindex="204" title="�ۼ��� ����ϰ� ������������ ���ư��ϴ�"><img src="/images/2012/sub/page6/btn_cancel.gif" align="absmiddle" alt="���ۼ��� ����մϴ�"></a>
			</div>
		</div>
	</div>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>