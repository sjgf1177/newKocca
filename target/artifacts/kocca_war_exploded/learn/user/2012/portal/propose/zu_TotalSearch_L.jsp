<%@ page contentType = "text/html;charset=MS949" %>
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

	box.put("topmenu","00");

//	String p_specials = box.get("s_specials");
	String p_action = box.get("p_action");
	String p_lsearchtext = box.get("p_lsearchtext");
	
	String v_upperclass = "";
//	String v_lclassnm = box.getString("s_lclassnm");
//	String v_mclassnm = box.getString("s_mclassnm");
	
	
	if (box == null) box = RequestManager.getBox(request);
	
	List<DataBox> onLineSubjList = (List)request.getAttribute("OnlineList");		 // ���� ����Ʈ
	List<DataBox> offLineSubjList = (List)request.getAttribute("OfflineList");		 // ���� ����Ʈ
	
	int v_pageno = box.getInt("p_pageno");
	if (v_pageno == 0)  v_pageno = 1;
	int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0;
	int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
	int v_pagesize = box.getInt("p_pagesize");
	int	 v_totalrowcount =  0;
	
    HashMap<String, String> upperMap = null;    // ��з� �� �޴�ID ���� �� HashMap<upperlcass, menuid>
    
    //upperMap   = ClassifySubjectBean.getMenuId(box);
    String v_titleprn = "";
    String v_contentprn = "";
%>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>

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


function whenSubjInfoOff(subj, year, subjseq, seq){
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


  //��ü �����˻�
  function totalSubjSearch2() {
  	
     var searchText = $("#topWarp_searchText2").val();     
     var gubun   = "1";
     var url     = "/servlet/controller.propose.MainSubjSearchServlet?p_process=SubjSearch&p_lsearchtext="+searchText;    
     menuMainForward(gubun, url);
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
	<input type="hidden" name="p_seq"	        value=""/>
	
		<div class="totalsearch">
		<div class="searchform">
			<ul class="searchbox">
				<li class="msg"><img src="/images/2012/common/text_totalsearch.gif" alt="���԰˻�"></li>
				<li class="intext"><input type="text" name="topWarp_searchText2" id="topWarp_searchText2" class="textinsert" value="<%=p_lsearchtext%>" title="�˻�� �Է����ּ���"></li>
				<li><a href="javascript:totalSubjSearch2();"><img src="/images/2012/common/btn_search.gif" title="�˻��� �����մϴ�" alt="���հ˻�"></a></li>
			</ul>
		</div>
		<div class="totalpost"><h3><b>"<%=p_lsearchtext%>"</b> <!-- �˻���� <u>�� 7��</u> -->�� �˻������ �ֽ��ϴ�.</h3></div>
		<dl class="searchresult">
			<dt><img src="/images/2012/common/subject_onlinecourse.gif" alt="�¶��ΰ��� �˻� ���"></dt>
			<dd class="resultlist">
				 <%  // �¶��� ����
                        if(onLineSubjList.size()!=0)
                        {
                            for(int i=0;i<onLineSubjList.size();i++)
                            {                               
                                DataBox dbox =  onLineSubjList.get(i);
                                String biyong="";
                                String aHref_SubjValues="";
                                DecimalFormat df = new DecimalFormat("#,###");

                                String tmp=upperMap !=null && upperMap.get(dbox.get("d_scupperclass")) != null ?  upperMap.get(dbox.get("d_scupperclass")).toString() : "00";
                                aHref_SubjValues="'"+dbox.get("d_subj")+"','"+dbox.get("d_subjnm")+"','"+dbox.get("d_isonoff")+"','"+dbox.get("d_scupperclass")+"','"+dbox.get("d_uclassnm")+"','"+dbox.get("d_scyear")+"','"+dbox.get("d_subjseq")+"','";
                                aHref_SubjValues+=tmp+"'";
                                
                                v_titleprn = StringManager.replace(dbox.get("d_subjnm"), p_lsearchtext, "<b>" + p_lsearchtext + "</b>");
                                if (dbox.get("d_intro").length() > 80) {
                                	v_contentprn = StringManager.replace(dbox.get("d_intro").substring(0,80), p_lsearchtext, "<b>" + p_lsearchtext + "</b>");
                                } else {
                                	v_contentprn = StringManager.replace(dbox.get("d_intro"), p_lsearchtext, "<b>" + p_lsearchtext + "</b>");
                                }
                     %>
                     
				<p>
					<a href="javascript:whenSubjInfo(
									'<%=dbox.get("d_subj")%>',
									'<%=dbox.get("d_subjnm")%>',
									'<%=dbox.get("d_isonoff")%>',
									'<%=dbox.get("d_scupperclass")%>',
									'<%=dbox.get("d_uclassnm")%>',
									'<%=dbox.get("d_scyear")%>',
									'<%=dbox.get("d_subjseq")%>')" title="<%=dbox.get("d_subjnm")%>"><%=v_titleprn%></a><br>
					<%=v_contentprn%>...
				</p>
				<% }} %>	
				
				<% if (onLineSubjList.size()== 0) { %>
					<p> �¶���  ���� �� �˻� ����� �����ϴ�.</p>
				<% } %>			
			</dd>
			<!-- <dd class="plusabout"><b>></b> <a href="totalsearch_select.html" title="�¶��� �˻������ �� Ȯ���Ͻðڽ��ϱ�?">�� ���� ���� Ȯ���ϱ�</a></dd> -->
		</dl>
		<dl class="searchresult">
			<dt><img src="/images/2012/common/subject_offlinecourse.gif" alt="�������ΰ��� �˻� ���"></dt>
			<dd class="resultlist">
			 <%  // �������� ����
                        if(offLineSubjList.size()!=0)
                        {
                            for(int i=0;i<offLineSubjList.size();i++)
                            {                               
                                DataBox dbox =  offLineSubjList.get(i);
                                String biyong="";
                                String aHref_SubjValues="";
                                DecimalFormat df = new DecimalFormat("#,###");

                                String tmp=upperMap !=null && upperMap.get(dbox.get("d_scupperclass")) != null ?  upperMap.get(dbox.get("d_scupperclass")).toString() : "00";
                                aHref_SubjValues="'"+dbox.get("d_subj")+"','"+dbox.get("d_subjnm")+"','"+dbox.get("d_isonoff")+"','"+dbox.get("d_scupperclass")+"','"+dbox.get("d_uclassnm")+"','"+dbox.get("d_scyear")+"','"+dbox.get("d_subjseq")+"','";
                                aHref_SubjValues+=tmp+"'";
                                v_titleprn = StringManager.replace(dbox.get("d_subjnm"), p_lsearchtext, "<b>" + p_lsearchtext + "</b>");
                                v_contentprn = StringManager.replace(dbox.get("d_intro"), p_lsearchtext, "<b>" + p_lsearchtext + "</b>");
              %>
				<p>
					<a href="javascript:whenSubjInfoOff(
									'<%=dbox.get("d_subj")%>',
									'<%=dbox.get("d_year")%>',
									'<%=dbox.get("d_subjseq")%>',
									'<%=dbox.get("d_seq")%>')" title="<%=dbox.get("d_subjnm")%>"><%=v_titleprn%></a><br>
					<%=v_contentprn%>
				</p>
			<% }} %>	
			
				<% if(offLineSubjList.size()==0) { %>
					<p> �������� ���� �� �˻� ����� �����ϴ�.</p>
				<% } %>
			</dd>
			
			<!-- <dd class="plusabout"><b>></b> <a href="totalsearch_select.html" title="�������� �˻������ �� Ȯ���Ͻðڽ��ϱ�?">�� ���� ���� Ȯ���ϱ�</a></dd> -->
		</dl>		
	</div>

	
</form>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
