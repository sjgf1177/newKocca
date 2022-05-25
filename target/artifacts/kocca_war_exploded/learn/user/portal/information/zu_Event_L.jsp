<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    ArrayList list2 = null;

    String  v_process  = box.getString("p_process");

    // �˻�
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    
    String  v_selSeminarGubun   = box.getString("p_selSeminarGubun");
    
    int v_pageno    = box.getInt("p_pageno");
    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������
    int v_rowcount  = 0;
	int v_pagesize = box.getInt("p_pagesize");
    
    int    v_seq     = 0;              // �Ϸù�ȣ
    int    v_cnt     = 0;              // ��ȸ��

    String v_title     = "";           // ����
    String v_content   = "";           // ����
    String v_indate    = "";           // �����
    String v_name      = "";           // �����
    String v_startdate = "";           // �̺�Ʈ ������
    String v_enddate   = "";           // �̺�Ʈ ������
    String v_winneryn  = "";           // ��û�� ����
    String v_isall     = "";
    String v_status    = "";
    
    String s_userid   = box.getSession("userid");
    String s_username = box.getSession("name");
    
    list2 = (ArrayList)request.getAttribute("selectList");
   
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<SCRIPT LANGUAGE="JavaScript">
<!--
    function go(index) {
        document.nform1.p_pageno.value = index;
        document.nform1.action = "/servlet/controller.homepage.EventHomePageServlet";
        document.nform1.p_process.value = "selectList";
        document.nform1.submit();
    }

    //������ ����
    function goPage(pageNum) {
        document.nform1.p_pageno.value = pageNum;
        document.nform1.action = "/servlet/controller.homepage.EventHomePageServlet";
        document.nform1.p_process.value = "selectList";
        document.nform1.submit();
    }

    //����Ʈ ��ȸ
    function select() {
        document.nform1.p_pageno.value = 0;
        document.nform1.action = "/servlet/controller.homepage.EventHomePageServlet";
        document.nform1.p_process.value = "selectList";
        document.nform1.submit();
    }

    //�󼼺���
    function selectView(seq) {

        document.nform1.action = "/servlet/controller.homepage.EventHomePageServlet";
        document.nform1.p_process.value = "selectView";
        document.nform1.p_seq.value= seq;
        document.nform1.submit();
    }

    function viewPassContent(seq) {

    	window.open("about:blank", "popUpView", "top=0, left=0, width=400, height=330, status=no, resizable=no, scrollbars=auto");

        document.nform1.action="/servlet/controller.homepage.EventHomePageServlet";
        document.nform1.p_process.value = "selectViewPass";
        document.nform1.p_seq.value = seq;
        document.nform1.target="popUpView";
        document.nform1.submit();
        
        document.nform1.target="_self";
    }

//-->
</SCRIPT>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name="nform1" method="post" onsubmit="javascript:select();">
    <input type = "hidden" name = "p_process">
    <input type = "hidden" name = "p_pageno"  value="<%=v_pageno%>"> 
    <input type = "hidden" name = "p_seq"    >
    
    <%if( box.getSession("tem_grcode").equals("N000001")) { %>
	
	<table>
		<tr>
			<td>
			
			 <!--Ÿ��Ʋ�κ�-->
    <table width="672" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" colspan="2" class="h_road">&nbsp;</td>
      </tr>
      <tr>
        <td><img src="/images/portal/homepage_renewal/support/stitle_09.gif" alt="�̺�Ʈ ��" /></td>
        <td class="h_road">Home &gt; �н����� �ȳ�  &gt; <strong>�̺�Ʈ ��</strong></td>
      </tr>
      <tr>
        <td height="12" colspan="2"></td>
        </tr>
      <tr>
        <td height="1" colspan="2" bgcolor="E5E5E5"></td>
      </tr>
    </table>
    <table width="672" border="0" cellpadding="0" cellspacing="1" bgcolor="ADBBD8">
      <tr>
        <td height="34" bgcolor="F0F0F0"><table border="0" align="center" cellpadding="3" cellspacing="0">
            <tr>
              <td><span class="tit_table">
                <select name="p_search">
                    <option value="title"   <%if("title".equals(v_search)) out.print(" selected");%>>����</option>
                    <option value="all" <%if("all".equals(v_search)) out.print(" selected");%>>����+����</option>
                </select>
              </span></td>
              <td><input name="p_searchtext" type="text" class="input_search" id="p_searchtext" size="30" value="<%=v_searchtext %>" onkeypress="javascript:fnKeyPressEnter(event, 'select');"/></td>
              <td><a href="javascript:select();"><img src="/images/portal/homepage_renewal//common/btn_search_in.jpg" alt="�˻�" width="46" height="24" /></a></td>
            </tr>
        </table></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table>
    <!--�˻��κ�//-->
    <!--���̺�κ�-->
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="tit_table">��ȣ</td>
        <td class="tit_table">���� </td>
        <td class="tit_table">�̺�Ʈ�Ⱓ</td>
        <td class="tit_table">����Ⱓ</td>
        <td class="tit_table">��÷�ڹ�ǥ</td>
        <td class="tit_table_right">��ȸ��</td>
      </tr>
      
      <%
			if(list2.size() != 0){
				for( int i = 0; i < list2.size(); i++) {
				    DataBox dbox     = (DataBox)list2.get(i);
				    
				    v_seq       = dbox.getInt("d_seq");
				    v_cnt       = dbox.getInt("d_cnt");
				    v_title     = dbox.getString("d_title");
				    v_startdate = dbox.getString("d_strdate");
				    v_enddate   = dbox.getString("d_enddate");
				    v_indate    = dbox.getString("d_indate");
				    v_name      = dbox.getString("d_name");
				    v_winneryn  = dbox.getString("d_winneryn");
				    v_isall     = dbox.getString("d_isall");
				
				    v_dispnum        = dbox.getInt("d_dispnum");
				    v_totalpage      = dbox.getInt("d_totalpage");
				    v_rowcount       = dbox.getInt("d_rowcount");
				    
				    if(v_winneryn.equals("C")){
				    	v_winneryn = "�̹�ǥ";
				    	v_status = "�Ϸ�";
				    } else if(v_winneryn.equals("Y")){
				        v_winneryn = "<a href='javascript:viewPassContent("+v_seq+")'><img src='/images/portal/homepage_renewal/library/btn_dok.jpg' width='90' height='21' alt='��÷��Ȯ��' /></a>";
				        v_status = "�Ϸ�";
				    } else if(v_winneryn.equals("N")){
				    	v_winneryn = "�̹�ǥ";
				    	v_status = "����";
				    } else if(v_winneryn.equals("A")){
				    	v_winneryn = "�̹�ǥ";
                        v_status = "����";
                    } 
				    
				    
				    //if (!v_searchtext.equals("")&&v_search.equals("title")) {
				    if (!v_searchtext.equals("")) {
				    	v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
				    } 
			%>      
      
      <tr>
        <td class="ct_tit_table"><%=v_isall.equals("Y") ? "*" : v_dispnum%></td>
        <td class="ct_tit_table_left"><a href="javascript:selectView(<%=v_seq%>)"><%=v_title%></a></td>
        <td class="ct_tit_table"><%=FormatDate.getFormatDate(v_startdate, "yyyy.MM.dd")+"-"+FormatDate.getFormatDate(v_enddate, "MM.dd")%></td>
        <td class="ct_tit_table"><%=v_status%></td>
        <td class="ct_tit_table"><%=v_winneryn%></td>
        <td class="ct_tit_table_right"><%=v_cnt%></td>
      </tr>
			<%      }
			    }else{%>

		    <tr> 
		        <td colspan="6">��ϵ� ������ �����ϴ�.</td>
		    </tr>
            <%  }   %>
      
      <tr>
        <td height="1" colspan="6" bgcolor="CACACA"></td>
      </tr>
      <tr>
        <td height="4" colspan="6" bgcolor="F7F7F7"></td>
      </tr>
    </table>
    
    <!-- total ���� -->
		 <%= PageUtil.re_printPageSizeListDiv(v_totalpage, v_pageno, 0, v_pagesize, v_totalpage) %>
		<!-- total �� -->
    
    <!--Ÿ��Ʋ�κ�//-->
    </td>
    <td width="20">&nbsp;</td>
    
  </tr>
</table>
			
			<%}else{ %>

            <h2><img src="/images/portal/information/h2_tit5.gif" alt="�̺�Ʈ" class="fl_l" /><p class="category">Home > �������� > <strong>�̺�Ʈ</strong></p></h2>

            <p><img src="/images/portal/information/event_borimg.gif" alt="��������������� �����ϴ� �̺�Ʈ�� ����������" /></p>
            
            <p class="board_serach">
                <select name="p_search">
                    <option value="title"   <%if("title".equals(v_search)) out.print(" selected");%>>����</option>
                    <option value="all" <%if("all".equals(v_search)) out.print(" selected");%>>����+����</option>
                </select>
                <input name="p_searchtext" type="text" class="inbox" style="width:135px;" value="<%=v_searchtext %>" onkeypress="javascript:fnKeyPressEnter(event, 'select');"/>
                <input type="image" class="btn" src="/images/portal/btn/btn_serbox_search.gif" alt="�˻�" onclick="select();"/>
            </p>
            
            <table class="board_list">
            <colgroup><col width="48px" /><col width="323px" /><col width="106px" /><col width="74px" /><col width="82px" /><col width="60px" /></colgroup>
            <thead>
            <tr class="information">
                <th><p>��ȣ</p></th>
                <th><p>����</p></th>
                <th><p>�̺�Ʈ�Ⱓ</p></th>
                <th><p>����Ⱓ</p></th>
                <th><p>��÷�ڹ�ǥ</p></th>
                <th class="end"><p>��ȸ��</p></th>
            </tr>
            </thead>
            <tbody>
			<%
			if(list2.size() != 0){
				for( int i = 0; i < list2.size(); i++) {
				    DataBox dbox     = (DataBox)list2.get(i);
				    
				    v_seq       = dbox.getInt("d_seq");
				    v_cnt       = dbox.getInt("d_cnt");
				    v_title     = dbox.getString("d_title");
				    v_startdate = dbox.getString("d_strdate");
				    v_enddate   = dbox.getString("d_enddate");
				    v_indate    = dbox.getString("d_indate");
				    v_name      = dbox.getString("d_name");
				    v_winneryn  = dbox.getString("d_winneryn");
				    v_isall     = dbox.getString("d_isall");
				
				    v_dispnum        = dbox.getInt("d_dispnum");
				    v_totalpage      = dbox.getInt("d_totalpage");
				    v_rowcount       = dbox.getInt("d_rowcount");
				    
				    if(v_winneryn.equals("C")){
				    	v_winneryn = "<a class='state'><span class='pre'>�̹�ǥ</span></a>";
				    	v_status = "�Ϸ�";
				    } else if(v_winneryn.equals("Y")){
				        v_winneryn = "<a class='state' href='javascript:viewPassContent("+v_seq+")'><span class='finish'>��÷��Ȯ��</span></a>";
				        v_status = "�Ϸ�";
				    } else if(v_winneryn.equals("N")){
				    	v_winneryn = "<a class='state'><span class='pre'>�̹�ǥ</span></a>";
				    	v_status = "����";
				    } else if(v_winneryn.equals("A")){
				    	v_winneryn = "<a class='state'><span class='pre'>�̹�ǥ</span></a>";
                        v_status = "����";
                    } 
				    
				    
				    //if (!v_searchtext.equals("")&&v_search.equals("title")) {
				    if (!v_searchtext.equals("")) {
				    	v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
				    } 
			%>
            <tr onmouseover="className='over'" onmouseout="className=' '">
                <td class="num"><%=v_isall.equals("Y") ? "*" : v_dispnum%></td>
                <td class="ta_l"><a href="javascript:selectView(<%=v_seq%>)"><%=v_title%></a></td>
                <td class="num"><%=FormatDate.getFormatDate(v_startdate, "yyyy.MM.dd")+"-"+FormatDate.getFormatDate(v_enddate, "MM.dd")%></td>
                <td><%=v_status%></td>
                <td class="btn"><%=v_winneryn%></td>
                <td class="num"><%=v_cnt%></td>
            </tr>
			<%      }
			    }else{%>

		    <tr> 
		        <td colspan="6">��ϵ� ������ �����ϴ�.</td>
		    </tr>
            <%  }   %>
            </tbody>
            </table>

        <!-- ����¡ ���� ���� -->
         <%= PageUtil.printPageSizeListDivNoPagesize(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
        <!-- ����¡ ���� ���� -->
        
        <%} %>
</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->