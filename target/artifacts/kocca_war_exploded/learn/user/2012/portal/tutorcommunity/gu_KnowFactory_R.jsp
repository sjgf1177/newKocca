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
RequestBox box = (RequestBox)request.getAttribute("requestbox");
box.put("topmenu","99");

String v_title = "", v_contents = "", v_inuserid = "", v_indate = "" , v_types = "";
Vector v_realfileVector = null;
Vector v_savefileVector = null;
int    v_seq        = box.getInt("p_seq");
int    v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�
int    v_pageno     = box.getInt("p_pageno");
String v_searchtext = box.getString("p_searchtext");            //  ������ ������ִ� ���ϼ� 
String v_select     = box.getString("p_select"); 
String v_tabseq 	= box.getString("p_tabseq");
String v_tgubun		= box.getString("p_tgubun");
String v_subj		= box.getString("p_subj");
String v_subjseq	= box.getString("p_subjseq");
String v_year		= box.getString("p_year");
String v_lesson		= box.getString("p_lesson");

String v_name = "";
String v_repstatus  = "";
String v_subjnm = "";

String tabimg1 ="tab01.gif";
String tabimg2 ="tab02.gif";
String tabimg3 ="tab03.gif";
String tabimg4 ="tab04.gif";
String tabimg5 ="tab05.gif";

DataBox dbox        = (DataBox)request.getAttribute("SelectView");

int v_commentseq    = 0;
 

v_inuserid          = dbox.getString("d_inuserid");
v_name              = dbox.getString("d_name");
v_types             = dbox.getString("d_types");
v_indate            = dbox.getString("d_indate");
v_title             = dbox.getString("d_title");
v_subjnm            = dbox.getString("d_subjnm");
v_seq               = dbox.getInt("d_seq");
if (v_tgubun.equals("N")) {
	v_contents          = dbox.getString("d_contents");
} else {
	v_contents          = dbox.getString("d_contents").replace("\r", "<BR>");  // �����ִ� �κ� ����
}
v_realfileVector    = (Vector)dbox.getObject("d_realfile");
v_savefileVector    = (Vector)dbox.getObject("d_savefile");
String v_categorynm = dbox.getString("d_categorynm");
int v_recommend = dbox.getInt("d_recommend");
int v_cnt       = dbox.getInt("d_cnt");
v_repstatus         = dbox.getString("d_okyn1");

String  v_categorycd= box.getString("p_area");
String s_userid     = box.getSession("userid");
String s_gender  	= box.getSession("gender");

int    v_filecount = v_realfileVector.size();

String p_categorycd = box.getString("p_categorycd");            // request ī�װ�


/*
if(p_categorycd.equals("")){
    p_categorycd=v_categorycd;
}
*/
String v_process= box.getString("p_process");

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
//����Ʈ�������� �̵�
function selectList() {
   	document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
   	document.form1.p_area.value = "<%=v_categorycd%>";
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

//������������ �̵�
function updatePage() {
	document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
	document.form1.p_process.value = "updatePage";
	document.form1.submit();
}

//�亯 ��� �������� �̵�
function replyPage() {
	document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
	document.form1.p_process.value = "replyPage";
	document.form1.submit();
}   

//������ ���
function insertcomment() {
	if(document.form2.commentqna.value==""){
		alert("�������� ����ϼ���");
		return;
	}
	var r=calculate_msglen($("#commentqna").val());
	if(r>200){
		alert("���� ����� = "+ r + "Byte �Դϴ�.\n��۵���� 200Byte ���Ϸ� �Է��� �ֽñ� �ٶ��ϴ�.");
        $("#commentqna").focus();
        return;
	}
	
	document.form2.p_categorycd.value = document.form1.p_categorycd.value; // ī�װ�
	document.form2.action = "/servlet/controller.homepage.KnowBoardUserServlet";
	document.form2.p_process.value = "commentInsert";
	document.form2.submit();
}

//�� ȭ�� ����
function deleteAction() {
	if (confirm("������ �����Ͻðڽ��ϱ�?")) {
		document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
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
		document.form2.p_categorycd.value = document.form1.p_categorycd.value; // ī�װ�
		document.form2.p_commentseq.value = v_commentseq;
		document.form2.action = "/servlet/controller.homepage.KnowBoardUserServlet";
		document.form2.p_process.value = "deleteComment";
		document.form2.submit();
	}
	else {
		return;
	}
}

//��� ���� ȭ�� ��ȯ
function updateComment(v_commentseq,v_commentqna,v_indate){
	var str = "";
		str += "<input id=\"p_commentqna\" class=\"write\" style=\"width:750px;height:18px;border:1px solid #DDDDDD;font-size:12px;font-family:gulim,dotum,sans-self;\" value=\""+v_commentqna+"\"><span>"+v_indate+"</span>";
	$("#commentseq_"+v_commentseq).empty();
	$("#commentseq_"+v_commentseq).append(str);
	$("[id^='up_del_btn_']").hide();
	$("#up_can_btn_"+v_commentseq).show();
}

//��� ���� ȭ�� ���
function cancelComment(v_commentseq,v_commentqna,v_indate){
	var str = "";
		str += v_commentqna + "<span>"+v_indate+"</span>";
	$("#commentseq_"+v_commentseq).empty();
	$("#commentseq_"+v_commentseq).append(str);
	$("[id^='up_del_btn_']").show();
	$("#up_can_btn_"+v_commentseq).hide();
}

//��� ���� ����
function appupdateComment(v_commentseq){
	if (confirm("������ �����Ͻðڽ��ϱ�?")){
		document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
		document.form1.p_commentseq.value = v_commentseq;
		document.form1.p_commentqna.value = $("#p_commentqna").val();
		document.form1.p_process.value = "updateComment";
		document.form1.submit();
	}else{
		return;
	}
}


// ��õ�ϱ�
function InsertRecommend(seq) {
//alert(document.form1.p_categorycd.value);
	if (confirm("��õ�Ͻðڽ��ϱ�?")) {
		document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
		document.form1.p_process.value = "insertRecommend";
		document.form1.submit();
	}
	else {
		return;
	}
}

function textareaLength(hwnd,target){
    var h=$("[name='"+hwnd+"']").val();
    var r=calculate_msglen(h);
    $("#"+target).text(r);
    if(r>200)
        $("#"+target).css("color","#FF0000");
    else
        $("#"+target).css("color","#000000");
}

function calculate_msglen(msg){
    var nbytes = 0;

    for (i=0; i<msg.length; i++) {
        var ch = msg.charAt(i);
        if(escape(ch).length > 4) {
        nbytes += 2;
        } else if (ch == '\n') {
        if (msg.charAt(i-1) != '\r') {
        nbytes += 1;
        }
        } else if (ch == '<' || ch == '>') {
        nbytes += 4;
        } else {
        nbytes += 1;
        }
    }
 return nbytes;
}
</script>
<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
	<div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0" summary="���� ������ �������� ��ġ�Դϴ�">
			<tr>
				<td></td>
				<td class="pagenaviR"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > �������丮 > <u><%=sub_navi%></u></td>
			</tr>
		</table>
		<div class="concept e01">
			<div><img src="/images/2012/sub/page6/title/common.png" alt="�������� �ñ��� �� �������! �оߺ� �������Ե��� �亯�� �޾Ƶ帳�ϴ�."></div>
			<ul class="factorysearch">
				<li class="typechoice">
					<p onclick="typechoiceopen('1')" onfocus="typechoiceopen('1')" tabindex="171"><span id="choicename">����</span><img src="/images/2012/sub/page6/arrow_down.png" align="absmiddle" alt="����"></p>
					<input type="hidden" id="choicetype" value="subject">
					<dl id="typelist" class="typelist" style="display:none;">
						<dd onclick="searchtype('����')" tabindex="172" onfocus="this.style.background='#1f68b3'" onblur="this.style.background='#4898ea'" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">����</dd>
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
		<div class="viewbar"><h6><b><%=v_title%> </b></h6></div>
		<form name = "form1" method = "post" action="">
		<input type = "hidden" name = "p_searchtext"  value = "<%=v_searchtext %>">
		<input type = "hidden" name = "p_select"      value = "<%=v_select %>">
		<input type = "hidden" name = "p_pageno"      value = "<%=v_pageno %>">
		<input type = "hidden" name = "p_process"     value = "">
		<input type = "hidden" name = "p_userid"      value = "<%=v_inuserid %>">
		<input type = "hidden" name = "p_categorycd"  value = "<%=p_categorycd%>">				
		<input type = "hidden" name = "p_upfilecnt"   value = "<%=v_upfilecnt %>">
		<input type = "hidden" name = "p_area"		  value = "<%=v_categorycd%>"/>
		<input type = "hidden" name = "p_commentseq"  value = "" />
		<input type = "hidden" name = "p_commentqna"  value = "" />
		
		<input type = "hidden" name = "p_tgubun"	value = "<%=v_tgubun %>"/>
		<input type = "hidden" name = "p_tabseq"	value = "<%=v_tabseq %>"/>
	    <input type = "hidden" name = "p_seq"		value = "<%=v_seq %>"/>
	    <input type = "hidden" name = "p_types"		value = "<%=v_types %>"/>
	    <input type = "hidden" name = "p_subj"		value = "<%=v_subj %>"/>
	    <input type = "hidden" name = "p_subjseq"	value = "<%=v_subjseq %>"/>
	    <input type = "hidden" name = "p_year"		value = "<%=v_year %>"/>
	    <input type = "hidden" name = "p_lesson"	value = "<%=v_lesson %>"/>
		<div class="viewcontent">
			<h6><%=v_contents%></h6>
		 	<%
	    if( v_realfileVector != null ) {
	      for(int i = 0; i < v_realfileVector.size(); i++) {      //     ÷������ ������ ����
	
	        String v_realfile = (String)v_realfileVector.elementAt(i);
	        String v_savefile = (String)v_savefileVector.elementAt(i);
	
	        if(v_realfile != null && !v_realfile.equals("")) {  
	      	  
	       
	      	  if(v_realfile != null && !v_realfile.equals("")) { 
	            	sFileExt = 	v_realfile.substring(v_realfile.lastIndexOf(".")+1);
	            	if (sFileExt.equals("hwp")) {
	            		imgExt = "<img src='/images/2012/common/icon/icon_hwp.gif' id='exticon' align='absmiddle' alt='�ѱ۹���'>";
	            	} else if (sFileExt.equals("doc") || sFileExt.equals("docx")) {
	            		imgExt = "<img src='/images/2012/common/icon/icon_doc.gif' id='exticon' align='absmiddle' alt='���幮��'>";
	            	} else if (sFileExt.equals("ppt")||sFileExt.equals("pptx")) {
	            		imgExt = "<img src='/images/2012/common/icon/icon_ppt.gif' id='exticon' align='absmiddle' alt='���������̼�'>";
	            	} else if (sFileExt.equals("xls") ||sFileExt.equals("xlsx") ) {
	            		imgExt = "<img src='/images/2012/common/icon/icon_xls.gif' id='exticon' align='absmiddle' alt='����'>";
	            	} else if (sFileExt.equals("pdf")) {
	            		imgExt = "<img src='/images/2012/common/icon/icon_pdf.gif' id='exticon' align='absmiddle' alt='PDF'>";
	            	} else {
	            		imgExt = "<img src='/images/2012/common/icon/icon_idk.gif' id='exticon' align='absmiddle' alt='�� �� ���� ��������'>";
	            	}
	      	 
	        
	    %>                   
			<ul class="fileload">
				<li><%=imgExt%> 
				<a href="/servlet/controller.library.DownloadServlet?p_savefile=<%= v_savefile%>&p_realfile=<%= v_realfile%>" tabindex="21-<%=i%>"> <%= v_realfile%></a></li>
				<input type = "hidden" name = "p_savefile"  value = <%=v_savefile%>>
			</ul>
			<% }}}} %>
			
			<table class="about" cellpadding="0" cellspacing="0" summary="�����Ͻ� �Խù� �����Դϴ�">
				<colgroup><col width="50"><col width="*"><col width="50"><col width="90"><col width="65"><col width="60"></colgroup>
				<tr>
					<th id="w_course">������</th>
					<td name="w_course"><%=v_subjnm%></td>
					<th id="w_writer">�ۼ���</th>
					<td name="w_writer"><%=v_name%></td>
					<th id="w_date">�ۼ�����</th>
					<td name="w_date"><%= FormatDate.getFormatDate(v_indate, "yyyy.MM.dd") %></td>
				</tr>
			</table>
		</div>
		<%
			ArrayList alist = (ArrayList)request.getAttribute("selectAns");
			if(alist.size() > 0){
		%>		
		<%
				for(int i = 0; i < alist.size(); i++) {
					DataBox Ansbox = (DataBox)alist.get(i);
					
					String v_anstitle      = "";
					String v_anscontents   = "";
					String v_ansinuserid   = "";
					String v_ansindate     = "";
					String v_ansname       = "";
					String v_anscategorynm = "";		
					
				    v_ansinuserid          = Ansbox.getString("d_inuserid");
				    v_ansname              = Ansbox.getString("d_name");
				    v_ansindate            = Ansbox.getString("d_indate");
				    v_anstitle             = Ansbox.getString("d_title");
				    v_anscontents          = Ansbox.getString("d_contents");
				    v_anscategorynm        = Ansbox.getString("d_categorynm");
				    
	    %>
	    <div class="viewanswer" summary="�� �Խù��� ���� �亯�Դϴ�">
			<table class="answer" cellpadding="0" cellspacing="0">
				<colgroup><col width="70"><col width="*"></colgroup>
				<tr>
					<th id="w_answer">
						<h2>Answer</h2>
						<h6><%=FormatDate.getFormatDate(v_ansindate, "yyyy.MM.dd")%></h6>
					</th>
					<td name="w_answer">
						<B><%=v_anstitle %></B><BR><BR>
						<%=v_anscontents%>
					</td>
				</tr>
				</table>
		</div>
		<%
				}
			}
		%>
		<div class="viewfooter">
		<%if(s_userid.equals(v_inuserid)){	%>			
			<button type="button" tabindex="200" onclick="javascript:updatePage()" class="btn_small_linegray" title="�� ���� �����մϴ�">�����ϱ�</button>
			<button type="button" tabindex="201" onclick="javascript:deleteAction()" class="btn_small_linegray" title="�� ���� �����մϴ�">�����ϱ�</button>
		<% } %>
			<button type="button" tabindex="202" onclick="javascript:selectList();" class="btn_small_lineblue" title="������� ���ư��ϴ�">�������</button>
		</div>
		</form>
	
		<div class="comment">
			<table class="commentlist" cellpadding="0" cellspacing="0" summary="�� �Խù��� ���� ��� ����Դϴ�">
				<colgroup><col width="80"><col width="*"><col width="80"></colgroup>
				<% ArrayList list = (ArrayList)request.getAttribute("selectCommentList"); %>
				<!-- ��� �ݺ� ���� ���� -->                             
				<%
				//if(list.size() != 0){
 				String s_gadmin	= box.getSession("gadmin");
				for(int i = 0; i < list.size(); i++) {
					dbox = (DataBox)list.get(i);  
					v_inuserid      = dbox.getString("d_inuserid");
					String c_name   = dbox.getString("d_name");
					v_indate        = dbox.getString("d_cdate");
					String v_commentqna    = dbox.getString("d_commentqna");
					v_commentseq    = dbox.getInt("d_commentseq");
				%>
				<tr>
					<th>
					<% if(s_gadmin.equals("A1")){ %>
						<span class="man" style="color:black;"><%=c_name%></span>
					<%}else{%>
						<span class="man"><%=c_name%></span>
					<%} %>
					
					</th>
					<td id="commentseq_<%=v_commentseq%>"><%=v_commentqna%><span><%=FormatDate.getFormatDate(v_indate, "yyyy-MM-dd")%></span></td>
					<td>
					<%if(s_userid.equals(v_inuserid)){	%>
<!--						<a href="javascript:updateComment(<%=v_commentseq%>,'<%=v_commentqna%>','<%=FormatDate.getFormatDate(v_indate, "yyyy-MM-dd")%>')" tabindex="<%=i+203%>" title="ȸ������ ����� �����մϴ�"><img id="up_btn_<%=v_commentseq%>" src="/images/2012/common/icon/btn_comment_modify.gif" align="absmiddle" alt="��ۼ���"></a>-->
<!--						<a href="javascript:deleteComment(<%=v_commentseq%>)" tabindex="<%=i+243%>" title="ȸ������ ����� �����մϴ�"><img id="del_btn_<%=v_commentseq%>" src="/images/2012/common/icon/btn_comment_delete.gif" align="absmiddle" alt="��ۻ���"></a>-->
						<span id="up_can_btn_<%=v_commentseq%>" style="display: none;">
							<a href="javascript:appupdateComment(<%=v_commentseq%>);" tabindex="<%=i+203%>" title="ȸ������ ��� ������ �����մϴ�">����</a> |
							<a href="javascript:cancelComment(<%=v_commentseq%>,'<%=v_commentqna%>','<%=FormatDate.getFormatDate(v_indate, "yyyy-MM-dd")%>');" tabindex="<%=i+213%>" title="��� ������ ����մϴ�.">���</a>
						</span>
						<span id="up_del_btn_<%=v_commentseq%>">
							<a href="javascript:updateComment(<%=v_commentseq%>,'<%=v_commentqna%>','<%=FormatDate.getFormatDate(v_indate, "yyyy-MM-dd")%>')" tabindex="<%=i+223%>" title="ȸ������ ����� �����մϴ�">����</a> |
							<a href="javascript:deleteComment(<%=v_commentseq%>)" tabindex="<%=i+233%>" title="ȸ������ ����� �����մϴ�">����</a>
						</span>
					<% } %>
					</td>
				</tr>
				<%}
				//}
				%>
			</table>
			
			<div class="commentwritebox">
			 <form name = "form2" method = "post" action="">
				  <input type = "hidden" name = "p_tabseq"      value = "<%= v_tabseq %>">
				  <input type = "hidden" name = "p_seq"         value = "<%= v_seq %>">
				  <input type = "hidden" name = "p_searchtext"  value = "<%= v_searchtext %>">
				  <input type = "hidden" name = "p_select"      value = "<%= v_select %>">
				  <input type = "hidden" name = "p_pageno"      value = "<%= v_pageno %>">
				  <input type = "hidden" name = "p_process"     value = "">
				  <input type = "hidden" name = "p_userid"      value = "<%= v_inuserid %>">
				  <input type = "hidden" name = "p_types"       value = "<%=v_types%>">
				  <input type = "hidden" name = "p_commentseq" value ="">
				  <input type = "hidden" name = "p_categorycd" value ="">
				  <input type = "hidden" name = "p_gender" value = "<%=s_gender %>">
				  <input type = "hidden" name = "p_tgubun"	value = "<%=v_tgubun %>"/>

				    <input type = "hidden" name = "p_types"		value = "<%=v_types %>"/>
				    <input type = "hidden" name = "p_subj"		value = "<%=v_subj %>"/>
				    <input type = "hidden" name = "p_subjseq"	value = "<%=v_subjseq %>"/>
				    <input type = "hidden" name = "p_year"		value = "<%=v_year %>"/>
				    <input type = "hidden" name = "p_lesson"	value = "<%=v_lesson %>"/>
					<table class="commentwrite" cellpadding="0" cellspacing="0">
					<colgroup><col width="80"><col width="*"><col width="112"></colgroup>
					<tr>
						<td>
						<% if (s_gender.equals("2")) { %>
<!--						<img src="/images/2012/common/icon/icon_sex_woman.gif" align="absmiddle" alt="����">-->
						<% } else { %>
<!--						<img src="/images/2012/common/icon/icon_sex_man.gif" align="absmiddle" alt="����">-->
						<% } %>
							<span class="man"><%=s_userid %></span>
						</td>
						<td>
							<textarea id="commentqna" name="commentqna" tabindex="270" class="write" onfocus="this.style.background='#ffffff'" onkeyup="textareaLength('commentqna','p_selfintroLbael');"></textarea>
							<br/><span>* �ִ� 200Byte���� �ۼ� �����մϴ�. (�ѱ�,Ư������ 2byte ������ 1Byte)
                    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���� Byte : <label id="p_selfintroLbael" style="font-weight:bold;"></label></span>
                    	</td>
						<td><button type="button" tabindex="271" onClick="javascript:insertcomment()" class="btn_large_linewhiteblue" title="����� ����մϴ�">��۴ޱ�</button></td>
					</tr>
				</table>
				</form>
			</div>
		</div>
	</div>
	<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>