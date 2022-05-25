<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.library.FormatDate" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

	box.put("topmenu","5");
	box.put("submenu","7");

	String vv_email = null;
	String vv_handphone = null;
	
	//EncryptUtil encryptUtil = new EncryptUtil(Constants.APP_KEY, Constants.APP_IV);
	
	vv_email = box.getSession("email");
	vv_handphone = box.getSession("handphone");
	//if (!box.getSession("email").equals("")) vv_email = box.getSession("email");//encryptUtil.decrypt(box.getSession("email"));
    //if (!box.getSession("handphone").equals("")) vv_handphone = encryptUtil.decrypt(box.getSession("handphone"));
    
    String  v_process   = box.getString("p_process");
    int     v_pageno    = box.getInt   ("p_pageno");
    
    String s_userid     = box.getSession("userid");
    String s_usernm     = box.getSession("name");
    String s_email      = box.getSession("email");
    String s_handphone  = box.getSession("handphone");
    String s_gender  	= box.getSession("gender");
    
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    
    int v_seq      = box.getInt("p_seq");

    int    v_cnt        = 0;            // ��ȸ��
    String v_gubun      = "";           // ��ü����
    String v_startdate  = "";           // �˾�����������
    
    String v_enddate    = "";           // �˾�����������
    String v_title      = "";           // ����
    String v_content    = "";           // ����
    String v_date       = "";           // �����
    String v_name       = "";           // �����
    String v_userid     = "";
    String  v_isanswer  = "";           // �亯�� ���� ����
    String  v_apply_yn  = "";
    String  v_winner_yn = "";
    String v_status     = "";

    DataBox dbox = (DataBox)request.getAttribute("selectView");
    ArrayList list = (ArrayList)request.getAttribute("selectEventMemoList");

    if (dbox != null) {
    	
    	v_gubun     = dbox.getString("d_gubun");            
        v_startdate = dbox.getString("d_strdate"); 
        v_enddate   = dbox.getString("d_enddate");   
        v_title     = dbox.getString("d_title");  
        v_content   = dbox.getString("d_content");
        v_date      = dbox.getString("d_indate");   
        v_name      = dbox.getString("d_name");
        v_userid    = dbox.getString("d_userid");   
        v_cnt       = dbox.getInt("d_cnt");      
        v_isanswer  = dbox.getString("d_isanswer");   
        v_apply_yn  = dbox.getString("d_apply_yn");
        v_winner_yn = dbox.getString("d_winneryn");

     }
    
    if(v_winner_yn.equals("C")){
    	v_winner_yn = "<a class='state'><span class='pre'>�̹�ǥ</span></a>";
        v_status = "�Ϸ�";
    } else if(v_winner_yn.equals("Y")){
    	v_winner_yn = "<a class='state' href='javascript:viewPassContent("+v_seq+")'><span class='finish'>��÷��Ȯ��</span></a>";
        v_status = "�Ϸ�";
    } else if(v_winner_yn.equals("N")){
    	v_winner_yn = "<a class='state'><span class='pre'>�̹�ǥ</span></a>";
        v_status = "����";
    } else if(v_winner_yn.equals("A")){
    	v_winner_yn = "<a class='state'><span class='pre'>�̹�ǥ</span></a>";
        v_status = "����";
    } 
%>
<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<SCRIPT LANGUAGE="JavaScript">

    function listnotice(){
        document.nform2.p_process.value = "selectList";
        document.nform2.action = "/servlet/controller.homepage.EventHomePageServlet";
        document.nform2.submit();
    }

    function applyEvent() {
        <% if (v_apply_yn.equals("Y")){ %>
             alert("�̹� ��û�ϼ̽��ϴ�.");
        <% } else { %>

        var bRtn = confirm("����Ͻðڽ��ϱ�?");

        if(bRtn) {
	        document.nform2.action="/servlet/controller.homepage.EventHomePageServlet";
	        document.nform2.p_process.value = "insertRequest";
	        document.nform2.submit();
        }
        <% } %>
    }
    

  //���� ����
  function deleteComment(v_commentseq,v_indate) {
  	if (confirm("������ �������  �����Ͻðڽ��ϱ�?")) {
  		document.nform2.p_commentseq.value = v_commentseq;
  		document.nform2.p_commentindate.value = v_indate;
  		document.nform2.action = "/servlet/controller.homepage.EventHomePageServlet";
  		document.nform2.p_process.value = "deleteComment";
  		document.nform2.submit();
  	}
  	else {
  		return;
  	}
  }
  
//���� ����
  function updateComment(v_commentseq,v_indate) {
  	if (confirm("������ ������� �����Ͻðڽ��ϱ�?")) {
  		document.nform2.p_commentseq.value = v_commentseq;
  		document.nform2.p_commentindate.value = v_indate;
  		document.nform2.action = "/servlet/controller.homepage.EventHomePageServlet";
  		document.nform2.p_process.value = "updateCommentPage";
  		document.nform2.submit();
  	}
  	else {
  		return;
  	}
  }


</SCRIPT>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name="nform2" method="post" action="">
<input type = "hidden" name = "p_process" >
<input type = "hidden" name = "p_seq" value="<%=v_seq%>">
<input type = "hidden" name = "p_pageno" value = "<%=v_pageno %>">
<input type = "hidden" name = "p_commentseq" value = "">
<input type = "hidden" name = "p_commentindate" value = "">
<input type = "hidden" name = "p_pageno" value = "<%=v_pageno %>">
<input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
<input type = "hidden" name = "p_search" value = "<%=v_search %>">
<input type = "hidden" name = "p_gender" value = "<%=s_gender %>">

<div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0" summary="���� �����ô� �������� ��ġ�Դϴ�">
			<tr>
				<td class="pagenaviR"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > �н����� > <u>������ϱ�</u></td>
			</tr>
		</table>
		<div class="concept">
			<div><img src="/images/2012/sub/page4/title/event.gif" alt="�ѱ���������ī���̿��� �����ϴ� ���� �̺�Ʈ�� �����غ�����"></div>
			<ul class="boardsearch">
				<li class="typechoice">
					<p onclick="typechoiceopen('1')" tabindex="171" onfocus="typechoiceopen('1')"><span id="choicename">����</span><img src="/images/2012/sub/page6/arrow_down.png" align="absmiddle" alt="����"></p>
					<input type="hidden" id="choicetype" value="subject">
					<dl id="typelist" class="typelist" style="display:none;">
						<dd onclick="searchtype('����')" tabindex="172" onfocus="this.style.background='#1f68b3'" onblur="this.style.background='#4898ea'" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">����</dd>
						<dd onclick="searchtype('����')" tabindex="173" onfocus="this.style.background='#1f68b3'" onblur="this.style.background='#4898ea'; searchtypeclose();"  onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">����</dd>
					</dl>
				</li>
				<li class="insert"><input type="text" tabindex="174" class="insearch" onfocus="this.style.background='#ffffff'" title="�˻��� ������ �Է����ּ���"></li>
				<li class="output"><input type="image" tabindex="175" src="/images/2012/sub/page2/btn_course_search.gif" title="�˻�� �Է� �� Ŭ�����ּ���" alt="�����˻�"></li>
			</ul>
		</div>
		<div class="viewbar"><h6><b><%=v_title%></b></h6></div>
		<div class="eventimage"><%=v_content %></div>
		<div class="viewfooter">
			<button type="button" onclick="javascript:listnotice();" tabindex="199" class="btn_small_lineblue" title="������� ���ư��ϴ�">�������</button>
		</div>
		
		<% if ((list!= null) && (v_seq >9))  {%>
		<div class="comment">
			<table class="commentlist" cellpadding="0" cellspacing="0" summary="�����Ͻ� �̺�Ʈ�� �󼼳����Դϴ�">
				<colgroup><col width="60"><col width="100"><col width="*"><col width="40"></colgroup>
				 <% for (int i=0; i<list.size();i++) {
			    	  DataBox dbox2 = (DataBox)list.get(i);
			      %>
				<tr>
					<th>
					<% if (dbox2.getString("d_gender").equals("2")) { %>
					<img src="/images/2012/common/icon/icon_sex_woman.gif" align="absmiddle" alt="����">
					<% } else { %>
					<img src="/images/2012/common/icon/icon_sex_man.gif" align="absmiddle" alt="����">
					<% } %>
					
					<%=dbox2.getString("d_name").substring(0,1)%>**</th>
					<td><%=dbox2.getString("d_userid")%></td>
					<td><%=dbox2.getString("d_answer")%><span>(<%=FormatDate.getFormatDate(dbox2.getString("d_indate"), "yyyy.MM.dd")%>)</span></td>
					<td>
					<% if (dbox2.getString("d_userid").equals(s_userid)) { %>
						<a href="javascript:updateComment('<%=dbox2.getString("d_seq")%>','<%=dbox2.getString("d_indate")%>');" tabindex="<%="2"+i+"1"%>" title="ȸ������ ����� �����մϴ�"><img src="/images/2012/common/icon/btn_comment_modify.gif" align="absmiddle" alt="��ۼ���"></a>
						<a href="javascript:deleteComment('<%=dbox2.getString("d_seq")%>','<%=dbox2.getString("d_indate")%>');" tabindex="<%="2"+i+"2"%>" title="ȸ������ ����� �����մϴ�"><img src="/images/2012/common/icon/btn_comment_delete.gif" align="absmiddle" alt="��ۻ���"></a>
					<% } %>
					</td>
				</tr>
				<% } %>				
			</table>
			 <% if(v_status.equals("����")){ %>
                    <% if(  v_isanswer.equals("Y") ){ %>
			<div class="commentwritebox">
				<table class="commentwrite" cellpadding="0" cellspacing="0">
					<colgroup><col width="80"><col width="*"><col width="112"></colgroup>
					<tr>
						<td> 
							<% if (s_gender.equals("2")) { %>
							<img src="/images/2012/common/icon/icon_sex_woman.gif" align="absmiddle" alt="����">
							<% } else { %>
							<img src="/images/2012/common/icon/icon_sex_man.gif" align="absmiddle" alt="����">
							<% } %>
							<span class="man"><%=s_usernm %></span>
						</td>
						<td><textarea name="p_answer" tabindex="301" class="write" onfocus="this.style.background='#ffffff'"></textarea></td>
						<td><button type="button" tabindex="302" onClick="javascript:applyEvent();" class="btn_large_linewhiteblue" title="����� ����մϴ�">��۴ޱ�</button></td>
					</tr>
				</table>
			</div>
			   <% } %>
      <% } %>
		</div>
		<% } %>
	</div>
</form>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
