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
<%@ page contentType = "text/html;charset=euc-kr" %>
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
	//String type = box.get("type");
	String v_upperclass = box.get("p_upperclass");
	if (box == null) box = RequestManager.getBox(request);
	List<DataBox> subjList = (List<DataBox>)request.getAttribute("SubjectList");		 // ���� ����Ʈ
	int v_pageno = box.getInt("p_pageno");
	if (v_pageno == 0)  v_pageno = 1;
	int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0;
	int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
	int v_pagesize = box.getInt("p_pagesize");
	int	 v_totalrowcount =  0;
    String v_grcode=box.getSession("tem_grcode");
	String p_order = box.getString("p_order");
	
	String  v_creduURL		= "/contents/credu/start.html";
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
function whenSubjInfo(subj,subjnm,courseyn,upperclass,upperclassnm, year, subjseq, wj_classkey){
document.form1.p_subj.value = subj;
document.form1.p_subjnm.value = subjnm;
document.form1.p_iscourseYn.value = courseyn;
document.form1.p_upperclass.value = upperclass;
document.form1.p_upperclassnm.value = upperclassnm;
document.form1.p_year.value = year;
document.form1.p_subjseq.value = subjseq;
document.form1.p_wj_classkey.value = wj_classkey;
document.form1.p_process.value = 'SubjectPreviewPage';
document.form1.p_rprocess.value = 'SubjectList';
document.form1.action='/servlet/controller.propose.ProposeCourseServlet';
document.form1.target = "_self";
document.form1.submit();
}


var creduGateUrl;
var creduWin;
//������
function whenPreShow(url, subj, d_preheight, d_prewidth, d_wj_classkey) {
             
	if(url.indexOf("ksp.credu.com") > 0 ){
		creduGateUrl = url;
		//open_window("openShow",url,"100","100",d_preheight,d_prewidth,"","","",true,true);
		creduWin = window.open("<%=v_creduURL%>", "creduPre", "top=100px,left=100px,width=1000px,height=600px");
	}else{
		
		if (d_wj_classkey != '') {    //����(�����н���)
		  if (<%=v_grcode.equals("N000031") %>)  {
		      // �α�
		      prelog_url = "/servlet/controller.propose.ProposeCourseServlet?p_process=insertPreviewLog&p_subj="+subj;
		
		      open_window("openShow","http://samplezone.campus21.co.kr/classpreview.asp?classkey="+d_wj_classkey,"100","100","720","400","","","",true,true);           
		  }
		  return;
		} else {
		      // �α�
		      prelog_url = "/servlet/controller.propose.ProposeCourseServlet?p_process=insertPreviewLog&p_subj="+subj;
		
		      open_window("openShow",url,"100","100",d_preheight,d_prewidth,"","","",true,true);
		}
	}
		
	
}

//ũ���� ���ް��� ��ũ���� ��������
function creduURL(){
	$.ajax({
            type : "post"
        ,   url : "/servlet/controller.contents.EduStart"
        ,   dataType : "json"
        ,   data : {
        	url : creduGateUrl,
        	p_process : "creduSubj"
        }
        ,   success : function(ajaxData) {
        		creduWin.loadswf(ajaxData.videoURL, 945, 540);
        	}
        ,   error :  function(arg1, arg2) {
                alert("������ �߻��Ͽ� �÷��� �� �� �����ϴ�.");
            }
    });
}

//��ü��������
function whenSubjectListAll() {
document.form1.p_process.value = 'SubjectListAll';
document.form1.p_rprocess.value = 'SubjectList';
document.form1.action='/servlet/controller.propose.ProposeCourseServlet';
document.form1.submit();
}
//������û
function whenSubjPropose(subj,year,subjseq, subjnm, billYn, wj_classkey) {

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
	document.form1.action = "/servlet/controller.propose.ProposeCourseServlet";
	document.form1.submit();
	document.form1.target = "_self";
}

//���ɹ�ư Ŭ��
function fnInterestInsert(subj,year,subjseq,courseyn,subjnm) {

	if (confirm(subjnm + " ������ ���ɰ������� ����Ͻðڽ��ϱ�?")) {
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
		document.form1.p_process.value = "REQUEST";
		document.form1.submit();
	}
	//������ �̵�
	function selectArea(area) {
		$("#p_area").val(area);
		document.form1.p_action.value = "go";
		document.form1.p_process.value = "REQUEST";
		document.form1.p_pageno.value = 0;
		document.form1.submit();
	}
	//������ �̵�
	function goPage(pageNum) {
		document.form1.p_action.value = "go";
		document.form1.p_pageno.value = pageNum;
		document.form1.p_process.value = "REQUEST";
		document.form1.submit();
	}
	function pagesize(pageSize) {
		document.form1.target = "_self";
		document.form1.p_pageno.value = 1;
		document.form1.p_pagesize.value = pageSize;
		document.form1.p_process.value = "REQUEST";
		document.form1.submit();
	}

	function goSort(tmp) {
        $("[name='p_order']").val(tmp);
		document.form1.p_process.value = "REQUEST";
		document.form1.submit();
	}
//-->
</script>
<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ�������� -->
<!-- form ���� -->
<form name="form1" action="/servlet/controller.homepage.AspMenuMainServlet" method="post">
	<input type="hidden" name="p_process"	value="<%=box.get("p_process")%>"/>
	<input type="hidden" name="p_rprocess"	value=""/>
	<input type="hidden" name="p_year"	value=""/>
	<input type="hidden" name="p_subj"	value=""/>
	<input type="hidden" name="p_subjseq"	value=""/>
	<input type="hidden" name="p_subjnm"	value=""/>
	<input type="hidden" name="p_order"	value="<%=p_order %>"/>
	<input type="hidden" name="p_iscourseYn"	value=""/>
	<input type="hidden" name="p_upperclass"	value="<%=v_upperclass %>"/>
	<input type="hidden" name="p_upperclassnm"	value=""/>
	<input type="hidden" name="p_action"	value="<%=p_action%>"/>
	<input type="hidden" name="p_pageno"	value="<%=v_pageno%>"/>
	<input type="hidden" name="p_pagesize"  value="<%=v_pagesize%>"/>
	<input type="hidden" name="p_area" id="p_area"	value="<%= box.get("p_area") %>"/>
    <input type="hidden" name="p_wj_classkey" value=""/>

	<% // �� upperclass �� ���� �̹����� ���۾�  ���־�� ��. ex) /���/<%=v_upperclass+".gif"  %>
<% if      ("C01".equals(v_upperclass)) { %> <h2><img src="/images/portal/online/h2_tit01.gif" alt="��ȹ"     class="fl_l" /><p class="category">Home &gt; �¶��ΰ��� &gt; <strong>��ȹ</strong></p></h2><% }
   else if ("C02".equals(v_upperclass)) { %> <h2><img src="/images/portal/online/h2_tit02.gif" alt="����"     class="fl_l" /><p class="category">Home &gt; �¶��ΰ��� &gt; <strong>����</strong></p></h2><% }
   else if ("C03".equals(v_upperclass)) { %> <h2><img src="/images/portal/online/h2_tit03.gif" alt="����"     class="fl_l" /><p class="category">Home &gt; �¶��ΰ��� &gt; <strong>����</strong></p></h2><% }
   else if ("C04".equals(v_upperclass)) { %> <h2><img src="/images/portal/online/h2_tit04.gif" alt="�濵����" class="fl_l" /><p class="category">Home &gt; �¶��ΰ��� &gt; <strong>�濵����</strong></p></h2><% }
   else if ("C05".equals(v_upperclass)) { %> <h2><img src="/images/portal/online/h2_tit05.gif" alt="Ư��"     class="fl_l" /><p class="category">Home &gt; �¶��ΰ��� &gt; <strong>Ư��</strong></p></h2><% }
   else if ("B01".equals(v_upperclass)) { %> <h2><img src="/images/portal/online/h2_tit1.gif" alt="��ۿ���" class="fl_l" /><p class="category">Home &gt; �¶��ΰ��� &gt; <strong>��ۿ���</strong></p></h2><% }
   else if ("G01".equals(v_upperclass)) { %> <h2><img src="/images/portal/online/h2_tit2.gif" alt="���Ӱ���" class="fl_l" /><p class="category">Home &gt; �¶��ΰ��� &gt; <strong>���Ӱ���</strong></p></h2><% }
   else if ("K01".equals(v_upperclass)) { %> <h2><img src="/images/portal/online/h2_tit3.gif" alt="��ȭ������" class="fl_l" /><p class="category">Home &gt; �¶��ΰ��� &gt; <strong>��ȭ������</strong></p></h2><% }
%>
            <ul class="tabwrap">
                <li>�� �����Ⱓ,�����Ḧ Ŭ���Ͻø� ������������ ������ �˴ϴ�.</li>
            </ul>
            <ul class="tabwrap">
                <li style="color: red">�� ���� �н� �ÿ��� ���ͳ� �ͽ��÷η� ����� �����մϴ�.</li>
            </ul>
            <br>
			<ul class="tabwrap">
				<li><a href="javascript:selectArea('');" class="tab_online<%= box.get("p_area").equals("") ? " tab_online_on" : "" %>"><span>��ü</span></a></li>           
				<li><a href="javascript:selectArea('B0');" class="tab_online<%= box.get("p_area").equals("B0") ? " tab_online_on" : "" %>"><span>��ۿ���</span></a></li>
				<li><a href="javascript:selectArea('G0');" class="tab_online<%= box.get("p_area").equals("G0") ? " tab_online_on" : "" %>"><span>���Ӱ���</span></a></li>                
				<li><a href="javascript:selectArea('K0');" class="tab_online<%= box.get("p_area").equals("K0") ? " tab_online_on" : "" %>"><span>��ȭ������</span></a></li>
				
                <% if(v_grcode.equals("N000031")) {%>
                <li><a href="javascript:selectArea('W0');" class="tab_online<%= box.get("p_area").equals("W0") ? " tab_online_on" : "" %>"><span>����</span></a></li>
                <%}%>
			</ul>

			<table class="row_list">
			<thead>
			<tr>
				<th>
					<kocca_select:select name="s_mclassnm" sqlNum="course.0003"  param='<%= v_upperclass %>'
					onChange='go(1);' attr=" �о�" selectedValue='<%= box.get("s_mclassnm") %>' isLoad="true" all="true" type="3" styleClass=""/>
				</th>
				<th>
					<kocca_select:select name="s_sclowerclass" sqlNum="course.0004"  param='<%= v_upperclass %>' param2='<%= box.get("s_mclassnm").trim().length()==0 ? "ALL" : box.get("s_mclassnm")%>'
					onChange="go(1);" attr=" �з�" selectedValue='<%= box.get("s_sclowerclass") %>' isLoad="true" all="true" type="3" styleClass=""/>
				</th>
				<th>
					������
				</th>
				<th><a href="javascript:goSort('date')">�����Ⱓ<br /><span class="stit">(������û�Ⱓ)</span></a></th>
				<th>������û</th>
			</tr>
			</thead>
			<tbody>
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
				<td class="ta_l"><%=dbox.get("d_mclassnm")%></td>
				<%--<td><%= dbox.get("d_sclowerclass").equals("001") ? "��������ȹ" : dbox.get("d_sclowerclass").equals("002") ? "���ӱ�ȹ" : "��ۿ����ȹ"%></td>--%>
                <td><%= dbox.get("d_lclassnm")%></td>
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
					<b>&lt;&lt;<%= dbox.get("d_areaname") %>&gt;&gt;</<%= dbox.get("d_areaname") %>></b><a href="javascript:whenSubjInfo(
									'<%=dbox.get("d_subj")%>',
									'<%=dbox.get("d_subjnm")%>',
									'<%=dbox.get("d_isonoff")%>',
									'<%=dbox.get("d_scupperclass")%>',
									'<%=dbox.get("d_uclassnm")%>',
									'<%=dbox.get("d_scyear")%>',
									'<%=dbox.get("d_subjseq")%>',
									'<%=dbox.get("d_wj_classkey")%>')"><%=dbox.get("d_subjnm")%></a><br />
					<span class="slist">��������: <%= slimit %></span></td>
				<td class="data"><%=dbox.get("d_edustart")%>~<%=dbox.get("d_eduend")%><br /><span class="sdata"><%=dbox.get("d_propstart")%>~<%=dbox.get("d_propend")%></span></td>
				<td class="end">
					<a href="javascript:whenPreShow('<%= dbox.get("d_preurl")%>'
											,'<%= dbox.get("d_subj")%>'
											, '<%= dbox.get("d_prewidth", "800") %>'
											,'<%= dbox.get("d_preheight", "600") %>'
											,'<%= dbox.get("d_wj_classkey")%>' )" class="board_btn"><span class="pd_l6 pd_r5">������</span></a><br />

<%if(dbox.getBoolean("d_existpropose")) {%>��û�Ϸ�<%	}	else { if( propyn.equals("Y") ) {%>
					<a href="javascript:whenSubjPropose(
									'<%=dbox.get("d_subj")%>',
									'<%=dbox.get("d_scyear")%>',
									'<%=dbox.get("d_subjseq")%>',
									'<%=dbox.get("d_subjnm")%>',
						 		   	'<%= dbox.get("d_wj_classkey")%>')" class="btn_gr mg_t3"><span>��û</span></a><br/>
<%}	} %>
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
			</form>
<!-- form �� -->
<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->
