<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.system.*" %>

<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
	box.put("topmenu","5");
	box.put("submenu","3");

    if (box == null) box = RequestManager.getBox(request);
    int v_tabseq         = box.getInt("p_tabseq");
    int row = Integer.parseInt(conf.getProperty("page.bulletin.row"));
    int v_seq = 0,v_readcnt = 0,v_cnt = 0;

    String v_inuserid   = "";
    String v_position   = "";
    String v_indate     = "";
    String v_title      = "";
    String tLink        = "";
    String v_types      = "";
    String v_name       = "";
    String v_categorycd = "";
    String v_categorynm = "";
    String v_isopen     = "";
    String v_repstatus  = "";
    
    int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0;
    ArrayList selectList = (ArrayList)request.getAttribute("selectList");
      
    String  v_searchtext     = box.getString("p_searchtext");   
    String  v_select         = box.getString("p_select");
    String  v_selCategory    = box.getString("p_selCategory");

    int v_pageno             = box.getInt("p_pageno"); 
    String s_userid          = box.getSession("userid");
    String s_usernm          = box.getSession("name");
    String s_grcode          = box.getStringDefault("tem_grcode", box.getSession("tem_grcode"));

	int	 v_totalrowcount =  0;

    String v_classname1      = "";
    String v_classname2      = "";
                  
%>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ���� -->
<script language="JavaScript" type="text/JavaScript">
<!--

//�Է��������� �̵�
function insertPage() {
    document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
    document.form1.p_process.value = "insertPage";  
    document.form1.p_pageno.value = "<%= v_pageno %>";    
    document.form1.submit();
}

//�˻����뿡 �´� ����Ʈ �������� �̵�
function selectList() {
    if (form1.p_searchtext.value == ""){
        alert("�˻� �� ������ �Է��� �ּ���");
    }else{
    document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
    document.form1.p_process.value = "";
    document.form1.submit();
    }
}

//��ȭ�� �������� �̵�
function select(seq, upfilecnt, userid, types) {
    document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
    document.form1.p_process.value   = "selectView";
    document.form1.p_seq.value       = seq;
    document.form1.p_userid.value    = userid;
    document.form1.p_types.value     = types;
    document.form1.p_upfilecnt.value = upfilecnt;
    document.form1.submit();
}

//ī�װ��� �´� ����Ʈ �˻�
function changeCategory() {
    document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
    document.form1.p_process.value    = "";
    document.form1.submit();
}

//��� �������� �̵�
function insertPage() {
    document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
    document.form1.p_process.value = "insertPage";
    document.form1.submit();
}

//������ �̵�
function go(index) {
    document.form1.p_pageno.value = index;
    document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
    document.form1.p_process.value = "";
    document.form1.submit();
}

//������ �̵�
function goPage(pageNum) {
     document.form1.p_pageno.value = pageNum;
     document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
     document.form1.p_process.value = "";
     document.form1.submit();
}
//-->
</script>
<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ�������� -->
<!-- form ���� -->
<form name = "form1" method = "post" action="">
<input type = "hidden" name = "p_process"     value = "">
<input type = "hidden" name = "p_pageno"      value = "<%=v_pageno%>">
<input type = "hidden" name = "p_seq"         value = "">
<input type = "hidden" name = "p_userid"      value = "">
<input type = "hidden" name = "p_upfilecnt"   value = "">
<input type = "hidden" name = "p_types"       value = "<%=v_types%>">
  <div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0" summary="���� ���� ��ô� ȭ���� ��ġ�Դϴ�">
			<tr>
				<td class="pagenaviR"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > �н����� > <u>������ϱ�</u></td>
			</tr>
		</table>
		<div class="concept">
			<div><img src="/images/2012/sub/page4/title/qna.gif" alt="�н��� ���� �ñ��� ���� �ִٸ� �����̵� �������"></div>
			<ul class="boardsearch">
				<li class="typechoice">
					<p onclick="typechoiceopen('1')" tabindex="171" onfocus="typechoiceopen('1')"><span id="choicename">����</span><img src="/images/2012/sub/page6/arrow_down.png" align="absmiddle" alt="����"></p>
					<input type="hidden" name="p_select" id="choicetype" value="title">
					<dl id="typelist" class="typelist" style="display:none;">
						<dd onclick="searchtype('����','title')" onkeypress="searchtype('����','title')" tabindex="172" onfocus="this.style.background='#1f68b3'" onblur="this.style.background='#4898ea'" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">����</dd>
						<dd onclick="searchtype('����','content')" onkeypress="searchtype('����','content')" tabindex="173" onfocus="this.style.background='#1f68b3'" onblur="this.style.background='#4898ea'; searchtypeclose();" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">����</dd>
					</dl>
				</li>
				<li class="insert"><input type="text" name="p_searchtext" tabindex="174" class="insearch" onfocus="this.style.background='#ffffff'" title="�˻��� ������ �Է����ּ���"></li>
				<li class="output"><a href="javascript:selectList();" tabindex="175" title="�˻��� �����մϴ�"><img src="/images/2012/sub/page2/btn_course_search.gif" alt="�����˻�"></a></li>
			</ul>
		</div>
		<div class="myclass">
			<div class="listbar">
				<table class="listrable" cellpadding="0" cellspacing="0" summary="������ϱ��� ����� Ȯ���մϴ�">
					<colgroup><col width="50"><col width="140"><col width="*"><col width="80"><col width="80"><col width="100"><col width="50"></colgroup>
					<tr class="listhead">
						<th id="w_num">��ȣ</th>
						<th id="w_category">�з�</th>
						<th id="w_subject">����</th>
						<th id="w_writer">�ۼ���</th>
						<th id="w_writingdate">�ۼ���</th>
						<th id="w_answer">�亯����</th>
						<th id="w_count">��ȸ</th>
					</tr>
				  <%
				  if(selectList.size() != 0){
				    for(int i = 0; i < selectList.size(); i++) {
		           DataBox dbox = (DataBox)selectList.get(i);  
		           v_dispnum    = dbox.getInt("d_dispnum");
		           v_inuserid   = dbox.getString("d_inuserid");
		           v_name       = dbox.getString("d_name");
		           v_cnt        = dbox.getInt("d_cnt");
		           v_indate     = dbox.getString("d_indate");
		           v_title      = dbox.getString("d_title");
		           v_seq        = dbox.getInt("d_seq");
		           v_types      = dbox.getString("d_types");
		           v_readcnt    = dbox.getInt("d_readcnt");
		           v_upfilecnt  = dbox.getInt("d_filecnt");
		           v_totalpage  = dbox.getInt("d_totalpage");
		           v_rowcount   = dbox.getInt("d_rowcount");  
		           v_categorycd = dbox.getString("d_categorycd");
		           v_categorynm = dbox.getString("d_categorynm");
		           v_isopen     = dbox.getString("d_isopen");
		           v_repstatus  = dbox.getString("d_okyn1");
		           v_totalrowcount = dbox.getInt("d_totalrowcount");
		
		            // �˻�� �־��ٸ� �ش� �κ��� �ش������ �ΰ���Ų��.
		
		            if (!v_searchtext.equals("")&&v_select.equals("title")) {
		                v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
		            } else if(!v_searchtext.equals("")&&v_select.equals("name")){
		                v_name = StringManager.replace(v_name, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
		            }
		            
		            if(v_categorynm.equals("")){
		            	v_categorynm = "��Ÿ";
		            }
		            /*
		            if(v_repstatus.equals("3")){
		            	v_repstatus = "�亯�Ϸ�";
		            } else if(v_repstatus.equals("2")){
		                v_repstatus = "�亯�غ���";
		            } else {
		            	v_repstatus = "������";
		            }
		            */

					%>
			
					<tr class="listmiddle" onmouseover="this.style.background='#fbfbfb'" onmouseout="this.style.background=''">
						<td name="w_num" class="linefirst"><%=v_dispnum%></td>
						<td name="w_category"><%=v_categorynm%></td>
						<td name="w_subject" class="title" id="bboardfocus<%=i%>">
							<%if (v_isopen.equals("N")){%>
              	<img src="/images/2012/sub/page4/icon_lock.gif" class="lock" alt="���" align="absmiddle">
              <% } %>
							<%if (v_isopen.equals("N") && !s_userid.equals(v_inuserid)){%>
              	<a href="javascript:alert('��б��� �ۼ��ڸ� �� �� �ֽ��ϴ�.');" onfocus="boardfocus('b',<%=i%>)" onblur="boardfocus('b',<%=i%>)" tabindex="<%="2"+i+"1"%>" title="<%=FormatDate.getFormatDate(v_indate, "yyyy.MM.dd")%> <%=v_title%>"><%=StringManager.formatTitle(v_title, 48)%></a>
              <% } else { %>
              	<a href="javascript:select('<%=v_seq%>','<%=v_upfilecnt%>','<%=v_inuserid%>','<%=v_types%>')" onfocus="boardfocus('b',<%=i%>)" onblur="boardfocus('b',<%=i%>)" tabindex="<%="2"+i+"1"%>" title="<%=FormatDate.getFormatDate(v_indate, "yyyy.MM.dd")%> <%=v_title%>"><%=StringManager.formatTitle(v_title, 48)%></a>
              <% } %>
		                    
              <%if (FormatDate.getDate("yyyyMMdd").equals(FormatDate.getFormatDate(v_indate, "yyyyMMdd"))){%>
              	<img src="/images/portal/homepage_renewal/support/icon_n.gif" alt="n" />
              <% } %>
						</td>
						<td name="w_writer"><%=v_name%></td>
						<td name="w_writingdate"><%=FormatDate.getFormatDate(v_indate, "yyyy.MM.dd")%></td>
						<td name="w_answer">
							<%if(v_repstatus.equals("3")){ %>
		        		<button type="button" class="btn_nomal_darkmint" tabindex="<%="2"+i+"2"%>" title="�亯�� �Ϸ� �Ǿ����ϴ�. Ȯ�����ּ���">�亯�Ϸ�</button>
		        	<%}else if(v_repstatus.equals("2")){ %>
		        		<h6>�غ���</h6>
		        	<%}else{ %>
		        		<h6>��ó����</h6>
		        	<%} %>
						</td>
						<td name="w_count"><%=v_cnt%></td>
					</tr>
					<%
						} 
					} else {
					%>
					 <tr><td colspan="7" class="nodata linefirst">��ϵ� �Խù��� �����ϴ�.</td></tr>
     			<% } %>
				</table>
			</div>
			<div class="boardoption"><button type="button" onclick="javascript:insertPage();" tabindex="301" class="btn_small_lineblue" title="������ �Ǵ� ���ı��� �ۼ��� �� �ֽ��ϴ�">�� �ۼ�</button></div>
			<div class="pageset">
				<%= PageUtil.re2012_printPageListDiv(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
			</div>
		</div>
	</div>
</form>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
