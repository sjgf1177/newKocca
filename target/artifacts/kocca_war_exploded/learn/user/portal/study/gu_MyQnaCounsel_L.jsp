<%
//**********************************************************
//  1. ��      ��: ���ǰ��ι� > ���ǻ�㳻��
//  2. ���α׷��� : gu_MyQnaCounsel_L.jsp
//  3. ��      ��: ���� ��㳻��
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.11.25
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    
    String  ss_userid     = box.getSession("userid");    
    int		v_no = 0;
    String  v_sdate       = "";
    String  v_types       = "";
    String  v_type        = "";
    String  v_typenm      = ""; 
    String  v_title       = "";
    String  v_status      = "";
    String  v_status_view = "";
    String  v_status_class = "";
    String  v_searchtext  = box.getString("p_searchtext");   
    String  v_select      = box.getString("p_select");   
    String  p_type        = box.getString("p_type");   
    String  v_edustart    = "";
    String  v_eduend      = "";
    String  v_subj      	= "";
    String  v_subjseq   	= "";
    String  v_year      	= "";
    String  v_userid      	= "";
    String	sScriptString	= "";

     
    int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0, v_tabseq = 0;
    
    // ����¡����
    int row      = Integer.parseInt(conf.getProperty("page.bulletin.row"));
    int v_pageno = box.getInt("p_pageno");   
        
    ArrayList blist2 = (ArrayList)request.getAttribute("MyQnaCounselListPage");  // �н�����
      
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--
function press_enter(e) { 
	if (e.keyCode =='13'){  selectList();  }
}

//�˻����뿡 �´� ����Ʈ �������� �̵�
function selectList() {
	//if (form1.p_searchtext.value == ""){
	//	alert("�˻� �� ������ �Է��� �ּ���");
	//}else{
    	document.form1.action = "/servlet/controller.study.MyQnaServlet";
    	document.form1.p_process.value = "MyQnaCounselListPage";
        document.form1.p_pageno.value = "1";
    	document.form1.submit();
	//}
}

//��ȭ�� �������� �̵�
function select(tabseq, seq,  userid, types) {
	document.form1.action = "/servlet/controller.study.MyQnaServlet";
	document.form1.p_process.value   = "MyQnaSiteViewPage";
	document.form1.p_tabseq.value    = tabseq;
	document.form1.p_seq.value       = seq;
	document.form1.p_userid.value    = userid;
	document.form1.p_types.value     = types;
    //document.form1.p_upfilecnt.value = upfilecnt;
	document.form1.submit();
}


//������ �̵�
function goPage(pageNum) {

	document.form1.p_pageno.value = pageNum;
	document.form1.action = "/servlet/controller.study.MyQnaServlet";
	document.form1.p_process.value = "MyQnaCounselListPage";
	document.form1.submit();

}


//Q&A��ȭ�� �������� �̵�
function viewHomeqna(seq, upfilecnt, userid, types, type) {
	document.form1.action				= "/servlet/controller.study.MyQnaServlet";
	document.form1.p_process.value		= "MyQnaCounselHomeQnaViewPage";
	document.form1.p_seq.value			= seq;
	document.form1.p_userid.value		= userid;
	document.form1.p_types.value		= types;
	document.form1.pp_type.value		= type;
	document.form1.p_upfilecnt.value	= upfilecnt;
	document.form1.submit();


}

//�������� ��ȭ�� �������� �̵�
function viewQna(seq,subj,year,subjseq) {
	document.form1.action = "/servlet/controller.study.MyQnaServlet";
	document.form1.p_process.value = "MyQnaCounselQnaViewPage";
	document.form1.p_seq.value     = seq;
	document.form1.p_subj.value    = subj;
	document.form1.p_year.value    = year;
	document.form1.p_subjseq.value = subjseq;
	document.form1.submit();
}

//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name="form1" method="post" action="/servlet/controller.study.MyQnaServlet" onsubmit="javascript:selectList();">
  <input type = "hidden" name = "p_process"		value = "">
  <input type = "hidden" name = "p_pageno"		value = "<%= v_pageno %>">
  <input type = "hidden" name = "p_seq"			value = "">
  <input type = "hidden" name = "p_userid"		value = "">
  <input type = "hidden" name = "p_upfilecnt"	value = "">
  <input type = "hidden" name = "p_types"		value = "">
  <input type = "hidden" name = "pp_type"		value = "">
  <input type = "hidden" name = "p_tabseq"		value = "">
  <input type = "hidden" name = "p_subj">
  <input type = "hidden" name = "p_year">
  <input type = "hidden" name = "p_subjseq">
  
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
        <td><img src="/images/portal/homepage_renewal/myclass/stitle_04.gif" alt="���� ��㳻��" /></td>
        <td class="h_road">Home &gt; ���� ���ǽ�  &gt; <strong>���� ��㳻��</strong></td>
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
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td><img src="/images/portal/homepage_renewal/myclass/bar_03.jpg" width="672" height="104" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table>
    <!--Ÿ��Ʋ�κ�//-->
    
          <!--�˻��κ�-->
          <table width="672" border="0" cellpadding="0" cellspacing="1" bgcolor="ADBBD8">
            <tr>
              <td height="34" bgcolor="F0F0F0"><table border="0" align="center" cellpadding="3" cellspacing="0">
                <tr>
                  <td class="board_serach"><span class="board_serach">
                    <select name = "p_select" class = "input">
					<option value="title"   <% if (v_select.equals("title"))   out.print("selected"); %>>����</option>
					<option value="content" <% if (v_select.equals("content")) out.print("selected"); %>>����+����</option>
		 			</select>
                  </span></td>
                  <td><input name="p_searchtext" type="text" class="inbox" id="p_searchtext" size="30" value = "<%= v_searchtext %>" onkeypress="javascript:fnKeyPressEnter(event, 'selectList');"/></td>
                  <td><a href="javascript:selectList()"><img src="/images/portal/homepage_renewal/common/btn_search_in.jpg" alt="�˻�" width="46" height="24" /></a></td>
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
          	<kocca_select:select name="p_type" sqlNum="homepagecounseltype"  param=" "
					onChange="selectList();" attr="�Խ��Ǻз�" selectedValue="<%= p_type %>" isLoad="true" all="none" type="3" styleClass="table_title"/>
          </td>
          <td class="tit_table">����  </td>
          <td class="tit_table">�ۼ�����</td>
          <td class="tit_table_right">�亯����</td>
        </tr>
        <%
        for (int i=0; i<blist2.size(); i++) {
            DataBox dbox = (DataBox)blist2.get(i);  
            v_dispnum	= dbox.getInt("d_dispnum"); 
            v_no		= dbox.getInt("d_no");
            v_sdate		= dbox.getString("d_sdate");
            v_types		= dbox.getString("d_types");
            v_totalpage	= dbox.getInt("d_totalpage");
            v_title		= dbox.getString("d_title");
            v_type		= dbox.getString("d_type");
            v_status	= dbox.getString("d_status");
            v_userid	= dbox.getString("d_userid");
            v_subj		= dbox.getString("d_subj");
            v_year		= dbox.getString("d_year");
            v_subjseq	= dbox.getString("d_subjseq");
            
            int i_upfilecnt = dbox.getInt("d_upfilecnt");
            
			if (!v_searchtext.equals("")&&v_select.equals("title")) {
				v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
			}
			
	        if (v_type.equals("PQ")) {
	        	v_typenm = "Ȩ������";
	        } else if (v_type.equals("BU") || v_type.equals("CU") || v_type.equals("OO") || v_type.equals("MM")) {
	        	v_typenm = "1vs1���";
	        } else if (v_type.equals("OFF")) {
	        	v_typenm = "�������";
	        } else if (v_type.equals("SUBJ")) {
	        	v_typenm = "����������";
	        } else {
	        	v_typenm = "";
	        }

	        //vc_status  1 : ��ó��, 2 : ó����, 3 : �Ϸ�
	        if (v_status.equals("1")) {
	            v_status_view	= "icon_view_pre.jpg";
	            v_status_class	= "pre";
	        } else if (v_status.equals("2")) {
	            v_status_view	= "btn_ing.jpg";
	            v_status_class	= "ing";
	        } else if (v_status.equals("3")) {
	            v_status_view	= "icon_a_ok.jpg";
	            v_status_class	= "finish";
	        } else {
	            v_status_view	= "icon_view_pre.jpg";
	            v_status_class	= "pre";
	        }
	        
	        //�󼼺��� ��ũ �����
	        /*
	        if ("OFF".equals(v_type)) {
	        	sScriptString	= "viewCounsel('" + v_no + "');";
	        } else
	        */
	        if ("PQ".equals(v_type) || "BU".equals(v_type) || "CU".equals(v_type) || "OO".equals(v_type) || "MM".equals(v_type)) {
	        	sScriptString	= "viewHomeqna('" + v_no + "', '" + v_upfilecnt + "', '" + v_userid + "', '" + v_types + "', '" + v_type + "');";	
	        } else if ("SUBJ".equals(v_type)) {
	        	sScriptString	= "viewQna('" + v_no + "', '" + v_subj + "', '" + v_year + "', '" + v_subjseq + "');";	
	        }

%>      
        
        <tr>
          <td class="ct_tit_table"><%= v_dispnum %></td>
          <td class="ct_tit_table_left"><%= v_typenm %></td>
          <td class="ct_tit_table_left"><a href="javascript:<%= sScriptString %>"><%= v_title %></a></td>
          <td class="ct_tit_table"><%=FormatDate.getFormatDate(v_sdate, "yyyy.MM.dd")%></td>
          <%
			if ("".equals(v_status_class)) {
%>
				<td class="ct_tit_table_right"><img src="/images/portal/homepage_renewal/myclass/<%= v_status_view %>"/></td>
<%
			} else {
%>
				<td class="ct_tit_table_right"><a href="javascript:<%= sScriptString %>" class="state"><img src="/images/portal/homepage_renewal/myclass/<%= v_status_view %>"/></a></td>
<%			}
          %>
			
        </tr>
        <%} %>
        <tr>
          <td height="1" colspan="5" bgcolor="CACACA"></td>
        </tr>
        <tr>
          <td height="4" colspan="5" bgcolor="F7F7F7"></td>
        </tr>
      </table>
      
   
    </td>
    <td width="20">&nbsp;</td>
    
  </tr>
</table>
      	
      	<%}else{ %>
  
			<h2><img src="/images/portal/myclass/h2_tit7.gif" alt="���ǻ�㳻��" class="fl_l" /><p class="category">Home > ���ǰ��ǽ� > <strong>���ǻ�㳻��</strong></p></h2>
 
			<p><img src="/images/portal/myclass/myconsult_txt.gif" alt="������������ �������� �н�â���� �����н��� �ñ��� ���� ������ �����Դϴ�. Q&A�� �н��������Ϳ��� ������ ���� �� ����Ʈ �̿� ���ݿ� ���� �����ϴ� �����Դϴ�. 1:1���Ǵ� �н��������Ϳ��� ������ ���� �� ����, ����/���� ���� �Ű��ϴ� �����Դϴ�." /></p>
			
			<p class="board_serach">
				<select name = "p_select" class = "input">
					<option value="title"   <% if (v_select.equals("title"))   out.print("selected"); %>>����</option>
					<option value="content" <% if (v_select.equals("content")) out.print("selected"); %>>����+����</option>
		 		</select>
				<input type="text" name = "p_searchtext" class="inbox" style="width:135px;" value = "<%= v_searchtext %>" onkeypress="javascript:fnKeyPressEnter(event, 'selectList');"/>
				<input type="image" class="btn" src="/images/portal/btn/btn_serbox_search.gif" alt="�˻�" />
			</p>
			
			<table class="board_list">
			<colgroup><col width="63px" /><col width="118px" /><col width="340px" /><col width="90px" /><col width="80px" /></colgroup>
			<thead>
			<tr class="myclass">
				<th><p>��ȣ</p></th>
				<th><p>
					<kocca_select:select name="p_type" sqlNum="homepagecounseltype"  param=" "
					onChange="selectList();" attr="�Խ��Ǻз�" selectedValue="<%= p_type %>" isLoad="true" all="none" type="3" styleClass="table_title"/>
                </p></th>
				<th><p>����</p></th>
				<th><p>�ۼ�����</p></th>
				<th class="end"><p>�亯����</p></th>
			</tr>
			</thead>
			<tbody>
<%
        for (int i=0; i<blist2.size(); i++) {
            DataBox dbox = (DataBox)blist2.get(i);  
            v_dispnum	= dbox.getInt("d_dispnum"); 
            v_no		= dbox.getInt("d_no");
            v_sdate		= dbox.getString("d_sdate");
            v_types		= dbox.getString("d_types");
            v_totalpage	= dbox.getInt("d_totalpage");
            v_title		= dbox.getString("d_title");
            v_type		= dbox.getString("d_type");
            v_status	= dbox.getString("d_status");
            v_userid	= dbox.getString("d_userid");
            v_subj		= dbox.getString("d_subj");
            v_year		= dbox.getString("d_year");
            v_subjseq	= dbox.getString("d_subjseq");
            
            int i_upfilecnt = dbox.getInt("d_upfilecnt");
            
			if (!v_searchtext.equals("")&&v_select.equals("title")) {
				v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
			}
			
	        if (v_type.equals("PQ")) {
	        	v_typenm = "Ȩ������";
	        } else if (v_type.equals("BU") || v_type.equals("CU") || v_type.equals("OO") || v_type.equals("MM")) {
	        	v_typenm = "1vs1���";
	        } else if (v_type.equals("OFF")) {
	        	v_typenm = "�������";
	        } else if (v_type.equals("SUBJ")) {
	        	v_typenm = "����������";
	        } else {
	        	v_typenm = "";
	        }

	        //vc_status  1 : ��ó��, 2 : ó����, 3 : �Ϸ�
	        if (v_status.equals("1")) {
	            v_status_view	= "������";
	            v_status_class	= "pre";
	        } else if (v_status.equals("2")) {
	            v_status_view	= "�亯�غ���";
	            v_status_class	= "ing";
	        } else if (v_status.equals("3")) {
	            v_status_view	= "�亯�Ϸ�";
	            v_status_class	= "finish";
	        } else {
	            v_status_view	= "������";
	            v_status_class	= "pre";
	        }
	        
	        //�󼼺��� ��ũ �����
	        /*
	        if ("OFF".equals(v_type)) {
	        	sScriptString	= "viewCounsel('" + v_no + "');";
	        } else
	        */
	        if ("PQ".equals(v_type) || "BU".equals(v_type) || "CU".equals(v_type) || "OO".equals(v_type) || "MM".equals(v_type)) {
	        	sScriptString	= "viewHomeqna('" + v_no + "', '" + v_upfilecnt + "', '" + v_userid + "', '" + v_types + "', '" + v_type + "');";	
	        } else if ("SUBJ".equals(v_type)) {
	        	sScriptString	= "viewQna('" + v_no + "', '" + v_subj + "', '" + v_year + "', '" + v_subjseq + "');";	
	        }

%>      
			<tr onmouseover="className='over'" onmouseout="className=' '">
				<td class="num"><%= v_dispnum %></td>
				<td><%= v_typenm %></td>
				<td class="ta_l"><a href="javascript:<%= sScriptString %>"><%= v_title %></a></td>
				<td class="num"><%=FormatDate.getFormatDate(v_sdate, "yyyy.MM.dd")%></td>
<%
			if ("".equals(v_status_class)) {
%>
				<td><%= v_status_view %></td>
<%
			} else {
%>
				<td class="btn"><a href="javascript:<%= sScriptString %>" class="state"><span class="<%= v_status_class %>"><%= v_status_view %></span></a></td>
<%
			}
%>
			</tr>
<%
        }
%>
<%
		if(blist2.size() == 0){
%>
            <tr>
                <td colspan="5">��㳻���� �����ϴ�.</td>
            </tr>
<%
        }
%>
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