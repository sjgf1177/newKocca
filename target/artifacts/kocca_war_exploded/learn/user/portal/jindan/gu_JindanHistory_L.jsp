<%
//**********************************************************
//  1. ��      ��: ���ǰ��ǽ�> �����̷º���
//  2. ���α׷��� : gu_JindanHistory_L.jsp
//  3. ��      ��: �н�����
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.11.27
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.exam.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
	DataBox dbox = null;
    box = (RequestBox)request.getAttribute("requestbox");

    ArrayList list = (ArrayList)request.getAttribute("JindanHistoryList");
    
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript">
<!--
//�����̷»󼼳���
function historyGo(class1, class2, class3, ldate, classname){

	window.open("", "selfHistory", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 700, height = 500, top=0, left=0");
	document.frm1.target = "selfHistory"
	document.frm1.p_upperclass.value = class1; 
	document.frm1.p_middleclass.value = class2; 
	document.frm1.p_lowerclass.value = class3; 	
	document.frm1.p_jindanDate.value = ldate; 
	document.frm1.p_classname.value = classname; 
	document.frm1.action = "/servlet/controller.jindan.JindanUserServlet?p_process=JindanUserResultView";
	document.frm1.submit();

	}

//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
	<form method=post name="frm1">
	<input type="hidden" name="p_upperclass">
	<input type="hidden" name="p_middleclass">
	<input type="hidden" name="p_lowerclass">
	<input type="hidden" name="p_jindanDate">
	<input type="hidden" name="p_classname">
			<h2><img src="/images/portal/myclass/h2_tit10.gif" alt="�н�����" class="fl_l" /><p class="category">Home > ���ǰ��ǽ� > <strong>�н�����</strong></p></h2>
 
			<p><img src="/images/portal/myclass/examine_txt.gif" alt="���� �о� �� ���̵��� ���� �н����� �׽�Ʈ�� �� �� �ִ� �����Դϴ�." /></p>
						
			<ul class="tabwrap mg_t30">
				<li><a href="/servlet/controller.jindan.JindanUserServlet?p_process=JindanListPage" class="tab_myclass"><span>�����ϱ�</span></a></li>
				<li><a class="tab_myclass tab_myclass_on"><span>�����̷º���</span></a></li>
			</ul>
			
			<table class="board_list">
			<colgroup><col width="53px" /><col width="197px" /><col width="80px" /><col width="110px" /><col width="130px" /><col width="120px" /></colgroup>
			<thead>
			<tr class="myclass">
				<th><p>��ȣ</p></th>
				<th><p>���ܺо�</p></th>
				<th><p>���̵�</p></th>
				<th><p>������</p></th>
				<th><p>�������</p></th>
				<th class="end"><p>���ܰ��</p></th>
			</tr>
			</thead>
			<tbody>
<%
	String subjgubun = "";
	int avg = 0;
	String lDate="";

	int totalcnt = list.size();
	for(int i=0; i < list.size(); i++){
		dbox = (DataBox)list.get(i);

		lDate = FormatDate.getFormatDate(dbox.getString("d_ldate"),"yyyy.MM.dd");
		avg		= dbox.getInt("d_score") / dbox.getInt("d_cnt");
%>
			<tr onmouseover="className='over'" onmouseout="className=' '">
				<td class="num"><%= totalcnt-- %></td>
				<td><%= dbox.getString("d_middleclassnm") %></td>
				<td><%= dbox.getString("d_lowerclassnm") %></td>
				<td class="num"><%= lDate %></td>
				<td class="num"><%= avg %></td>
				<td><a href="javascript:historyGo('<%=dbox.getString("d_upperclass")%>','<%=dbox.getString("d_middleclass")%>','<%=dbox.getString("d_lowerclass")%>','<%=dbox.getString("d_ldate")%>','<%=dbox.getString("d_middleclassnm")%> <%=dbox.getString("d_lowerclassnm")%>')" class="board_btn2"><span>�������</span></a></td>
			</tr>
<%
	}
%>
<%
		if(list.size()==0){
%>
			<tr height="25"> 
			  <td colspan="6" align="center" valign="middle">�˻��� ������ �����ϴ�.</td>
			</tr>
<%
		}
%>
			</tbody>
			</table>
</form>
<!-- Form ���� ���� -->

<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->