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

<%@ include file="/learn/user/portal/include/top.jsp"%>
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


//-->
</SCRIPT>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name="form1" method="post">
    <input type = "hidden" name="p_process"    value = "<%=v_process %>">
    <input type = "hidden" name="p_pageno"     value = "<%=v_pageno %>">
    <input type = "hidden" name="s_classify"   value = "<%=ss_classify %>">
    <input type = "hidden" name="p_searchtext" value = "<%=v_searchtext %>">
    <input type = "hidden" name="p_bookcode"   value = "<%=v_bookcode%>">

            <style>
            table.booknavi { width:100%; border-collapse:collapse; margin-top:30px; }
            table.booknavi td { padding-bottom:10px; }
            div.booktip { margin-bottom:20px; border-top:1px solid #dddddd; border-bottom:1px solid #dddddd; }
            table.bookinfor { width:100%; border-collapse:collapse; }
            table.bookinfor td.rightabout { vertical-align:top; }
            table.bookinfor td img { width:133px; height:152px; border:2px solid #efefef; }
            table.bookinfor td table.inabout { width:100%; border-collapse:collapse; }
            table.bookinfor td table.inabout th { background-color:#ffffff; border:1px solid #dddddd; font-weight:bold; }
            table.bookinfor td table.inabout td { background-color:#ffffff; border:1px solid #dddddd; text-indent:10px; }
            table.bookinfor td table.inabout td.booktitle { font-family:"dotum","sans-serif"; font-size:16px; color:#3473ad; padding:10px 0px 10px 0px; font-weight:bold; text-indent:5px; }
            </style>
            <table class="booknavi" cellpadding="0" cellspacing="0">
            	<colgroup><col width="50%"><col width="*"></col></colgroup>
            	<tr>
            		<td style="text-align:left;"><img src="/images/portal/homepage_renewal/support/stitle_08.gif" alt="����ȳ�"></td>
            		<td style="text-align:right;">Home > �н��������� > <strong>����ȳ�</strong></td>
            	</tr>
            </table>
            <div class="booktip"><img src="/images/portal/studying/book_borimg.gif" alt="���������� �ʿ��� ���� �� ����������� �߻� ������ �Ұ��մϴ�." /></div>
            <table class="bookinfor" cellpadding="0" cellspacing="0">
            	<colgroup><col width="150"><col width="*"></col></colgroup>
            	<tr>
            		<td style="text-align:left;"><img src="<%=v_image_view2%>"></td>
            		<td class="rightabout">
            			<table class="inabout" cellpadding="0" cellspacing="0">
            				<colgroup><col width="100"><col width="*"></col></colgroup>
            				<tr>
            					<td colspan="2" class="booktitle"><%=v_bookname%></td>
            				</tr>
            				<tr>
            					<th>����</th>
            					<td><%=v_author%></td>
            				</tr>
            				<tr>
            					<th>ISBN</th>
            					<td><%=v_isbn %></td>
            				</tr>
            				<tr>
            					<th>�Ǹ�ó</th>
            					<td>
            						<%=v_book_site %>
				                    <% if( !v_book_url.equals("") ) { %> 
				                    	<a href="<%=v_book_url %>" style="color:#627ABA;" target="_blank">[�ٷΰ���]</a>
				                    <% } else { %>
				                    	&nbsp;
				                    <% } %>
            					</td>
            				</tr>
            			</table>
            		</td>
            	</tr>
            </table>
            <style>
             div.subtitleA { margin-top:30px; }
             div.subcontent { margin-top:15px; margin-left:15px; }
             div.inbottom { margin-top:30px; margin-bottom:30px; border-top:1px solid #dddddd; padding-top:10px; text-align:right; }
            </style>
            <div class="subtitleA"><img src="/images/portal/common/stit_writerinfo.gif" alt="���ڼҰ�"></div>
            <div class="subcontent"><%=v_writer %></div>
            <div class="subtitleA"><img src="/images/portal/common/stit_bookinfo.gif" alt="å�Ұ�"></div>
            <div class="subcontent"><%=v_intro%></div>
            <div class="subtitleA"><img src="/images/portal/common/stit_list.gif" alt="����"></div>
            <div class="subcontent"><%=v_content %></div>

            <div class="inbottom"><a href="javascript:listBook();"><span>���</span></a></div>            
</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->