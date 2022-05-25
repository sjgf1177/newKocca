<%
//**********************************************************
//  1. ��      ��: ���ǻ�㳻�� - ���� QnA �󼼺���
//  2. ���α׷��� : gu_MyQnaCounselSangdam_R.jsp
//  3. ��      ��: ���ǻ�㳻�� 
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.11.26
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.research.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.study.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

	String	v_process	= box.getString("p_process");
	String  v_categorycd  = box.getString("p_categorycd");
	int     v_seq         = box.getInt("p_seq");
	String  v_subj        = box.getString("p_subj");
	String  v_year        = box.getString("p_year");
	String  v_subjseq     = box.getString("p_subjseq");
	String  v_type        = box.getString("p_type");
	String  v_searchtext  = box.getString("p_searchtext");
	String  v_select      = box.getString("p_select");
	String  v_repkind     = "";
	int     v_repseq      = 0;

	int		v_pageno	  = box.getInt("p_pageno");
    int		v_pagesize	  = box.getInt("p_pagesize");
	
    DataBox dbox        = (DataBox)request.getAttribute("selectMyQnaCounselQna");
	String v_inuserid   = dbox.getString("d_inuserid");
	String v_lesson     = dbox.getString("d_lesson");
	String v_kind       = dbox.getString("d_kind");
	String v_name       = dbox.getString("d_name");
	String v_indate     = dbox.getString("d_indate");
	String v_title      = dbox.getString("d_title");
	String v_contents   = dbox.getString("d_contents");
	String v_grcodenm   = dbox.getString("d_grcodenm");
	String v_grcode     = dbox.getString("d_grcode");
	String v_okyn1      = dbox.getString("d_okyn1");
	String v_okuserid1  = dbox.getString("d_okuserid1");
	String v_okdate1    = dbox.getString("d_okdate1");
	String v_okyn2      = dbox.getString("d_okyn2");
	String v_okuserid2  = dbox.getString("d_okuserid2");
	String v_okdate2    = dbox.getString("d_okdate2");
	String v_scsubjnm   = dbox.getString("d_scsubjnm");
	String v_subjseqgr  = dbox.getString("d_subjseqgr");
	Vector v_realfileVector = (Vector)dbox.getObject("d_realfile");
	Vector v_savefileVector = (Vector)dbox.getObject("d_savefile");
	String v_realmotion  = dbox.getString("d_realmotion");
	String v_savemotion  = dbox.getString("d_savemotion");
	String v_status_view = "";
	int    v_filecount   = v_realfileVector.size();
	int    v_cnt         = dbox.getInt("d_cnt");

    //vc_status  1 : ��ó��, 2 : ó����, 3 : �Ϸ�
    if (v_okyn1.equals("1")) {
        v_status_view = "������";
    } else if (v_okyn1.equals("2")) {
        v_status_view = "�亯�غ���";
    } else if (v_okyn1.equals("3")) {
        v_status_view = "�亯�Ϸ�";
    } else {
        v_status_view = "";
    }

	MyQnaBean myqnabean = new MyQnaBean();

	//Relative Start
	String pp_searchStart	= box.getString("p_searchStart");
	String pp_searchEnd     = box.getString("p_searchEnd");
	String ss_gyear         = box.getString("s_gyear");
	String ss_grseq         = box.getString("s_grseq");
	String ss_upperclass    = box.getString("s_upperclass");
	String ss_middleclass   = box.getString("s_middleclass");
	String ss_lowerclass    = box.getString("s_lowerclass");
	String ss_subjcourse    = box.getString("s_subjcourse");
	String ss_subjseq       = box.getString("s_subjseq");
	String pp_order       	= box.getString("p_order");
	String pp_orderType     = box.getString("p_orderType");
	//Relative End
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>

<script language="JavaScript" type="text/JavaScript">
<!--
// �������
function listPage() {
    document.form1.target = "_self";
	document.form1.p_process.value='MyQnaCounselListPage';
	document.form1.action='/servlet/controller.study.MyQnaServlet';
	document.form1.submit();
}

//-->
</script>



<!-- title -->
<form name="form1" method="post" action="/servlet/controller.study.MyQnaServlet">
  <input type = "hidden" name = "p_process"		value = "<%= v_process %>">
  <input type = "hidden" name = "p_pageno"		value = "<%= v_pageno %>">
  <input type = "hidden" name = "p_pagesize"	value = "<%= v_pagesize %>">
  <input type = "hidden" name = "p_type"		value = "<%= v_type %>">
  <input type = "hidden" name = "p_subj"		value = "<%= v_subj %>">
  <input type = "hidden" name = "p_year"		value = "<%= v_year %>">
  <input type = "hidden" name = "p_subjseq"		value = "<%= v_subjseq %>">
  <input type = "hidden" name = "p_select"		value = "<%= v_select %>">
  <input type = "hidden" name = "p_searchtext"	value = "<%= v_searchtext %>">

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
    
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
            
            <tr>
              <td width="20" height="40"><img src="/images/portal/homepage_renewal/common/icon_blue.jpg"/></td>
              <td>
              	
			<img src="/images/portal/homepage_renewal/myclass/stit_class.gif" alt="���������� ���ǳ���" />

              </td>
        </tr>
          </table>
      <!--���̺�κ�-->
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="1" colspan="8" bgcolor="#7692CB"></td>
        </tr>
        <tr>
          <td class="tit_table" width="8%">����</td>
          <td colspan="7" class="ct_tit_table_lright"><strong><%= v_title %></strong></td>
        </tr>
        
        <tr>
          <td class="tit_table">������</td>
          <td class="ct_tit_table_left"><%= v_scsubjnm %>&nbsp;</td>
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
        		<!-- ����÷�� ���� -->
            <%
                Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
                Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
                String i_boardStyle        = "myclass_view";                                // ���� ��Ÿ��

                String v_realfile_tmp = (String)i_realfileVector.elementAt(0);      

                if(v_realfile_tmp != null && !v_realfile_tmp.equals("")) {
            %>
            <%@ include file="/learn/user/include/zu_MultiAttach_R.jsp" %>
            <%  } %>
            <!-- ����÷�� ����-->
            
          <%

	ArrayList list = (ArrayList)request.getAttribute("selectMyQnaCounselQnaListA");
	ArrayList list1 = new ArrayList();
	int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
	//int v_cnt = 0;
	int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1;
	if(list.size() != 0) {
%>            
          <tr>
		<td colspan="8">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
			 <tr>
          <td width="20" height="40"><img src="/images/portal/homepage_renewal/common/icon_blue.jpg"/></td>
          <td><img src="/images/portal/homepage_renewal/myclass/sstitle_04.gif"/></td>
          	 </tr>
          	 </table>
          	 </td>
        </tr>       
        <%
		for(int i = 0; i < list.size(); i++) {
			DataBox dboxA = (DataBox)list.get(i);
			v_dispnum	= dboxA.getInt("d_dispnum");
			v_inuserid	= dboxA.getString("d_inuserid");
			v_name		= dboxA.getString("d_name");
			v_indate	= dboxA.getString("d_indate");
			v_title		= dboxA.getString("d_title");
			v_seq		= dboxA.getInt("d_seq");
            v_totalpage	= dboxA.getInt("d_totalpage");
            v_rowcount	= dboxA.getInt("d_rowcount");
            v_contents	= dboxA.getString("d_contents");
			v_scsubjnm	= dboxA.getString("d_scsubjnm");
			v_subjseqgr = dboxA.getString("d_subjseqgr");
			v_repseq	= dboxA.getInt("d_seq");
			v_repkind	= dboxA.getString("d_kind");
%>
		<tr>
          <td colspan="8" height="1" bgcolor="#7692CB"></td>
        </tr>
        <tr>        	
        	<td colspan="8" class="blue_txt" bgcolor="#F6F6F6"><br/>&nbsp;<%= v_title %><span class="h_road"> (<%= FormatDate.getFormatDate(v_indate, "yyyy.MM.dd") %>)</span></td>
        </tr>
        <tr>
        	<td colspan="8" bgcolor="#F6F6F6"><br/>&nbsp;<%= v_contents %><br/></td>
        </tr>
        <%
	list1 = myqnabean.fileCourseList(v_subj,  v_year, v_subjseq , v_repseq, v_repkind);

	if(list1.size() != 0){
%>
            
            <tr>
						<td class="tit_table" width="150px">÷������</td>
						<td colspan="7" class="ct_tit_table_lright" style="border-bottom: #afbedd 1px solid;">
							 <%
      	for(int ai= 0 ; ai<list1.size(); ai++){
			DataBox dboxf = (DataBox)list1.get(ai);
         	String v_realfile = dboxf.getString("d_realfile");
         	String v_savefile = dboxf.getString("d_savefile");
         	if(v_realfile != null && !v_realfile.equals("")) {  
%>
                        
	                    <img src="/images/portal/ico/ico_file.gif" alt="file" class="mg_r6 va_t" />
	                    <a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_savefile%>&p_realfile=<%= v_realfile%>'><%= v_realfile%></a>
	                    <input type = "hidden" name = "p_savefile"  value = <%=v_savefile%>>
	                    
	                    <%              }   
                        }  %>
						</td>
					  </tr>
					  <%} %>
		<tr>
          <td height="1" colspan="8" bgcolor="CACACA"></td>
        </tr>
        <tr>
          <td height="4" colspan="8" bgcolor="F7F7F7"></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
					  <%} }%>

      </table>
      
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td class="h_road"><a href="javascript:listPage();"><img src="/images/portal/homepage_renewal/myclass/btn_list.jpg" alt="���" width="46" height="25" /></a></td>
        </tr>
      </table></td>
    <td width="20">&nbsp;</td>
    
   
  </tr>
</table>
      	
      	<%}else{ %>



			<h2><img src="/images/portal/myclass/h2_tit7.gif" alt="���ǻ�㳻��" class="fl_l" /><p class="category">Home > ���ǰ��ǽ� > <strong>���ǻ�㳻��</strong></p></h2>
 
			<p><img src="/images/portal/myclass/myconsult_txt.gif" alt="������������ �������� �н�â���� �����н��� �ñ��� ���� ������ �����Դϴ�. Q&A�� �н��������Ϳ��� ������ ���� �� ����Ʈ �̿� ���ݿ� ���� �����ϴ� �����Դϴ�. 1:1���Ǵ� �н��������Ϳ��� ������ ���� �� ����, ����/���� ���� �Ű��ϴ� �����Դϴ�. " /></p>
			
			<h3 class=" mg_t30"><img src="/images/portal/myclass/stit_class.gif" alt="���������� ���ǳ���" /></h3>
			<table class="myclass_view">
			<colgroup><col width="70px" /><col width="345px" /><col width="70px" /><col width="80px" /><col width="45px" /><col width="80px" /></colgroup>
			<tr>
				<th>����</th>
				<td colspan="6" class="tit"><%= v_title %></td>
			</tr>
			<tr>
				<th>������</th>
				<td colspan="6"><%= v_scsubjnm %></td>
			</tr>
			<tr class="bo">
				<th>�ۼ���</th>
				<td><%= v_name %></td>
				<th>�ۼ���</th>
				<td class="num"><%= FormatDate.getFormatDate(v_indate, "yyyy.MM.dd") %></td>
				<th>��ȸ</th>
				<td class="fs_s"><%= v_cnt %></td>
			</tr>
			<tr>
				<td colspan="6" class="con"><%= v_contents %></td>
			</tr>
			</table>
            <%
                Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
                Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
                String i_boardStyle        = "myclass_view";                                // ���� ��Ÿ��

                String v_realfile_tmp = (String)i_realfileVector.elementAt(0);      

                if(v_realfile_tmp != null && !v_realfile_tmp.equals("")) {
            %>
            <%@ include file="/learn/user/include/zu_MultiAttach_R.jsp" %>
            <%  } %>
<%

	ArrayList list = (ArrayList)request.getAttribute("selectMyQnaCounselQnaListA");
	ArrayList list1 = new ArrayList();
	int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
	//int v_cnt = 0;
	int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1;
	if(list.size() != 0) {
%>
		<h3><img src="/images/portal/myclass/stit_answer.gif" alt="�亯����" /></h3>
<%
		for(int i = 0; i < list.size(); i++) {
			DataBox dboxA = (DataBox)list.get(i);
			v_dispnum	= dboxA.getInt("d_dispnum");
			v_inuserid	= dboxA.getString("d_inuserid");
			v_name		= dboxA.getString("d_name");
			v_indate	= dboxA.getString("d_indate");
			v_title		= dboxA.getString("d_title");
			v_seq		= dboxA.getInt("d_seq");
            v_totalpage	= dboxA.getInt("d_totalpage");
            v_rowcount	= dboxA.getInt("d_rowcount");
            v_contents	= dboxA.getString("d_contents");
			v_scsubjnm	= dboxA.getString("d_scsubjnm");
			v_subjseqgr = dboxA.getString("d_subjseqgr");
			v_repseq	= dboxA.getInt("d_seq");
			v_repkind	= dboxA.getString("d_kind");
%>
			<dl class="inan_myclass">
				<dt><strong><%= v_title %></strong><%= FormatDate.getFormatDate(v_indate, "yyyy.MM.dd") %></dt>
				<dd><%= v_contents %></dd>
			</dl>
<%
	list1 = myqnabean.fileCourseList(v_subj,  v_year, v_subjseq , v_repseq, v_repkind);

	if(list1.size() != 0){
%>
            <table class="board_write bo_tn">
            <!--[if ie]><colgroup><col width="65px" /><col width="625px" /></colgroup><![endif]-->
            <colgroup><col width="85px" /><col width="625px" /></colgroup>
            <tr class="file_add">
                <th>÷������</th>
                <td colspan="7" class="pd_ln">
<%
      	for(int ai= 0 ; ai<list1.size(); ai++){
			DataBox dboxf = (DataBox)list1.get(ai);
         	String v_realfile = dboxf.getString("d_realfile");
         	String v_savefile = dboxf.getString("d_savefile");
         	if(v_realfile != null && !v_realfile.equals("")) {  
%>
	                <p class="file_list">
	                <img src="/images/portal/ico/ico_file.gif" alt="file" class="mg_r6" />
	                <a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%=v_savefile%>&p_realfile=<%=v_realfile%>'><%= v_realfile %></a>
	                <input type = "hidden" name = "p_savefile"  value = "<%= v_savefile %>">
	                </p>
<%
         	}
      	}
%>
                </td>
            </tr>
            </table>
<%
	}
%>
			<br/>
<%
		}
	}
%>
			<p class="board_btn"><a href="javascript:listPage()" class="board_green"><span>���</span></a></p>
			
		<%} %>	
</form>
<!-- Form ���� ���� -->


<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->