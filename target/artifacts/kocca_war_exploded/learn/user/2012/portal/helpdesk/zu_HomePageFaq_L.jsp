<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box       = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    
    box.put("topmenu","5");
    box.put("submenu","2");

    String  v_process     = box.getString("p_process");
    String  v_searchtxt   = box.getString("p_searchtxt");
    String  v_faqcategory = "";
    v_faqcategory = box.getString("faqcategory");

    int     v_fnum       = 0, v_totalpage = 0, v_rowcount = 1;
    int     v_pageno     = box.getInt("p_pageno");
    String  v_title      = "";
    String  v_contents   = "";
    String  v_indate     = "";
	String  v_searchtext = box.getString("p_searchtxt");
    ArrayList list       = (ArrayList)request.getAttribute("selectList");
    String faqcategory   ="";

%>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>


<!-- ��ũ��Ʈ���� -->

<script language="JavaScript" type="text/JavaScript"><!--


//ī�װ��� �´� ����Ʈ �˻�
function changeCategory(aa) {
        document.form1.faqcategory.value=aa;
        $("#p_searchtxt").val("");
        document.form1.action = "/servlet/controller.homepage.HomePageFAQServlet";
        document.form1.p_process.value    = "selectList";
        document.form1.submit();
}

//�˻����뿡 �´� ����Ʈ �������� �̵�
function searchTxt() {
	if(document.form1.p_searchtxt.value ==""){
		alert("������ �Է��ϼ���");
		return;

	}
		document.form1.action = "/servlet/controller.homepage.HomePageFAQServlet";
		document.form1.p_process.value = "selectList";
		document.form1.submit();
}

   
    function viewFaq(idx){
        var objDl   = document.getElementsByName("objDl");
        var objDt   = document.getElementsByName("objDt");
        var objDd   = document.getElementsByName("objDd");

        var objLen  = objDl.length;

        for(var i = 0 ; i < objLen ; i++) {
            if(i == idx && objDd[i].style.display  == "none") {
                objDl[i].className      = "faq_fir";
                objDt[i].className      = "on";
                objDd[i].style.display  = "block";
            } else if (i == idx && objDd[i].style.display  == "block"){
            	objDl[i].className      = "faq";
                objDt[i].className      = "";
                objDd[i].style.display  = "none";
            }
        }
    }  

    function viewFaqAll(action) {
    	var objDl   = document.getElementsByName("objDl");
        var objDt   = document.getElementsByName("objDt");
        var objDd   = document.getElementsByName("objDd");
        var objLen  = objDl.length;

        for(var i = 0 ; i < objLen ; i++) {
            if(action == "open") {
                objDl[i].className      = "faq_fir";
                objDt[i].className      = "on";
                objDd[i].style.display  = "block";
            } else {
                objDl[i].className      = "faq";
                objDt[i].className      = "";
                objDd[i].style.display  = "none";
            }
        }
    }      

//
--></script>
<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ�������� -->
<!-- form ����-->
<form name = "form1" method = "post" action="" action="">
	  <input type = "hidden" name = "p_process"   value = "">
	  <input type = "hidden" name = "p_pageno"    value = "">
	  <input type = "hidden" name = "p_seq"       value = "">
	  <input type = "hidden" name = "p_userid"    value = "">
	  <input type = "hidden" name = "faqcategory" value = "<%=v_faqcategory%>">
	  
	  <%
				String full_toggle = "off";
				String sub1_toggle = "off";
				String sub2_toggle = "off";
				String sub3_toggle = "off";	
				String sub4_toggle = "off";
				String sub5_toggle = "off";
				String sub6_toggle = "off";
				
				if ("0025".equals(v_faqcategory))        { sub1_toggle = "on"; 
				} else if ("0034".equals(v_faqcategory)) { sub2_toggle = "on"; 				
				} else if ("0035".equals(v_faqcategory)) { sub3_toggle = "on"; 		
				} else if ("0036".equals(v_faqcategory)) { sub4_toggle = "on"; 				
				} else if ("0037".equals(v_faqcategory)) { sub5_toggle = "on"; 		
				} else if ("0072".equals(v_faqcategory)) { sub6_toggle = "on"; 				
				} else { full_toggle = "on"; 				
				}
		%>
	  
	<div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0" summary="���� ������ �������� ��ġ�Դϴ�">
			<tr>
				<td class="pagenaviR"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > �н����� > <u>FAQ</u></td>
			</tr>
		</table>
		<div class="concept">
			<div><img src="/images/2012/sub/page4/title/faq.gif" alt="���� ���� �������� ��Ƶξ����ϴ�. ���� �ٸ��� �ñ����� �ؼ��ϼ���."></div>
		</div>
		<ul class="category">
			<li><a href="javascript:changeCategory('ALL')" tabindex="171" title="��� FAQ ����� Ȯ���մϴ�"><img src="/images/2012/sub/page4/tabmenu/total_<%=full_toggle%>.png" alt="����"></a></li>
			<li><a href="javascript:changeCategory('0025')" tabindex="172" title="ȸ������ �� Ż�� ���� ����� Ȯ���մϴ�"><img src="/images/2012/sub/page4/tabmenu/member_<%=sub1_toggle%>.png" alt="ȸ������ �� Ż��"></a></li>
			<li><a href="javascript:changeCategory('0034')" tabindex="173" title="������û���ÿ� ���� ����� Ȯ���մϴ�"><img src="/images/2012/sub/page4/tabmenu/request_<%=sub2_toggle%>.png" alt="������û����"></a></li>
			<li><a href="javascript:changeCategory('0035')" tabindex="174" title="�н����ÿ� ���� ����� Ȯ���մϴ�"><img src="/images/2012/sub/page4/tabmenu/learning_<%=sub3_toggle%>.png" alt="�н�����"></a></li>
			<li><a href="javascript:changeCategory('0036')" tabindex="175" title="�򰡰��ÿ� ���� ����� Ȯ���մϴ�"><img src="/images/2012/sub/page4/tabmenu/rating_<%=sub4_toggle%>.png" alt="�򰡰���"></a></li>
			<li><a href="javascript:changeCategory('0037')" tabindex="176" title="�н���������ÿ� ���� ����� Ȯ���մϴ�"><img src="/images/2012/sub/page4/tabmenu/movie_<%=sub5_toggle%>.png" alt="�н����������"></a></li>
			<li><a href="javascript:changeCategory('0072')" tabindex="177" title="�ý��۰��ÿ� ���� ����� Ȯ���մϴ�"><img src="/images/2012/sub/page4/tabmenu/system_<%=sub6_toggle%>.png" alt="�ý��۰���"></a></li>
		</ul>
		<div class="faqconfig">
			<button type="button" class="btn_small_lineblue" tabindex="178" onclick="faqallview()" title="FAQ����Ʈ�� �亯���� ��ü ��Ĩ�ϴ�">��ü ��ġ��</button>
			<button type="button" class="btn_small_linegray" tabindex="179" onclick="faqallclose()" title="������ ����Ʈ�� ��ü �ݽ��ϴ�">��ü �ݱ�</button>
		</div>	
		<dl class="faqrable">
			<%if(list.size() != 0){
   
				int i =0;
				for( i = 0; i < list.size(); i++) {

					DataBox dbox = (DataBox)list.get(i);

					v_title     = dbox.getString("d_title");
					v_contents  = dbox.getString("d_contents");
					v_totalpage = dbox.getInt("d_totalpage");
					v_rowcount  = dbox.getInt("d_rowcount");

					if (!v_searchtext.equals("")) {
						v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>");
						v_contents = StringManager.replace(v_contents, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>");
					}
			%>
			<dt id="btxtfocus<%=i%>"><img src="/images/2012/sub/page4/icon_question.gif" alt="question"><a href="javascript:faqview('<%=i %>');" onfocus="txtlink('b',<%=i%>)" onblur="txtlink('b',<%=i%>)" tabindex="<%=i+200%>"><%=v_title%></a></dt>
			<dd id="answer<%=i%>" name="answer" class="close"><%=StringManager.removeHTMLHead(v_contents)%></dd>
			<%}} %>
		</dl>
	</div>
</form>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
