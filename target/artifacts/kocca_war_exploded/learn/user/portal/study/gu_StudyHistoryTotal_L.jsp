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

    String  v_user_id   = box.getSession("userid");
    String  v_process   = box.getString("p_process");
    String  v_selectcode= box.getStringDefault("p_selectcode", "ALL");
	String	 v_grcode	= box.getSession("tem_grcode");

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

<%@ include file="/learn/user/portal/include/top.jsp"%>
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
	kind = '1';
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
        <td><img src="/images/portal/homepage_renewal/myclass/stitle_03.gif" alt="���� �����̷�" /></td>
        <td class="h_road">Home &gt; ���� ���ǽ�  &gt; <strong>���� �����̷�</strong></td>
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
        <td><img src="/images/portal/homepage_renewal/myclass/bar_02.jpg" width="672" height="104" /></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>
    </table>
    <!--Ÿ��Ʋ�κ�//-->
    
      <!--�Ǻκ�-->
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><a href="/servlet/controller.study.MyClassServlet?p_process=StudyHistoryList" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image55','','/images/portal/homepage_renewal/myclass/tab_on_001.gif',1)"><img src="/images/portal/homepage_renewal/myclass/tab_on_001.gif" name="Image55" id="Image55" /></a></td>
          <td><a href="/servlet/controller.study.MyClassServlet?p_process=StudyHistoryOffList" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('Image56','','/images/portal/homepage_renewal/myclass/tab_on_002.gif',1)"><img src="/images/portal/homepage_renewal/myclass/tab_off_002.gif" name="Image56" id="Image56" /></a></td>
        </tr>
      </table>
      <!--�Ǻκ�//-->
      
      <!--���̺�κ�-->
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td class="tit_table">
          	<kocca_select:select name="p_upperclass" sqlNum="upperclass"  param=" "
	              onChange="selectList();" attr="�з�" selectedValue="<%= v_upperclass %>" isLoad="true" all="none" type="3"/>
          </td>
          <td class="tit_table"> ������  </td>
          <td class="tit_table">�����Ⱓ</td>
          <td class="tit_table">�����Ⱓ</td>
          <td class="tit_table">����</td>
          <td class="tit_table">����</td>
          <td class="tit_table">���Ῡ��</td>
          <td class="tit_table_right">������</td>
        </tr>
        
        <%    //double v_score = 0;
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
            v_score			= dbox.getDouble("d_tstep");
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

//			if (v_reviewtype.equals("D")) {
//				if (StringManager.toInt(v_today) > StringManager.toInt(FormatDate.getDateAdd(FormatDate.getFormatDate(v_eduend,"yyyyMMdd"),"yyyyMMdd", "date", v_reviewdays - 1)) ) {
//					v_isablereview = "N";
//				}
//			} else if (v_reviewtype.equals("W")) {
//				if (StringManager.toInt(v_today) > StringManager.toInt(FormatDate.getDateAdd(FormatDate.getFormatDate(v_eduend,"yyyyMMdd"),"yyyyMMdd", "date", v_reviewdays * 7 - 1)) ) {
//					v_isablereview = "N";
//				}
//			} else if (v_reviewtype.equals("M")) {
//				if (StringManager.toInt(v_today) > StringManager.toInt(FormatDate.getDateAdd(FormatDate.getFormatDate(v_eduend,"yyyyMMdd"),"yyyyMMdd", "month", v_reviewdays)) ) {
//					v_isablereview = "N";
//				}
//			} else if (v_reviewtype.equals("Y")) {
//				if (StringManager.toInt(v_today) > StringManager.toInt(FormatDate.getDateAdd(FormatDate.getFormatDate(v_eduend,"yyyyMMdd"),"yyyyMMdd", "year", v_reviewdays)) ) {
//					v_isablereview = "N";
//				}
//			}

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
        
        <tr>
          <td class="ct_tit_table"><%= v_upperclassnm %></td>
          <td class="ct_tit_table_left"><a href="javascript:whenSubjInfoPopup('<%= v_subj %>','<%= v_subjnm %>','<%= v_isonoff %>')"><%= v_subjnm %></a></td>
          <td class="ct_tit_table_left"><%= v_edustart %>~<%= v_eduend %></td>
          <td class="ct_tit_table_left"><%= v_reviewstart %>~<%= v_reviewend %></td>
          <td class="ct_tit_table">
          	<%--<%if(v_isablereview.equals("Y") && v_isgraduated.equals("����")){%>--%>
                <%if(v_isablereview.equals("Y") && (v_isgraduated.equals("����") || v_isgraduated.equals("�̼���")) ) {%>
                    <% if ("N000031".equals(v_grcode) && !v_wj_classkey.equals("")) {  %>
                        <a href="javascript:studyOpen2('<%=v_eduurl%>','<%=v_ieduurl%>', '<%=v_wj_classkey%>', '<%=v_edustartdt%>')" class="board_btn2"><span><img src="/images/portal/homepage_renewal/myclass/btn_again.jpg" alt="����" /></span></a>
                    <% }  else {  %>
                        <a href="javascript:studyOpen('<%= v_eduurl %>','<%= v_ieduurl %>')" class="board_btn2"><span><img src="/images/portal/homepage_renewal/myclass/btn_again.jpg" alt="����" /></span></a>
                    <% }%>
                <%}else{%>
                &nbsp;
                <%} %>
		  </td>
          <td class="ct_tit_table">
          	<strong class="btxt">
          		<%--<% if(!v_subjgrcode.equals("N000001") && v_eduend.substring(0,8).compareTo("20100831")<1) {%>--%>
                    <%--<a href="javascript:alert('�̰��� ����Ÿ�� �� ������ ���Ǽ� �����ϴ�.')" class="board_btn2"><span class="fw_b"><%= v_score %></span></a>--%>
				<% if (!v_subj.equals("")) {  %>
					<a href="javascript:whenEdulist('<%= v_subjnm %>','Y','<%= v_edulist_value %>')" class="board_btn2"><%= v_score %></a>
				<%}else{%>
				  -
				<%}%>
          	</strong>
          </td>
          <td class="ct_tit_table"><%= v_isgraduated %></td>
          <td class="ct_tit_table_right">          	
          	<%if(!v_subj.equals("") && v_isgraduated.equals("����")){%>
				  <a href="javascript:suRoyJeung('<%= v_subj %>','<%= v_year %>','<%= v_subjseq %>','<%= v_user_id %>','<%= v_kind %>','<%= v_subjgrcode %>')" class="board_btn2">
				  <img src="/images/portal/homepage_renewal/myclass/btn_print.jpg" alt="�μ�" /></a>
				<%}else{%>
				  -
				<%}%>
          </td>
        </tr>
        <%
		}
%>
<%
		if(i == 0){
%>
            <tr>
                <td colspan="8">�����̷��� �����ϴ�.</td>
            </tr>
              <%
        }
%>
        <tr>
          <td height="1" colspan="8" bgcolor="CACACA"></td>
        </tr>
        <tr>
          <td height="4" colspan="8" bgcolor="F7F7F7"></td>
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
    
    		<h2><img src="/images/portal/myclass/h2_tit2.gif" alt="���Ǳ����̷�" class="fl_l" /><p class="category">Home > ���ǰ��ǽ� > <strong>���Ǳ����̷�</strong></p></h2>
 
			<%--<p class="myclass_tab cltxt_2"><img src="/images/portal/myclass/myclass_online_tab1_on.gif" alt="�¶��ΰ���" /><a href="/servlet/controller.study.MyClassServlet?p_process=StudyHistoryOffList"><img src="/images/portal/myclass/myclass_online_tab2_off.gif" alt="�������ΰ���" onmouseover="imgover(this);" onmouseout="imgout(this);" /></a></p>--%>
             <img src="/images/portal/myclass/edu_borimg.gif" alt="" style="width:681px;background-position: left 18px;background-repeat: no-repeat;">
            <p style="line-height:7px">&nbsp;</p>
    <% if(grcode.equals("N000001")) {%>
            <img src="/images/portal/btn/btn_online_on.gif" alt="�¶��ΰ���"><a href="/servlet/controller.study.MyClassServlet?p_process=StudyHistoryOffList"><img src="/images/portal/btn/btn_offline_off.gif" alt="�������ΰ���" onmouseover="imgover(this);" onmouseout="imgout(this);" /></a>
    <%}%>
			<table class="board_list">
			<colgroup><col width="90px" /><col width="200px" /><col width="78px" /><col width="78px" /><col width="62px" /><col width="62px" /><col width="65px" /><col width="62px" /></colgroup>
			<thead>
			<tr class="myclass">
				<th><p><kocca_select:select name="p_upperclass" sqlNum="upperclass"  param=" "
	              onChange="selectList();" attr="�з�" selectedValue="<%= v_upperclass %>" isLoad="true" all="none" type="3"/>
                </p></th>
				<th><p>������</p></th>
				<th><p>�����Ⱓ</p></th>
				<th><p>�����Ⱓ</p></th>
				<th><p>����</p></th>
				<th><p>����</p></th>
				<th><p>���Ῡ��</p></th>
				<th class="end"><p>������</p></th>
			</tr>
			</thead>
			<tbody>
        <%    //double v_score = 0;
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
            v_score			= dbox.getDouble("d_tstep");
            v_eduurl			= dbox.getString("d_eduurl");
            v_dispnum	= dbox.getInt("d_dispnum");
            v_totalpage	= dbox.getInt("d_totalpage");

			v_iscourseYn 	= dbox.getString("d_isbelongcourse");
			v_subjcnt		= dbox.getInt("d_subjcnt");

			v_subjgrcode 	= dbox.getString("d_grcode");

%>
			<tr onmouseover="className='over'" onmouseout="className=' '">
				<td><%= v_upperclassnm %></td>
				<td class="ta_l"><a href="javascript:whenSubjInfoPopup('<%= v_subj %>','<%= v_subjnm %>','<%= v_isonoff %>')"><%= v_subjnm %></a></td>
				<td class="ta_l num"><%= v_edustart %>~<br/> <%= v_eduend %></td>
				<td class="ta_l num"><%= v_reviewstart %>~<br/> <%= v_reviewend %></td>
				<td>
                <%if(v_isablereview.equals("Y") && v_isgraduated.equals("����")){%>
                <%--if(v_isablereview.equals("Y") && (v_isgraduated.equals("����") || v_isgraduated.equals("�̼���")) ) {--%>
                    <% if ("N000031".equals(v_grcode) && !v_wj_classkey.equals("")) {  %>
                        <a href="javascript:studyOpen2('<%=v_eduurl%>','<%=v_ieduurl%>', '<%=v_wj_classkey%>', '<%=v_edustartdt%>')" class="board_btn2"><span>����</span></a>
                    <% }  else {  %>
                        <a href="javascript:studyOpen('<%= v_eduurl %>','<%= v_ieduurl %>')" class="board_btn2"><span>����</span></a>
                    <% }%>
                <%}%>
                </td>
				<td>
                <%--<% if(!v_subjgrcode.equals("N000001") && v_eduend.substring(0,8).compareTo("20100831")<1) {%>--%>
                    <%--<a href="javascript:alert('�̰��� ����Ÿ�� �� ������ ���Ǽ� �����ϴ�.')" class="board_btn2"><span class="fw_b"><%= v_score %></span></a>--%>
				<% if (!v_subj.equals("")) {  %>
					<a href="javascript:whenEdulist('<%= v_subjnm %>','Y','<%= v_edulist_value %>')" class="board_btn2"><span class="fw_b"><%= v_score %></span></a>
				<%}else{%>
				  -
				<%}%>
				</td>
				<td><%= v_isgraduated %></td>
				<td>
				<%if(!v_subj.equals("") && v_isgraduated.equals("Y")){%>
				  <a href="javascript:suRoyJeung('<%= v_subj %>','<%= v_year %>','<%= v_subjseq %>','<%= v_user_id %>','<%= v_kind %>','<%= v_subjgrcode %>')" class="board_btn2"><span>�μ�</span></a>
				<%}else{%>
				  <%-- <a href="javascript:suRoyJeung('<%= v_subj %>','<%= v_year %>','<%= v_subjseq %>','<%= v_user_id %>','<%= v_kind %>','<%= v_subjgrcode %>')" class="board_btn2"><span>�μ�</span></a> --%>
				  -
				<%}%>
				</td>
			</tr>
<%
		}
%>
<%
		if(i == 0){
%>
            <tr>
                <td colspan="8">�����̷��� �����ϴ�.</td>
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