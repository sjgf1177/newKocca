<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    ArrayList list1 = null;
    ArrayList list2 = null;

    int     v_tabseq   = box.getInt("p_tabseq");
    int     v_seq      = box.getInt("p_seq");     
    String  v_process  = box.getString("p_process");

    // �˻�
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");

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
    String v_isall      = "";           // ��ü ���� ����
    String v_onoffgubun = "";           // �¿�������
    int v_popwidth   = 0;               // �˾�����
    int v_popheight  = 0;               // �˾�����
    int v_popxpos    = 0;               // �˾�x��ġ
    int v_popypos    = 0;               // �˾�y��ġ
    
    String v_popup   = "";               // �˾�����
    String v_uselist = "";               // ����Ʈ���
    String v_useframe= "";               // �����ӻ��
    
    String v_upfile    ="";
    //String v_realfile  ="";
    
    int v_dispnum   = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������
    int v_rowcount  = 0;
    int v_upfilecnt = 0;
    int v_pageno    = box.getInt("p_pageno");
	int v_pagesize = box.getInt("p_pagesize");

	int	 v_totalrowcount =  0;

    String s_userid   = box.getSession("userid");
    String s_username = box.getSession("name");

    list2 = (ArrayList)request.getAttribute("selectNoticeList");
    
    String left_menu = "helpdesk";
   
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<SCRIPT LANGUAGE="JavaScript">
<!--
    function go(index) {
        document.nform1.p_pageno.value = index;
        document.nform1.action = "/servlet/controller.homepage.HomeNoticeServlet";
        document.nform1.p_process.value = "List";
        document.nform1.submit();
    }

    //������ ����
    function goPage(pageNum) {
        document.nform1.p_pageno.value = pageNum;
        document.nform1.action = "/servlet/controller.homepage.HomeNoticeServlet";
        document.nform1.p_process.value = "List";
        document.nform1.submit();
    }

	function pagesize(pageSize) {
		document.nform1.action = "/servlet/controller.homepage.HomeNoticeServlet";
		document.nform1.p_pageno.value = 1;
		document.nform1.p_pagesize.value = pageSize;
		document.nform1.p_process.value = "List";
		document.nform1.submit();
	}

    //����Ʈ ��ȸ
    function select() {
        document.nform1.p_pageno.value = 0;
        document.nform1.action = "/servlet/controller.homepage.HomeNoticeServlet";
        document.nform1.p_process.value = "List";
        document.nform1.submit();
    }

    //�󼼺���
    function selectView(seq) {

        document.nform1.action = "/servlet/controller.homepage.HomeNoticeServlet";
        document.nform1.p_process.value = "selectView";
        document.nform1.p_seq.value= seq;
        document.nform1.submit();
    }

//-->
</SCRIPT>
<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name="nform1" method="post" onsubmit="javascript:select();">
    <input type = "hidden" name = "p_process">
    <input type = "hidden" name = "p_pageno"  value="<%=v_pageno%>"> 
    <input type = "hidden" name = "p_seq"    >
	<input type="hidden" name="p_pagesize"  value="<%=v_pagesize%>"/>
    
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
        <td><img src="/images/portal/homepage_renewal/support/stitle_02.gif" alt="��������" /></td>
        <td class="h_road">Home &gt; �н����� �ȳ�  &gt; <strong>��������</strong></td>
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
                  <option value="adtitle"   <%if("adtitle".equals(v_search)) out.print(" selected");%>>����</option>
                    <option value="adcontent" <%if("adcontent".equals(v_search)) out.print(" selected");%>>����</option>
                    <option value="adname"    <%if("adname".equals(v_search)) out.print(" selected");%>>�ۼ���</option>
                </select>
              </span></td>
              <td><input name="p_searchtext" type="text" class="input_search" id="p_searchtext" size="30" value="<%=v_searchtext %>" onkeypress="javascript:fnKeyPressEnter(event, 'select');"/></td>
              <td><a href="javascript:select();"><img src="/images/portal/homepage_renewal/common/btn_search_in.jpg" alt="�˻�" width="46" height="24" /></a></td>
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
        <td class="tit_table">�ۼ�����</td>
        <td class="tit_table_right">��ȸ��</td>
      </tr>
      
      <%

if(list2.size() != 0){
  for( int i = 0; i < list2.size(); i++) {

    DataBox dbox = (DataBox)list2.get(i);
    v_seq      = dbox.getInt("d_seq");
    v_cnt      = dbox.getInt("d_cnt");
    v_adtitle  = dbox.getString("d_adtitle");
    v_addate   = dbox.getString("d_addate");
    v_adname   = dbox.getString("d_adname");
    v_upfilecnt = dbox.getInt("d_filecnt");
    v_dispnum   = dbox.getInt("d_dispnum");
    v_totalpage = dbox.getInt("d_totalpage");
    v_totalrowcount = dbox.getInt("d_totalrowcount");
    v_rowcount  = dbox.getInt("d_rowcount");
    v_isall     = dbox.getString("d_isall");
    v_onoffgubun = dbox.getString("d_onoffgubun");
    if( v_onoffgubun.equals("C") ) {
		v_onoffgubun = "[�¶���]";
    } else if( v_onoffgubun.equals("C") ) {
    	v_onoffgubun = "[��������]";
    } else {
    	v_onoffgubun = "";
    }
    
    v_addate = FormatDate.getFormatDate(v_addate, "yyyy.MM.dd");
    
    v_adtitle = StringUtil.getByteString(v_adtitle, 60);
    
%>
      
      <tr>
        <td class="ct_tit_table"><%=v_isall.equals("Y") ? "*" : v_dispnum%></td>
        <td class="ct_tit_table_left"><a href="javascript:selectView(<%=v_seq%>)">
                <% if( box.getSession("tem_grcode").equals("N000001") && !v_onoffgubun.equals("") ) { %>
                	<%=v_onoffgubun %><%=v_adtitle%> <%=v_addate.equals(FormatDate.getDate("yyyy.MM.dd")) ? "<img src=\"/images/portal/ico/ico_board_n.gif\" alt=\"new\" />" : "" %>
                <% } else { %>
                	<%=v_adtitle%> <%=v_addate.equals(FormatDate.getDate("yyyy.MM.dd")) ? "<img src=\"/images/portal/ico/ico_board_n.gif\" alt=\"n\" />" : "" %>
                <% } %>
                </a></td>
        <td class="ct_tit_table"><%=v_addate%></td>
        <td class="ct_tit_table_right"><%=v_cnt%></td>
        
        <%      }
    }else{%>

            <tr> 
               <td class="num" colspan="4">��ϵ� ������ �����ϴ�.</td>
            </tr>
<%  }   %>
        
      </tr>
      <tr>
        <td height="1" colspan="4" bgcolor="CACACA"></td>
      </tr>
      <tr>
        <td height="4" colspan="4" bgcolor="F7F7F7"></td>
      </tr>
    </table>    
    <!--Ÿ��Ʋ�κ�//-->
    
    	<!-- total ���� -->
		 <%= PageUtil.re_printPageSizeListDiv(v_totalpage, v_pageno, 0, v_pagesize, v_totalrowcount) %>
		<!-- total �� -->
    
    </td>
    <td width="20">&nbsp;</td>
    

    
  </tr>
</table>
    
    <%}else{ %>

            <h2><img src="/images/portal/studying/h2_tit1.gif" alt="��������" class="fl_l" /><p class="category">Home > �н��������� > <strong>��������</strong></p></h2>
 
            <p><img src="/images/portal/studying/notice_borimg.gif" alt="�н��������Ϳ� ���Ű��� ȯ���մϴ�.��������������� �˷��帮�� ���ҽİ� �̺�Ʈ�� Ȯ���Ͻ� �� �ֽ��ϴ�." /></p>
            
            <p class="board_serach">
                <select name="p_search">
                    <option value="adtitle"   <%if("adtitle".equals(v_search)) out.print(" selected");%>>����</option>
                    <option value="adcontent" <%if("adcontent".equals(v_search)) out.print(" selected");%>>����</option>
                    <option value="adname"    <%if("adname".equals(v_search)) out.print(" selected");%>>�ۼ���</option>
                </select>
                <input type="text" name="p_searchtext" class="inbox" style="width:135px;" value="<%=v_searchtext %>" onkeypress="javascript:fnKeyPressEnter(event, 'select');"/>
                <input type="image" class="btn" src="/images/portal/btn/btn_serbox_search.gif" alt="�˻�" />
            </p>
                        
            <table class="board_list">
            <colgroup><col width="63px" /><col width="460px" /><col width="106px" /><col width="62px" /></colgroup>
            <thead>
            <tr>
                <th><p>��ȣ</p></th>
                <th><p>����</p></th>
                <th><p>�ۼ�����</p></th>
                <th class="end"><p>��ȸ��</p></th>
            </tr>
            </thead>
            <tbody>
<%

if(list2.size() != 0){
  for( int i = 0; i < list2.size(); i++) {

    DataBox dbox = (DataBox)list2.get(i);
    v_seq      = dbox.getInt("d_seq");
    v_cnt      = dbox.getInt("d_cnt");
    v_adtitle  = dbox.getString("d_adtitle");
    v_addate   = dbox.getString("d_addate");
    v_adname   = dbox.getString("d_adname");
    v_upfilecnt = dbox.getInt("d_filecnt");
    v_dispnum   = dbox.getInt("d_dispnum");
    v_totalpage = dbox.getInt("d_totalpage");
    v_rowcount  = dbox.getInt("d_rowcount");
    v_isall     = dbox.getString("d_isall");
    v_onoffgubun = dbox.getString("d_onoffgubun");
    if( v_onoffgubun.equals("C") ) {
		v_onoffgubun = "[�¶���]";
    } else if( v_onoffgubun.equals("C") ) {
    	v_onoffgubun = "[��������]";
    } else {
    	v_onoffgubun = "";
    }
    
    v_addate = FormatDate.getFormatDate(v_addate, "yyyy.MM.dd");
    
    v_adtitle = StringUtil.getByteString(v_adtitle, 60);
    
%>
            <tr onmouseover="className='over'" onmouseout="className=' '">
                <td class="num"><%=v_isall.equals("Y") ? "*" : v_dispnum%></td>
                <td class="ta_l"><a href="javascript:selectView(<%=v_seq%>)">
                <% if( box.getSession("tem_grcode").equals("N000001") && !v_onoffgubun.equals("") ) { %>
                	<%=v_onoffgubun %><%=v_adtitle%> <%=v_addate.equals(FormatDate.getDate("yyyy.MM.dd")) ? "<img src=\"/images/portal/ico/ico_board_n.gif\" alt=\"n\" />" : "" %>
                <% } else { %>
                	<%=v_adtitle%> <%=v_addate.equals(FormatDate.getDate("yyyy.MM.dd")) ? "<img src=\"/images/portal/ico/ico_board_n.gif\" alt=\"n\" />" : "" %>
                <% } %>
                </a></td>
                <td class="num"><%=v_addate%></td>
                <td class="num"><%=v_cnt%></td>
            </tr>
<%      }
    }else{%>

            <tr> 
               <td class="num" colspan="4">��ϵ� ������ �����ϴ�.</td>
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

