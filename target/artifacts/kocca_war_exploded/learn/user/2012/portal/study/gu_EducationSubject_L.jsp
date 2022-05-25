<%
//**********************************************************
//  1. ��      ��: EDUCATION SUBJECT PAGE
//  2. ���α׷���: gu_EducationSubject_L.jsp
//  3. ��      ��: ���ǰ��ǽ�
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.12.30
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
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />
<jsp:useBean id = "MyClassBean" class = "com.credu.study.MyClassBean"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

	box.put("topmenu","2");
	box.put("submenu","0");

    String server = conf.getProperty("game.url.value");

    String  v_process   = box.getString("p_process");
    String  v_user_id   = box.getSession("userid");
    String  v_name      = box.getSession("name");
    String  v_grcode    = box.getSession("tem_grcode");
    String  v_lglast    = box.getSession("lglast");
    String  v_wj_classkey = "";
    String  v_edustartdt = "";


    String  v_gubun      =  "";
    String  v_gubun_value=  "";
    double  v_price      =  0;
    String  v_tid           = "";
    String  v_goodname      = "";
    String  v_resultcode    = "";
    String  v_pgauthdate    = "";
    String  v_cancelyn      = "";
    String  v_paystatus     = "";
    String  v_pay_status_text = "";
    String  v_ldate         = "";
    String  v_seq           = "";
    String  v_sphere        = "";
    String  v_listgubun     = "";
    
    String  v_isonoff    =  "";
    String  v_subj       =  "";
    String  v_year       =  "";
    String  v_subjnm     =  "";
    String  v_subjseq    =  "";
    String  v_edustart   =  "";
    String  v_eduend     =  "";
    String  v_eduurl     =  "";
    int     v_ieduurl    = 0;
    String  v_cpsubj     = "";
    String  v_cpsubjseq  = "";

    String  v_isoutsourcing = "";
    String  v_company       = "";
    String  v_edulist_value = "";
    String  v_contenttype   ="";

    int     i           =  0;
    
    //������
    ArrayList	listStudyingList	= (ArrayList)request.getAttribute("selectStudyingList");
    ArrayList	listBillList		= (ArrayList)request.getAttribute("selectBillList");
    ArrayList	listInterestList	= (ArrayList)request.getAttribute("selectInterestList");

    //ȭ�鿡 ������ ������
    String  v_studyhistorycnt	= box.getString("p_studyhistorycnt");	//�����̷� �Ǽ�
    double  v_mypoint			= box.getDouble("p_mypoint");			//���� ����Ʈ
    String  v_onstudycnt		= box.getString("p_onstudycnt");		//���� �¶��� ���� �Ǽ�
    String  v_offstudycnt		= box.getString("p_offstudycnt");		//���� �������� ���� �Ǽ�
    String  v_message			= box.getString("p_message");			//������ ���
    String  v_subjqnacnt		= box.getString("p_subjqnacnt");		//����������
    String  v_qnacnt			= box.getString("p_qnacnt");			//Q&A
    String  v_counselcnt		= box.getString("p_counselcnt");		//1vs1
    String  v_myeventcnt		= box.getString("p_myeventcnt");		//�����̺�Ʈ
    String  v_mywineventcnt		= box.getString("p_mywineventcnt");		//���Ǵ�÷�̺�Ʈ
    String  v_myworkshopcnt		= box.getString("p_myworkshopcnt");		//���ǿ�ũ��
    String	v_iproposehistoryycnt = box.getString("p_iProposeHistoryYCnt"); //���� ������û �̷°Ǽ�(�¶���/��������)
    String	v_iproposehistorybcnt = box.getString("p_iProposeHistoryBCnt"); //���� ������û �̷°Ǽ�(�¶���/���δ��)
    String	v_ioffproposehistoryucnt = box.getString("p_iOffProposeHistoryUCnt"); //���� ������û �̷°Ǽ�(��������/���δ��)
    String	v_ioffproposehistoryycnt = box.getString("p_iOffProposeHistoryYCnt"); //���� ������û �̷°Ǽ�(��������/��������)

    // �н���������
    int v_controlstudy = 0;
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
<%      if (box.getSession("gadmin").equals("ZZ")) {  %>
			document.form1.lessonReurl.value = url;
			document.form1.lessonReiurl.value = iurl;
            var s_url = url+"&p_iurl="+iurl;
//    alert(s_url);
           if (url == '') {
               alert("������ �����ϴ�");
           } else {
               if (iurl == 0)
                open_window('openApp',s_url,0,0,0,0,false,false,false,true,true);
               else
                open_window('openApp',s_url,0,0,1024,768,false,false,false,'yes','yes');
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
// �н��ð�����
function controlstudy() {
    alert("������ �н����� �ð��� �ƴմϴ�.");
    return;
}

// �н���Ȳ OPEN
function whenEdulist(subjnm, iurl, iseduend, url) {
//alert(url);
    var ulink = url + "&p_subjnm=" + subjnm + "&p_iurl=" + iurl + "&p_iseduend=" + iseduend;
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

//�¶��� ������������ ��ȸ
function fnOnPayInfo(p_tid) {
	window.self.name = "winProposePage";
	open_window("openPayInfo","","100","100","550","450","no","no","no","yes","yes");
	document.form1.target = "openPayInfo";
	document.form1.p_tid.value = p_tid;
	document.form1.action='/servlet/controller.study.MyClassBillServlet';
	document.form1.p_process.value = 'PayInfoPage';
	document.form1.submit();
    document.form1.target = window.self.name;
}

//�������� ������������ ��ȸ
function fnOffPayInfo(p_listgubun, p_tid, p_subj, p_year, p_subjseq, p_seq) {
	window.self.name = "winProposePage";
	open_window("openPayInfo","","100","100","550","450","no","no","no","yes","yes");
	document.form1.target = "openPayInfo";
	document.form1.p_tid.value = p_tid;
	document.form1.p_listgubun.value = p_listgubun;
	document.form1.p_subj.value = p_subj;
	document.form1.p_year.value = p_year;
	document.form1.p_subjseq.value = p_subjseq;
	document.form1.p_seq.value = p_seq;
	document.form1.action='/servlet/controller.study.MyClassBillServlet';
	document.form1.p_process.value = 'OffPayInfoPage';
	document.form1.submit();
    document.form1.target = window.self.name;
}

//���� ���뺸��
function whenSubjInfo(subj,tabnum){
 document.form1.p_subj.value     = subj;
 document.form1.p_tabnum.value   = tabnum;
 document.form1.p_process.value  = 'SubjectPreviewPage';
 document.form1.p_rprocess.value = 'SubjectList';
 document.form1.action='/servlet/controller.course.CourseIntroServlet';
 document.form1.target = "_self";
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
    <input type='hidden' name='p_tid'       value ="">
    <input type='hidden' name='p_seq'       value ="">
    <input type='hidden' name='p_tabnum'    value ="">
    <input type='hidden' name='p_rprocess'  value ="">
    <input type='hidden' name='p_listgubun'  value ="">
    <!-- �н�â �ٽö���� 1:�ٽ� �ȶ���  2:�ٽö���(�н����������� �ݾ������) -->
    <input type='hidden' name='lessonRepopup' value="1">
    <input type='hidden' name='lessonReurl' value="">
    <input type='hidden' name='lessonReiurl' value="">
    
	<div class="content">
		<table class="pageinfo" cellpadding="0" cellspacing="0">
			<tr>
				<td class="pagetitle"></td>
				<td class="pagenavi"><img src="/images/2012/sub/icon_home.gif" alt="Ȩ"> Ȩ > <u>���� ���ǽ�</u></td>
			</tr>
		</table>
		<div class="myclassheader">
			<table class="userinfo" cellpadding="0" cellspacing="0">
				<colgroup><col width="120"><col width="*"><col width="120"><col width="216"></colgroup>
				<tr>
					<td colspan="4" class="username"><h2><span><%= v_name %></span>���� ���ǽ��Դϴ�.</h2></td>
				</tr>
				<tr>
					<th>���� �α���</th>
					<td><%= FormatDate.getFormatDate(v_lglast,"yyyy.MM.dd HH:mm") %></td>
					<th>���� �����̷�</th>
					<td><b><%= v_studyhistorycnt %></b> ȸ</td>
				</tr>
				<tr>
					<th>�������� ����</th>
					<td colspan="3">�¶��� <b><%= v_onstudycnt %></b> �� / �������� <b><%= v_offstudycnt %></b> �� </td>
				</tr>
			</table>
		</div>
		<div class="myclassmiddle">
			<div class="playing"><img src="/images/2012/sub/page1/subject_playing_course.png" alt="�������� ����"></div>
			<div class="listbar">
				<table class="listrable" cellpadding="0" cellspacing="0">
					<colgroup><col width="90"><col width="*"><col width="160"><col width="120"></colgroup>
					<tr class="listhead">
						<th>����</th>
						<th>������</th>
						<th>�����Ⱓ</th>
						<th>�н�</th>
					</tr>
					<%
          for(i = 0; i < listStudyingList.size(); i++) {
              DataBox dbox    = (DataBox)listStudyingList.get(i);
              
              v_gubun         =  dbox.getString("d_gubun");
              v_subj          =  dbox.getString("d_subj");
              v_year          =  dbox.getString("d_year");
              v_subjseq       =  dbox.getString("d_subjseq");
              v_subjnm        =  dbox.getString("d_subjnm");
              v_edustart      =  dbox.getString("d_edustart");
              v_eduend        =  dbox.getString("d_eduend");
              v_contenttype   =  dbox.getString("d_contenttype");
              v_eduurl		=  dbox.getString("d_eduurl");

              v_wj_classkey   =  dbox.getString("d_wj_classkey");
              v_edustartdt    =  v_edustart.substring(0,8);

              v_edustart      = FormatDate.getFormatDate(v_edustart,"yyyy.MM.dd");
              v_eduend        = FormatDate.getFormatDate(v_eduend,"yyyy.MM.dd");

              if(v_gubun.equals("ON"))      {   v_gubun_value =   "�¶���";
              }else if(v_gubun.equals("OFF")){  v_gubun_value =   "��������";     }

              // �н�url=������ ���..
              if(v_eduurl.equals("")) { v_ieduurl = 0; }else{ v_ieduurl = 1; }

              // �н���Ȳ
              v_edulist_value = "/servlet/controller.contents.EduStart?p_process=eduList&p_subj="+ v_subj +"&p_year="+ v_year +"&p_subjseq="+v_subjseq+"&p_userid="+v_user_id;

              if (v_isoutsourcing.equals("Y")) {                 //��Ź�����϶�

                  v_eduurl = "/servlet/controller.contents.EduStart";
                  v_eduurl += "?FIELD1=" + v_user_id + "&FIELD2=" + v_year + "&FIELD3=" + v_cpsubj + "&FIELD4=" + v_cpsubjseq + "&FIELD99=" + v_company+"&FIELD100=N"+ "&contenttype=" + v_contenttype+ "&p_subj=" + v_subj +"&p_year="+ v_year +"&p_subjseq="+v_subjseq;
              } else {
//                	v_eduurl = EduEtc1Bean.make_eduURL(v_subj,v_year,v_subjseq);  //�ܺΰ����� �ƴѰ��
//                    v_eduurl +=  "&contenttype=" + v_contenttype;
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

              if(v_isonoff.equals("OFF")){
                  v_eduurl = "/servlet/controller.study.OffEduStartServlet?p_process=selectFrame&p_subj="+v_subj+"&p_year="+v_year+"&p_subjseq="+v_subjseq;
              }
              // �н��ð�����
      		// v_controlstudy = control.allowStudy(box, v_subj, v_year, v_subjseq);
					%>      
					<tr class="listmiddle" onmouseover="this.style.background='#fbfbfb'" onmouseout="this.style.background=''">
						<td class="linefirst"><%= v_gubun_value %></td>
						<td class="title"><%=v_subjnm%></td>
						<td><%= v_edustart %>~<%= v_eduend %></td>
						<td class="learnactive">
						<%
						if ("ON".equals(v_gubun)) { 
							if (v_controlstudy >0) {  %>                        	        
          	  	<button type="button" tabindex="<%=i+170%>" onClick="javscript:controlstudy()" class="btn_nomal_darkmint" title="�� ������ ���Ǹ� �����մϴ�">�н��ϱ�</button>
          		<% } else { %>
          			<button type="button" tabindex="<%=i+170%>" onClick="javscript:studyOpen('<%=v_eduurl%>','<%=v_ieduurl%>')" class="btn_nomal_darkmint" title="�� ������ ���Ǹ� �����մϴ�">�н��ϱ�</button>
          		<%
          			}
             	}else{
          		%>
             &nbsp;
             <%} %>
						</td>
					</tr>
				<% } %>	
				</table>
			</div>
		</div>
		<ul class="myclassbottom">
			<li>
				<img src="/images/2012/sub/page1/subject_mycounsel.gif" alt="���� ��㳻��">
				<table class="postcounsel" cellspacing="0" cellpadding="0">
					<tr>
						<th id="ktxtfocus1"><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage&p_type=SUBJ" onfocus="txtlink('k',1)" onblur="txtlink('k',1)" tabindex="201" title="�������������� �̵��մϴ�">����������</a></th>
						<td><b><%= v_subjqnacnt %></b> ��</td>
					</tr>
					<tr>
						<th id="ktxtfocus2"><a href="http://172.16.80.83:7001/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage&p_type=PQ" onfocus="txtlink('k',2)" onblur="txtlink('k',2)" tabindex="202" title="Ȩ������ �̿� ���Ƿ� �̵��մϴ�">Ȩ������ �̿� ����</a></th>
						<td><b><%= v_qnacnt %></b> ��</td>
					</tr>
					<tr>
						<th id="ktxtfocus3"><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage&p_type=MM" onfocus="txtlink('k',3)" onblur="txtlink('k',3)" tabindex="203" title="1:1������� �̵��մϴ�">1:1���</a></th>
						<td><b><%= v_counselcnt %></b> ��</td>
					</tr>
				</table>
			</li>
			<li class="btmcenter">
				<img src="/images/2012/sub/page1/subject_request.gif" alt="������û Ȯ��/���">
				<table class="postrequest" cellspacing="0" cellpadding="0">
					<tr>
						<th rowspan="2" id="ktxtfocus4"><a href="/servlet/controller.study.MyClassServlet?p_process=ProposeHistoryPage" onfocus="txtlink('k',4)" onblur="txtlink('k',4)" tabindex="204" title="�¶��� ������û ������� �̵��մϴ�">�¶���</a></th>
						<td class="requestconfirm">���δ��</td>
						<td><b><%=v_iproposehistorybcnt %></b> ��</td>
					</tr>
					<tr>
						<td class="requestconfirm">��������</td>
						<td><b><%=v_iproposehistoryycnt %></b> ��</td>
					</tr>
					<tr>
						<th rowspan="2" id="ktxtfocus5"><a href="/servlet/controller.study.MyClassServlet?p_process=ProposeOffHistoryPage" onfocus="txtlink('k',5)" onblur="txtlink('k',5)" tabindex="205" title="�������� ������û ������� �̵��մϴ�">��������</a></th>
						<td class="requestconfirm">���δ��</td>
						<td><b><%=v_ioffproposehistoryucnt %></b> ��</td>
					</tr>
					<tr>
						<td class="requestconfirm">��������</td>
						<td><b><%=v_ioffproposehistoryycnt %></b> ��</td>
					</tr>
				</table>
			</li>
			<li class="btmright">
				<a href="http://kocca.anyhelp.net" target="remote" tabindex="206"><img src="/images/2012/sub/page1/myclass_banner_01.gif" alt="������������"></a><br>
				<a href="javascript:menuForward('4','05');" tabindex="207"><img src="/images/2012/sub/page1/myclass_banner_02.gif" alt="����ȯ�漳���ϱ�"></a>
			</li>
		</ul>
	</div>
</form>
<%@ include file="/learn/user/2012/portal/include/footer.jsp"%>
