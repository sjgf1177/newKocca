<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.course.ClassifySubjectBean" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />
<%
	RequestBox box = (RequestBox)request.getAttribute("requestbox");
	String p_specials = box.get("s_specials");
	String p_action = box.get("p_action");
	
	String v_upperclass = box.get("p_upperclass");
	String v_lclassnm = box.getString("s_lclassnm");
	String v_mclassnm = box.getString("s_mclassnm");
	
	
	if (box == null) box = RequestManager.getBox(request);
	
	List<DataBox> subjList = (List)request.getAttribute("totalSubjectList");		 // ���� ����Ʈ
	
	int v_pageno = box.getInt("p_pageno");
	if (v_pageno == 0)  v_pageno = 1;
	int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0;
	int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
	int v_pagesize = box.getInt("p_pagesize");
	int	 v_totalrowcount =  0;
	
    HashMap<String, String> upperMap = null;    // ��з� �� �޴�ID ���� �� HashMap<upperlcass, menuid>
    
    upperMap   = ClassifySubjectBean.getMenuId(box);
    
    String  v_creduURL		= "/contents/credu/start.html";
%>

<%@ include file="/learn/user/portal/include/top.jsp"%>

<!-- ��ũ��Ʈ���� -->
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script language="JavaScript">
<!--//

// �����˻�
function subjSearch() {
	document.form1.p_process.value = "TotalSubjectList";
	document.form1.submit();
}

//���� ���뺸��
function whenSubjInfo(subj,subjnm,courseyn,upperclass,upperclassnm, year, subjseq, menuid){
document.form1.p_subj.value = subj;
document.form1.p_subjnm.value = subjnm;
document.form1.p_iscourseYn.value = courseyn;
document.form1.p_upperclass.value = upperclass;
document.form1.p_upperclassnm.value = upperclassnm;
document.form1.p_year.value = year;
document.form1.p_subjseq.value = subjseq;
document.form1.menuid.value = menuid;
document.form1.p_process.value = 'SubjectPreviewPage';
document.form1.p_rprocess.value = 'TotalSubjectList';
document.form1.action='/servlet/controller.propose.ProposeCourseServlet';
document.form1.target = "_self";
document.form1.submit();
}

//������û
function whenSubjPropose(subj,year,subjseq, subjnm, billYn) {

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
		document.form1.submit();
	}
	//������ �̵�
	function goPage(pageNum) {
		document.form1.p_action.value = "go";
		document.form1.p_pageno.value = pageNum;
		document.form1.submit();
	}
	function pagesize(pageSize) {
		document.form1.target = "_self";
		document.form1.p_pageno.value = 1;
		document.form1.p_pagesize.value = pageSize;
		document.form1.submit();
	}

	
	var creduGateUrl;
	var creduWin;
    //������
    function whenPreShow(url, subj, d_preheight, d_prewidth) {
    	
    	if(url.indexOf("ksp.credu.com") > 0 ){
    		creduGateUrl = url;
    		//open_window("openShow",url,"100","100",d_preheight,d_prewidth,"","","",true,true);
    		creduWin = window.open("<%=v_creduURL%>", "creduPre", "top=100px,left=100px,width=1000px,height=600px");
    	}else{
	        // �α�
	        prelog_url = "/servlet/controller.propose.ProposeCourseServlet?p_process=insertPreviewLog&p_subj="+subj;
	
	        open_window("openShow",url,"100","100",d_preheight,d_prewidth,"","","",true,true);
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
    

    function goSort(tmp) {
        $("[name='p_order']").val(tmp);
		document.form1.p_process.value = "TotalSubjectList";
		document.form1.submit();
	}
//-->
</script>
<div id="ajaxDiv"></div>
<!-- ��ũ��Ʈ�������� -->
<!-- form ���� -->
<form name="form1" action="/servlet/controller.propose.ProposeCourseServlet" method="post">
	<input type="hidden" name="p_process"	    value="<%=box.get("p_process")%>"/>
	<input type="hidden" name="p_rprocess"	    value=""/>
	<input type="hidden" name="p_year"	        value=""/>
	<input type="hidden" name="p_subj"	        value=""/>
	<input type="hidden" name="p_subjseq"	    value=""/>
	<input type="hidden" name="p_subjnm"	    value=""/>
	<input type="hidden" name="p_iscourseYn"	value=""/>
	<input type="hidden" name="p_upperclass"	value=""/>
	<input type="hidden" name="p_upperclassnm"	value=""/>
	<input type="hidden" name="p_action"	    value="<%=p_action%>"/>
	<input type="hidden" name="p_pageno"	    value="<%=v_pageno%>"/>
	<input type="hidden" name="p_pagesize"      value="<%=v_pagesize%>"/>
	<input type="hidden" name="menuid"          value=""/>
    <input type="hidden" name="p_order"          value=""/>
	
	
		<h2><img src="/images/portal/common/h2_search.gif" alt="�������հ˻�" class="fl_l" /><p class="category">Home &gt; �¶��ΰ��� &gt; <strong>�������հ˻�</strong></p></h2>

			<%--<p class="board_comment"><strong>[�ȳ�]</strong> ��������  KOCCA ���� ������ �߱ް���, �α����, �ű԰���, ��õ�������� ���е˴ϴ�.</p>--%>

			<p class="searchbox">
				<%--<img src="/images/portal/board/serbox_category.gif" style="padding:0 5px 0 0"> <kocca_select:select name="s_specials" sqlNum="specials"  param=" "  styleClass="mg_r12"--%>
	<%--onChange="" attr=" " selectedValue="<%= p_specials %>" isLoad="true" all="true" />--%>
				<img src="/images/portal/board/serbox_classtit.gif" alt="�����˻�" class="mg_r7" />
				<input type="text" name="s_subjnm" class="inbox" style="width:280px;" value="<%= box.get("s_subjnm") %>" onkeypress="javascript:fnKeyPressEnter(event, 'subjSearch');"/>
				<input type="image" src="/images/portal/btn/btn_serbox_search.gif" class="va_m mg_r12" alt="�˻�" />
			</p>
            <ul class="tabwrap">
                <li>�� �����Ⱓ,�����Ḧ Ŭ���Ͻø� ������������ ������ �˴ϴ�.</li>
            </ul>
            <br>
			<table class="row_list">
			<thead>
			<tr>
				<th>
					<kocca_select:select name="s_lclassnm" sqlNum="course.0005"  param=' '
					onChange='go(1);' attr=" ��з�" selectedValue='<%= v_lclassnm %>' isLoad="true" all="true" type="3" styleClass=""/>
				</th>
				<th>
					<kocca_select:select name="s_mclassnm" sqlNum="course.0003"  param='<%= v_lclassnm %>' 
					onChange="go(1);" attr=" �ߺз�" selectedValue='<%= v_mclassnm %>' isLoad="true" all="true" type="3" styleClass=""/>
				</th>
				<th>������</th>
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
				<td class="ta_l"><%=dbox.get("d_uclassnm")%></td>
				<td><%=dbox.get("d_mclassnm")%></td>
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
					<a href="javascript:whenSubjInfo(
									'<%=dbox.get("d_subj")%>',
									'<%=dbox.get("d_subjnm")%>',
									'<%=dbox.get("d_isonoff")%>',
									'<%=dbox.get("d_scupperclass")%>',
									'<%=dbox.get("d_uclassnm")%>',
									'<%=dbox.get("d_scyear")%>',
									'<%=dbox.get("d_subjseq")%>',
									'<%=upperMap !=null && upperMap.get(v_upperclass) != null ?  upperMap.get(v_upperclass) : "00" %>')"><%=dbox.get("d_subjnm")%></a><br />
					<span class="slist"><a href="javascript:goSort('biyong')">������:</a> <%= biyong %></span><span class="slist">��������: <%= slimit %></span></td>
				<td class="data"><%=dbox.get("d_edustart")%>~<%=dbox.get("d_eduend")%><br /><span class="sdata"><%=dbox.get("d_propstart")%>~<%=dbox.get("d_propend")%></span></td>
				<td class="end">
					<a href="javascript:whenPreShow('<%= dbox.get("d_preurl")%>'
											,'<%= dbox.get("d_subj")%>'
											, '<%= dbox.get("d_prewidth", "1012") %>'
											,'<%= dbox.get("d_preheight", "677") %>' )" class="board_btn"><span class="pd_l6 pd_r5">������</span></a><br />
<%if(dbox.getBoolean("d_existpropose")) {%>��û�Ϸ�<%	}	else { if( propyn.equals("Y") ) {%>                    
					<a href="javascript:whenSubjPropose(
									'<%=dbox.get("d_subj")%>',
									'<%=dbox.get("d_scyear")%>',
									'<%=dbox.get("d_subjseq")%>',
									'<%=dbox.get("d_subjnm")%>')" class="btn_gr mg_t3"><span>��û</span></a><br/>
<%}	} %>
				</td>
			</tr>
<%	v_totalpage	 = dbox.getInt("d_totalpage");// for ���� �ȿ� ����
		v_totalrowcount = dbox.getInt("d_totalrowcount");
		v_rowcount	  = dbox.getInt("d_rowcount");
	}	 %>
			</tbody>
			</table>
<%
%>
		<!-- total ���� -->
		 <%= PageUtil.printPageSizeListDiv(v_totalpage, v_pageno, 0, v_pagesize, v_totalrowcount) %>
		<!-- total �� -->
			</form>
<!-- form �� -->
<!-- footer -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!--// footer -->
