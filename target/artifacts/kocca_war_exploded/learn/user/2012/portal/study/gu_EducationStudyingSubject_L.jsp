<%
//**********************************************************
//  1. ��      ��: EDUCATION STUDYING SUBJECT PAGE
//  2. ���α׷���: zu_EducationStudyingSubject_L.jsp
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
<%@ page import = "com.credu.course.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

	box.put("topmenu","2");
	box.put("submenu","1");

	String server = conf.getProperty("game.url.value");

    String  v_process   = box.getString("p_process");
    String  v_user_id   = box.getSession("userid");
    String  v_grcode    = box.getSession("tem_grcode");

    String  v_gyear      =  "";
    String  v_grseq      =  "";
    String  v_upperclass =  "";
    String  v_isonoff    =  "";
    String  v_course     =  "";
    String  v_cyear      =  "";
    String  v_courseseq  =  "";
    String  v_coursenm   =  "";
    String  v_subj       =  "";
    String  v_subjseqgr  =  "";
    String  v_year       =  "";
    String  v_subjnm     =  "";
    String  v_subjseq    =  "";
    String  v_propend    =  "";
    String  v_edustart   =  "";
    String  v_eduend     =  "";
    String  v_eduurl     =  "";
    int     v_ieduurl    = 0;
    String  v_isnewcourse= "";
    String  v_chkfirst   =  "";
    String  v_chkfinal   =  "";
    String  v_cancelkind =  "";
    String  v_cpsubj     = "";
    String  v_cpsubjseq  = "";
    String  v_upperclassnm = "";
    String  v_middleclassnm = "";
    String  v_preurl    =  "";
    String v_hasPreviewObj = "";
    
    String  v_wj_classkey = "";
    String  v_edustartdt = "";
    
    String  v_isgraduated  = "";
    String  v_subjtarget   = "";
    String  v_isonoff_value= "";
    String  v_isgraduated_value="";
    String  v_today        =  FormatDate.getDate("yyyyMMdd");
    String  v_propenddate  = "";
    String  v_edustartdate = "";
    String  v_eduenddate   = "";
    String  v_reviewend    = "";
    String  v_cancelcheck  = "";
    String  v_proposetype  = "";
    String  v_isoutsourcing = "";
    String  v_isablereview = "";
    int	    v_reviewdays   = 0;
    String  v_reviewtype   = "";
    String  v_stuchkfinal  = "";
    String  v_company      = "";
    String  v_edulist_value= "";
    String  v_contenttype   ="";
    String  v_kind          = "";
    String  v_gubun         = "";
    String  v_serno         = "";
    String  v_pkey          = "";
    String  v_biyong        = "";
    String  v_isuseYn       = "";
    String  v_taxString     = "";
    String  v_isstudyyn     = "";

    String  v_tmp_subj  = "";
    String  v_iscourseYn = "";
    

	int v_pagesize = box.getInt("p_pagesize");
	int	 v_totalrowcount =  0;

    String  v_base64resno = "";
    int     v_total     = 0;
    int     i           = 0;
    int     l           = 0;
    int     v_subjcnt   = 0;

    int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0, v_tabseq = 0;

    // ����¡����
    int row      = Integer.parseInt(conf.getProperty("page.bulletin.row"));
    int v_pageno = box.getInt("p_pageno");   

    ArrayList list1     = null;
    //DEFINED class&variable END

    list1 = (ArrayList)request.getAttribute("EducationStudyingSubjectList");   //study.MyClassBean.selectEducationStudyingSubjectList(box)
    //out.println(list3.size());
    
//    SubjGongAdminBean control = new SubjGongAdminBean();

    int v_controlstudy = 0;
    String grcode=box.getSession("tem_grcode");
%>

<%@ include file="/learn/user/2012/portal/include/top.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<SCRIPT LANGUAGE="JavaScript">
<!--

function studyOpenRe() {
	document.form1.lessonRepopup.value = "1";
	var rurl = document.form1.lessonReurl.value;
	var riurl = document.form1.lessonReiurl.value;
	setTimeout("studyOpen('"+rurl+"','"+riurl+"');" ,100);
}

// �н�â OPEN
function studyOpen(url, iurl) {
<% if (box.getSession("gadmin").equals("ZZ")) {  %>
        document.form1.lessonReurl.value = url;
        document.form1.lessonReiurl.value = iurl;
        var s_url = url+"&p_iurl="+iurl;
 		//alert(s_url);
        if (url == '') {
            alert("������ �����ϴ�");
        } else {
            if (iurl == 0)
                open_window('openApp',s_url,0,0,0,0,false,false,false,true,true);
            else
                open_window('openApp',s_url,0,0,1024,768,false,false,false,'yes','yes');
        }
<%  } else {                                      %>
        alert ("�н��� ������ �ƴմϴ�.");
<%  }                                             %>
}

// �н�â OPEN (�ܺΰ��� : �����н���)
function studyOpen2(url, iurl, wj_classkey, edustart) {
<%  if (box.getSession("gadmin").equals("ZZ")) {  %>
        document.form1.lessonReurl.value = url;
        document.form1.lessonReiurl.value = iurl;
        var s_url = url+"&p_iurl="+iurl;

        //document.form1.wj_classkey.value = wj_classkey;

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

// �н��ð�����
function controlstudy() {
    alert("������ �н����� �ð��� �ƴմϴ�.");
    return;
}

// �н���Ȳ OPEN
function whenEdulist(subjnm, iurl, iseduend, url) {
    var ulink = url + "&p_subjnm=" + subjnm + "&p_iurl=" + iurl + "&p_iseduend=" + iseduend;
//alert( ulink);
    var new_Open = window.open(ulink,"eduList",'scrollbars=no,width=350,height=240,scrollbars=yes,resizable=no');
}

// ���������� POPUP
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

//�˻����뿡 �´� ����Ʈ �������� �̵�
function selectList() {
	document.form1.action = "/servlet/controller.study.MyClassServlet";
	document.form1.p_pageno.value = "1";
	document.form1.p_process.value = "EducationStudyingSubjectPage";
	document.form1.submit();
}

//������ �̵�
function goPage(pageNum) {

	document.form1.p_pageno.value = pageNum;
	document.form1.action = "/servlet/controller.study.MyClassServlet";
	document.form1.p_process.value = "EducationStudyingSubjectPage";
	document.form1.submit();

}
function pagesize(pageSize) {
	document.form1.target = "_self";
	document.form1.p_pageno.value = 1;
	document.form1.action = "/servlet/controller.study.MyClassServlet";
	document.form1.p_pagesize.value = pageSize;
	document.form1.p_process.value = "EducationStudyingSubjectPage";
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
    <input type='hidden' name='p_scsubjseq'   value ="">
    <input type='hidden' name='p_subjnm'    value ="">
    <input type='hidden' name='p_userid'    value ="">
    <input type='hidden' name='p_gubun'     value ="">
    <input type='hidden' name='p_rejectedreason'     value ="">
    <input type='hidden' name='p_isonoff'   value ="">
    <input type='hidden' name='p_kind' value="">
    <input type='hidden' name='p_grcode' value="<%=v_grcode %>">
    <input type='hidden' name='s_grcode' value="<%=v_grcode %>">
    <input type="hidden" name="p_pageno" value="<%= v_pageno %>">
	<input type="hidden" name="p_pagesize"  value="<%=v_pagesize%>"/>
    <!-- �н�â �ٽö���� 1:�ٽ� �ȶ���  2:�ٽö���(�н����������� �ݾ������) -->
    <input type='hidden' name='lessonRepopup' value="1">
    <input type='hidden' name='lessonReurl' value="">
    <input type='hidden' name='lessonReiurl' value="">
   <!-- <input type='hidden' name='wj_classkey' value="">-->
   
	<div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0">
			<tr>
				<td class="pagetitle"></td>
				<td class="pagenavi"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > ���ǰ��ǽ� ><u>�������� ����</u></td>
			</tr>
		</table>
		<div class="concept a01">
			<div class="titlemsg"><img src="/images/2012/sub/page1/title/learning_now.gif" alt="�������� ����"></div>
			<ul class="pagetab">
				<li><img src="/images/2012/sub/page1/tabmenu/online_on.png" alt="�¶��ΰ���"></li>
				<li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingOffSubjectPage" tabindex="171" title="ȸ���Բ��� �������� �������� ������ Ȯ���� �� �ֽ��ϴ�"><img src="/images/2012/sub/page1/tabmenu/offline_off.png" alt="�������ΰ���"></a></li>
			</ul>
		</div>
		<div class="myclass">
			<div class="listbar">
				<table class="listrable" cellpadding="0" cellspacing="0">
					<colgroup><col width="90"><col width="125"><col width="*"><col width="160"><col width="120"></colgroup>
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
						<th colspan="2">������</th>
						<th>�����Ⱓ</th>
						<th>�н�</th>
					</tr>
					 <%
						v_tmp_subj = "";
						l = 0;
						for(i = 0; i < list1.size(); i++) {
							DataBox dbox    = (DataBox)list1.get(i);
							String imgurl = dbox.getString("d_introducefilenamenew");
							v_upperclass    =  dbox.getString("d_upperclass");
					        v_isonoff       =  dbox.getString("d_isonoff");
							v_course        =  dbox.getString("d_course");
							v_cyear         =  dbox.getString("d_cyear");
							v_courseseq     =  dbox.getString("d_courseseq");
							v_coursenm      =  dbox.getString("d_coursenm");
							v_subj          =  dbox.getString("d_subj");
							v_year          =  dbox.getString("d_year");
							v_subjnm        =  dbox.getString("d_subjnm");
							v_subjseq       =  dbox.getString("d_subjseq");
							v_subjseqgr     =  dbox.getString("d_subjseqgr");
							v_edustart      =  dbox.getString("d_edustart");
							v_eduend        =  dbox.getString("d_eduend");
							v_eduurl        =  dbox.getString("d_eduurl");
							v_subjtarget    =  dbox.getString("d_subjtarget");
							v_isnewcourse   =  dbox.getString("d_isnewcourse");
							v_isoutsourcing =  dbox.getString("d_isoutsourcing");
							v_cpsubj        =  dbox.getString("d_cpsubj");
							v_cpsubjseq     =  dbox.getString("d_cpsubjseq");
							v_stuchkfinal   =  dbox.getString("d_stuchkfinal");
							v_company       =  dbox.getString("d_company");
							v_chkfinal      =  dbox.getString("d_chkfinal");
							v_upperclassnm  =  dbox.getString("d_upperclassnm");
							v_middleclassnm =  dbox.getString("d_middleclassnm");
							v_contenttype   =  dbox.getString("d_contenttype");
							v_biyong        =  dbox.getString("d_biyong");
							v_isuseYn       =  dbox.getString("d_isuseyn");
							v_isstudyyn     =  dbox.getString("d_isstudyyn");
					        v_wj_classkey   =  dbox.getString("d_wj_classkey");
					
					        v_dispnum	= dbox.getInt("d_dispnum");
					        v_totalpage	= dbox.getInt("d_totalpage");
					        		
							v_iscourseYn    = dbox.getString("d_isbelongcourse");
							v_subjcnt       = dbox.getInt("d_subjcnt");
					
					        v_edustartdt   =  v_edustart.substring(0,8);
							v_edustart      = FormatDate.getFormatDate(v_edustart,"yyyy.MM.dd");
							v_eduend        = FormatDate.getFormatDate(v_eduend,"yyyy.MM.dd");
							
							v_totalrowcount = dbox.getInt("d_totalrowcount");
							
							if (imgurl.equals("")) {
								imgurl = "/images/2012/common/not_image.gif";
							} else {
								imgurl = "http://edu.kocca.or.kr/upload/bulletin/"+imgurl;
							}
					
							if(v_subjtarget.equals(""))     {   v_subjtarget    =   "�����";   }
					
					        // �н�url=������ ���..
					        if(v_eduurl.equals("")) { v_ieduurl = 0; }else{ v_ieduurl = 1; }
					
					        // �н���Ȳ
					        v_edulist_value = "/servlet/controller.contents.EduStart?p_process=eduList&p_subj="+ v_subj +"&p_year="+ v_year +"&p_subjseq="+v_subjseq+"&p_userid="+v_user_id;
					        //�н�URL?FIELD1=���&FIELD2=�����⵵&FIELD3=���־�ü�����ڵ�&FIELD4=���־�ü��������
					        //FIELD1="+v_userid+"&FIELD2="+v_gyear+"&FIELD3="+v_cpsubj+"&FIELD4="+v_cpsubjseq;
					        //out.println(v_isoutsourcing.equals("Y"));
					
					        if (v_isoutsourcing.equals("Y")) {                 //��Ź�����϶�
					
					            v_eduurl = "/servlet/controller.contents.EduStart";
					            v_eduurl += "?FIELD1=" + v_user_id + "&FIELD2=" + v_year + "&FIELD3=" + v_cpsubj + "&FIELD4=" + v_cpsubjseq + "&FIELD99=" + v_company+"&FIELD100=N"+ "&contenttype=" + v_contenttype+ "&p_subj=" + v_subj +"&p_year="+ v_year +"&p_subjseq="+v_subjseq;
					        } else {//�ܺΰ����� �ƴѰ��
								 //���� ���� ���.. v_eduurl = EduEtc1Bean.make_eduURL(v_subj,v_year,v_subjseq);
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
					            v_eduurl +=  "&contenttype=" + v_contenttype;
					        }
					%>
					
					<tr class="listmiddle" onmouseover="this.style.background='#fbfbfb'" onmouseout="this.style.background=''">
						<td class="linefirst"><%= v_upperclassnm %></td>
						<td class="courseimg"><img src="<%=imgurl%>" class="course" alt="<%=v_subjnm%>"></td>
						<td class="title courselist" id="bboardfocus<%=i+1%>">
							<a href="javascript:whenSubjInfoPopup('<%=v_subj%>','<%=v_subjnm%>','<%=v_isonoff%>')" onfocus="boardfocus('b',<%=i+1%>)" onblur="boardfocus('b',<%=i+1%>)" tabindex="<%="2"+i+"1"%>" title="[<%= v_edustart %>~<%= v_eduend %>] <%= v_subjnm %>��(��) �Ұ��մϴ�"><%= v_subjnm %></a>
<!--						<img src="/images/2012/common/icon/icon_online.gif" alt="�¶��ΰ���">-->
							<br><img src="/images/2012/common/icon/icon_pc.gif" alt="PC�н�"> 
							<!-- <img src="/images/2012/common/icon/icon_mobile.gif" alt="������н�"> -->
						</td>
						<td><%= v_edustart %>~<%= v_eduend %></td>
						<td class="learnactive">
							<% if ("Y".equals(v_isstudyyn)) { %>
							<button type="button" tabindex="<%="2"+i+"2"%>" onclick="javascript:whenEdulist('<%=v_subjnm%>','<%=v_ieduurl%>','','<%=v_edulist_value%>')" class="btn_nomal_white" title="�� ������ �н���Ȳ�� Ȯ���� �� �ֽ��ϴ�">�н���Ȳ</button><br>
							<button type="button" tabindex="<%="2"+i+"3"%>" onclick="javascript:studyOpen('<%=v_eduurl%>','<%=v_ieduurl%>')" class="btn_nomal_darkmint" title="�� ������ ���Ǹ� �����մϴ�">�н��ϱ�</button>
							<% } else { %> �н���
							<% } %>
						</td>
					</tr>
					<% } %>
					 <%	if(i == 0){	 %>
				     <tr><td colspan="5" align="center">�н����� ������ �����ϴ�.</td></tr>
				   <% } %>
				</table>
			</div>
			<div class="pageset">
				<%= PageUtil.re2012_printPageListDiv(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
			</div>
		</div>
	</div>

<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
