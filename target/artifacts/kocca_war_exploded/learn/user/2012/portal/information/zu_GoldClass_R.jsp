<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.cp.*" %>
<%@ page import = "com.credu.library.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%

	RequestBox box = (RequestBox)request.getAttribute("requestbox");
	String  v_process  = box.getString("p_process");
	String  v_selcomp  = box.getString("p_selcomp");
	
	int     v_pageno   = box.getInt("p_pageno");
	int     v_pagesize = box.getInt("p_pagesize");
	
	String  v_searchtext = box.getString("p_searchtext");
	String  v_search     = box.getString("p_search");
	
	String  v_prePage    = box.getString("p_prePage");
	
	int     v_seq          = box.getInt("p_seq");
	
	float   v_checkpoin = 0;
	
	String  v_lecnm             = "";   // ���Ǹ�
	String  v_tutornm           = "";   // �����
	String  v_vodurl            = "";   // ���� URL
	String  v_tutorcareer       = "";   // ���
	String  v_lectime           = "";   // ���� �ð�
	String  v_genre             = "";   // �帣
	String  v_creator           = "";   // ����
	String  v_creatyear           = "";   // ���۳⵵
	String  v_intro             = "";   // ����
	String  v_contents          = "";   // ����
	String  v_tutorauthor       = "";   // ����
	String  v_width_s           = "";   // â����
	String  v_height_s          = "";   // â����
	String  v_openyn            = "";   // ���¿���
	String  v_useyn             = "";   // ��뿩��
	String  v_img_save_file     = "";   // �����̹���(�������ϸ�)
	String  v_tutor_save_file   = "";   // �����̹���(�������ϸ�)
	
	DataBox dbox = (DataBox)request.getAttribute("selectOffExpert");
	if (dbox != null) {
	    v_lecnm             = dbox.getString("d_lecnm");      
	    v_tutornm           = dbox.getString("d_tutornm");    
	    v_vodurl            = dbox.getString("d_vodurl");     
	    v_tutorcareer       = dbox.getString("d_tutorcareer");
	    v_lectime           = dbox.getString("d_lectime");    
	    v_genre             = dbox.getString("d_genre");      
	    v_creator           = dbox.getString("d_creator");
	    v_creatyear			= dbox.getString("d_creatyear");
	    v_intro             = dbox.getString("d_intro");      
	    v_contents          = dbox.getString("d_contents");   
	    v_tutorauthor       = dbox.getString("d_tutorauthor");
	    v_width_s           = dbox.getString("d_width_s");    
	    v_height_s          = dbox.getString("d_height_s");   
	    v_openyn            = dbox.getString("d_openyn");     
	    v_useyn             = dbox.getString("d_useyn");      
	    v_img_save_file     = dbox.getString("d_vodimg");   
	    v_tutor_save_file   = dbox.getString("d_tutorimg"); 
	    v_checkpoin  = dbox.getFloat("d_checkpoin");
	}
	
	String  s_gadmin    = box.getSession("gadmin");
	String v_gadmin ="";
	if(!s_gadmin.equals("")){
	  v_gadmin = s_gadmin.substring(0,1);
	}

%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--

//����Ʈ�������� �̵�
function selectList() {

	var prePage = document.form1.p_prePage.value;

	if(prePage == "Main") {
        document.form1.action = "/servlet/controller.infomation.GoldClassHomePageServlet";
        document.form1.target="_self";
        document.form1.p_process.value = "mainPage";     
        document.form1.submit();
	} else {
	   	document.form1.action = "/servlet/controller.infomation.GoldClassHomePageServlet";
		document.form1.p_process.value = "selectPreGoldClassList";
		document.form1.target="_self";     
		document.form1.submit();
	}	
}      

function goReply(seq){

	window.open("about:blank", "replyList", "top=0, left=0, width=637, height=530, status=no, resizable=no");

    document.form1.action="/servlet/controller.infomation.GoldClassHomePageServlet";
    document.form1.p_process.value = "insertReplyPage";
    document.form1.p_seq.value = seq;
    document.form1.target="replyList";
    document.form1.submit();

    document.form1.target="_self";    
}

function openGoldClass(seq,w,h)
{
    
    if (w.length>0) {
        window.open("", "ViewVod", "top=0, left=0, width="+w+", height="+h+", status=no, resizable=no");
        
    }else{
        window.open("", "ViewVod", "top=0, left=0, width=1008, height=570, status=no, resizable=no");
    }
    document.form1.action="/servlet/controller.infomation.GoldClassHomePageServlet";
    document.form1.p_process.value = "popUpVod";
    document.form1.p_seq.value = seq;
    document.form1.target="ViewVod";
    document.form1.submit();
    document.form1.target="_self";
    
}


//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name = "form1" method = "post" action="">
		<input type = "hidden" name = "p_seq"         value = "<%= v_seq %>">
		<input type = "hidden" name = "p_searchtext"  value = "<%= v_searchtext %>">
		<input type = "hidden" name = "p_search"      value = "<%= v_search %>">
		<input type = "hidden" name = "p_pageno"      value = "<%= v_pageno %>">
		<input type = "hidden" name = "p_prePage"     value = "<%= v_prePage %>">
		<input type = "hidden" name = "p_process"     value = "">
		
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
        <td><img src="/images/portal/homepage_renewal/gold/stitle_01.gif" alt="��ۿ���" /></td>
        <td class="h_road">Home &gt; ���Ŭ����  &gt; <strong>��ۿ���</strong></td>
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
        <td height="10"></td>
      </tr>
      <tr>
        <td class="h_road">
        	<a href="javascript:openGoldClass(<%=v_seq %>, '<%=v_width_s %>','<%=v_height_s %>')"><img src="/images/portal/homepage_renewal/library/btn_book_view.jpg" width="87" height="25" /></a>
        	<a href="javascript:selectList()"><img src="/images/portal/homepage_renewal/myclass/btn_list.jpg" alt="���" width="46" height="25" /></a>
        </td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="1" colspan="2" bgcolor="#7692CB"></td>
      </tr>
      <tr>
        <td width="22%" class="tit_table">���¸�</td>
        <td width="78%" class="ct_tit_table_lright"><strong><%=v_lecnm %></strong></td>
      </tr>
      <tr>
        <td class="tit_table">����Ұ�</td>
        <td class="ct_tit_table_lright"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="27%" valign="top"><table border="0" cellpadding="0" cellspacing="1" >
              <tr>
                <td width="130" height="150"><img src="/servlet/controller.library.DownloadServlet?p_savefile=<%=v_tutor_save_file %>" width="130" height="150" alt="��������" /></td>
                </tr>
            </table></td>
            <td width="73%" valign="top"><dl>
              <dd><strong>�̸� </strong>:<%=v_tutornm %> </dd>
              <dd><strong>���</strong><br />
                <%=v_tutorcareer.replace("\r\n","<br>") %>
              </dd>
            </dl>            </td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td class="tit_table">���°���
        <td class="ct_tit_table_lright">
        <%=v_intro.replace("\r\n","<br>") %>
        </td>
      </tr>
      <tr>
        <td class="tit_table">���½ð�</td>
        <td class="ct_tit_table_lright"><p><%=v_lectime %></p></td>
      </tr>
      <tr>
        <td class="tit_table">���۳⵵</td>
        <td class="ct_tit_table_lright"><%if(!v_creatyear.equals("")){ %><p><%=v_creatyear %></p><%}else{ %>&nbsp;<%} %></td>
      </tr>
      <tr>
        <td class="tit_table">���³���</td>
        <td class="ct_tit_table_lright">
        <%=v_contents.replace("\r\n","<br>") %>
        </td>
        </tr>
      <!--<tr>
        <td class="tit_table">��</td>
        <td class="ct_tit_table_lright"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="91" height="30"><div align="left"><%=StringUtil.getStarPoint(v_checkpoin) %></div></td>
            <td width="424"><a href="javascript:goReply(<%=v_seq %>)"><img src="/images/portal/homepage_renewal/library/btn_reply.jpg" width="75" height="21" /></a></td>
          </tr>
        </table></td>
      </tr>-->
      
      <tr>
        <td height="1" colspan="2" bgcolor="CACACA"></td>
      </tr>
      <tr>
        <td height="4" colspan="2" bgcolor="F7F7F7"></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="h_road">
        <a href="javascript:openGoldClass(<%=v_seq %>, '<%=v_width_s %>','<%=v_height_s %>')"><img src="/images/portal/homepage_renewal/library/btn_book_view.jpg" width="87" height="25" /></a>
        <a href="javascript:selectList()"><img src="/images/portal/homepage_renewal/myclass/btn_list.jpg" alt="���" width="46" height="25" /></a>
        </td>
      </tr>
    </table>
    <!--Ÿ��Ʋ�κ�//-->
    </td>
    <td width="20">&nbsp;</td>
    
  </tr>
</table>
      		
      		<%}else{ %>
		
            <h2><img src="/images/portal/information/h2_tit1.gif" alt="���Ŭ����" class="fl_l" /><p class="category">Home > �������� > <strong>���Ŭ����</strong></p></h2>

            <p><img src="/images/portal/information/gold_borimg.gif" alt="���Ŭ������ ����� �����Ǵ� �������·� ��̿� ���̰� �Բ� �����ϴ� ���� �����Դϴ�. �ſ� �Ǹ��� ����� ���ο� ���¸� �������� �� ������, ������ ������ �� �ִ� ���� ���������Դϴ�." /></p>            
            
            <table class="view mg_t30">
            <colgroup><col width="18%" /><col width="82%" /></colgroup>
            <tr>
                <th class="stit">���¸�</th>
                <td class="end fw_b"><%=v_lecnm %></td>
            </tr>
            <tr>
                <th class="stit va_t">����Ұ�</th>
                <td class="end">
                    <dl class="professor">
                        <dt><img src="/servlet/controller.library.DownloadServlet?p_savefile=<%=v_tutor_save_file %>" width=100 alt="��������" /></dt>
                        <dd class="mg_t6"><span class="tit fw_b">�̸� :</span><span class="con"><%=v_tutornm %> </span></dd>
                        <dd><strong>���</strong><br/>
                             <%=v_tutorcareer.replace("\r\n","<br>") %>
                        </dd>
                    </dl>
                </td>
            </tr>
            <tr>
                <th class="stit va_t">���¼Ұ�<br />(���°���)</th>
                <td class="end"><%=v_intro.replace("\r\n","<br>") %></td>
            </tr>
            <tr>
                <th class="stit va_t">���³���</th>
                <td class="end"><%=v_contents.replace("\r\n","<br>") %></td>
            </tr>
            </table>

            <p class="board_btn"><a href="javascript:selectList()" class="board_violet"><span>���</span></a></p>
            
            <%} %>
                  
</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->
