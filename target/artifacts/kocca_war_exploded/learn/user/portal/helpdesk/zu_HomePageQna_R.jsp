<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    
    int    v_seq        = box.getInt("p_seq");
    int    v_pageno     = box.getInt("p_pageno");
    String v_searchtext = box.getString("p_searchtext");             
    String v_select     = box.getString("p_select");
    String v_selCategory = box.getString("p_selCategory");
    
    String s_userid     = box.getSession("userid");
    
    String v_title      = "";
    String v_contents   = "";
    String v_inuserid   = "";
    String v_indate     = "";
    String v_types      = "";
    String v_name       = "";
    String v_categorycd = "";
    String v_categorynm = "";
    String v_isopen     = "";
    String v_repstatus  = "";
    int    v_cnt        = 0;
    
    DataBox dbox        = (DataBox)request.getAttribute("selectQna");
    
    if(dbox != null) {
        v_inuserid          = dbox.getString("d_inuserid");
        v_name              = dbox.getString("d_name");
        v_types             = dbox.getString("d_types");
        v_indate            = dbox.getString("d_indate");
        v_title             = dbox.getString("d_title");
        v_seq               = dbox.getInt("d_seq");
        v_cnt               = dbox.getInt("d_cnt");
        v_contents          = dbox.getString("d_contents");
        v_categorycd        = dbox.getString("d_categorycd");
        v_categorynm        = dbox.getString("d_categorynm");
        v_isopen            = dbox.getString("d_isopen");
        v_repstatus         = dbox.getString("d_okyn1");
        
    }

%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">

    //����Ʈ�������� �̵�
    function selectList() {
        document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
        document.form1.p_process.value = "";     
        document.form1.submit();    
    }      
    
    //������������ �̵�
    function updatePage() {
        document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
        document.form1.p_process.value = "updatePage";
        document.form1.submit();
    }
    
    //�亯 ��� �������� �̵�
    function replyPage() {
        document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
        document.form1.p_process.value = "replyPage";
        document.form1.submit();
    }   
    
    //������ ���
    function insertcomment() {
        if(document.form2.commentqna.value==""){
            alert("�������� ����ϼ���");
            return;
        }
        document.form2.p_categorycd.value = document.form1.p_categorycd.value; // ī�װ�
        document.form2.action = "/servlet/controller.homepage.HomePageQNAServlet";
        document.form2.p_process.value = "commentInsertPage";
        document.form2.submit();
    }
    
    
    //�� ȭ�� ����
    function deleteAction() {
        if (confirm("������ �����Ͻðڽ��ϱ�?")) {
            
            document.form1.action = "/servlet/controller.homepage.HomePageQNAServlet";
            document.form1.p_process.value = "delete";
            document.form1.submit();
        }
        else {
            return;
        }
    }
    
    //������ ����
    function deleteComment(v_commentseq) {
        if (confirm("������ �����Ͻðڽ��ϱ�?")) {
            document.form2.p_commentseq.value = v_commentseq;
            document.form2.action = "/servlet/controller.homepage.HomePageQNAServlet";
            document.form2.p_process.value = "deleteComment";
            document.form2.submit();
        }
        else {
            return;
        }
    }

</script>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name = "form1" method = "post">
    <input type = "hidden" name = "p_seq"         value = "<%= v_seq %>">
    <input type = "hidden" name = "p_searchtext"  value = "<%= v_searchtext %>">
    <input type = "hidden" name = "p_select"      value = "<%= v_select %>">
    <input type = "hidden" name = "p_pageno"      value = "<%= v_pageno %>">
    <input type = "hidden" name = "p_selCategory" value = "<%= v_selCategory %>">
    <input type = "hidden" name = "p_process"     value = "">
    <input type = "hidden" name = "p_userid"      value = "<%= v_inuserid %>">
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
        <td><img src="/images/portal/homepage_renewal//support/stitle_04.gif" alt="Q&A" /></td>
        <td class="h_road">Home &gt; �н����� �ȳ�  &gt; <strong>Q&A</strong></td>
      </tr>
      <tr>
        <td height="12" colspan="2"></td>
        </tr>
      <tr>
        <td height="1" colspan="2" bgcolor="E5E5E5"></td>
      </tr>
    </table>
    
    <!--Ÿ��Ʋ�κ�//-->
    

      <!--���̺�κ�-->
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="1" colspan="8" bgcolor="#7692CB"></td>
        </tr>
        <tr>
          <td class="tit_table">����</td>
          <td colspan="7" class="ct_tit_table_right"><%= v_title %></td>
        </tr>
        
        <tr>
          <td class="tit_table">�з�</td>
          <td class="ct_tit_table_left"><%=v_categorynm %></td>
          <td class="tit_table">�ۼ���</td>
          <td class="ct_tit_table"><%=v_name%></td>
          <td class="tit_table">�ۼ�����</td>
          <td class="ct_tit_table"><%= FormatDate.getFormatDate(v_indate, "yyyy.MM.dd") %></td>
          <td class="tit_table">��ȸ</td>
          <td class="ct_tit_table_right"><%=v_cnt%></td>
        </tr>
        <tr>
          <td colspan="8" class="ct_tit_table_lright"><%=v_contents%></td>
        </tr>
        <tr>
          <td height="1" colspan="8" bgcolor="CACACA"></td>
        </tr>
        <tr>
          <td height="4" colspan="8" bgcolor="F7F7F7"></td>
        </tr>
      </table>
      
      <!-- ����÷�� ���� -->
            <%
                Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
                Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
                String i_boardStyle        = "board_view";                                // ���� ��Ÿ��
            %>
            <%@ include file="/learn/user/include/zu_MultiAttach_R.jsp" %>
            <!-- ����÷�� ����-->
            
<%    if(v_repstatus.equals("3")){ %>
        <%@ include file="/learn/user/portal/helpdesk/zu_HomePageQna_A.jsp"%> 
<%    } %>

      <!--           
          <p class="board_btn">
          <%if(v_inuserid.equals(box.getSession("userid")) && !v_repstatus.equals("3")){%>
          <a href="javascript:updatePage()" class="board_blue"><span>����</span></a>
          <a href="javascript:deleteAction()" class="board_blue"><span>����</span></a>
          <%}%>
          <a href="selectList()"><img src="/images/portal/homepage_renewal//myclass/btn_list.jpg" alt="���" width="46" height="25" /></a>
          </p>
       -->
          
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
        <%if(v_inuserid.equals(box.getSession("userid")) && !v_repstatus.equals("3")){%>
        	<td class="h_road"></td>
        	<td class="h_road"></td>
        <%} %>        
          <td class="h_road">          	
          	<%if(v_inuserid.equals(box.getSession("userid")) && !v_repstatus.equals("3")){%>
	          	<a href="javascript:updatePage();"><img src="/images/portal/homepage_renewal/myclass/modify.jpg" alt="����" width="46" height="25" /></a>
	          	<a href="javascript:deleteAction();"><img src="/images/portal/homepage_renewal/myclass/del.jpg" alt="����" width="46" height="25" /></a>
        	<%} %>
          		<a href="javascript:selectList()"><img src="/images/portal/homepage_renewal/myclass/btn_list.jpg" alt="���" width="46" height="25" /></a>          	
          </td>
        </tr>
      </table></td>
    <td width="20">&nbsp;</td>
    
  </tr>
</table>
      	
      	<%}else{ %>

            <h2><img src="/images/portal/studying/h2_tit3.gif" alt="Q&A" class="fl_l" /><p class="category">Home > �н��������� > <strong>Q&A</strong></p></h2>

            <p><img src="/images/portal/studying/qna_borimg.gif" alt="���� ���� ������ ����Ͻø�, ����ڰ� �亯�ص帳�ϴ�. ���� ���뿡 ���� ������ ������ �����ø� ������� �ۼ����ּ���. " /></p>
                              

            <table class="board_view mg_t30">
            <!--[if ie]><colgroup><col width="25px" /><col width="150px" /><col width="40px" /><col width="80px" /><col width="50px" /><col width="80px" /><col width="25px" /><col width="80px" /></colgroup><![endif]-->
            <colgroup><col width="45px" /><col width="150px" /><col width="60px" /><col width="80px" /><col width="70px" /><col width="80px" /><col width="45px" /><col width="80px" /></colgroup>
            <tr>
                <th>����</th>
                <td colspan="7" class="tit"><%= v_title %></td>
            </tr>
            <tr class="bo">
                <th>�з�</th>
                <td><%=v_categorynm %></td>
                <th>�ۼ���</th>
                <td><%=v_name%></td>
                <th>�ۼ�����</th>
                <td class="num"><%= FormatDate.getFormatDate(v_indate, "yyyy.MM.dd") %></td>
                <th>��ȸ</th>
                <td class="fs_s"><%=v_cnt%></td>
            </tr>
            <tr>
                <th>����</th>
                <td colspan="7" class="con"><%=v_contents.replaceAll("\r\n", "<br/>") %></td>
            </tr>
            </table>
            
            <!-- ����÷�� ���� -->
            <%
                Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
                Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
                String i_boardStyle        = "board_view";                                // ���� ��Ÿ��
            %>
            <%@ include file="/learn/user/include/zu_MultiAttach_R.jsp" %>
            <!-- ����÷�� ����-->
            
<%    if(v_repstatus.equals("3")){ %>
        <%@ include file="/learn/user/portal/helpdesk/zu_HomePageQna_A.jsp"%> 
<%    } %>
          <p class="board_btn">
          <%if(v_inuserid.equals(box.getSession("userid")) && !v_repstatus.equals("3")){%>
          <a href="javascript:updatePage()" class="board_blue"><span>����</span></a>
          <a href="javascript:deleteAction()" class="board_blue"><span>����</span></a>
          <%}%>
          <a href="javascript:selectList()" class="board_blue"><span>���</span></a>
          </p>
          <%} %>
</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->