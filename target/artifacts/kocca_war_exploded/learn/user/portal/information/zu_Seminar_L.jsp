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

    ArrayList list1 = null;
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
    
    int    v_seq     = 0;              // �Ϸù�ȣ
    int    v_cnt     = 0;              // ��ȸ��

    String v_code      = "";
    String v_codenm    = "";
    String v_seminargubun     = "";
    String v_seminargubunnm   = "";            
    String v_seminarnm = "";           // ����
    String v_content   = "";           // ����
    String v_tname     = "";           // ��米����
    String v_indate    = "";           // �����
    String v_name      = "";           // �����
    String v_startdate = "";           // ��ũ�� ������
    String v_enddate   = "";           // ��ũ�� ������
    String v_propstart = "";           // ��ũ�� ���� ������
    String v_propend   = "";           // ��ũ�� ���� ������
    String v_passyn  = "";             // ������ ���� ����
    
    String s_userid   = box.getSession("userid");
    String s_username = box.getSession("name");
    
    list2 = (ArrayList)request.getAttribute("selectSemanarList");
   
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<SCRIPT LANGUAGE="JavaScript">
<!--
    function go(index) {
        document.nform1.p_pageno.value = index;
        document.nform1.action = "/servlet/controller.homepage.SeminarHomePageServlet";
        document.nform1.p_process.value = "selectList";
        document.nform1.submit();
    }

    //������ ����
    function goPage(pageNum) {
        document.nform1.p_pageno.value = pageNum;
        document.nform1.action = "/servlet/controller.homepage.SeminarHomePageServlet";
        document.nform1.p_process.value = "selectList";
        document.nform1.submit();
    }

    //����Ʈ ��ȸ
    function select() {
        document.nform1.p_pageno.value = 0;
        document.nform1.action = "/servlet/controller.homepage.SeminarHomePageServlet";
        document.nform1.p_process.value = "selectList";
        document.nform1.submit();
    }

    //�󼼺���
    function selectView(seq) {

        document.nform1.action = "/servlet/controller.homepage.SeminarHomePageServlet";
        document.nform1.p_process.value = "selectView";
        document.nform1.p_seq.value= seq;
        document.nform1.submit();
    }

    function viewPassContent(seq) {

    	window.open("about:blank", "popUpView", "top=0, left=0, width=400, height=330, status=no, resizable=no, scrollbars=auto");

        document.nform1.action="/servlet/controller.homepage.SeminarHomePageServlet";
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

            <h2><img src="/images/portal/information/h2_tit4.gif" alt="��ũ��" class="fl_l" /><p class="category">Home > �������� > <strong>��ũ��</strong></p></h2>

            <p><img src="/images/portal/information/workshop_borimg.gif" alt="����������� ��ũ�� �Դϴ�. �پ��� �о� ������� ������ ������ �Ҹ��� ������ �� �ֽ��ϴ�." /></p>

            <p class="board_serach">
                <select name="p_search">
                    <option value="seminarnm"   <%if("seminarnm".equals(v_search)) out.print(" selected");%>>����</option>
                    <option value="all" <%if("all".equals(v_search)) out.print(" selected");%>>����+����</option>
                </select>
                <input name="p_searchtext" type="text" class="inbox" style="width:135px;" value="<%=v_searchtext %>" onkeypress="javascript:fnKeyPressEnter(event, 'select');"/>
                <input type="image" class="btn" src="/images/portal/btn/btn_serbox_search.gif" alt="�˻�" onclick="select();"/>
            </p>

            <table class="board_list">
            <colgroup><col width="50px" /><col width="81px" /><col /><col width="105px" /><col width="105px" /><col width="82px" /></colgroup>
            <thead>
            <tr class="information">
                <th><p>��ȣ</p></th>
                <th><p>
                    <kocca_select:select                                       
		                name="p_selSeminarGubun"                                         
		                sqlNum="0001"                                    
		                param="0061"             
		                onChange="select();"                         
		                attr= "�з�"                                        
		                selectedValue="<%=v_selSeminarGubun%>"                         
		                isLoad="true"                                           
		                type="3"                                                
		                styleClass=""                                
		                all="true" />
                </p></th>
                <th><p>����</p></th>
                <th><p>��ũ������</p></th>
                <th><p>��û�Ⱓ</p></th>
                <th class="end"><p>�����ǥ</p></th>
            </tr>
            </thead>
            <tbody>
			<%
			if(list2.size() != 0){
			    for( int i = 0; i < list2.size(); i++) {
				    DataBox dbox     = (DataBox)list2.get(i);
				    
				    v_seq           = dbox.getInt("d_seq");
				    v_seminargubun  = dbox.getString("d_seminargubun");
				    v_seminargubunnm= dbox.getString("d_seminargubunnm");
				    v_seminarnm     = dbox.getString("d_seminarnm");
				    v_tname         = dbox.getString("d_tname");
				    v_startdate     = dbox.getString("d_startdate");
				    v_enddate       = dbox.getString("d_enddate");
				    v_propstart     = dbox.getString("d_propstart");
				    v_propend       = dbox.getString("d_propend");
				    v_passyn        = dbox.getString("d_pass_yn");
				
				    v_dispnum        = dbox.getInt("d_dispnum");
				    v_totalpage      = dbox.getInt("d_totalpage");
				    v_rowcount       = dbox.getInt("d_rowcount");
				    
				    if(v_passyn.equals("Y")){
				        v_passyn = "<a class='state' href='javascript:viewPassContent("+v_seq+")'><span class='finish'>������Ȯ��</span></a>";
				    } else if(v_passyn.equals("N")) {
				        v_passyn = "<a class='state'><span class='pre'>�̹�ǥ</span></a>";
				    }
				    
				    //if (!v_searchtext.equals("")&&v_search.equals("title")) {
				    if (!v_searchtext.equals("")) {
				    	v_seminarnm = StringManager.replace(v_seminarnm, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
				    } 
			%>
			<tr onmouseover="className='over'" onmouseout="className=' '">
                <td class="num"><%=v_dispnum%></td>
                <td><%=v_seminargubunnm%></td>
                <td class="ta_l"><a href="javascript:selectView(<%=v_seq%>)"><%=v_seminarnm%></a></td>
                <td class="num"><%=FormatDate.getFormatDate(v_startdate, "yyyy.MM.dd")+"-"+FormatDate.getFormatDate(v_enddate, "MM.dd")%></td>
                <td class="num"><%=FormatDate.getFormatDate(v_propstart, "yyyy.MM.dd")+"-"+FormatDate.getFormatDate(v_propend, "MM.dd")%></td>
                <td class="btn"><%=v_passyn%></td>
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
</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->
