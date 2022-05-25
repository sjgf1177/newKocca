<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.book.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box    = (RequestBox)request.getAttribute("requestbox");

	box.put("topmenu","5");
	box.put("submenu","5");

    String  v_process = box.getString("p_process");
    int v_pageno         = box.getInt("p_pageno");

    String ss_classify   = box.getStringDefault("s_classify","ALL");
    String v_searchtext  = box.getString("p_searchtext");
    String v_bookcode      = box.getString("p_bookcode");          // �����ڵ�

    String v_classify      = "";          // �з�
    String v_codenm        = "";          // �з���
    String v_bookname      = "";          // �����
    int    v_price         = 0;           // ����
    int    v_dis_price     = 0;           // �ǸŰ�
    String v_intro         = "";          // ����Ұ�
    String v_writer        = "";          // ���ڼҰ�
    String v_content       = "";          // ����
    String v_review        = "";          // ����
    String v_recom         = "";          // ��õ���翩��
    String v_luserid       = "";          // �����
    String v_ldate         = "";          // �����
    String v_realfilename1 = "";          // ū�̹���   �������ϸ�
    String v_newfilename1  = "";          // ū�̹���   �������ϸ�
    String v_realfilename2 = "";          // �����̹��� �������ϸ�
    String v_newfilename2  = "";          // �����̹��� �������ϸ�
    String v_image_view1   = "";
    String v_image_view2   = "";
    String v_book_site     = "";          // �Ǹ�ó
    String v_book_url      = "";          // �Ǹ� �ּ�(URL)
    String v_author        = "";          // ���ڸ�
    String v_isbn          = "";          // ISBN

    String upload_url = conf.getProperty("url.upload");
    DecimalFormat  df = new DecimalFormat("###,##0");

    DataBox dbox = (DataBox)request.getAttribute("selectBook");

    if (dbox != null) {
        v_classify      = dbox.getString("d_classify");
        v_codenm        = dbox.getString("d_codenm");
        v_bookname      = dbox.getString("d_bookname");
        v_price         = dbox.getInt   ("d_price");
        v_dis_price     = dbox.getInt   ("d_dis_price");
        v_intro         = dbox.getString("d_intro");
        v_writer        = dbox.getString("d_writer");
        v_content       = dbox.getString("d_content");
        v_review        = dbox.getString("d_review");
        v_recom         = dbox.getString("d_recom");
        v_luserid       = dbox.getString("d_luserid");
        v_ldate         = dbox.getString("d_ldate");
        v_realfilename1 = dbox.getString("d_realfilename1");
        v_newfilename1  = dbox.getString("d_newfilename1");
        v_realfilename2 = dbox.getString("d_realfilename2");
        v_newfilename2  = dbox.getString("d_newfilename2");
        v_book_site     = dbox.getString("d_book_site");
        v_book_url      = dbox.getString("d_book_url");
        v_author        = dbox.getString("d_author");
        v_isbn          = dbox.getString("d_isbn");
        

        if (v_newfilename1.equals("")) v_image_view1 = "/images/user/game/book/blank_book1.gif";
        else                           v_image_view1 = v_newfilename1;
        if (v_newfilename2.equals("")) v_image_view2 = "/images/user/game/book/blank_book2.gif";
        else                           v_image_view2 = v_newfilename2;

        v_ldate   = FormatDate.getFormatDate(v_ldate,"yyyy/MM/dd");
        v_intro   = StringManager.replace(v_intro,"\n","<br>");
        v_writer  = StringManager.replace(v_writer,"\n","<br>");
        v_content = StringManager.replace(v_content,"\n","<br>");
        v_review  = StringManager.replace(v_review,"\n","<br>");
     }

     String s_userid = box.getSession("userid");
%>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<SCRIPT LANGUAGE="JavaScript">
<!--

function listBook() {
    document.form1.action = "/servlet/controller.book.BookServlet";
    document.form1.p_process.value = "listPage";
    document.form1.submit();
}

// �����û
function whenBookPropose(bookcode) {
/*
    document.form1.p_bookcode.value = bookcode;

     var new_Open = window.open("","BookBill","scrollbars=auto,width=700,height=430,resizable=no");
     document.form1.target = "BookBill";
     document.form1.p_process.value = "bookBillPage";
     document.form1.action = "/servlet/controller.book.BookServlet";
     document.form1.submit();
*/

    farwindow = window.open("", "winInicis", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 920, height = 640, top=0, left=0");
    document.fbill.p_bookcode.value = bookcode;
    document.fbill.target = "winInicis";
    document.fbill.submit();

    farwindow.window.focus();

}

	//��ٱ��� ���
	function whenBookBasket(bookcode, price) {

	   if(!confirm("��ٱ��Ͽ� �����ðڽ��ϱ�?")){
		 return;
	   }

	   document.fcart.target = "_self";
	   document.fcart.p_price.value = price;
	   document.fcart.p_bookcode.value = bookcode;
	   document.fcart.p_process.value = "InsertBasketBook";
	   document.fcart.action = "/servlet/controller.account.AccountManagerServlet";
	   document.fcart.submit();
	}
	

	function whenSearch() {
	    document.form1.p_pageno.value = 1;
	    document.form1.target = "_self";
	    document.form1.action = "/servlet/controller.book.BookServlet";
	    document.form1.p_process.value = "listPage";
	    document.form1.submit();
	}


//-->
</SCRIPT>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name="form1" method="post" action="">
    <input type = "hidden" name="p_process"    value = "<%=v_process %>">
    <input type = "hidden" name="p_pageno"     value = "<%=v_pageno %>">
    <input type = "hidden" name="s_classify"   value = "<%=ss_classify %>">
    <%-- <input type = "hidden" name="p_searchtext" value = "<%=v_searchtext %>"> --%>
    <input type = "hidden" name="p_bookcode"   value = "<%=v_bookcode%>">
     <div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0">
			<tr>
				<td class="pagenaviR"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > �н����� > <u>����Ұ�</u></td>
			</tr>
		</table>
		<div class="concept inspace">
			<div><img src="/images/2012/sub/page4/title/book.gif" alt="���� ������ �ʿ��� ���� �� ������ ����� �߰������� �Ұ��մϴ�. ���縦 Ŭ���Ͽ� �Ǹ�ó�� Ŭ���Ͻø� �������� ����Ʈ�� �̵��մϴ�."></div>
			<ul class="booksearch">
				<li class="typechoice">
					<p onclick="typechoiceopen('1')" tabindex="121" onfocus="typechoiceopen('1')"><span id="choicename">�����</span><img src="/images/2012/sub/page6/arrow_down.png" align="absmiddle" alt="����"></p>
					<input type="hidden" id="choicetype" value="subject">
					<dl id="typelist" class="typelist" style="display:none;">
						<dd onclick="searchtype('�����')" tabindex="122" onfocus="this.style.background='#1f68b3'" onblur="this.style.background='#4898ea'; searchtypeclose();" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">�����</dd>
						<!-- <dd onclick="searchtype('����')" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">����</dd> -->
					</dl>
				</li>
				<li class="insert"><input type="text" name="p_searchtext" tabindex="123" class="insearch" onkeypress="javascript:fnKeyPressEnter(event, 'whenSearch');" onfocus="this.style.background='#ffffff'" title="�˻��� ������ �Է����ּ���"></li>
				<li class="output"><a href="javascript:whenSearch();" tabindex="124" title="�˻�� �Է� �� Ŭ�����ּ���"><img src="/images/2012/sub/page2/btn_course_search.gif" alt="�����˻�"></a></li>
			</ul>
		</div>
		<div class="bookshowback"><button type="button" tabindex="125" onclick="javascript:listBook();" class="btn_small_gray" title="���� ������� ���ư��ϴ�">�������</button></div>
		<dl class="skipcontent">
			<dt>���� �ٷΰ���</dt>
			<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip01" tabindex="126" title="�� ������?">�� ������?</a></dd>
			<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip02" tabindex="127" title="�� ������ ���ڸ� �Ұ��մϴ�">���ڸ� �Ұ��մϴ�</a></dd>
			<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip03" tabindex="128" title="������ ������ �����ϰ� �Ұ��մϴ�">�� ������ ����</a></dd>
			<dd><img src="/images/2012/common/icon_dot.png" align="middle" alt="������"><a href="#skip04" tabindex="129" title="�� ������ ������ Ȯ���մϴ�">�� ������ ����</a></dd>
		</dl>
		<table class="linecolor" cellspacing="0" cellpadding="0" summary="4�� ���ж���">
			<colgroup><col width="25%"><col width="25%"><col width="25%"><col width="*"></colgroup>
			<tr>
				<td class="color1"></td>
				<td class="color2"></td>
				<td class="color3"></td>
				<td class="color4"></td>
			</tr>
		</table>
		<div class="bookdetail">
			<table class="bookabout" cellspacing="0" cellpadding="0" id="skip01" summary="���������Դϴ�">
				<colgroup><col width="130"><col width="*"></colgroup>
				<tr>
					<td><img src="http://edu.kocca.or.kr<%=v_image_view2%>" class="book" alt="<%=v_bookname%>"></td>
					<th>
						<h1><%=v_bookname%></h1>
						<h3>���� : <%=v_author%></h3>
						<h4>IBSN : <%=v_isbn %></h4>
						<h4>�Ǹ�ó : <%=v_book_site %>&nbsp;
						<% if( !v_book_url.equals("") ) { %> 
							<a href="<%=v_book_url %>" tabindex="176" target="_blank" title="�Ǹ�ó �ٷΰ���"><img src="/images/2012/sub/page4/btn_golink.gif" alt="�ٷΰ���" align="absmiddle"></a>
	          <% } else { %>
	          	&nbsp;
				    <% } %>            	
						</h4>
					</th>
				</tr>
			</table>
			<table class="aboutrable" cellspacing="0" cellpadding="0" id="skip02" summary="���ڸ� �Ұ��մϴ�">
				<colgroup><col width="80"><col width="*"></colgroup>
				<tr>
					<th><img src="/images/2012/sub/page4/subject_writer_about.gif" alt="���ڼҰ�"></th>
					<td>
						<!-- <p>[������]</p> -->
						<%=v_writer %>
					</td>
				</tr>
			</table>
			<table class="aboutrable" cellspacing="0" cellpadding="0" id="skip03" summary="���縦 �����մϴ�">
				<colgroup><col width="80"><col width="*"></colgroup>
				<tr>
					<th><img src="/images/2012/sub/page4/subject_book_about.gif" alt="å�Ұ�"></th>
					<td>
						<%=v_intro%>
					</td>
				</tr>
			</table>
			<table class="aboutrable" cellspacing="0" cellpadding="0" id="skip04" summary="���� �����Դϴ�">
				<colgroup><col width="80"><col width="*"></colgroup>
				<tr>
					<th><img src="/images/2012/sub/page4/subject_index.gif" alt="����"></th>
					<td>
						<%=v_content %>
					</td>
				</tr>
			</table>
		</div>
	</div>        
</form>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
