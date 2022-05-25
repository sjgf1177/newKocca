<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%  
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

	box.put("topmenu","5");
	box.put("submenu","1");

    String  v_process    = box.getString("p_process");
    int     v_pageno     = box.getInt   ("p_pageno");
    String  v_userid     = box.getSession("userid");
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");

    int v_tabseq   = box.getInt("p_tabseq");
    int v_seq      = box.getInt("p_seq");

    int    v_cnt       = 0;            // ��ȸ��
    String v_gubun     = "";           // ��ü����
    String v_startdate = "";           // �˾�����������
    String v_enddate   = "";           // �˾�����������
    String v_adtitle   = "";           // ����
    String v_adcontent = "";           // ����
    String v_addate    = "";           // �����
    String v_adname    = "";           // �����
    String v_luserid   = "";
    String v_gubun_view = "";
    String v_loginyn    = "";           // �α�������
    String v_useyn      = "";           // �������
    String v_grcodecd   = "";           // ��� �����׷�
    String v_onoffgubun = "";			// �¶���/�������� ����
    int v_popwidth   = 0;               // �˾�����
    int v_popheight  = 0;               // �˾�����
    int v_popxpos    = 0;               // �˾�x��ġ
    int v_popypos    = 0;               // �˾�y��ġ

    String v_popup   = "";               // �˾�����
    String v_uselist = "";               // ����Ʈ���
    String v_useframe= "";               // �����ӻ��

    DataBox dbox = (DataBox)request.getAttribute("selectNotice");

    if (dbox != null) {
        v_gubun     = dbox.getString("d_gubun");
        v_startdate = dbox.getString("d_startdate");
        v_enddate   = dbox.getString("d_enddate");
        v_adtitle   = dbox.getString("d_adtitle");
        v_adcontent = dbox.getString("d_adcontent");
        v_addate    = dbox.getString("d_addate");
        v_adname    = dbox.getString("d_adname");
        v_luserid   = dbox.getString("d_luserid");
        v_cnt       = dbox.getInt("d_cnt");
        v_loginyn   = dbox.getString("d_loginyn");
        v_useyn     = dbox.getString("d_useyn");
        v_grcodecd  = dbox.getString("d_grcodecd");
        v_popwidth  = dbox.getInt("d_popwidth");
        v_popheight = dbox.getInt("d_popheight");
        v_popxpos   = dbox.getInt("d_popxpos");
        v_popypos   = dbox.getInt("d_popypos");
        v_popup     = dbox.getString("d_popup");
        v_uselist   = dbox.getString("d_uselist");
        v_useframe  = dbox.getString("d_useframe");
        if(dbox.getStringDefault("d_onoffgubun","C").equals("C")){
        	v_onoffgubun = "�¶���";	
        }else{
        	v_onoffgubun = "��������";
        }
        

        v_addate     = FormatDate.getFormatDate(v_addate, "yyyy.MM.dd");

     }

    if (v_gubun.equals("Y")) v_gubun_view = "��ü";
    else if (v_gubun.equals("N")) v_gubun_view = "�Ϲ�";
    else if (v_gubun.equals("P")) v_gubun_view = "�˾�";

    if (v_uselist.equals("")) v_uselist = "N";
    if (v_useframe.equals("")) v_useframe = "N";

    if(v_loginyn.equals("Y")) v_loginyn = "�α�����";
    else if(v_loginyn.equals("N")) v_loginyn = "�α�����";
    else v_loginyn = "��ü";

    if(v_useyn.equals("Y")) v_useyn = "���";
    else if(v_useyn.equals("N")) v_useyn = "������";

%>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>

<!-- ��ũ��Ʈ���� -->
<SCRIPT type="text/javascript">

    function listnotice(){
    	document.nform2.p_process.value = "List";
        document.nform2.action = "/servlet/controller.homepage.HomeNoticeServlet";
        document.nform2.submit();
    }

</SCRIPT>
<!-- ��ũ��Ʈ�������� -->
<!-- form ���� -->
<form name="nform2" method="post" action="/">
<input type = "hidden" name = "p_process" >
<input type = "hidden" name = "p_pageno" value = "<%=v_pageno %>">
<input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
<input type = "hidden" name = "p_search" value = "<%=v_search %>">
<input type = "hidden" id="choicetype" value="subject">
	
	<div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0" summary="���� ������ �������� ��ġ�Դϴ�">
			<tr>
				<td class="pagenaviR"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > �н����� > <u>��������</u></td>
			</tr>
		</table>
		<div class="concept">
			<div><img src="/images/2012/sub/page4/title/notice.gif" alt="�ѱ���������ī���̿��� ���ϴ� ȸ���Ե��� ���� �پ��� ����"></div>
			<ul class="boardsearch">
				<li class="typechoice">
					<p onclick="typechoiceopen('1')" tabindex="171" onfocus="typechoiceopen('1')"><span id="choicename">����</span><img src="/images/2012/sub/page6/arrow_down.png" align="absmiddle" alt="����"></p>
					<dl id="typelist" class="typelist" style="display:none;">
						<dd onclick="searchtype('����','title')" tabindex="172" onfocus="this.style.background='#1f68b3'" onblur="this.style.background='#4898ea'" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">����</dd>
						<dd onclick="searchtype('����','content')" tabindex="173" onfocus="this.style.background='#1f68b3'" onblur="this.style.background='#4898ea'; searchtypeclose();" onmouseover="this.style.background='#1f68b3'" onmouseout="this.style.background='#4898ea'">����</dd>
					</dl>
				</li>
				
				<li class="insert"><input type="text" tabindex="174" class="insearch" onfocus="this.style.background='#ffffff'" title="�˻��� ������ �Է����ּ���"></li>
				<li class="output"><input type="image" src="/images/2012/sub/page2/btn_course_search.gif" tabindex="175" title="�˻�� �Է� �� Ŭ�����ּ���" alt="�����˻�"></li>
			</ul>
		</div>
		<div class="viewbar"><h6><b><%=v_adtitle%></b></h6></div>
		<div class="viewcontent">
			<%=StringManager.removeHTMLHead(v_adcontent)%>
			<%
			Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
			Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
			String i_boardStyle        = "board_view";                                // ���� ��Ÿ��
			%>
			<%@ include file="/learn/user/include/zu_MultiAttach_2012_R.jsp" %>
			<table class="about" cellpadding="0" cellspacing="0">
				<colgroup><col width="34"><col width="*"><col width="65"><col width="70"><col width="36"><col width="30"></colgroup>
				<tr>
					<th>�з�</th>
					<td><%=v_onoffgubun %></td>
					<th>�ۼ�����</th>
					<td><%=v_addate%></td>
					<th>��ȸ</th>
					<td><%=v_cnt%></td>
				</tr>
			</table>
		</div>
		<div class="viewfooter">
			<button type="button" onclick="javascript:listnotice()" tabindex="200" class="btn_small_lineblue" title="������� ���ư��ϴ�">�������</button>
		</div>
	</div>
	<input type="submit" class="close" title="����">
</form>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>

