<%
//**********************************************************
//  1. ��      ��: STUDY HISTORY LIST
//  2. ���α׷���: zu_StudyHistoryTotal_L.jsp
//  3. ��      ��: ���α����̷�
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2003. 8. 27
//  7. ��      ��:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    
    box.put("topmenu","2");
	box.put("submenu","2");

    String  v_user_id   = box.getSession("userid");
    String  v_process   = box.getString("p_process");
    String  v_selectcode= box.getStringDefault("p_selectcode", "ALL");
	String	v_grcode	= box.getSession("tem_grcode");

    String  v_wj_classkey = "";
    String  v_edustartdt = "";

    String  v_upperclass	= "";
    String  v_isonoff   	= "";
    String  v_course    	= "";
    String  v_cyear     	= "";
    String  v_courseseq 	= "";
    String  v_coursenm  	= "";
    String  v_subj      	= "";
    String  v_year      	= "";
    String  v_subjnm    	= "";
    String  v_subjseq   	= "";
    String  v_subjseqgr 	= "";
    String  v_edustart  	= "";
    String  v_eduend    	= "";
    String  v_edustart1 	= "";
    String  v_eduend1   	= "";
    String  v_place     	= "";
    String  v_edu_org_nm	= "";
    String  v_kind      	= "";
    String  v_isgraduated	= "";
    String  v_isnewcourse	= "";
    String  v_isonoff_value	= "";
    String  v_kind_value 	= "";
    String  v_serno      	= "";
    String  v_pkey       	= "";
    String  v_gubun      	= "";
    String  v_eduurl     	= "";
    int     v_ieduurl    	= 0;
    String  v_cpsubj     	= "";
    String  v_cpsubjseq  	= "";
    String  v_isoutsourcing = "";
    String  v_reviewtype	= "";
    int	    v_reviewdays	= 0;
    String  v_reviewstart	= "";
    String  v_reviewend		= "";
    String	v_isablereview	= "";
    String  v_today			= FormatDate.getDate("yyyyMMdd");
    double	v_score			= 0d;

	String  v_tmp_subj		= "";
	String  v_iscourseYn	= "";

    String  v_upperclassnm	= "";
    String  v_middleclassnm	= "";
    String  v_edulist_value = "";
    String  v_company		= "";
    String  v_contenttype   = "";

    String  v_subjgrcode   = "";
    
    double v_credit     	= 0;
    double v_creditexam  	= 0;
    
    int     v_total     	= 0;
    int     i           	= 0;
    int     l           	= 0;
	int		v_subjcnt		= 0;

    int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0, v_tabseq = 0;

    // ����¡����
    int row      = Integer.parseInt(conf.getProperty("page.bulletin.row"));
    int v_pageno = box.getInt("p_pageno");   

	ArrayList list      = null;
    //DEFINED class&variable END

    list = (ArrayList)request.getAttribute("StudyHistoryList");
    String grcode=box.getSession("tem_grcode");
%>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--

// �н���Ȳ OPEN
function whenEdulist(subjnm, iseduend, url) {
    var ulink = url + "&p_subjnm=" + subjnm + "&p_iseduend=" + iseduend;
    var new_Open = window.open(ulink,"eduList",'scrollbars=no,width=350,height=240,scrollbars=yes,resizable=no');
}

//���������� POPUP
function whenSubjInfoPopup(subj,subjnm,isonoff){
    window.self.name = "SubjList";
    window.open("", "openSubjInfo", "scrollbars=no,width=720,height=350,scrollbars=yes,resizable=yes'");
    document.form1.target = "openSubjInfo"

    document.form1.p_subj.value = subj;
    document.form1.p_subjnm.value = subjnm;
    document.form1.p_isonoff.value = isonoff;
    document.form1.p_process.value = 'SubjectPreviewPopup';
    document.form1.action='/servlet/controller.propose.ProposeCourseServlet';
    document.form1.submit();

    document.form1.target = window.self.name;
}

//������ ���
function suRoyJeung(subj,year,subjseq,userid, kind,subjgrcode){
	window.self.name = "SuryoJeung";
	var new_Open = window.open("","openSuryoJeungPrint",'scrollbars=no,width=830,height=800,scrollbars=yes,resizable=NO');
	
	document.form1.target = "openSuryoJeungPrint";
	document.form1.action = "/servlet/controller.polity.DiplomaAdminServlet";
	
	//document.form1.action = "/learn/admin/polity/RexViewer.jsp?pRptNames=__Diploma_Kocca&pRptParams=lee1^N000001^2006^cbu001^0001";
	document.form1.p_subj.value = subj;
	document.form1.p_year.value = year;
	document.form1.p_scsubjseq.value = subjseq;
	document.form1.p_userid.value = userid;
	document.form1.p_kind.value = kind;
	document.form1.p_grcode.value = subjgrcode;
	document.form1.p_process.value = "DiplomaPrint";
	document.form1.submit();
    document.form1.target = window.self.name;
}

function studyOpenRe() {
	document.form1.lessonRepopup.value = "1";
	var rurl = document.form1.lessonReurl.value;
	var riurl = document.form1.lessonReiurl.value;
	setTimeout("studyOpen('"+rurl+"','"+riurl+"');" ,100);
}

// �н�â OPEN
function studyOpen(url, iurl) {
<%      if (box.getSession("gadmin").equals("ZZ")) {  %>
			document.form1.lessonReurl.value = url;
			document.form1.lessonReiurl.value = iurl;
            var s_url = url+"&p_iurl="+iurl;
//	    alert(s_url);
           if (url == '') {
               alert("������ �����ϴ�");
           } else {
               if (iurl == 0)
                open_window('openApp',s_url,0,0,0,0,false,false,true,true,true);
               else
                open_window('openApp',s_url,0,0,1024,768,false,false,'yes','yes','yes');
           }
<%      } else {                                      %>
            alert ("�н��� ������ �ƴմϴ�.");
<%      }                                             %>
}

// �н�â OPEN (�ܺΰ��� : �����н���)
function studyOpen2(url, iurl, wj_classkey, edustart) {
<%  if (box.getSession("gadmin").equals("ZZ")) {  %>
        document.form1.lessonReurl.value = url;
        document.form1.lessonReiurl.value = iurl;
        var s_url = url+"&p_iurl="+iurl;

        if (url == '') {
            alert("������ �����ϴ�");
        } else {
            s_url ="http://kocca.campus21.co.kr/enterclass.asp?userid="+'<%=v_user_id%>'+"&classkey="+wj_classkey+"&edustart="+ edustart ;

          //  if (iurl == 0)
          //      open_window('openApp',s_url,0,0,0,0,false,false,true,true,true);
          //  else
                open_window('openApp',s_url,0,0,1024,768,false,false,'yes','yes','yes');
        }
<% } else {                                      %>
        alert ("�н��� ������ �ƴմϴ�.");
<% }                                             %>
}

//�˻����뿡 �´� ����Ʈ �������� �̵�
function selectList() {
	document.form1.action = "/servlet/controller.study.MyClassServlet";
	document.form1.p_pageno.value = "1";
	document.form1.p_process.value = "StudyHistoryList";
	document.form1.submit();
}

//������ �̵�
function goPage(pageNum) {

	document.form1.p_pageno.value = pageNum;
	document.form1.action = "/servlet/controller.study.MyClassServlet";
	document.form1.p_process.value = "StudyHistoryList";
	document.form1.submit();

}
//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- Form ���� ���� -->
<form name= "form1" method= "post">
    <input type='hidden' name='p_process'>
    <input type='hidden' name='p_sel'       value="<%=box.getString("p_sel")%>">
    <input type='hidden' name='p_subj'      value="">
    <input type='hidden' name='p_subjnm'    value ="">
    <input type='hidden' name='p_grcode'    value ="">
    <input type='hidden' name='s_grcode'    value="<%=v_grcode%>">
    <input type='hidden' name='p_year'      value="">
    <input type='hidden' name='s_subj'      value="">
    <input type='hidden' name='p_scsubjseq' value="">
    <input type='hidden' name='p_subjseq'   value="">
    <input type='hidden' name='p_userid'    value="">
    <input type='hidden' name='p_kind'      value="">
    <input type='hidden' name='p_isonoff'   value ="">
    <input type = "hidden" name = "p_pageno"		value = "<%= v_pageno %>">
    <!-- �н�â �ٽö���� 1:�ٽ� �ȶ���  2:�ٽö���(�н����������� �ݾ������) -->
    <input type='hidden' name='lessonRepopup' value="1">
    <input type='hidden' name='lessonReurl' value="">
    <input type='hidden' name='lessonReiurl' value="">
    
	<div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0">
			<tr>
				<td class="pagetitle"></td>
				<td class="pagenavi"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > ���ǰ��ǽ� ><u>���� �����̷�</u></td>
			</tr>
		</table>
		<div class="concept a02">
			<div class="titlemsg"><img src="/images/2012/sub/page1/title/learning_finish.gif" alt="���� �����̷�"></div>
			<ul class="pagetab">
				<li><img src="/images/2012/sub/page1/tabmenu/online_on.png" alt="�¶��ΰ���"></li>
				<li><a href="/servlet/controller.study.MyClassServlet?p_process=StudyHistoryOffList" tabindex="171" title="ȸ������ �������ΰ��� �����̷��� Ȯ���� �� �ֽ��ϴ�"><img src="/images/2012/sub/page1/tabmenu/offline_off.png" alt="�������ΰ���"></a></li>
			</ul>
		</div>
		<div class="myclass">
			<div class="listbar">
				<table class="listrable" cellpadding="0" cellspacing="0">
					<colgroup><col width="90"><col width="*"><col width="140"><col width="140"><col width="80"><col width="60"><col width="60"><col width="80"></colgroup>
					<tr class="listhead">
						<th>ī�װ�
							<!-- <select class="classification">
								<option>��ü</option>
								<option>��ȹ</option>
								<option>����</option>
								<option>����</option>
								<option>�濵����</option>
								<option>Ư��</option>
								<option>�濵����</option>
								<option>��������</option>
							</select> -->
						</th>
						<th>������</th>
						<th>�����Ⱓ</th>
						<th>�����Ⱓ</th>
						<th>����</th>
						<th>����</th>
						<th>���Ῡ��</th>
						<th>������</th>
					</tr>
					<%    
					for(i = 0; i < list.size(); i++) {
						DataBox dbox = (DataBox)list.get(i);
			
						v_isonoff     	= dbox.getString("d_isonoff");
						v_course      	= dbox.getString("d_course");
						v_cyear       	= dbox.getString("d_cyear");
						v_courseseq   	= dbox.getString("d_courseseq");
						v_coursenm    	= dbox.getString("d_coursenm");
						v_subj        	= dbox.getString("d_subj");
						v_subjseqgr   	= dbox.getString("d_subjgr");
						v_year        	= dbox.getString("d_year");
						v_subjseq     	= dbox.getString("d_subjseq");
						v_subjnm      	= dbox.getString("d_subjnm");
						v_edustart    	= dbox.getString("d_edustart");
						v_eduend      	= dbox.getString("d_eduend");
						v_credit      	= dbox.getDouble("d_credit");
						v_creditexam  	= dbox.getDouble("d_creditexam");
						v_place       	= dbox.getString("d_place");
						v_isgraduated 	= dbox.getString("d_isgraduated");
						v_serno       	= dbox.getString("d_serno");
						v_pkey        	= dbox.getString("d_pkey");
						v_gubun       	= dbox.getString("d_gubun");
						v_iscourseYn  	= dbox.getString("d_isbelongcourse");
						v_isoutsourcing	= dbox.getString("d_isoutsourcing");
			            v_cpsubj        = dbox.getString("d_cpsubj");
			            v_cpsubjseq     = dbox.getString("d_cpsubjseq");
						v_kind        	= dbox.getString("d_kind");
						v_upperclassnm 	= dbox.getString("d_uclassnm");
						v_middleclassnm	= dbox.getString("d_mclassnm");
						v_reviewtype	= dbox.getString("d_reviewtype");
						v_reviewdays	= dbox.getInt("d_reviewdays");
						v_reviewstart	= dbox.getString("d_reviewstart");
						v_isablereview	= dbox.getString("d_isablereview");
			            v_company       = dbox.getString("d_company");
			            v_contenttype   = dbox.getString("d_contenttype");
			            v_score			= dbox.getDouble("d_score");
			            v_eduurl			= dbox.getString("d_eduurl");
			            v_dispnum	= dbox.getInt("d_dispnum");
			            v_totalpage	= dbox.getInt("d_totalpage");
			
						v_iscourseYn 	= dbox.getString("d_isbelongcourse");
						v_subjcnt		= dbox.getInt("d_subjcnt");
			
						v_subjgrcode 	= dbox.getString("d_grcode");
			
			            v_wj_classkey   =  dbox.getString("d_wj_classkey");
			            v_edustartdt   =  v_edustart.substring(0,8);
			
						if (v_reviewtype.equals("D")) {
							v_reviewend = FormatDate.getDateAdd(FormatDate.getFormatDate(v_reviewstart,"yyyyMMdd"),"yyyyMMdd", "date", v_reviewdays - 1);
						} else if (v_reviewtype.equals("W")) {
							v_reviewend = FormatDate.getDateAdd(FormatDate.getFormatDate(v_reviewstart,"yyyyMMdd"),"yyyyMMdd", "date", v_reviewdays * 7 - 1);
						} else if (v_reviewtype.equals("M")) {
							v_reviewend = FormatDate.getDateAdd(FormatDate.getFormatDate(v_reviewstart,"yyyyMMdd"),"yyyyMMdd", "month", v_reviewdays);
						} else if (v_reviewtype.equals("Y")) {
							v_reviewend = FormatDate.getDateAdd(FormatDate.getFormatDate(v_reviewstart,"yyyyMMdd"),"yyyyMMdd", "year", v_reviewdays);
						}
			
			            int reviewPlusDay=3; //����ó�� �Ⱓ�� �ִ� 3���̶� 3���� ������
			            v_reviewend=FormatDate.getFormatDate(FormatDate.getDateAdd(FormatDate.getFormatDate(v_reviewend,"yyyyMMdd"),"yyyyMMdd", "date", v_reviewdays +reviewPlusDay), "yyyy.MM.dd");
			            String convertReviewEnd=FormatDate.getFormatDate(v_reviewend,"yyyyMMdd");
			
			            if(StringManager.toInt(v_today) >StringManager.toInt(convertReviewEnd))
			                v_isablereview = "N";
			
						if (v_reviewend.equals("")) {
							v_isablereview = "N";
						}
			
						v_reviewstart	= FormatDate.getFormatDate(v_reviewstart,"yyyy.MM.dd");
						v_edustart		= FormatDate.getFormatDate(v_edustart,"yyyy.MM.dd");
						v_eduend		= FormatDate.getFormatDate(v_eduend,"yyyy.MM.dd");
			
						if(v_isgraduated.equals("A"))       v_isgraduated = "-";
			            else if(v_isgraduated.equals("B"))  v_isgraduated = "ó����"; 
						else if(v_isgraduated.equals("Y"))  v_isgraduated = "����";
			            else if(v_isgraduated.equals("N"))  v_isgraduated = "�̼���";
			
			
						// ���� �ڷ��̸�
						if (v_kind.equals("2")) {
							v_edulist_value = "/servlet/controller.contents.EduStart?p_process=eduList&p_subj="+ v_pkey +"&p_year="+ v_year +"&p_subjseq="+v_subjseq+"&p_userid="+v_user_id+"&p_kind=2";
							// �����ڵ� ����
							v_subj = v_pkey;
						} else {
							v_edulist_value = "/servlet/controller.contents.EduStart?p_process=eduList&p_subj="+ v_subj +"&p_year="+ v_year+"&p_subjseq="+v_subjseq+"&p_userid="+v_user_id;
						}
						
			            // ���� �ڷ��̸�
			            if (v_kind.equals("2")) {
			
			            } else {
			                if (v_isoutsourcing.equals("Y")) {                 //ũ����
			                    v_eduurl = v_eduurl+"?FIELD1="+v_user_id+"&FIELD2="+ v_year+"&FIELD3="+v_cpsubj+"&FIELD4=" +v_cpsubjseq+ "&FIELD99="+ v_company+ "&FIELD100=Y";
			                    v_ieduurl = 1;
			                } else {//�ܺΰ����� �ƴѰ��
			        			// ���� ���� ���.. v_eduurl = EduEtc1Bean.make_eduURL(v_subj,v_year,v_subjseq);
			        			if (v_eduurl.equals("")){
			        				v_eduurl = "/servlet/controller.contents.EduStart?p_subj="+v_subj;
			        			}
			
			        			if (!v_year.equals(""))
			        				v_eduurl = v_eduurl+"&p_year="+v_year+"&p_subjseq=";
			        			else 
			        				v_eduurl = v_eduurl+"&p_year=2000&p_subjseq=";
			        			if(!v_subjseq.equals(""))
			        				v_eduurl = v_eduurl+v_subjseq;
			        			else v_eduurl = v_eduurl+"0001";
			                    v_eduurl +=  "&contenttype=" + v_contenttype+"&p_review=Y";
			                    v_ieduurl = 0;
			                }
			            }
					%>
					
					<tr class="listmiddle" onmouseover="this.style.background='#fbfbfb'" onmouseout="this.style.background=''">
						<td class="linefirst"><%= v_upperclassnm %></td>
						<td class="title" id="bboardfocus<%=i+1%>"><a href="javascript:whenSubjInfoPopup('<%= v_subj %>','<%= v_subjnm %>','<%= v_isonoff %>')" onfocus="boardfocus('b',<%=i+1%>)"  onblur="boardfocus('b',<%=i+1%>)" tabindex="<%="2"+i+"1"%>" title="<%= v_subjnm %>"><%= v_subjnm %></a></td>
						<td><%= v_edustart %>~<%= v_eduend %></td>
						<td>
							<%if(v_isablereview.equals("Y") && v_isgraduated.equals("����")){%>
								<%= v_reviewstart %>~<%= v_reviewend %>
							<%}else{ %>
								-
							<%} %>
						</td>
						<td>
							<%//if(v_isablereview.equals("Y") && (v_isgraduated.equals("����") || v_isgraduated.equals("�̼���")) ) {
							if(v_isablereview.equals("Y") && v_isgraduated.equals("����")){%>
	           		<button type="button" tabindex="<%="2"+i+"2"%>" onclick="javascript:studyOpen('<%= v_eduurl %>','<%= v_ieduurl %>')" class="btn_small_gray" title="�� ������ ������ �� �ֽ��ϴ�">����</button>
	            <% }%>
						</td>
						
						<td id="btxtfocus<%=i+1%>">
						
						<% if ((!v_subj.equals("")) && (!v_isgraduated.equals("ó����"))) {  %>
							<a href="javascript:whenEdulist('<%= v_subjnm %>','Y','<%= v_edulist_value %>')" onfocus="txtlink('b',<%=i+1%>)"  onblur="txtlink('b',<%=i+1%>)" tabindex="<%="2"+i+"3"%>" class="board_btn2"><%= v_score %></a>
						<%}else{%>
						  	-
						<%}%>
						
						
						</td>
						<td><%= v_isgraduated %></td>
						<td>
							<%if(!v_subj.equals("") && v_isgraduated.equals("����")){%>
							 <button type="button" tabindex="<%="2"+i+"4"%>" onclick="javascript:suRoyJeung('<%= v_subj %>','<%= v_year %>','<%= v_subjseq %>','<%= v_user_id %>','<%= v_kind %>','<%= v_subjgrcode %>')" class="btn_small_gray" title="Ŭ���Ͻø� �������� �μ��� �� �ֽ��ϴ�">�μ�</button>
							<%}else{%>
							  -
							<%}%>
						</td>
					</tr>
					 <% } %>
					 <%	if(i == 0){	 %>
				     <tr><td colspan="5" align="center" class="linefirst">�н����� ������ �����ϴ�.</td></tr>
				     <% } %>
				</table>
			</div>
			<div class="pageset">
				<%=PageUtil.re2012_printPageListDiv(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
			</div>
		</div>
	</div>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
