<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.library.FormatDate" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

	String vv_email = null;
	String vv_handphone = null;
	
	EncryptUtil encryptUtil = new EncryptUtil(Constants.APP_KEY, Constants.APP_IV);
	
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
<%@ include file="/learn/user/portal/include/top.jsp"%>
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

</SCRIPT>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name="nform2" method="post">
<input type = "hidden" name = "p_process" >
<input type = "hidden" name = "p_seq" value="<%=v_seq%>">
<input type = "hidden" name = "p_pageno" value = "<%=v_pageno %>">
<input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
<input type = "hidden" name = "p_search" value = "<%=v_search %>">

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
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="1" colspan="8" bgcolor="#7692CB"></td>
      </tr>
      <tr>
        <td class="tit_table">����</td>
        <td colspan="7" class="ct_tit_table_lright"><strong><%=v_title%></strong></td>
      </tr>
      <tr>
        <td class="tit_table">���࿩��</td>
        <td class="ct_tit_table_left"><%=v_status%></td>
        <td class="tit_table">�̺�Ʈ�Ⱓ</td>
        <td class="ct_tit_table"><%=FormatDate.getFormatDate(v_startdate, "yyyy.MM.dd")+"-"+FormatDate.getFormatDate(v_enddate, "MM.dd")%></td>
        <td class="tit_table">�ۼ���</td>
        <td class="ct_tit_table"><%=v_name%></td>
        <td class="tit_table">��ȸ</td>
        <td class="ct_tit_table_right"><%=v_cnt %></td>
      </tr>
      <tr>
        <td colspan="8" class="ct_tit_table_lright"><div align="center"><%=v_content %></div></td>
      </tr>
      <tr>
        <td height="1" colspan="8" bgcolor="CACACA"></td>
      </tr>
      <tr>
        <td height="4" colspan="8" bgcolor="F7F7F7"></td>
      </tr>
      <tr>
                <td colspan="8">
                <% if(v_status.equals("����")){ %>
                    <% if(  v_isanswer.equals("Y") ){ %>
                    <table width="672" border="0" cellpadding="0" cellspacing="0">
                    <colgroup><col width="100px" /><col width="248px" /><col width="100px" /><col /></colgroup>
                    <tr>
                        <td class="tit_table">�� ��</td>
                        <td colspan="7" class="ct_tit_table_lright"><input type="text" class="inbox" style="width:195px;" readonly value="<%=s_usernm %>"/></td>
                    </tr>
                    <tr>
                        <td class="tit_table" >�޴���</td>
                        <td colspan="3" class="ct_tit_table_left"><input type="text" class="inbox" style="width:195px;" name = "p_handphone" value="<%=vv_handphone %>"/></td>
                        <td class="tit_table" >�̸���</td>
                        <td colspan="3" class="ct_tit_table_lright"><input type="text" class="inbox" style="width:195px;" name = "p_email" value="<%=vv_email %>"/></td>
                    </tr>
                    <tr>
                        <td class="tit_table">�� ��</td>
                        <td colspan="7" class="ct_tit_table_lright"><textarea name="p_answer" style="width:550px; height:50px;"></textarea></td>
                    </tr>
                    <tr>
				        <td height="1" colspan="8" bgcolor="CACACA"></td>
				    </tr>
				    <tr>
				        <td height="4" colspan="8" bgcolor="F7F7F7"></td>
				    </tr>
                    <tr>                    	
                    	<td align="center" colspan="8"><br/><a href="javascript:applyEvent();"><img src="/images/portal/homepage_renewal/support/btn_apply_event.gif" alt="�����ϱ�" width="78" height="19" /></a></td>
                    </tr>
                    </table>
                    <% } %>
            <% } %>
            </td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="h_road"><a href="javascript:listnotice();"><img src="/images/portal/homepage_renewal/support/btn_list.jpg" alt="���" width="46" height="25" /></a></td>
      </tr>
    </table>
    <!--Ÿ��Ʋ�κ�//-->
    
    <% if ((list!= null) && (v_seq == 8))  {%>
    
    <table width="100%" border="0" cellspacing="0" cellpadding="0">     
      <tr>
        <td class="tit_table">���̵�</td>
        <td class="tit_table">�̸� </td>
        <td class="tit_table">����</td>
        <td class="tit_table_right">��¥</td>
      </tr>      
      
      <% for (int i=0; i<list.size();i++) {
    	  DataBox dbox2 = (DataBox)list.get(i);
      %>
      	<tr>
      		<td class="tit_table"><%=dbox2.getString("d_userid")%> </td>
      		<td class="tit_table"><%=dbox2.getString("d_name").substring(0,1)%>**</td>
      		<td class="ct_tit_table_left"><%=dbox2.getString("d_answer")%></td>
      		<td class="tit_table_right"><%=FormatDate.getFormatDate(dbox2.getString("d_indate"), "yyyy.MM.dd")%></td>
      	</tr>
      
      <% } %>
    
    </table>
     <% } %>    
    
    </td>
    <td width="20">&nbsp;</td>
    
  </tr>
</table>



	
	<%}else{ %>

            <h2><img src="/images/portal/information/h2_tit5.gif" alt="�̺�Ʈ" class="fl_l" /><p class="category">Home > �������� > <strong>�̺�Ʈ</strong></p></h2>

            <p><img src="/images/portal/information/event_borimg.gif" alt="��������������� �����ϴ� �̺�Ʈ�� ����������" /></p>

            <table class="information_view mg_t30">
            <!--[if ie]><colgroup><col width="55px" /><col width="120px" /><col width="70px" /><col width="80px" /><col width="35px" /><col width="50px" /></colgroup><![endif]-->
            <colgroup><col width="65px" /><col width="120px" /><col width="80px" /><col width="80px" /><col width="55px" /><col width="50px" /></colgroup>
            <tr>
                <th>����</th>
                <td colspan="3" class="tit"><%=v_title%></td>
                <th>�ۼ���</th>
                <td><%=v_name%></td>
            </tr>
            <tr class="bo">
                <th>���࿩��</th>
                <td><%=v_status%></td>
                <th>�̺�Ʈ �Ⱓ</th>
                <td class="num"><%=FormatDate.getFormatDate(v_startdate, "yyyy.MM.dd")+"-"+FormatDate.getFormatDate(v_enddate, "MM.dd")%></td>
                <th>��ȸ��</th>
                <td class="num"><%=v_cnt %></td>
            </tr>
            <tr>
                <td colspan="6" class="con bo_bn">
                    <%=v_content %>
                </td>
            </tr>
            
            <tr>
                <td colspan="6" class="pd_ln pd_b25 bgn">
                <% if(v_status.equals("����")){ %>
                    <div class="event_view">
                    <% if(  v_isanswer.equals("Y") ){ %>
                    <table>
                    <colgroup><col width="100px" /><col width="248px" /><col width="100px" /><col /></colgroup>
                    <tr>
                        <th>�� ��</th>
                        <td colspan="3"><input type="text" class="inbox" style="width:195px;" readonly value="<%=s_usernm %>"/></td>
                    </tr>
                    <tr>
                        <th>�޴���</th>
                        <td><input type="text" class="inbox" style="width:195px;" name = "p_handphone" value="<%=vv_handphone %>"/></td>
                        <th>�̸���</th>
                        <td><input type="text" class="inbox" style="width:195px;" name = "p_email" value="<%=vv_email %>"/></td>
                    </tr>
                    <tr>
                        <th class="va_t">�� ��</th>
                        <td colspan="3"><textarea name="p_answer" style="width:540px; height:50px;"></textarea></td>
                    </tr>
                    </table>
                    <% } %>
                        <p class="ag_c"><a href="javascript:applyEvent();" class="btn_violet mg_r7"><span>�����ϱ�</span></a></p>
                    </div>
                </td>
            </tr>
            <% } %>
            </table>
            
            <p class="board_btn"><a href="javascript:listnotice();" class="board_violet"><span>���</span></a></p>
            
            <%} %>
</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->