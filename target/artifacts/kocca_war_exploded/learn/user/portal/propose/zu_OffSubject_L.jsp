<%
//**********************************************************
//  1. ��	  ��: SUBJECT LIST
//  2. ���α׷���: zu_Subject_L.jsp
//  3. ��	  ��: ������ȸ
//  4. ȯ	  ��: JDK 1.3
//  5. ��	  ��: 1.0
//  6. ��	  ��: 2004.01.14
//  7. ��	  ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />
<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
	String p_specials = box.get("p_specials");
	String p_action = box.get("p_action");
	String type = box.get("type");
    String p_menuid = box.get("menuid"); //��� 01,���� 02,��ȹ 03
    String p_middleclass = box.get("s_mclassnm");  //����������米�� 001,����������缺���� 002, ��Ź���� 003
	if (box == null) box = RequestManager.getBox(request);
	List<DataBox> subjList = (List<DataBox>)request.getAttribute("SubjectList");		 // ���� ����Ʈ
	int v_pageno = box.getInt("p_pageno");
	if (v_pageno == 0)  v_pageno = 1;
	int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0;
	int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
	int v_pagesize = box.getInt("p_pagesize");
	int	 v_totalrowcount =  0;
	
	System.out.println("jsp_gubun::::::::::::::::"+box.getSession("s_gubun"));
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>

<!-- ��ũ��Ʈ���� -->
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script language="JavaScript">
<!--//
// �����˻� ����ó��
function search_enter(e)  {
	if (e.keyCode =='13'){  subjSearch();  }
}

// �����˻�
function subjSearch() {
	document.form1.p_process.value = "SubjectList";
	document.form1.submit();
}

//���� ���뺸��
function whenSubjInfo(subj, year, subjseq, seq){
document.form1.p_subj.value = subj;
document.form1.p_year.value = year;
document.form1.p_subjseq.value = subjseq;
document.form1.p_seq.value = seq;
document.form1.p_process.value = 'SubjectPreviewPage';
document.form1.p_rprocess.value = 'SubjectList';
document.form1.action='/servlet/controller.off.ProposeOffServlet';
document.form1.target = "_self";
document.form1.submit();
}

//��ü��������
function whenSubjectListAll() {
document.form1.p_process.value = 'SubjectListAll';
document.form1.p_rprocess.value = 'SubjectList';
document.form1.action='/servlet/controller.off.ProposeOffServlet';
document.form1.submit();
}
//������û
function whenSubjPropose(subj,year,subjseq, subjnm, seq) {
	if(<%= box.getSession("userid").length()==0 %>) {
		alert("�α����� �ʿ��մϴ�.");
		return;
	}
	if(!confirm(subjnm+"������ ������û�Ͻðڽ��ϱ�?")){
	 return;
	}
	var new_Open = window.open("","proposeWindow",'scrollbars=yes,width=800,height=600,resizable=no');
	document.form1.p_process.value = "SubjectEduProposePage";
	document.form1.target = "proposeWindow";
	document.form1.p_subj.value = subj;
	document.form1.p_year.value = year;
	document.form1.p_subjseq.value = subjseq;
	document.form1.p_seq.value = seq;
	document.form1.action = "/servlet/controller.off.ProposeOffServlet";
	document.form1.submit();
	document.form1.target = "_self";
}

//���ɹ�ư Ŭ��
function fnInterestInsert(subj,year,subjseq,courseyn,subjnm) {

	if (confirm(subjnm + " ������ ���ɰ������� ����ϽÁٽ��ϱ�?")) {
			$.post("/servlet/controller.common.AjaxServlet"
					, {checkSqlNum:"interest.exist", sqlNum:"interest.insert", p_subj:subj,rerurnFunction:"resultInterest"}
					, function(data) {
						$("#ajaxDiv").html(data);
					});
	}
}
function resultInterest(data) {
	if (data.result=='true') alert("���ɰ������� ����߽��ϴ�."); 
	else alert("���ɰ��� ����� �����Ͽ����ϴ�.\n"+data.result);
}
	//������ �̵�
	function go(index) {
		document.form1.p_action.value = "go";
		document.form1.p_pageno.value = index;
		document.form1.p_process.value = "SubjectList";
		document.form1.submit();
	}
	//������ �̵�
	function selectArea(area,mid) {
		//document.form1.type.value = area;
		document.form1.p_area.value = area;
		if( mid != '' ) {
			document.form1.menuid.value = mid;
		}
		//document.form1.s_mclassnm.value = "";
		document.form1.p_action.value = "go";
		document.form1.p_process.value = "SubjectList";
		document.form1.p_pageno.value = 0;
		document.form1.submit();
	}
	//������ �̵�
	function goPage(pageNum) {
		document.form1.p_action.value = "go";
		document.form1.p_pageno.value = pageNum;
		document.form1.p_process.value = "SubjectList";
		document.form1.submit();
	}
	function pagesize(pageSize) {
		document.form1.target = "_self";
		document.form1.p_pageno.value = 1;
		document.form1.p_pagesize.value = pageSize;
		document.form1.p_process.value = "SubjectList";
		document.form1.submit();
	}
//-->
</script>
<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ�������� -->
<!-- form ���� -->
<form name="form1" action="/servlet/controller.off.ProposeOffServlet" method="post">
	<input type="hidden" name="type"	value="<%=type%>"/>
	<input type="hidden" name="p_upperclass"	value="<%=type%>"/>
	<input type="hidden" name="p_process"	value="<%=box.get("p_process")%>"/>
	<input type="hidden" name="p_rprocess"	value=""/>
	<input type="hidden" name="p_year"	value=""/>
	<input type="hidden" name="p_subj"	value=""/>
	<input type="hidden" name="p_subjseq"	value=""/>
	<input type="hidden" name="p_seq"	value=""/>
	<input type="hidden" name="gubun" value="2">
	<input type="hidden" name="p_area" id="p_area"	value="<%= box.get("p_area") %>"/>
	<input type="hidden" name="p_action"	value="<%=p_action%>"/>
	<input type="hidden" name="p_pageno"	value="<%=v_pageno%>"/>
	<input type="hidden" name="p_pagesize"  value="<%=v_pagesize%>"/>
	<input type="hidden" name="menuid" value='<%= box.get("menuid") %>'>	
    <input type="hidden" name="p_topuserid"	value=""/>
    <input type="hidden" name="p_toppwd"	value=""/>
	
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
        <% if      ("S01".equals(type)) { %> <td><img src="/images/portal/homepage_renewal/offline/stitle_02.gif" alt="��ۿ���" /></td><td class="h_road">Home &gt; �������� ����  &gt; <strong>��ۿ���</strong></td><% }
   else if ("S02".equals(type)) { %> <td><img src="/images/portal/homepage_renewal/offline/stitle_03.gif" alt="��������" /></td><td class="h_road">Home &gt; �������� ����  &gt; <strong>��������</strong></td><% }
   else if ("S03".equals(type)) { %> <td><img src="/images/portal/homepage_renewal/offline/stitle_04.gif" alt="��ȹâ��" /></td><td class="h_road">Home &gt; �������� ����  &gt; <strong>��ȹâ��</strong></td><% }
   else if ("".equals(type)) { %> <td><img src="/images/portal/homepage_renewal/offline/stitle_01.gif" alt="��ü��������" /></td><td class="h_road">Home &gt; �������� ����  &gt; <strong>��ü��������</strong></td><% }
%>
      </tr>
      <tr>
        <td height="12" colspan="2"></td>
        </tr>
      <tr>
        <td height="1" colspan="2" bgcolor="E5E5E5"></td>
      </tr>
    </table>
    <!--Ÿ��Ʋ�κ�//-->

      <table width="672" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="15"></td>
        </tr>
        <tr>
          <td>
          
          <!--�˻��κ�-->
          <table width="672" border="0" cellpadding="0" cellspacing="1" bgcolor="ADBBD8">
            <tr>
              <td height="34" bgcolor="F0F0F0"><table width="90%" border="0" align="center" cellpadding="3" cellspacing="0">
                <tr>
                  <td><img src="/images/portal/homepage_renewal/common/txt_search_in.gif" alt="�����˻�" width="69" height="16" /></td>
                  <td><input name="s_subjnm" type="text" class="input_search" id="s_subjnm" size="77" value="<%= box.get("s_subjnm") %>"/></td>
                  <td><a href="javascript:subjSearch();"><img src="/images/portal/homepage_renewal/common/btn_search_in.jpg" alt="�˻�" width="46" height="24" /></a></td>
                </tr>
                
              </table></td>
            </tr>
          </table>
          <!--�˻��κ�//-->
          
          </td>
        </tr>
        <tr>
          <td height="15"></td>
        </tr>
      </table>
      
      <!--�Ǻκ�-->
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
        <%if (box.get("p_area").equals("")){ %>
          <td width="133"><a href="javascript:selectArea('','');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image44','','/images/portal/homepage_renewal/offline/tab_on_01.gif',1)"><img src="/images/portal/homepage_renewal/offline/tab_on_01.gif" name="Image44" id="Image44" /></a></td>
          <td width="133"><a href="javascript:selectArea('004','');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image45','','/images/portal/homepage_renewal/offline/tab_on_02.gif',1)"><img src="/images/portal/homepage_renewal/offline/tab_off_02.gif" name="Image45" id="Image45" /></a></td>
          <td width="133"><a href="javascript:selectArea('001','');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image46','','/images/portal/homepage_renewal/offline/tab_on_03.gif',1)"><img src="/images/portal/homepage_renewal/offline/tab_off_03.gif" name="Image46" id="Image46" /></a></td>
          <td width="133"><a href="javascript:selectArea('002','');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image47','','/images/portal/homepage_renewal/offline/tab_on_04.gif',1)"><img src="/images/portal/homepage_renewal/offline/tab_off_04.gif" name="Image47" id="Image47" /></a></td>
          <td width="133"><a href="javascript:selectArea('003','');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image48','','/images/portal/homepage_renewal/offline/tab_on_05.gif',1)"><img src="/images/portal/homepage_renewal/offline/tab_off_05.gif" name="Image48" id="Image48" /></a></td>
          <%}else if(box.get("p_area").equals("004")){ %>
          <td width="133"><a href="javascript:selectArea('','');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image44','','/images/portal/homepage_renewal/offline/tab_on_01.gif',1)"><img src="/images/portal/homepage_renewal/offline/tab_off_01.gif" name="Image44" id="Image44" /></a></td>
          <td width="133"><a href="javascript:selectArea('004','');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image45','','/images/portal/homepage_renewal/offline/tab_on_02.gif',1)"><img src="/images/portal/homepage_renewal/offline/tab_on_02.gif" name="Image45" id="Image45" /></a></td>
          <td width="133"><a href="javascript:selectArea('001','');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image46','','/images/portal/homepage_renewal/offline/tab_on_03.gif',1)"><img src="/images/portal/homepage_renewal/offline/tab_off_03.gif" name="Image46" id="Image46" /></a></td>
          <td width="133"><a href="javascript:selectArea('002','');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image47','','/images/portal/homepage_renewal/offline/tab_on_04.gif',1)"><img src="/images/portal/homepage_renewal/offline/tab_off_04.gif" name="Image47" id="Image47" /></a></td>
          <td width="133"><a href="javascript:selectArea('003','');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image48','','/images/portal/homepage_renewal/offline/tab_on_05.gif',1)"><img src="/images/portal/homepage_renewal/offline/tab_off_05.gif" name="Image48" id="Image48" /></a></td>
          <%}else if(box.get("p_area").equals("001")){ %>
          <td width="133"><a href="javascript:selectArea('','');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image44','','/images/portal/homepage_renewal/offline/tab_on_01.gif',1)"><img src="/images/portal/homepage_renewal/offline/tab_off_01.gif" name="Image44" id="Image44" /></a></td>
          <td width="133"><a href="javascript:selectArea('004','');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image45','','/images/portal/homepage_renewal/offline/tab_on_02.gif',1)"><img src="/images/portal/homepage_renewal/offline/tab_off_02.gif" name="Image45" id="Image45" /></a></td>
          <td width="133"><a href="javascript:selectArea('001','');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image46','','/images/portal/homepage_renewal/offline/tab_on_03.gif',1)"><img src="/images/portal/homepage_renewal/offline/tab_on_03.gif" name="Image46" id="Image46" /></a></td>
          <td width="133"><a href="javascript:selectArea('002','');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image47','','/images/portal/homepage_renewal/offline/tab_on_04.gif',1)"><img src="/images/portal/homepage_renewal/offline/tab_off_04.gif" name="Image47" id="Image47" /></a></td>
          <td width="133"><a href="javascript:selectArea('003','');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image48','','/images/portal/homepage_renewal/offline/tab_on_05.gif',1)"><img src="/images/portal/homepage_renewal/offline/tab_off_05.gif" name="Image48" id="Image48" /></a></td>
          <%}else if(box.get("p_area").equals("002")){ %>
          <td width="133"><a href="javascript:selectArea('','');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image44','','/images/portal/homepage_renewal/offline/tab_on_01.gif',1)"><img src="/images/portal/homepage_renewal/offline/tab_off_01.gif" name="Image44" id="Image44" /></a></td>
          <td width="133"><a href="javascript:selectArea('004','');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image45','','/images/portal/homepage_renewal/offline/tab_on_02.gif',1)"><img src="/images/portal/homepage_renewal/offline/tab_off_02.gif" name="Image45" id="Image45" /></a></td>
          <td width="133"><a href="javascript:selectArea('001','');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image46','','/images/portal/homepage_renewal/offline/tab_on_03.gif',1)"><img src="/images/portal/homepage_renewal/offline/tab_off_03.gif" name="Image46" id="Image46" /></a></td>
          <td width="133"><a href="javascript:selectArea('002','');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image47','','/images/portal/homepage_renewal/offline/tab_on_04.gif',1)"><img src="/images/portal/homepage_renewal/offline/tab_on_04.gif" name="Image47" id="Image47" /></a></td>
          <td width="133"><a href="javascript:selectArea('003','');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image48','','/images/portal/homepage_renewal/offline/tab_on_05.gif',1)"><img src="/images/portal/homepage_renewal/offline/tab_off_05.gif" name="Image48" id="Image48" /></a></td>
          <%}else if(box.get("p_area").equals("003")){ %>
          <td width="133"><a href="javascript:selectArea('','');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image44','','/images/portal/homepage_renewal/offline/tab_on_01.gif',1)"><img src="/images/portal/homepage_renewal/offline/tab_off_01.gif" name="Image44" id="Image44" /></a></td>
          <td width="133"><a href="javascript:selectArea('004','');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image45','','/images/portal/homepage_renewal/offline/tab_on_02.gif',1)"><img src="/images/portal/homepage_renewal/offline/tab_off_02.gif" name="Image45" id="Image45" /></a></td>
          <td width="133"><a href="javascript:selectArea('001','');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image46','','/images/portal/homepage_renewal/offline/tab_on_03.gif',1)"><img src="/images/portal/homepage_renewal/offline/tab_off_03.gif" name="Image46" id="Image46" /></a></td>
          <td width="133"><a href="javascript:selectArea('002','');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image47','','/images/portal/homepage_renewal/offline/tab_on_04.gif',1)"><img src="/images/portal/homepage_renewal/offline/tab_off_04.gif" name="Image47" id="Image47" /></a></td>
          <td width="133"><a href="javascript:selectArea('003','');" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image48','','/images/portal/homepage_renewal/offline/tab_on_05.gif',1)"><img src="/images/portal/homepage_renewal/offline/tab_on_05.gif" name="Image48" id="Image48" /></a></td>
          <%} %>
        </tr>
      </table>
      <!--�Ǻκ�//-->
      
      <!--���̺�κ�-->
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <!--<td class="tit_table">�о�
          <kocca_select:select name="s_mclassnm" sqlNum="course.0006"  param='<%= type %>'
					onChange='go(1);' attr="�о�" selectedValue='<%= box.get("s_mclassnm") %>' isLoad="true" all="true" type="3" styleClass=""/>
		  </td>-->
		  <td class="tit_table">������</td>
          <td class="tit_table">������</td>
          <td class="tit_table">��û�Ⱓ</td>
          <td class="tit_table"><a href="javascript:goSort('date')">�����Ⱓ</a></td>
          <td class="tit_table_right">������û</td>
        </tr>
                
        
        <%	for(DataBox dbox : subjList) { 
    		String biyong = "";
    		String slimit = "";
    		String propyn = dbox.getString("d_propyn");
    		if( dbox.getInt("d_biyong") == 0 ) {
    			biyong = "����";
    		} else {
    			biyong = dbox.getCommaInt("d_biyong") + "��";
    		}
    		if( dbox.getInt("d_studentlimit") == 0 ) {
    			slimit = "���Ѿ���";
    		} else {
    			slimit = dbox.getCommaInt("d_studentlimit") + "��";
    		}
		%>
        
        <tr>
          <!--<td class="ct_tit_table"><%=dbox.getFromDBTypeString("MIDDLECLASSNM")%></td>-->
          <td class="ct_tit_table_left">
            <table border="0" cellspacing="0" cellpadding="2">
              <tr>
                <td valign="top">
                	<% if(dbox.get("d_isunit").equals("Y")) {%><img src="/images/portal/homepage_renewal/online/icon_org.gif" alt="����" /> <% } %>
					<% if(dbox.get("d_ishit").equals("Y")) {%><img src="/images/portal/homepage_renewal/online/icon_puple.gif" alt="�α�" /> <% } %>
					<% if(dbox.get("d_isnew").equals("Y")) {%><img src="/images/portal/homepage_renewal/online/icon_blue.gif" alt="�ű�" /> <% } %>
					<% if(dbox.get("d_isrecom").equals("Y")) {%><img src="/images/portal/homepage_renewal/online/icon_green.gif" alt="��õ" /> <% } %>
					<!-- ���ɰ�����Ⱑ �ʿ�� �ٽ� ����<a href="javascript:fnInterestInsert(
									'<%=dbox.get("d_subj")%>',
									'<%=dbox.get("d_subjnm")%>',
									'<%=dbox.get("d_isonoff")%>',
									'<%=dbox.get("d_scupperclass")%>',
									'<%=dbox.get("d_uclassnm")%>')"
									class="board_btn"><span class="pd_l6 pd_r5">���ɰ������</span></a> -->							
                </td>
                <td>
                	<% if(dbox.get("d_areaname").length()>0) out.println("<b>[" + dbox.get("d_areaname") + "]</b>"); %><a href="javascript:whenSubjInfo(
									'<%=dbox.get("d_subj")%>',
									'<%=dbox.get("d_year")%>',
									'<%=dbox.get("d_subjseq")%>',
									'<%=dbox.get("d_seq")%>')"><%=dbox.get("d_subjnm")%></a>
					</a>
                </td>
              </tr>
            </table></td>
          <td class="ct_tit_table"><a href="javascript:goSort('biyong')"><%= biyong %></a></td>
          <td class="ct_tit_table"><%=dbox.getDate("d_propstart", ".").substring(5,10)%>~<%=dbox.getDate("d_propend", ".").substring(5,10)%></td>
          <td class="ct_tit_table"><%=dbox.getDate("d_edustart", ".").substring(5,10)%>~<%=dbox.getDate("d_eduend", ".").substring(5,10)%></td>
          <td class="ct_tit_table_right"> 
          	<%if(dbox.get("d_me_sukang_yn").equals("Y")) {%>��û�Ϸ�<%	}	else if( dbox.get("d_isprop").equals("Y") ) { %>
			<a href="javascript:whenSubjPropose(
									'<%=dbox.get("d_subj")%>',
									'<%=dbox.get("d_year")%>',
									'<%=dbox.get("d_subjseq")%>',
									'<%=dbox.get("d_subjnm")%>',
									'<%=dbox.get("d_seq")%>')" class="btn_gr mg_t3">
				<img src="/images/portal/homepage_renewal/online/btn_click.gif" alt="��û" />
					<% } else { %>
					    &nbsp;
					<% } %>
			</a>
          </td>
          </td>
        </tr>       
	
	<%	v_totalpage	 = dbox.getInt("d_totalpage");// for ���� �ȿ� ����
		v_totalrowcount = dbox.getInt("d_totalrowcount");
		v_rowcount	  = dbox.getInt("d_rowcount");
	}	 %>
        
        <%
	if( subjList.size() < 1) {
%>
		<tr>
			<td colspan="5" align="center">��ϵ� ������ �����ϴ�.</td>
		</tr>
<%
	}
%>
        
        <tr>
          <td height="1" colspan="6" bgcolor="CACACA"></td>
        </tr>
        <tr>
          <td height="4" colspan="6" bgcolor="F7F7F7"></td>
        </tr>
      </table>
      
      <!-- total ���� -->
		 <%= PageUtil.re_printPageSizeListDiv(v_totalpage, v_pageno, 0, v_pagesize, v_totalrowcount) %>
		<!-- total �� -->
		
		</td>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
      
      			      
		      </tr>		
		</table>
	
	<%}else{ %>	
	
<% if ("S01".equals(type)) { %>			<h2><img src="/images/portal/menu/2/h2_tit1.gif" alt="��ۿ���" class="fl_l" /><p class="category">Home &gt; �������ΰ��� &gt; <strong>��ۿ���</strong></p></h2><% }
else if ("S02".equals(type)) { %>			<h2><img src="/images/portal/menu/2/h2_tit2.gif" alt="���Ӱ���" class="fl_l" /><p class="category">Home &gt; �������ΰ��� &gt; <strong>��������</strong></p></h2><% }
else if ("S03".equals(type)) { %>			<h2><img src="/images/portal/menu/2/h2_tit3.gif" alt="��ȭ������" class="fl_l" /><p class="category">Home &gt; �������ΰ��� &gt; <strong>��ȹâ��</strong></p></h2><% } %>

    <% if(p_menuid.equals("01") && p_middleclass.equals("001")) { %>
        <p class="board_comment">����� �����ڸ� ������� �̵�� ȯ�� ��ȭ�� �´� ������ â�ۿ����� �۷ι� ����°�ȭ�� �������� â�� ����� ���</p>
    <% } else if(p_menuid.equals("01") && p_middleclass.equals("002")) { %>
        <p class="board_comment">�̷������� ����� �̲� û�� ������ ������� â�ۿ����� ������ ������ ���� ������� ���� ���ѹα� 1%�� â�� ���� �缺</p>
    <% } else if(p_menuid.equals("01") && p_middleclass.equals("003")) { %>
        <p class="board_comment">�̵�� ���տ� ���� ���ɺ� ���� �䱸�� �ʿ信 �����ϴ� ������ Ŀ��ŧ���� �����Ͽ� ��Ź���� ����ȯ�濡 �����ϴ� �ֻ��� �������񽺸� �����ϴ� �������� �������α׷�</p>
    <%}%>
			<p class="searchbox">
				<%--<img src="/images/user/portal/course/serbox_character.gif" alt="����Ư��" class="mg_r7" />--%>
				 <%--<kocca_select:select name="s_specials" sqlNum="specials"  param=" "  styleClass="mg_r12"--%>
	<%--onChange="" attr=" " selectedValue="<%= p_specials %>" isLoad="true" all="true" />--%>
				<img src="/images/portal/board/serbox_classtit.gif" alt="�����˻�" class="mg_r7" />
				<input type="text" name="s_subjnm" class="inbox" style="width:280px;" value="<%= box.get("s_subjnm") %>" />
				<input type="image" src="/images/portal/btn/btn_serbox_search.gif" class="va_m mg_r12" alt="�˻�" />
			</p>
			<ul class="tabwrap">
				<li><a href="javascript:selectArea('','');" class="tab_online<%= box.get("type").equals("") ? " tab_online_on" : "" %>"><span>��ü</span></a></li>
				<li><a href="javascript:selectArea('S01','01');" class="tab_online<%= box.get("type").equals("S01") ? " tab_online_on" : "" %>"><span>��ۿ���</span></a></li>
				<li><a href="javascript:selectArea('S02','02');" class="tab_online<%= box.get("type").equals("S02") ? " tab_online_on" : "" %>"><span>��������</span></a></li>
				<li><a href="javascript:selectArea('S03','03');" class="tab_online<%= box.get("type").equals("S03") ? " tab_online_on" : "" %>"><span>��ȹâ��</span></a></li>
			</ul>

			<table class="row_list">
			<thead>
			<tr>
			 
				<th>
					<kocca_select:select name="s_mclassnm" sqlNum="course.0006"  param='<%= type %>'
					onChange='go(1);' attr=" �о�" selectedValue='<%= box.get("s_mclassnm") %>' isLoad="true" all="true" type="3" styleClass=""/>
				</th>
				<!--
				<th>
					<kocca_select:select name="s_sclowerclass" sqlNum="course.0004"  param='<%= type.concat("01") %>' param2='<%= box.get("s_mclassnm").trim().length()==0 ? "001" : box.get("s_mclassnm")%>'
					onChange="go(1);" attr=" ���̵�" selectedValue='<%= box.get("s_sclowerclass") %>' isLoad="true" all="true" type="3" styleClass=""/>
				</th>
			 -->
				<th>������</th>
				<th>�����Ⱓ
				<!-- 	<br /><span class="stit">(������û�Ⱓ)</span> -->
				</th>
				<th>������û</th>
			</tr>
			</thead>
			<tbody>
<%	
	for(DataBox dbox : subjList) {		%>
			<tr>
			 
				<td class="ta_l"><%=dbox.getFromDBTypeString("MIDDLECLASSNM")%></td>
			<!--	<td><%= dbox.getFromDBTypeString("LOWERCLASSNM")%></td>
			 -->
				<td class="ta_l">
					<% if(dbox.get("d_isunit").equals("Y")) {%><img src="/images/portal/ico/ico_box_witness.gif" alt="����" /> <% } %>
					<% if(dbox.get("d_ishit").equals("Y")) {%><img src="/images/portal/ico/ico_box_popular.gif" alt="�α�" /> <% } %>
					<% if(dbox.get("d_isnew").equals("Y")) {%><img src="/images/portal/ico/ico_box_new.gif" alt="�ű�" /> <% } %>
					<% if(dbox.get("d_isrecom").equals("Y")) {%><img src="/images/portal/ico/ico_box_recom.gif" alt="��õ" /> <% } %>
					<!-- ���ɰ�����Ⱑ �ʿ�� �ٽ� ����<a href="javascript:fnInterestInsert(
									'<%=dbox.get("d_subj")%>',
									'<%=dbox.get("d_subjnm")%>',
									'<%=dbox.get("d_isonoff")%>',
									'<%=dbox.get("d_scupperclass")%>',
									'<%=dbox.get("d_uclassnm")%>')"
									class="board_btn"><span class="pd_l6 pd_r5">���ɰ������</span></a> -->
									<br />
					<% if(dbox.get("d_areaname").length()>0) out.println("<b>[" + dbox.get("d_areaname") + "]</b>"); %><a href="javascript:whenSubjInfo(
									'<%=dbox.get("d_subj")%>',
									'<%=dbox.get("d_year")%>',
									'<%=dbox.get("d_subjseq")%>',
									'<%=dbox.get("d_seq")%>')"><%=dbox.get("d_subjnm")%></a><br />
					<span class="slist">������: <%=dbox.getCommaInt("d_biyong")%>��</span><span class="slist">�����ο�: <%= dbox.getCommaInt("d_studentlimit") %>��</span></td>
				<td class="data"><%=dbox.getDate("d_edustart", ".")%>~<%=dbox.getDate("d_eduend", ".")%>
				<!-- 	<br /><span class="sdata"><%=dbox.getDate("d_propstart", ".")%>~<%=dbox.getDate("d_propend", ".")%></span> -->
				</td>
				<td class="end">
                    <% if(dbox.get("d_me_sukang_yn").equals("Y")) {%>
                        ��û�Ϸ�
                    <% } else if( dbox.get("d_isprop").equals("Y") ) { %>
					<a href="javascript:whenSubjPropose(
									'<%=dbox.get("d_subj")%>',
									'<%=dbox.get("d_year")%>',
									'<%=dbox.get("d_subjseq")%>',
									'<%=dbox.get("d_subjnm")%>',
									'<%=dbox.get("d_seq")%>')" class="btn_gr mg_t3"><span>��û</span></a><br/>
					<% } else { %>
					    &nbsp;
					<% } %>
				</td>
			</tr>
<%	v_totalpage	 = dbox.getInt("d_totalpage");// for ���� �ȿ� ����
		v_totalrowcount = dbox.getInt("d_totalrowcount");
		v_rowcount	  = dbox.getInt("d_rowcount");
	}	 %>
<%
	if( subjList.size() < 1) {
%>
		<tr>
			<td colspan="5" align="center">��ϵ� ������ �����ϴ�.</td>
		</tr>
<%
	}
%>
		</tbody>
			</table>
		<!-- total ���� -->
		 <%= PageUtil.printPageSizeListDiv(v_totalpage, v_pageno, 0, v_pagesize, v_totalrowcount) %>
		<!-- total �� -->
		<%} %>
			</form>
<!-- form �� -->
<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->
