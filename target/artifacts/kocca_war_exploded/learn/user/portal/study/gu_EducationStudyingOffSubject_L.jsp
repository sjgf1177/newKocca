<%
//**********************************************************
//  1. ��      ��: EDUCATION STUDYING OFF SUBJECT PAGE
//  2. ���α׷���: zu_EducationStudyingOffSubject_L.jsp
//  3. ��      ��: �������� ����
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009/11/23
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String server = conf.getProperty("game.url.value");

    String  v_process   = box.getString("p_process");
    String  v_user_id   = box.getSession("userid");

    String  v_upperclass =  "";
    String  v_upperclassnm =  "";
    String  v_subj       =  "";
    String  v_year       =  "";
    String  v_subjnm     =  "";
    String  v_subjseq    =  "";
    String  v_edustart   =  "";
    String  v_eduend     =  "";
    String  v_isterm  = "";
    String  v_stustatus   = "";
    String  v_stustatusnm = "";
    
    int     i           =  0;
    int     l           =  0;

    int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0, v_tabseq = 0;

    // ����¡����
    int row      = Integer.parseInt(conf.getProperty("page.bulletin.row"));
    int v_pageno = box.getInt("p_pageno");   

    ArrayList list1     = null;
    //DEFINED class&variable END

    list1 = (ArrayList)request.getAttribute("EducationStudyingOffSubjectList");   //study.MyClassBean.selectEducationStudyingOffSubjectList(box)
    //out.println(list3.size());
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<SCRIPT LANGUAGE="JavaScript">
<!--
// ���� POPUP
function whenScorePopup(subj,year,subjseq){
    window.self.name = "scoreList";
    window.open("", "openScore", "scrollbars=no,width=400,height=277,scrollbars=auto,resizable=yes'");
    document.form1.target = "openScore"

    document.form1.p_subj.value = subj;
    document.form1.p_year.value = year;
    document.form1.p_subjseq.value = subjseq;
    document.form1.p_process.value = 'EducationStudyingOffTermScorePopup';
    document.form1.action='/servlet/controller.study.MyClassServlet';
    document.form1.submit();

    document.form1.target = window.self.name;
}

//�˻����뿡 �´� ����Ʈ �������� �̵�
function selectList() {
	document.form1.action = "/servlet/controller.study.MyClassServlet";
	document.form1.p_pageno.value = "1";
	document.form1.p_process.value = "EducationStudyingOffSubjectPage";
	document.form1.submit();
}

//������ �̵�
function goPage(pageNum) {

	document.form1.p_pageno.value = pageNum;
	document.form1.action = "/servlet/controller.study.MyClassServlet";
	document.form1.p_process.value = "EducationStudyingOffSubjectPage";
	document.form1.submit();

}
//-->
</SCRIPT>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name= "form1" method= "post">
    <input type='hidden' name='p_process'>
    <input type='hidden' name='p_subj'      value ="">
    <input type='hidden' name='p_year'      value ="">
    <input type='hidden' name='p_subjseq'   value ="">
    <input type='hidden' name='p_subjnm'    value ="">
    <input type='hidden' name='p_userid'    value ="">
    <input type='hidden' name='p_gubun'     value ="">
    <input type = "hidden" name = "p_pageno"		value = "<%= v_pageno %>">
    
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
        <td><img src="/images/portal/homepage_renewal/myclass/stitle_02.gif" alt="�������� ����" /></td>
        <td class="h_road">Home &gt; ���� ���ǽ�  &gt; <strong>�������� ����</strong></td>
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
        <td><img src="/images/portal/homepage_renewal/myclass/bar_01.jpg" width="672" height="104" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table>
    <!--Ÿ��Ʋ�κ�//-->  
      
      <!--�Ǻκ�-->
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image55','','/images/portal/homepage_renewal/myclass/tab_on_001.gif',1)"><img src="/images/portal/homepage_renewal/myclass/tab_off_001.gif" name="Image55" id="Image55" /></a></td>
          <td><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingOffSubjectPage" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image56','','/images/portal/homepage_renewal/myclass/tab_on_002.gif',1)"><img src="/images/portal/homepage_renewal/myclass/tab_on_002.gif" name="Image56" id="Image56" /></a></td>
        </tr>
      </table>
      <!--�Ǻκ�//-->
      
      <!--���̺�κ�-->
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="tit_table">
          	<kocca_select:select name="p_upperclass" sqlNum="offupperclass"  param=" "
	              onChange="selectList();" attr="�з�" selectedValue="<%= v_upperclass %>" isLoad="true" all="none" type="3" styleClass="table_title"/>
          </td>
          <td class="tit_table">������</td>
          <td class="tit_table">�����Ⱓ</td>
          <td class="tit_table">��������</td>
          <td class="tit_table_right">����</td>
        </tr>
        
        <%
            for(i = 0; i < list1.size(); i++) {
                DataBox dbox    = (DataBox)list1.get(i);

                v_upperclass    =  dbox.getString("d_upperclass");
                v_upperclassnm  =  dbox.getString("d_upperclassnm");
                v_subj          =  dbox.getString("d_subj");
                v_year          =  dbox.getString("d_year");
                v_subjnm        =  dbox.getString("d_subjnm");
                v_subjseq       =  dbox.getString("d_subjseq");
                v_edustart      =  dbox.getString("d_edustart");
                v_eduend        =  dbox.getString("d_eduend");
                v_edustart      = FormatDate.getFormatDate(v_edustart,"yyyy.MM.dd");
                v_eduend        = FormatDate.getFormatDate(v_eduend,"yyyy.MM.dd");
                v_isterm        = dbox.getString("d_isterm");
                v_stustatus     = dbox.getString("d_stustatus");
                v_stustatusnm   = dbox.getString("d_stustatusnm");

                v_dispnum	= dbox.getInt("d_dispnum");
                v_totalpage	= dbox.getInt("d_totalpage");
                		                
                if ("N".equals(v_isterm)) {
                	v_stustatusnm = "������";
                }
%>
        
        <tr>
          <td class="ct_tit_table"><%= v_upperclassnm %></td>
          <td class="ct_tit_table_left"><%= v_subjnm %></td>
          <td class="ct_tit_table"><%= v_edustart %>~<%= v_eduend %></td>
          <td class="ct_tit_table">
	          <%
				if ("Y".equals(v_isterm)) {
%>
                  <a href="javascript:whenScorePopup('<%= v_subj %>','<%= v_year %>', '<%= v_subjseq %>')" class="board_btn2"><span>�б⺰</span></a>
<%
				} else {
%>
                  -
<%
				}
%>
          </td>
          <td class="ct_tit_table_right"><%= v_stustatusnm %></td>
        </tr>
        <%} %>
        <%
		if(i == 0){
%>
            <tr>
                <td colspan="5" align="center">�н����� ������ �����ϴ�.</td>
            </tr>
              <%
        }
%>
        <tr>
          <td height="1" colspan="5" bgcolor="CACACA"></td>
        </tr>
        <tr>
          <td height="4" colspan="5" bgcolor="F7F7F7"></td>
        </tr>
      </table>    
    
    	<!-- total ���� -->
		 <%= PageUtil.re_printPageListDiv(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
		<!-- total �� -->
      
    </td>
    
    <td width="20">&nbsp;</td>   

  </tr>
</table>
      	
      	<%}else{ %>

			<h2><img src="/images/portal/myclass/h2_tit1.gif" alt="�������ΰ���" class="fl_l" /><p class="category">Home > ���ǰ��ǽ� > <strong>�������ΰ���</strong></p></h2>
 
			<%--<p class="myclass_tab cltxt_1"><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage"><img src="/images/portal/myclass/myclass_online_tab1_off.gif" alt="�¶��ΰ���" onmouseover="imgover(this);" onmouseout="imgout(this);" /></a><img src="/images/portal/myclass/myclass_online_tab2_on.gif" alt="�������ΰ���" /></p>--%>
 
			<p class="mg_t30 board_comment"><strong>[�ȳ�]</strong> ������ �������� ��� �б⺰ ���� �� ���� ���¸� Ȯ���Ͻ� �� �ֽ��ϴ�.</p>

            <img src="/images/portal/myclass/classing_borimg.gif" alt="" style="width:681px;background-position: left 18px;background-repeat: no-repeat;">
            <p style="line-height:7px">&nbsp;</p>
            <a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage"><img src="/images/portal/btn/btn_online_off.gif" alt="�¶��ΰ���" onmouseover="imgover(this);" onmouseout="imgout(this);" /></a><img src="/images/portal/btn/btn_offline_on.gif" alt="�������ΰ���">
			<table class="board_list">
			<colgroup><col width="90px" /><col width="310px" /><col width="140px" /><col width="80px" /><col width="65px" /></colgroup>
			<thead>
			<tr class="myclass">
				<th><p>
				  <kocca_select:select name="p_upperclass" sqlNum="offupperclass"  param=" "
	              onChange="selectList();" attr="�з�" selectedValue="<%= v_upperclass %>" isLoad="true" all="none" type="3" styleClass="table_title"/>
                  </p></th>
				<th><p>������</p></th>
				<th><p>�����Ⱓ</p></th>
				<th><p>��������</p></th>
				<th class="end"><p>����</p></th>
			</tr>
			</thead>
			<tbody>
        <%
            for(i = 0; i < list1.size(); i++) {
                DataBox dbox    = (DataBox)list1.get(i);

                v_upperclass    =  dbox.getString("d_upperclass");
                v_upperclassnm  =  dbox.getString("d_upperclassnm");
                v_subj          =  dbox.getString("d_subj");
                v_year          =  dbox.getString("d_year");
                v_subjnm        =  dbox.getString("d_subjnm");
                v_subjseq       =  dbox.getString("d_subjseq");
                v_edustart      =  dbox.getString("d_edustart");
                v_eduend        =  dbox.getString("d_eduend");
                v_edustart      = FormatDate.getFormatDate(v_edustart,"yyyy.MM.dd");
                v_eduend        = FormatDate.getFormatDate(v_eduend,"yyyy.MM.dd");
                v_isterm        = dbox.getString("d_isterm");
                v_stustatus     = dbox.getString("d_stustatus");
                v_stustatusnm   = dbox.getString("d_stustatusnm");

                v_dispnum	= dbox.getInt("d_dispnum");
                v_totalpage	= dbox.getInt("d_totalpage");
                		                
                if ("N".equals(v_isterm)) {
                	v_stustatusnm = "������";
                }
%>

			<tr onmouseover="className='over'" onmouseout="className=' '">
				<td><%= v_upperclassnm %></td>
				<td class="ta_l"><%= v_subjnm %></td>
				<td class="num"><%= v_edustart %>~<%= v_eduend %></td>
				<td>
<%
				if ("Y".equals(v_isterm)) {
%>
                  <a href="javascript:whenScorePopup('<%= v_subj %>','<%= v_year %>', '<%= v_subjseq %>')" class="board_btn2"><span>�б⺰</span></a>
<%
				} else {
%>
                  -
<%
				}
%>
                </td>
				<td><%= v_stustatusnm %></td>
			</tr>
<%
	}
%>
<%
		if(i == 0){
%>
            <tr>
                <td colspan="5">�н����� ������ �����ϴ�.</td>
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
