<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    ArrayList list2 = null;

    String  v_tabseq   = box.getString("p_tabseq");
    String  v_process  = box.getString("p_process");

    // �˻�
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    
    int v_pageno    = box.getInt("p_pageno");
    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������
    int v_rowcount  = 0;
    
    int i = 0;
    int    v_seq     = 0;           // �Ϸù�ȣ
    int    v_cnt     = 0;           // ��ȸ��  

    String v_title   = "";          // ����
    String v_content = "";          // ����
    String v_indate   = "";          // �����
    String v_name    = "";          // �����
    String v_useyn   = "";          // ���λ�뿩��
    String v_savefile = "";         // �������ϸ�
    String v_realfile = "";         // �������ϸ�
    String v_select_seq = "";       // ���� �Խü��õ� seq
    String v_month   = "";          // ����
    String v_singleword   = "";     // �Ѹ���

    box.put("leftmenu","02");    

    list2 = (ArrayList)request.getAttribute("selectList");
   
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<SCRIPT LANGUAGE="JavaScript">
<!--
    function go(index) {
        document.nform1.p_pageno.value = index;
        document.nform1.action = "/servlet/controller.homepage.KOpenPowerHomePageServlet";
        document.nform1.p_process.value = "selectList";
        document.nform1.submit();
    }

    //������ ����
    function goPage(pageNum) {
        document.nform1.p_pageno.value = pageNum;
        document.nform1.action = "/servlet/controller.homepage.KOpenPowerHomePageServlet";
        document.nform1.p_process.value = "selectList";
        document.nform1.submit();
    }

    //����Ʈ ��ȸ
    function select() {
        document.nform1.p_pageno.value = 0;
        document.nform1.action = "/servlet/controller.homepage.KOpenPowerHomePageServlet";
        document.nform1.p_process.value = "selectList";
        document.nform1.submit();
    }

    //�󼼺���
    function selectView(seq) {

        document.nform1.action = "/servlet/controller.homepage.KOpenPowerHomePageServlet";
        document.nform1.p_process.value = "selectView";
        document.nform1.p_seq.value= seq;
        document.nform1.submit();
    }

//-->
</SCRIPT>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name="nform1" method="post" onsubmit="javascript:select();">
    <input type = "hidden" name = "p_process">
    <input type = "hidden" name = "p_pageno"  value="<%=v_pageno%>"> 
    <input type = "hidden" name = "p_seq"    >
    <input type = "hidden" name = "p_tabseq"  value = "<%= v_tabseq%>">

            <h2><img src="/images/portal/information/h2_tit7.gif" alt="���ͺ�" class="fl_l" /><p class="category">Home > �������� > <strong>���ͺ�</strong></p></h2>

            <p><img src="/images/portal/information/interview_borimg.gif" alt="������ �� ������� ������ ���ͺ並 ����������" /></p>

            <p class="board_serach">
                <select name="p_search">
                    <option value="title"   <%if("title".equals(v_search)) out.print(" selected");%>>����</option>
                    <option value="all" <%if("all".equals(v_search)) out.print(" selected");%>>����+����</option>
                </select>
                <input name="p_searchtext" type="text" class="inbox" style="width:135px;" value="<%=v_searchtext %>" onkeypress="javascript:fnKeyPressEnter(event, 'select');"/>
                <input type="image" class="btn" src="/images/portal/btn/btn_serbox_search.gif" alt="�˻�" onclick="select();" />
            </p>

            <table class="board_list">
            <colgroup><col width="63px" /><col width="440px" /><col width="90px" /><col width="62px" /></colgroup>
            <thead>
            <tr class="information">
                <th><p>��ȣ</p></th>
                <th><p>����</p></th>
                <th><p>�ۼ�����</p></th>
                <th class="end"><p>��ȸ��</p></th>
            </tr>
            </thead>
            <tbody>
			<%
			if(list2.size() != 0){
				for( i = 0; i < list2.size(); i++) {
				    DataBox dbox     = (DataBox)list2.get(i);
				    
				    v_seq   = dbox.getInt("d_seq");
				    v_cnt   = dbox.getInt("d_cnt");
				    v_title = dbox.getString("d_title");
				    v_indate = dbox.getString("d_indate");
				    v_name  = dbox.getString("d_lname");
				    v_useyn = dbox.getString("d_useyn");
				    v_month = dbox.getString("d_lmonth");
				    v_singleword = dbox.getString("d_singleword");
				
				    
				    v_dispnum   = dbox.getInt("d_dispnum");
				    v_totalpage = dbox.getInt("d_totalpage");
				
				    v_indate   = FormatDate.getFormatDate(v_indate,"yyyy.MM.dd");
				    
				    
				    //if (!v_searchtext.equals("")&&v_search.equals("title")) {
				    if (!v_searchtext.equals("")) {
				    	v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
				    } 
			%>
			<tr onmouseover="className='over'" onmouseout="className=' '">
                <td class="num"><%=v_dispnum%></td>
                <td class="ta_l"><a href="javascript:selectView(<%=v_seq%>)"><%=v_title%></a></td>
                <td class="num"><%=v_indate%></td>
                <td class="num"><%=v_cnt%></td>
            </tr>
			<%      }
			    }else{%>
			
			      <tr> 
			        <td colspan ='4'>��ϵ� ������ �����ϴ�.</td>
			      </tr>
			<%  }   %>
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