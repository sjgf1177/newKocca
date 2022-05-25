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

<%@ include file="/learn/user/portal/include/top.jsp"%>
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
<form name = "form1" method = "post">
      <input type = "hidden" name = "p_process"     value = "">
      <input type = "hidden" name = "p_pageno"      value = "<%=v_pageno%>">
      <input type = "hidden" name = "p_seq"         value = "">
      <input type = "hidden" name = "p_userid"      value = "">
      <input type = "hidden" name = "p_upfilecnt"   value = "">
      <input type = "hidden" name = "p_types"       value = "<%=v_types%>">
      
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
        <td><img src="/images/portal/homepage_renewal/support/stitle_04.gif" alt="Q&A" /></td>
        <td class="h_road">Home &gt; �н����� �ȳ�  &gt; <strong>Q&A</strong></td>
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
                <select name="p_select" id="p_select">                
                    <option value="title" <% if (v_select.equals("title")) out.print("selected"); %>>����</option>
                    <option value="name" <% if (v_select.equals("name")) out.print("selected"); %>>�ۼ���</option>
                    <option value = "content" <% if (v_select.equals("content")) out.print("selected"); %>>����</option>                
                </select>
              </span></td>
              <td><input name="p_searchtext" type="text" class="inbox" id="p_searchtext" size="30" value="<%=v_searchtext %>"  onkeypress="javascript:fnKeyPressEnter(event, 'selectList');"/></td>
              <td><a href="selectList();"><img src="/images/portal/homepage_renewal/common/btn_search_in.jpg" alt="�˻�" width="46" height="24"/></a></td>
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
        <td class="tit_table">
        <kocca_select:select name="p_selCategory" sqlNum="0001" param="0088" onChange="changeCategory();" attr= "�з�"                                        
	                selectedValue="<%=v_selCategory%>" isLoad="true" type="3" styleClass="" all="true" />
	    </td>
        <td class="tit_table">���� </td>
        <td class="tit_table">�ۼ���</td>
        <td class="tit_table">�ۼ�����</td>
        <td class="tit_table">�亯����</td>
        <td class="tit_table_right">��ȸ��</td>
      </tr>
      
      <%if(selectList.size() != 0){
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
      
      <tr>
        <td class="ct_tit_table"><%=v_dispnum%></td>
        <td class="ct_tit_table"><%=v_categorynm%></td>
        <td class="ct_tit_table_left">
        			<%if (v_isopen.equals("N") && !s_userid.equals(v_inuserid)){%>
                    <a href="javascript:alert('��б��� �ۼ��ڸ� �� �� �ֽ��ϴ�.');"><%=v_title%></a>
                    <% } else { %>
                    <a href="javascript:select('<%=v_seq%>','<%=v_upfilecnt%>','<%=v_inuserid%>','<%=v_types%>')"><%=v_title%></a>
                    <% } %>
                    <%if (v_isopen.equals("N")){%>
                    <img src="/images/portal/homepage_renewal/support/icon_k.gif" class="mg_l9" />
                    <% } %>
                    <%if (FormatDate.getDate("yyyyMMdd").equals(FormatDate.getFormatDate(v_indate, "yyyyMMdd"))){%>
                    <img src="/images/portal/homepage_renewal/support/icon_n.gif" alt="n" />
                    <% } %>
		</td>
        <td class="ct_tit_table"><%=v_name%></td>
        <td class="ct_tit_table"><%=FormatDate.getFormatDate(v_indate, "yyyy.MM.dd")%></td>
        <td class="ct_tit_table">
        	<%if(v_repstatus.equals("3")){ %>
        	<img src="/images/portal/homepage_renewal/support/icon_a_ok.jpg" width="65" height="21" />
        	<%}else if(v_repstatus.equals("2")){ %>
        	<img src="/images/portal/homepage_renewal/support/icon_ready.jpg" width="69" height="21" />
        	<%}else{ %>
        	<img src="/images/portal/homepage_renewal/support/icon_view_pre.jpg" width="52" height="21" />
        	<%} %>
        </td>
        <td class="ct_tit_table_right"><%=v_cnt%></td>
      </tr>      
      <%} }else{ %>
       
      <%} %>
      <tr>
        <td height="1" colspan="7" bgcolor="CACACA"></td>
      </tr>
      <tr>
        <td height="4" colspan="7" bgcolor="F7F7F7"></td>
      </tr>
    </table>
    <!--����¡�κ�-->
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="h_road"><a href="javascript:insertPage();"><img src="/images/portal/homepage_renewal/support/btn_reg.jpg"/></a></td>
      </tr>
    </table>    
   
    <!--Ÿ��Ʋ�κ�//-->
    
    <!-- total ���� -->
	 <%= PageUtil.re_printPageListDiv(v_totalpage, v_pageno, 0, 10, v_totalrowcount) %>
	<!-- total �� -->
		
    </td>
    <td width="20">&nbsp;</td>
    
  </tr>
</table>
      
      <%}else{ %>

            <h2><img src="/images/portal/studying/h2_tit3.gif" alt="Q&A" class="fl_l" /><p class="category">Home > �н��������� > <strong>Q&A</strong></p></h2>

            <p><img src="/images/portal/studying/qna_borimg.gif" alt="���� ���� ������ ����Ͻø�, ����ڰ� �亯�ص帳�ϴ�. ���� ���뿡 ���� ������ ������ �����ø� ������� �ۼ����ּ���. " /></p>

            <p class="board_serach">
                <select name = "p_select">
                    <option value="title" <% if (v_select.equals("title")) out.print("selected"); %>>����</option>
                    <option value="name" <% if (v_select.equals("name")) out.print("selected"); %>>�ۼ���</option>
                    <option value = "content" <% if (v_select.equals("content")) out.print("selected"); %>>����</option>
                </select>
                <input name="p_searchtext" type="text" class="inbox" style="width:135px;" value="<%=v_searchtext %>" onkeypress="javascript:fnKeyPressEnter(event, 'selectList');"/>
                <input type="image" class="btn" src="/images/portal/btn/btn_serbox_search.gif" alt="�˻�" onclick="selectList();"/>
            </p>
           
           <table class="board_list">
            <colgroup><col width="60px" /><col width="62px" /><col width="310px" /><col width="62px" /><col width="75px" /><col width="70px" /><col width="52px" /></colgroup>
            <thead>
            <tr>
                <th><p>��ȣ</p></th>
                <th><p>
                    <kocca_select:select name="p_selCategory" sqlNum="0001" param="0088" onChange="changeCategory();" attr= "�з�"                                        
	                selectedValue="<%=v_selCategory%>" isLoad="true" type="3" styleClass="" all="true" />
	                </p></th> 
                <th><p>����</p></th>
                <th><p>�ۼ���</p></th>
                <th><p>�ۼ�����</p></th>
                <th><p>�亯����</p></th>
                <th class="end"><p>��ȸ��</p></th>
            </tr>
            </thead>
            <tbody>

        <%if(selectList.size() != 0){
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

                    // �˻�� �־��ٸ� �ش� �κ��� �ش������ �ΰ���Ų��.

                    if (!v_searchtext.equals("")&&v_select.equals("title")) {
                        v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
                    } else if(!v_searchtext.equals("")&&v_select.equals("name")){
                        v_name = StringManager.replace(v_name, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
                    }
                    
                    if(v_categorynm.equals("")){
                    	v_categorynm = "��Ÿ";
                    }
                    
                    if(v_repstatus.equals("3")){
                    	v_repstatus = "�亯�Ϸ�";
                    } else if(v_repstatus.equals("2")){
                        v_repstatus = "�亯�غ���";
                    } else {
                    	v_repstatus = "������";
                    }

%>
            <tr onmouseover="className='over'" onmouseout="className=' '">
                <td><%=v_dispnum%></td>
                <td><%=v_categorynm%></td>
                <td class="ta_l">
                    <%if (v_isopen.equals("N") && !s_userid.equals(v_inuserid)){%>
                    <a href="javascript:alert('��б��� �ۼ��ڸ� �� �� �ֽ��ϴ�.');"><%=v_title%></a>
                    <% } else { %>
                    <a href="javascript:select('<%=v_seq%>','<%=v_upfilecnt%>','<%=v_inuserid%>','<%=v_types%>')"><%=v_title%></a>
                    <% } %>
                    <%if (v_isopen.equals("N")){%>
                    <img src="/images/portal/ico/ico_board_s.gif" class="mg_l9" />
                    <% } %>
                    <%if (FormatDate.getDate("yyyyMMdd").equals(FormatDate.getFormatDate(v_indate, "yyyyMMdd"))){%>
                    <img src="/images/portal/ico/ico_board_n.gif" alt="n" />
                    <% } %>
                </td>
                <td><%=v_name%></td>
                <td class="num"><%=FormatDate.getFormatDate(v_indate, "yyyy.MM.dd")%></td>
                <td class="btn"><a class="state"><span class="pre"><%=v_repstatus %></span></a></td>
                <td><%=v_cnt%></td>
            </tr>
<%      }
    }else{%>

		    <tr>
		        <td colspan=20>
		                          ��� �� ������ �����ϴ�.      
		        </td>
		    </tr>
<%}%>
            
            </tbody>
            </table>

            <p class="list_btn"><a href="javascript:insertPage()" class="board_blue"><span>���</span></a></p>
            
        <!-- ����¡ ���� ���� -->
         <%= PageUtil.printPageSizeListDivNoPagesize(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
        <!-- ����¡ ���� ���� -->
        
        <%} %>
</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->