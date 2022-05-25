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

    int v_tabseq    = box.getInt("p_tabseq");

    // �˻�
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");

    int v_pageno    = box.getInt("p_pageno");
    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������
    int v_rowcount  = 0;

    list2 = (ArrayList)request.getAttribute("selectList");

%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<SCRIPT LANGUAGE="JavaScript">
<!--
    function go(index) {
        document.nform1.p_pageno.value = index;
        document.nform1.target  =   "_self";
        document.nform1.action = "/servlet/controller.community.CommunityRiskServlet";
        document.nform1.p_process.value = "select";
        document.nform1.submit();
    }

    //������ ����
    function goPage(pageNum) {
        document.nform1.p_pageno.value = pageNum;
        document.nform1.target  =   "_self";
        document.nform1.action = "/servlet/controller.community.CommunityRiskServlet";
        document.nform1.p_process.value = "select";
        document.nform1.submit();
    }

    //����Ʈ ��ȸ
    function select() {
        document.nform1.p_pageno.value = 0;
        document.nform1.target  =   "_self";
        document.nform1.action = "/servlet/controller.community.CommunityRiskServlet";
        document.nform1.p_process.value = "select";
        document.nform1.submit();
    }

    //�󼼺���
    function selectView(seq) {
    	document.nform1.target  =   "_self";
        document.nform1.action = "/servlet/controller.community.CommunityRiskServlet";
        document.nform1.p_process.value = "view";
        document.nform1.p_seq.value= seq;
        document.nform1.submit();
    }

    //�۵��
    function insertPage() {
    	document.nform1.target  =   "_self";
        document.nform1.action = "/servlet/controller.community.CommunityRiskServlet";
        document.nform1.p_process.value = "insertPage";
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
    <input type = "hidden" name = "p_tabseq" value="<%=v_tabseq %>" >
    
    <h2><img src="/images/portal/community/h6_tit_5.gif" alt="�ǽð��������" class="fl_l" /><p class="category">Home > Ŀ�´�Ƽ > <strong>�ǽð��������</strong></p></h2>
            <p class="board_serach" style="padding-top:0px">
                <select name="p_search">
                    <option value="title"   <%if("title".equals(v_search)) out.print(" selected");%>>����</option>
                    <option value="all" <%if("all".equals(v_search)) out.print(" selected");%>>����+����</option>
                </select>
                <input name="p_searchtext" type="text" class="inbox" style="width:135px;" value="<%=v_searchtext %>" onkeypress="javascript:fnKeyPressEnter(event, 'select');" />
                <input type="image" class="btn" src="/images/portal/btn/btn_serbox_search.gif" alt="�˻�" onclick="select();"/>
            </p>

            <table class="board_list">
            <colgroup><col width="50px" /><col width="363px" /><col width="62px" /><col width="90px" /><col width="62px" /></colgroup>
            <thead>
            <tr class="information">
                <th><p>��ȣ</p></th>
                <th><p>����</p></th>
                <th><p>�ۼ���</p></th>
                <th><p>�ۼ�����</p></th>
                <th class="end"><p>��ȸ��</p></th>
            </tr>
            </thead>
            <tbody>
			<%
			if(list2.size() != 0){

                int    v_seq     = 0;              // �Ϸù�ȣ
                int    v_reply    = 0;
                int  v_hitnum   = 0;

                String  v_title     = "";
                String  v_indate     = "";
                String  v_userid    = "";
                String  v_usernm    = "";
                String  v_gubun    = "";
                String  v_sdate    = "";
                String  v_edate    = "";

			    for( int i = 0; i < list2.size(); i++) {
				    DataBox dbox     = (DataBox)list2.get(i);

				    v_seq           = dbox.getInt("d_seq");
				    v_gubun         = dbox.getString("d_gubun");
                    v_userid        = dbox.getString("d_userid");
                    v_usernm        = dbox.getString("d_name");
                    v_title         = dbox.getString("d_title");
                    v_indate        = dbox.getString("d_ldate");
                    v_sdate         = dbox.getString("d_sdate");
                    v_edate         = dbox.getString("d_edate");
                    v_reply         = dbox.getInt("d_reply");
				    v_hitnum        = dbox.getInt("d_hitnum");

				    v_totalpage      = dbox.getInt("d_totalpage");
				    v_rowcount       = dbox.getInt("d_rowcount");

				    if (!v_searchtext.equals("")) {
				        v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>");
				    }
			%>
			<tr onmouseover="className='over'" onmouseout="className=' '">
                <td class="num"><%=dbox.getString("d_dispnum")%></td>
                <td class="ta_l"><a href="javascript:selectView('<%=v_seq%>')"><%=v_title%></a> <label style="color:red">(<%=v_reply%>)</label></td>
                <td><%=v_usernm%></td>
                <td class="num"><%= FormatDate.getFormatDate(v_indate,"yyyy/MM/dd") %></td>
                <td class="num"><%=v_hitnum%></td>
            </tr>
			<%      }
			    }else{%>
			      <tr>
			        <td colspan ='5'>��ϵ� ������ �����ϴ�.</td>
			      </tr>
			<%  }   %>
            </tbody>
            </table>

            <p class="list_btn"><a href="javascript:insertPage()" class="board_blue"><span>���</span></a></p>
            
        <!-- ����¡ ���� ���� -->
         <%= PageUtil.printPageSizeListDivNoPagesize(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
        <!-- ����¡ ���� ���� -->
</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->