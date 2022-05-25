<%
//**********************************************************
//  1. ��      ��: ���ǰ��ǽ�> �н�����
//  2. ���α׷��� : gu_JindanList_L.jsp
//  3. ��      ��: �н�����
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.11.27
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
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    String  v_upperclass	= "";
    String  v_middleclass	= "";
    String  v_middleclassnm	= "";
    String  v_lowerclass	= ""; 
    String  v_lowerclassnm  = "";
    String  v_isjindan		= "";
     
    int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0, v_tabseq = 0;
    
    // ����¡����
    int row      = Integer.parseInt(conf.getProperty("page.bulletin.row"));
    int v_pageno = box.getInt("p_pageno");   
        
    ArrayList list1 = (ArrayList)request.getAttribute("JindanListPage");
      
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--
//������ �̵�
function goPage(pageNum) {

	document.form1.p_pageno.value = pageNum;
	document.form1.action = "/servlet/controller.jindan.JindanUserServlet";
	document.form1.p_process.value = "JindanListPage";
	document.form1.submit();

}

//���ܹ�����
function testGo(classname, class1, class2, class3, chk){
	if(chk == "Y"){
			var ok = confirm( classname+"��(��) �̹� �����Ͻ� ������ �ֽ��ϴ�. \n�������Ұ�� ������ ����Ÿ�� �������ϴ�. \n�ٽ� �����Ͻðڽ��ϱ�?"); 
	}else{
			var ok = confirm( classname+"�� �����׽�Ʈ�� �����Ͻðڽ��ϱ�?"); 
	}

	if(ok){
		window.self.name = "winListPage";
		window.open("", "selfTest", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 700, height = 680, top=0, left=0");
		document.form1.class1.value = class1;
		document.form1.class2.value = class2;
		document.form1.class3.value = class3;
		document.form1.classname.value = classname;
		document.form1.target = "selfTest"
		document.form1.p_process.value = "JindanUserPaperListPage";
		document.form1.action = "/servlet/controller.jindan.JindanUserServlet";
		document.form1.submit();

		document.form1.target = window.self.name;

	}else{
		return;
	}
	
}

//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name="form1" method="post" action="/servlet/controller.jindan.JindanUserServlet">
  <input type="hidden" name="p_process"	value = "">
  <input type="hidden" name="p_pageno"	value = "<%= v_pageno %>">
  <input type="hidden" name="class1"	value = "">
  <input type="hidden" name="class2"	value = "">
  <input type="hidden" name="class3"	value = "">
  <input type="hidden" name="classname"	value = "">
  
			<h2><img src="/images/portal/myclass/h2_tit10.gif" alt="�н�����" class="fl_l" /><p class="category">Home > ���ǰ��ǽ� > <strong>�н�����</strong></p></h2>
 
			<p><img src="/images/portal/myclass/examine_txt.gif" alt="���� �о� �� ���̵��� ���� �н����� �׽�Ʈ�� �� �� �ִ� �����Դϴ�." /></p>
						
			<ul class="tabwrap mg_t30">
				<li><a class="tab_myclass tab_myclass_on"><span>�����ϱ�</span></a></li>
				<li><a href="/servlet/controller.jindan.JindanUserServlet?p_process=JindanHistoryList" class="tab_myclass"><span>�����̷º���</span></a></li>
			</ul>
			
			<table class="board_list">
			<colgroup><col width="53px" /><col width="197px" /><col width="80px" /><col width="360px" /></colgroup>
			<thead>
			<tr class="myclass">
				<th><p>��ȣ</p></th>
				<th><p>���ܺо�</p></th>
				<th><p>���̵�</p></th>
				<th class="end"><p class="examine">�����ϱ�</p></th>
			</tr>
			</thead>
			<tbody>
<%
        for (int i=0; i<list1.size(); i++) {
            DataBox dbox = (DataBox)list1.get(i);  
            v_dispnum		= dbox.getInt("d_dispnum");
            v_upperclass	= dbox.getString("d_upperclass");
            v_middleclass	= dbox.getString("d_middleclass");
            v_middleclassnm	= dbox.getString("d_middleclassnm");
            v_lowerclass	= dbox.getString("d_lowerclass");
            v_lowerclassnm	= dbox.getString("d_lowerclassnm");
            v_isjindan		= dbox.getString("d_isjindan");
            v_totalpage		= dbox.getInt("d_totalpage");
%>      
			<tr onmouseover="className='over'" onmouseout="className=' '">
				<td class="num"><%= v_dispnum %></td>
				<td><%= v_middleclassnm %></td>
				<td><%= v_lowerclassnm %></td>
				<td class="ta_l examine"><a href="javascript:testGo('<%= v_middleclassnm %> <%= v_lowerclassnm %>','<%= v_upperclass %>','<%= v_middleclass %>','<%= v_lowerclass %>','<%= v_isjindan %>')" class="board_btn2"><span>�����ϱ�</span></a></td>
			</tr>
<%
        }
%>
<%
		if(list1.size()==0){
%>
			<tr height="25"> 
			  <td colspan="4" align="center" valign="middle">�˻��� ������ �����ϴ�.</td>
			</tr>
<%
		}
%>

			</tbody>
			</table>
        <!-- ����¡ ���� ���� -->
         <%= PageUtil.printPageSizeListDivNoPagesize(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
        <!-- ����¡ ���� ���� -->
</form>
<!-- Form ���� ���� -->

<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->