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

<%@ include file="/learn/user/portal/include/top.jsp"%>
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
        <td><img src="/images/portal/homepage_renewal/myclass/stitle_01.gif" alt="���� ���ǽ� Ȩ" /></td>
        <td class="h_road">Home &gt; ���� ���ǽ�  &gt; <strong>���� ���ǽ� Ȩ</strong></td>
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
        <td height="200" valign="top" background="/images/portal/homepage_renewal/myclass/bg_myclass.jpg"><table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="99" colspan="2" valign="bottom"><strong class="btxt"><%= v_name %></strong>�� ���������Դϴ�</td>
            </tr>
          <tr>
            <td height="20" colspan="2">&nbsp;</td>
            </tr>
          <tr>
            <td height="20"><span class="org"><strong>��</strong></span>�����α��� : <strong><%= FormatDate.getFormatDate(v_lglast,"yyyy.MM.dd HH:mm") %></strong></td>
            <td><strong class="org">��</strong>���� �����̷� : <strong><%= v_studyhistorycnt %></strong>ȸ </td>
            </tr>
          <tr>
            <td height="20" colspan="2"><strong class="org">��</strong>�������ΰ��� : �¶���<strong> <%= v_onstudycnt %></strong>��/��������<strong> <%= v_offstudycnt %></strong>�� </td>
            </tr>
        </table></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="10" colspan="4">&nbsp;</td>
        </tr>
      <tr>
        <td width="20" height="40"><img src="/images/portal/homepage_renewal/common/icon_blue.jpg"/></td>
        <td width="332"><img src="/images/portal/homepage_renewal/myclass/sstitle_01.gif"/></td>
        <td width="279"><div align="right" class="h_road">[��<strong><%= listStudyingList.size() %></strong>��]  </div></td>
        <td width="41"><div align="right"><a href="javascript:menuForward('3','11');"><img src="/images/portal/homepage_renewal/myclass/btn_more.gif" /></a></div></td>
      </tr>
    </table>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="tit_table">����</td>
        <td class="tit_table">������</td>
        <td colspan="2" class="tit_table_right">�����Ⱓ</td>
        </tr>
        <%
            for(i = 0; i < listStudyingList.size() && i<4; i++) {
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
      <tr>
        <td class="ct_tit_table"><%= v_gubun_value %></td>
        <td class="ct_tit_table_left"><%=v_subjnm%></td>
        <td class="ct_tit_table"><%= v_edustart %>~<%= v_eduend %></td>
        <td class="ct_tit_table_right"><% if ("ON".equals(v_gubun)) { 
								if (v_controlstudy >0) {         %>
                        	        <a href="javascript:controlstudy()"><img src="/images/portal/homepage_renewal/myclass/btn_study.jpg" alt="�н��ϱ�" /></a>
                        <% 		} else {                         %>
                                <% if ("N000031".equals(v_grcode) && !v_wj_classkey.equals("")) {  %>
                                        <a href="javascript:studyOpen2('<%=v_eduurl%>','<%=v_ieduurl%>', '<%=v_wj_classkey%>', '<%=v_edustartdt%>')"><img src="/images/portal/homepage_renewal/myclass/btn_study.jpg" alt="�н��ϱ�" /></a>
                                <% 	} else { %>
                                        <a href="javascript:studyOpen('<%=v_eduurl%>','<%=v_ieduurl%>')"><img src="/images/portal/homepage_renewal/myclass/btn_study.jpg" alt="�н��ϱ�" /></a>
                                <% 	}  %>
                        <% 		}
                           }else{    %>
                           &nbsp;
                           <%} %>
                           </td>
      </tr>
      	<%
            }
		%>
      <tr>
        <td height="1" colspan="4" bgcolor="CACACA"></td>
      </tr>
      <tr>
        <td height="4" colspan="4" bgcolor="F7F7F7"></td>
      </tr>
    </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="40"><img src="/images/portal/homepage_renewal/myclass/sss_img_01.gif" /></td>
            <td><img src="/images/portal/homepage_renewal/myclass/ssstitle_01.gif"  /></td>
            <td class="h_road">
            	<a href="javascript:menuForward('3','12')">
            	<img src="/images/portal/homepage_renewal/myclass/btn_more.gif" />
            	</a>
            </td>
          </tr>
          <tr>
            <td height="1" colspan="3" bgcolor="e7e7e7"></td>
            </tr>
        </table>
          <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="e7e7e7">
            <tr>
              <td bgcolor="#FFFFFF"><div align="center"><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage&p_type=SUBJ" class="fl_l">����������</a></div></td>
              <td bgcolor="#FFFFFF"><div align="center"><span class="btxt"><%= v_subjqnacnt %></span>��</div></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF"><div align="center"><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage&p_type=PQ" class="fl_l">Q&A</a></div></td>
              <td bgcolor="#FFFFFF"><div align="center"><span class="btxt"><%= v_qnacnt %></span>��</div></td>
            </tr>
            <tr>
              <td bgcolor="#FFFFFF"><div align="center"><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage&p_type=MM" class="fl_l">1:1����</a></div></td>
              <td bgcolor="#FFFFFF"><div align="center"><span class="btxt"><%= v_counselcnt %></span>��</div></td>
            </tr>            
          </table></td>
        <td>&nbsp;</td>
        <td>
	        <!--<table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td width="40"><img src="/images/portal/homepage_renewal/myclass/sss_img_02.gif" /></td>
	            <td><img src="/images/portal/homepage_renewal/myclass/ssstitle_02.gif"  /></td>
	            <td class="h_road">
	            	<a href="javascript:menuForward('3','18')">
	            	<img src="/images/portal/homepage_renewal/myclass/btn_more.gif" />
	            	</a>
	            </td>
	          </tr>
	          <tr>
	            <td height="1" colspan="3" bgcolor="e7e7e7"></td>
	          </tr>
	        </table>
	          <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="e7e7e7">
	
	            <tr>
	              <td height="62" bgcolor="f7f7f7"><div align="center">
	                ��  <span class="btxt"><%= listInterestList.size() %></span>���� ���� ������ �ֽ��ϴ�.</div>                </td>
	              </tr>
	          </table>-->
	          <table width="100%" border="0" cellspacing="0" cellpadding="0">
	          <tr>
	            <td width="40"><img src="/images/portal/homepage_renewal/myclass/sss_img_03.gif" /></td>
	            <td><img src="/images/portal/homepage_renewal/myclass/ssstitle_03.gif"  /></td>
	            <td class="h_road">
	            	<a href="javascript:menuForward('3','17')">
	            	<img src="/images/portal/homepage_renewal/myclass/btn_more.gif" />
	            	</a>
	            </td>
	          </tr>
	          <tr>
	            <td height="1" colspan="3" bgcolor="e7e7e7"></td>
	          </tr>
	        </table>
	        <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="e7e7e7">
	            <tr>
				  <td rowspan="2" bgcolor="#FFFFFF">
					<div align="center">
						<a href="/servlet/controller.study.MyClassServlet?p_process=ProposeHistoryPage">
						<strong>�¶���</strong>
						</a>
					</div>
				  </td>
	              <td bgcolor="#FFFFFF">
					<div align="center">
						���δ��
					</div>
				  </td>
	              <td bgcolor="#FFFFFF">
					<div align="center">
						<span class="btxt"><%=v_iproposehistorybcnt %></span>��
					</div>
				  </td>
	            </tr>
	
				<tr>
				  <td bgcolor="#FFFFFF">
					<div align="center">
						��������
					</div>
				  </td>
	              <td bgcolor="#FFFFFF">
					<div align="center">
						<span class="btxt"><%=v_iproposehistoryycnt %></span>��
					</div>
				  </td>
				 </tr>
	
				 <tr>
				  <td rowspan="2" bgcolor="#FFFFFF">
					<div align="center">
						<a href="/servlet/controller.study.MyClassServlet?p_process=ProposeOffHistoryPage">
						<strong>��������</strong>
						</a>
					</div>
				  </td>
	              <td bgcolor="#FFFFFF">
					<div align="center">
						���δ��
					</div>
				  </td>
	              <td bgcolor="#FFFFFF">
					<div align="center">
						<span class="btxt"><%=v_ioffproposehistoryucnt %></span>��
					</div>
				  </td>
	            </tr>
	
				<tr>
				  <td bgcolor="#FFFFFF">
					<div align="center">
						��������
					</div>
				  </td>
	              <td bgcolor="#FFFFFF">
					<div align="center">
						<span class="btxt"><%=v_ioffproposehistoryycnt %></span>��
					</div>
				  </td>
				 </tr>
	          </table>
         </td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <!--<tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="40"><img src="/images/portal/homepage_renewal/myclass/sss_img_03.gif" /></td>
            <td><img src="/images/portal/homepage_renewal/myclass/ssstitle_03.gif"  /></td>
            <td class="h_road">
            	<a href="javascript:menuForward('3','17')">
            	<img src="/images/portal/homepage_renewal/myclass/btn_more.gif" />
            	</a>
            </td>
          </tr>
          <tr>
            <td height="1" colspan="3" bgcolor="e7e7e7"></td>
          </tr>
        </table>
          
		  
		  <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="e7e7e7">
            <tr>
			  <td rowspan="2" bgcolor="#FFFFFF">
				<div align="center">
					<a href="/servlet/controller.study.MyClassServlet?p_process=ProposeHistoryPage">
					<strong>�¶���</strong>
					</a>
				</div>
			  </td>
              <td bgcolor="#FFFFFF">
				<div align="center">
					���δ��
				</div>
			  </td>
              <td bgcolor="#FFFFFF">
				<div align="center">
					<span class="btxt"><%=v_iproposehistorybcnt %></span>��
				</div>
			  </td>
            </tr>

			<tr>
			  <td bgcolor="#FFFFFF">
				<div align="center">
					��������
				</div>
			  </td>
              <td bgcolor="#FFFFFF">
				<div align="center">
					<span class="btxt"><%=v_iproposehistoryycnt %></span>��
				</div>
			  </td>
			 </tr>

			 <tr>
			  <td rowspan="2" bgcolor="#FFFFFF">
				<div align="center">
					<a href="/servlet/controller.study.MyClassServlet?p_process=ProposeOffHistoryPage">
					<strong>��������</strong>
					</a>
				</div>
			  </td>
              <td bgcolor="#FFFFFF">
				<div align="center">
					���δ��
				</div>
			  </td>
              <td bgcolor="#FFFFFF">
				<div align="center">
					<span class="btxt"><%=v_ioffproposehistoryucnt %></span>��
				</div>
			  </td>
            </tr>

			<tr>
			  <td bgcolor="#FFFFFF">
				<div align="center">
					��������
				</div>
			  </td>
              <td bgcolor="#FFFFFF">
				<div align="center">
					<span class="btxt"><%=v_ioffproposehistoryycnt %></span>��
				</div>
			  </td>
			 </tr>
          </table>
		  
		  
		  
		  </td>
        <td>&nbsp;</td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="40"><img src="/images/portal/homepage_renewal/myclass/sss_img_04.gif" /></td>
            <td><img src="/images/portal/homepage_renewal/myclass/ssstitle_04.gif"  /></td>
            <td class="h_road">
            	<a href="javascript:menuForward('3','19')">
            	<img src="/images/portal/homepage_renewal/myclass/btn_more.gif" />
            	</a>
            </td>
          </tr>
          <tr>
            <td height="1" colspan="3" bgcolor="e7e7e7"></td>
          </tr>
        </table>
          <table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="e7e7e7">
            <tr>
              <td height="91" bgcolor="f7f7f7"><div align="center">
                 �� <span class="btxt"><%= listBillList.size() %></span>���� ���������� �ֽ��ϴ�.
              </div></td>
            </tr>
          </table></td>
      </tr>
    --></table>
    <!--Ÿ��Ʋ�κ�//-->
    </td>
    <td width="20">&nbsp;</td>
    
  </tr>
</table>
      	
      	<%}else{ %>

			<div class="myclass_visualbox">
				<p class="tit"><img src="/images/portal/myclass/main_tit.gif" alt="My Class" class="va_m" /> <strong><%= v_name %>��</strong> ���������Դϴ�.</p>
				<ul>
					<li class="le">�����α��� : <%= FormatDate.getFormatDate(v_lglast,"yyyy.MM.dd HH:mm") %></li>
					<li class="ri">���� �����̷� : <%= v_studyhistorycnt %>ȸ</li>
					<li class="le">��������Ʈ : <%= new java.text.DecimalFormat("###,###,##0").format(v_mypoint) %> ����Ʈ </li>
					<li class="ri">�������ΰ��� : �¶��� <%= v_onstudycnt %>��/��������  <%= v_offstudycnt %>��</li>
				</ul>
				<p class="saying"><%= v_message %></p>
			</div>
 
			<div class="main_warp">
				<div class="myclass_left">
					<p class="main_stit"><img src="/images/portal/myclass/main_stit_1.gif" alt="�������� ����" class="fl_l" /><a href="javascript:menuForward('3','11');" class="fl_r"><span>[�� <strong><%= listStudyingList.size() %></strong>��]</span> <img src="/images/portal/btn/btn_txt_more.gif" alt="������" /></a></p>
 
					<table class="main_list">
					<!--[if ie]><colgroup><col width="72px" /><col width="210" /><col width="198" /><![endif]-->
					<colgroup><col width="82px" /><col width="220" /><col width="198" /></colgroup>
					<thead>
					<tr class="myclass1">
						<th><img src="/images/portal/myclass/main_table_tit1.gif" alt="����" /></th>
						<th><img src="/images/portal/myclass/main_table_tit2.gif" alt="������" /></th>
						<th class="end"><img src="/images/portal/myclass/main_table_tit3.gif" alt="�����Ⱓ" /></th>
					</tr>
					</thead>
					<tbody>
<%
            for(i = 0; i < listStudyingList.size() && i<4; i++) {
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
					<tr>
						<td class="ta_l"><%= v_gubun_value %></td>
						<td class="ta_l"><%=v_subjnm%></td>
						<td class="num"><span class="data"><%= v_edustart %>~<%= v_eduend %></span>
						<% if ("ON".equals(v_gubun)) { 
								if (v_controlstudy >0) {         %>
                        	        <a href="javascript:controlstudy()" class="my_btn">�н��ϱ�</a>
                        <% 		} else {                         %>
                                <% if ("N000031".equals(v_grcode) && !v_wj_classkey.equals("")) {  %>
                                        <a href="javascript:studyOpen2('<%=v_eduurl%>','<%=v_ieduurl%>', '<%=v_wj_classkey%>', '<%=v_edustartdt%>')" class="my_btn">�н��ϱ�</a>
                                <% 	} else { %>
                                        <a href="javascript:studyOpen('<%=v_eduurl%>','<%=v_ieduurl%>')" class="my_btn">�н��ϱ�</a>
                                <% 	}  %>
                        <% 		}
                           }    %>
						</td>
					</tr>
<%
            }
%>
					</tbody>
					</table>
 
					<p class="main_stit mg_t30"><img src="/images/portal/myclass/main_stit_2.gif" alt="������ ���� ��ȸ/����" class="fl_l" /><a href="javascript:menuForward('3','19');" class="fl_r"><span>[�� <strong><%= listBillList.size() %></strong>��]</span> <img src="/images/portal/btn/btn_txt_more.gif" alt="������" /></a></p>
 
					<table class="main_list">
					<!--[if ie]><colgroup><col width="289px" /><col width="64" /><col width="80" /><col width="65" /><![endif]-->
					<colgroup><col width="299px" /><col width="64" /><col width="80" /><col width="65" /></colgroup>
					<thead>
					<tr class="myclass2">
						<th><img src="/images/portal/myclass/main_table_tit4.gif" alt="������" /></th>
						<th><img src="/images/portal/myclass/main_table_tit5.gif" alt="������" /></th>
						<th><img src="/images/portal/myclass/main_table_tit6.gif" alt="��������" /></th>
						<th class="end"><img src="/images/portal/myclass/main_table_tit7.gif" alt="��������" /></th>
					</tr>
					</thead>
					<tbody>
<%
            for(i = 0; i < listBillList.size() && i<4; i++) {
                DataBox dbox    = (DataBox)listBillList.get(i);
                
                v_gubun         =  dbox.getString("d_gubun");
                v_tid           =  dbox.getString("d_tid");
                v_goodname      =  dbox.getString("d_goodname");
                v_price         =  dbox.getDouble("d_price");
                v_resultcode    =  dbox.getString("d_resultcode");
                v_pgauthdate    =  dbox.getString("d_pgauthdate");
                v_cancelyn      =  dbox.getString("d_cancelyn");
                v_paystatus     =  dbox.getString("d_paystatus");
                v_ldate         =  dbox.getString("d_ldate");
                v_subj          =  dbox.getString("d_subj");
                v_year          =  dbox.getString("d_year");
                v_subjseq       =  dbox.getString("d_subjseq");
                v_seq           =  dbox.getString("d_seq");
                v_listgubun     =  dbox.getString("d_listgubun");
                
                v_pgauthdate    = FormatDate.getFormatDate(v_pgauthdate,"yyyy.MM.dd");

                if(v_gubun.equals("ON"))      {   v_gubun_value =   "�¶���";
                }else if(v_gubun.equals("OFF")){  v_gubun_value =   "��������";     }
                
				if ("99".equals(v_resultcode)) {
					v_pay_status_text = "�̰���";
				} else if ("00".equals(v_resultcode) && "Y".equals(v_cancelyn)) {
					v_pay_status_text = "��ҿϷ�";
				} else if ("00".equals(v_resultcode) && "N".equals(v_cancelyn)) {
					v_pay_status_text = "�����Ϸ�";
				}
%>
					<tr>
						<td class="ta_l">
<%
				if ("ON".equals(v_gubun)) {
%>
							<a href="javascript:fnOnPayInfo('<%= v_tid %>')"><%= v_goodname %></a>
<%
				} else {
%>
							<a href="javascript:fnOffPayInfo('<%= v_listgubun %>','<%= v_tid %>','<%= v_subj %>','<%= v_year %>','<%= v_subjseq %>','<%= v_seq %>')"><%= v_goodname %></a> 
<%
				}
%>
						</td>
						<td class="ta_r num"><%= new java.text.DecimalFormat("###,###,##0").format(v_price) %></td>
						<td class="num"><%= v_pgauthdate %></td>
						<td><span class="fi"><%= v_pay_status_text %></span>
							<%//= "99".equals(v_resultcode) ? "<a href=\"#\" class=\"ing\">�����ϱ�</a>" : "<span class=\"fi\">" + v_pay_status_text + "</span>" %>
						</td>
					</tr>
<%
            }
%>
					</tbody>
					</table>
 
					<ul class="main_banner">
						<li><a href="javascript:menuForward('3','18');"><img src="/images/portal/myclass/main_banner1.gif" alt="��ٱ���" /></a></li>
						<li><a href="javascript:menuForward('3','17');"><img src="/images/portal/myclass/main_banner2.gif" alt="������ûȮ��/���" /></a></li>
						<li><a href="javascript:menuForward('3','16');"><img src="/images/portal/myclass/main_banner3.gif" alt="��������Ʈ" /></a></li>
						<li class="bgn"><a href="javascript:menuForward('3','15');"><img src="/images/portal/myclass/main_banner4.gif" alt="�н�����" /></a></li>
					</ul>
				</div>
 
				<div class="myclass_right">
					<dl class="fir">
						<dt><img src="/images/portal/myclass/main_stit_3.gif" alt="���� ���ɰ���" class="mg_t5" /></dt>
						<dd class="btn"><span class="fl_l">�������� : <strong><%= listInterestList.size() %>��</strong></span><a href="javascript:menuForward('3','09');" class="fl_r"><img src="/images/portal/btn/btn_txt_more.gif" alt="������" class="va_b" /></a></dd>
<%
            for(i = 0; i < listInterestList.size() && i<3; i++) {
                DataBox dbox    = (DataBox)listInterestList.get(i);
                
                v_subj   =  dbox.getString("d_subj");
                v_subjnm =  dbox.getString("d_subjnm");
                v_sphere =  dbox.getString("d_sphere");
%>
						<dd><%= StringManager.getByteString(v_subjnm,22) %></dd>
<%
            }
%>
					</dl>
					<dl>
						<dt><img src="/images/portal/myclass/main_stit_4.gif" alt="���� ��㳻��" class="mg_t5" /></dt>
						<dd><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage&p_type=SUBJ" class="fl_l">����������</a> <span class="num"><strong><%= v_subjqnacnt %></strong> ��</span></dd>
						<dd><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage&p_type=PQ" class="fl_l">Q &A</a> <span class="num"><strong><%= v_qnacnt %></strong> ��</span></dd>
						<dd><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage&p_type=MM" class="fl_l">1:1����</a> <span class="num"><strong><%= v_counselcnt %></strong> ��</span></dd>
					</dl>
					<dl>
						<dt><img src="/images/portal/myclass/main_stit_5.gif" alt="���� �̺�Ʈ" class="mg_t4" /></dt>
						<dd><a href="javascript:menuForward('3','14');" class="fl_l">�̺�Ʈ ����</a> <span class="num"><strong><%= v_myeventcnt %></strong> ��</span></dd>
						<dd><a href="javascript:menuForward('3','14');" class="fl_l">�̺�Ʈ ��÷</a> <span class="num"><strong><%= v_mywineventcnt %></strong> ��</span></dd>
					</dl>
					<dl>
						<dt><img src="/images/portal/myclass/main_stit_6.gif" alt="���� ��ũ��" /></dt>
						<dd><a href="javascript:menuForward('3','13');" class="fl_l">��û ��ũ��</a> <span class="num"><strong><%= v_myworkshopcnt %></strong> ��</span></dd>
					</dl>
				</div>
			</div>
			
			<%} %>
</form>
<!-- Form ���� ���� -->

<!-- footer ���� ���� -->
<%@ include file="/learn/user/portal/include/footer.jsp"%>
<!-- footer ���� ���� -->