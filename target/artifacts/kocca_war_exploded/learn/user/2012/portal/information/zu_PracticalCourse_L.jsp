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
    
    String  v_selDtlCd   = box.getString("p_selDtlCd");
    String  v_selContentType   = box.getString("p_selContentType");
    
    int v_pageno    = box.getInt("p_pageno");
    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������
    int v_rowcount  = 0;
    int v_pagesize = box.getInt("p_pagesize");
	int	 v_totalrowcount =  0;
    
    int    v_seq            = 0;
    int    v_cnt            = 0;            // ��ȸ��
    String v_clsfcd         = "";
    String v_dtlcd          = "";
    String v_dtlnm          = "";
    String v_contenttype    = "";
    String v_contenttypenm  = "";
    String v_title          = "";
    String v_professor      = "";
    String v_indate         = "";
    String v_name           = "";
    String v_mainyn         = "";
    String v_usechk         = "";
    
    String s_userid   = box.getSession("userid");
    String s_username = box.getSession("name");
    
    list2 = (ArrayList)request.getAttribute("selectPreGoldClassList");
   
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->

<SCRIPT LANGUAGE="JavaScript">
<!--
    function go(index) {
        document.nform1.p_pageno.value = index;
        document.nform1.action = "/servlet/controller.infomation.PracticalCourseHomePageServlet";
        document.nform1.target="_self";
        document.nform1.p_process.value = "selectList";
        document.nform1.submit();
    }

    //������ ����
    function goPage(pageNum) {
        document.nform1.p_pageno.value = pageNum;
        document.nform1.action = "/servlet/controller.infomation.PracticalCourseHomePageServlet";
        document.nform1.target="_self";
        document.nform1.p_process.value = "selectList";
        document.nform1.submit();
    }

    //����Ʈ ��ȸ
    function select() {
        document.nform1.p_pageno.value = 0;
        document.nform1.action = "/servlet/controller.infomation.PracticalCourseHomePageServlet";
        document.nform1.target="_self";
        document.nform1.p_process.value = "selectList";
        document.nform1.submit();
    }

    //�󼼺���
    function selectView(seq) {

        document.nform1.action = "/servlet/controller.infomation.PracticalCourseHomePageServlet";
        document.nform1.p_process.value = "selectView";
        document.nform1.target="_self";
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
        <td><img src="/images/portal/homepage_renewal/library/stitle_03.gif" alt="�ǹ�����" /></td>
        <td class="h_road">Home &gt; �����÷���  &gt; <strong>�ǹ�����</strong></td>
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
                <select name="p_search" id="p_search">
                  <option value="title"   <%if("title".equals(v_search)) out.print(" selected");%>>����</option>
                  <option value="content" <%if("content".equals(v_search)) out.print(" selected");%>>����+����</option>
                </select>
              </span></td>
              <td><input name="p_searchtext" type="text" class="inbox" id="p_searchtext" size="30"  value="<%=v_searchtext %>" /></td>
              <td><img src="/images/portal/homepage_renewal/common/btn_search_in.jpg" alt="�˻�" width="46" height="24" onclick="javascript:select();"/></td>
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
        <td class="tit_table"><kocca_select:select                                       
		                name="p_selContentType"                                         
		                sqlNum="0001"                                    
		                param="0085"             
		                onChange="select();"                         
		                attr= "��������"                                        
		                selectedValue="<%=v_selContentType%>"                         
		                isLoad="true"                                           
		                type="3"                                                
		                styleClass=""                                
		                all="true" /></td>
        <td class="tit_table"><kocca_select:select                                       
		                name="p_selDtlCd"                                         
		                sqlNum="0001"                                    
		                param="0086"             
		                onChange="select();"                         
		                attr= "���ºо�"                                        
		                selectedValue="<%=v_selDtlCd%>"                         
		                isLoad="true"                                           
		                type="3"                                                
		                styleClass=""                                
		                all="true" /></td>
        <td class="tit_table">���� </td>
        <td class="tit_table">�����</td>
        <td class="tit_table_right">��ȸ</td>
      </tr>
      
      <%
			if(list2.size() != 0){
			   for( int i = 0; i < list2.size(); i++) {
			
			    DataBox dbox     = (DataBox)list2.get(i);
			    
			    v_seq            = dbox.getInt("d_num");
			    v_cnt            = dbox.getInt("d_cnt");  
			    v_clsfcd         = dbox.getString("d_clsfcd");
			    v_dtlcd          = dbox.getString("d_dtlcd");
			    v_dtlnm          = dbox.getString("d_dtlnm");
			    v_contenttype    = dbox.getString("d_contenttype");
			    v_contenttypenm  = dbox.getString("d_contenttypenm");
			    v_title          = dbox.getString("d_title");
			    v_professor      = dbox.getString("d_professor");
			    v_indate         = dbox.getString("d_indate");
			    v_name           = dbox.getString("d_name");
			    v_mainyn         = dbox.getString("d_mainyn");
			    v_usechk         = dbox.getString("d_usechk");
			    v_dispnum        = dbox.getInt("d_dispnum");
			    v_totalpage      = dbox.getInt("d_totalpage");
			    v_rowcount       = dbox.getInt("d_rowcount");
			    
			    //if (!v_searchtext.equals("")&&v_search.equals("title")) {
			    if (!v_searchtext.equals("")) {
			        v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
			    } 
			%>
      
      <tr onmouseover="className='over'" onmouseout="className=' '">
        <td class="ct_tit_table"><%=v_dispnum%></td>
        <td class="ct_tit_table"><%=v_contenttypenm%></td>
        <td class="ct_tit_table_left"><%=v_dtlnm%></td>
        <td class="ct_tit_table_left"><a href="javascript:selectView(<%=v_seq%>)"><%=v_title%></a></td>
        <td class="ct_tit_table"><%=v_professor%></td>
        <td class="ct_tit_table_right"><%=v_cnt%></td>
      </tr>
			<%     // }

			v_totalpage	 = dbox.getInt("d_totalpage");// for ���� �ȿ� ����
		v_totalrowcount = dbox.getInt("d_totalrowcount");
		v_rowcount	  = dbox.getInt("d_rowcount");
		 
			   }}else{%>

		      <tr> 
		        <td colspan ='6' align='center' height="25">��ϵ� ������ �����ϴ�.</td>
		      </tr>
			<%  }   %>
      
      
      <tr>
        <td height="1" colspan="6" bgcolor="CACACA"></td>
      </tr>
      <tr>
        <td height="4" colspan="6" bgcolor="F7F7F7"></td>
      </tr>
    </table>    
    
    <!--Ÿ��Ʋ�κ�//-->
    </td>
    <td width="20">&nbsp;</td>
    
    	<!-- total ���� -->
    	<%= PageUtil.re_printPageSizeListDiv(v_totalpage, v_pageno, 0, v_pagesize, v_totalrowcount) %>
		 
		<!-- total �� -->
    
  </tr>
</table>
    
    <%}else{ %>

            <h2><img src="/images/portal/information/h2_tit2.gif" alt="�ǹ�����" class="fl_l" /><p class="category">Home > �������� > <strong>�ǹ�����</strong></p></h2>

            <p><img src="/images/portal/information/class_borimg.gif" alt="�ǹ����´� ����� �����Ǵ� �������·� �оߺ��� ������ ������ �ɵ��ִ� ���¸� �����Ͻ� �� �ֽ��ϴ�. " /></p>

            <p class="board_serach">
                <select name="p_search" >
                    <option value="title"   <%if("title".equals(v_search)) out.print(" selected");%>>����</option>
                    <option value="content" <%if("content".equals(v_search)) out.print(" selected");%>>����+����</option>
                </select>
                <input name="p_searchtext" type="text" class="inbox" style="width:135px;" value="<%=v_searchtext %>" onkeypress="javascript:fnKeyPressEnter(event, 'select');"/>
                <input type="image" class="btn" src="/images/portal/btn/btn_serbox_search.gif" alt="�˻�" onclick="javascript:select();"/>
            </p>

            <table class="board_list">
            <colgroup><col width="48px" /><col width="90px" /><col width="95px" /><col width="335px" /><col width="68px" /><col width="50px" /></colgroup>
            <thead>
            <tr class="information">
                <th><p>��ȣ</p></th>
                <th><p>
	                <kocca_select:select                                       
		                name="p_selContentType"                                         
		                sqlNum="0001"                                    
		                param="0085"             
		                onChange="select();"                         
		                attr= "��������"                                        
		                selectedValue="<%=v_selContentType%>"                         
		                isLoad="true"                                           
		                type="3"                                                
		                styleClass=""                                
		                all="true" />
                </p></th>
                <th><p>
                    <kocca_select:select                                       
		                name="p_selDtlCd"                                         
		                sqlNum="0001"                                    
		                param="0086"             
		                onChange="select();"                         
		                attr= "���ºо�"                                        
		                selectedValue="<%=v_selDtlCd%>"                         
		                isLoad="true"                                           
		                type="3"                                                
		                styleClass=""                                
		                all="true" />
                </p></th>
                <th><p>����</p></th>
                <th><p>�����</p></th>
                <th class="end"><p>��ȸ</p></th>
            </tr>
            </thead>
            <tbody>
			<%
			if(list2.size() != 0){
			   for( int i = 0; i < list2.size(); i++) {
			
			    DataBox dbox     = (DataBox)list2.get(i);
			    
			    v_seq            = dbox.getInt("d_num");
			    v_cnt            = dbox.getInt("d_cnt");  
			    v_clsfcd         = dbox.getString("d_clsfcd");
			    v_dtlcd          = dbox.getString("d_dtlcd");
			    v_dtlnm          = dbox.getString("d_dtlnm");
			    v_contenttype    = dbox.getString("d_contenttype");
			    v_contenttypenm  = dbox.getString("d_contenttypenm");
			    v_title          = dbox.getString("d_title");
			    v_professor      = dbox.getString("d_professor");
			    v_indate         = dbox.getString("d_indate");
			    v_name           = dbox.getString("d_name");
			    v_mainyn         = dbox.getString("d_mainyn");
			    v_usechk         = dbox.getString("d_usechk");
			    v_dispnum        = dbox.getInt("d_dispnum");
			    v_totalpage      = dbox.getInt("d_totalpage");
			    v_rowcount       = dbox.getInt("d_rowcount");
			    
			    //if (!v_searchtext.equals("")&&v_search.equals("title")) {
			    if (!v_searchtext.equals("")) {
			        v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
			    } 
			%>
            <tr onmouseover="className='over'" onmouseout="className=' '">
                <td class="num"><%=v_dispnum%></td>
                <td><%=v_contenttypenm%></td>
                <td><%=v_dtlnm%></td>
                <td class="ta_l"><a href="javascript:selectView(<%=v_seq%>)"><%=v_title%></a></td>
                <td><%=v_professor%></td>
                <td class="num"><%=v_cnt%></td>
            </tr>
			<%     // }
			    
			    }}else{%>

		      <tr> 
		        <td colspan ='6' align='center' height="25">��ϵ� ������ �����ϴ�.</td>
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