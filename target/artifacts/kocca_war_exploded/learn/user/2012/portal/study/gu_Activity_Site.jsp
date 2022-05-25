<%
//**********************************************************
//  1. ��      ��: EDUCATION SUBJECT PAGE
//  2. ���α׷���: zu_Activity_Site.jsp
//  3. ��      ��: My activity
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 7. 25
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    String v_process = box.getString("p_process");
    String v_grcode     = "";
    String v_gubun      = "";
    String v_gubunname  = "";
    String v_menuid     = "";
    String v_menuname   = "";
    String v_gubun1 = "";
    int    v_cnt        = 0;
    int    v_gubuncnt   = 0;
    int    v_gubuntot   = 0;

    ArrayList list1 = (ArrayList)request.getAttribute("selectActivity");
    //ArrayList list2 = (ArrayList)request.getAttribute("memberView");
    DataBox dbox2 = (DataBox)request.getAttribute("memberView");
    ArrayList list3 = (ArrayList)request.getAttribute("boardCnt");

    DataBox dbox3 = (DataBox)list3.get(0);
    //DataBox dbox2 = (DataBox)list2.get(0);

%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name="form1" method="post" action="">
<input type="hidden" name="p_process" value="">
</form>

			<h2><img src="/images/portal/myclass/h2_tit8.gif" alt="�����н�Ȱ��" class="fl_l" /><p class="category">Home > ���ǰ��ǽ� > <strong>�����н�Ȱ��</strong></p></h2>
 
			<p><img src="/images/portal/myclass/mystudy_txt.gif" alt="����Ʈ ���� ������� �޴��� ����Ƚ��, ����/���� �α��� ����, �� �α��� Ƚ�� ���� Ȯ���Ͻ� �� �ֽ��ϴ�." /></p>
						
			<ul class="tabwrap mg_t30">
				<li><a class="tab_myclass tab_myclass_on"><span>����ƮȰ��</span></a></li>
				<li><a href="/servlet/controller.system.StudyCountServlet?p_process=myActivity" class="tab_myclass"><span>�н�Ȱ��</span></a></li>
			</ul>
			
			<table class="myclass_mystudy_view">
			<colgroup><col width="85px" /><col width="180px" /><col width="85px" /><col width="180px" /><col width="85px" /><col width="75px" /></colgroup>
			<tbody>
			<tr class="bg_green">
				<th>���� �α���</th>
				<td class="num"><%= FormatDate.getFormatDate(dbox2.getString("d_lgfirst"),"yyyy.MM.dd HH:mm") %></td>
				<th>���� �α���</th>
				<td class="num"><%= FormatDate.getFormatDate(dbox2.getString("d_lglast"),"yyyy.MM.dd HH:mm") %></td>
				<th>�� �α��μ�</th>
				<td class="fs_s"><%= new java.text.DecimalFormat("###,###,##0").format(dbox2.getInt("d_lgcnt")) %></td>
			</tr>
			</tbody>
			</table>
			
			<div class="myclass_mystudy_datawrap mg_t35">
				<div class="left">
					<h3><img src="/images/portal/myclass/stit_online.gif" alt="�¶��ΰ���" /></h3>
					<ul>
<%
	int  j = 0;
	j = 0;
	for(int i = 0; i < list1.size(); i++) {
		DataBox dbox = (DataBox)list1.get(i);

		if(dbox.getString("d_gubun").equals("1")){

			v_gubun = dbox.getString("d_gubun");
			v_menuid = dbox.getString("d_menuid");
			v_menuname = dbox.getString("d_menuname");
			v_cnt = dbox.getInt("d_cnt");
			v_gubuncnt = dbox.getInt("d_gubuncnt");
			v_gubuntot += v_cnt;
%>
						<li><%= v_menuname %><span><%= new java.text.DecimalFormat("###,###,##0").format(v_cnt) %>ȸ</span></li>
<%
      }
    }
%>
					</ul>
				</div>
				<div class="right">
					<h3><img src="/images/portal/myclass/stit_offline.gif" alt="�������ΰ���" /></h3>
					<ul>
<%
	j = 0;
	for(int i = 0; i < list1.size(); i++) {
		DataBox dbox = (DataBox)list1.get(i);

		if(dbox.getString("d_gubun").equals("2")){

			v_gubun = dbox.getString("d_gubun");
			v_menuid = dbox.getString("d_menuid");
			v_menuname = dbox.getString("d_menuname");
			v_cnt = dbox.getInt("d_cnt");
			v_gubuncnt = dbox.getInt("d_gubuncnt");
			v_gubuntot += v_cnt;
%>
						<li><%= v_menuname %><span><%= new java.text.DecimalFormat("###,###,##0").format(v_cnt) %>ȸ</span></li>
<%
      }
    }
%>
					</ul>
				</div>
			</div>
			
			<div class="myclass_mystudy_datawrap mg_t40">
				<div class="left">
					<h3><img src="/images/portal/myclass/stit_myclass.gif" alt="���ǰ��ǽ�" /></h3>
					<ul>
<%
	j = 0;
	for(int i = 0; i < list1.size(); i++) {
		DataBox dbox = (DataBox)list1.get(i);

		if(dbox.getString("d_gubun").equals("3")){

			v_gubun = dbox.getString("d_gubun");
			v_menuid = dbox.getString("d_menuid");
			v_menuname = dbox.getString("d_menuname");
			v_cnt = dbox.getInt("d_cnt");
			v_gubuncnt = dbox.getInt("d_gubuncnt");
			v_gubuntot += v_cnt;
%>
						<li><%= v_menuname %><span><%= new java.text.DecimalFormat("###,###,##0").format(v_cnt) %>ȸ</span></li>
<%
      }
    }
%>
					</ul>
					
				</div>
				<div class="right">
					<h3><img src="/images/portal/myclass/stit_styudying.gif" alt="�н���������" /></h3>
					<ul>
<%
	j = 0;
	for(int i = 0; i < list1.size(); i++) {
		DataBox dbox = (DataBox)list1.get(i);

		if(dbox.getString("d_gubun").equals("4")){

			v_gubun = dbox.getString("d_gubun");
			v_menuid = dbox.getString("d_menuid");
			v_menuname = dbox.getString("d_menuname");
			v_cnt = dbox.getInt("d_cnt");
			v_gubuncnt = dbox.getInt("d_gubuncnt");
			v_gubuntot += v_cnt;
%>
						<li><%= v_menuname %><span><%= new java.text.DecimalFormat("###,###,##0").format(v_cnt) %>ȸ</span></li>
<%
      }
    }
%>
					</ul>
				</div>
			</div>
			
			<div class="myclass_mystudy_datawrap mg_t35">
				<div class="left">
					<h3><img src="/images/portal/myclass/stit_information.gif" alt="��������" /></h3>
					<ul>
<%
	j = 0;
	for(int i = 0; i < list1.size(); i++) {
		DataBox dbox = (DataBox)list1.get(i);

		if(dbox.getString("d_gubun").equals("5")){

			v_gubun = dbox.getString("d_gubun");
			v_menuid = dbox.getString("d_menuid");
			v_menuname = dbox.getString("d_menuname");
			v_cnt = dbox.getInt("d_cnt");
			v_gubuncnt = dbox.getInt("d_gubuncnt");
			v_gubuntot += v_cnt;
%>
						<li><%= v_menuname %><span><%= new java.text.DecimalFormat("###,###,##0").format(v_cnt) %>ȸ</span></li>
<%
      }
    }
%>
					</ul>
					
				</div>
				<div class="right">
					<h3><img src="/images/portal/myclass/stit_academy.gif" alt="��ī���̼Ұ�" /></h3>
					<ul>
<%
	j = 0;
	for(int i = 0; i < list1.size(); i++) {
		DataBox dbox = (DataBox)list1.get(i);

		if(dbox.getString("d_gubun").equals("7")){

			v_gubun = dbox.getString("d_gubun");
			v_menuid = dbox.getString("d_menuid");
			v_menuname = dbox.getString("d_menuname");
			v_cnt = dbox.getInt("d_cnt");
			v_gubuncnt = dbox.getInt("d_gubuncnt");
			v_gubuntot += v_cnt;
%>
						<li><%= v_menuname %><span><%= new java.text.DecimalFormat("###,###,##0").format(v_cnt) %>ȸ</span></li>
<%
      }
    }
%>
					</ul>
				</div>
			</div>
								
		</div>
<!-- Form ���� ���� -->

<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->