<%
//**********************************************************
//  1. ��      ��: SUBJECT PREVIEW PAGE
//  2. ���α׷���: zu_SubjectPreview.jsp
//  3. ��      ��: �����ȳ�
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004. 01.12
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />
<jsp:useBean id = "memberBean" class = "com.credu.system.MemberAdminBean"  scope = "page" />
<jsp:useBean id = "code" class = "com.credu.system.CodeConfigBean"  scope = "page" />
<jsp:useBean id = "probean" class = "com.credu.propose.ProposeBean"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);
    box.put("leftmenu","01");                       // �޴� ���̵� ����
    String yeslearn_url = conf.getProperty("yeslearn.url.value");
    String upload_url = conf.getProperty("url.upload");

    String  v_process      = box.getString("p_process");
    String  v_rprocess     = box.getString("p_rprocess");
    String  v_subj         = box.getString("p_subj");
    String  v_subjnm       = box.getString("p_subjnm");
    String  v_isonoff      = box.getString("p_isonoff");
    String  v_upperclassnm = box.getString("p_upperclassnm");
    String  v_upperclass   = box.getString("p_upperclass");
    String  v_select       = box.getString("p_select");
    String  v_actionurl    = box.getString("p_actionurl");
    String  v_lsearchsubject = box.getString("p_lsearchsubject");
    String  v_gubun       = box.getString("p_gubun");


    String  v_subjseq   =  "";
    String  v_year      =  "";
    String  v_preurl    =  "";
    String  v_sdesc     =  "";
    String  v_propstart =  "";
    String  v_propend   =  "";
    String  v_edustart  =  "";
    String  v_eduend    =  "";
    String  v_place     =  "";
    String  v_tutor     =  "";
    String  v_muserid   =  "";
    String  v_mastermail=  "";
    String  v_mastertel =  "";
    String  v_isgoyong  =  "";
    String  v_subjtarget=  "";
    String  v_edumans   =  "";
    String  v_intro     =  "";
    String  v_explain   =  "";
    String  v_isonoff_value="";
    String  v_prop_img  =  "";
    String  v_isgoyong_value="";
    String  v_edutype   =  "";
    String  v_masteruser=  "";
    String  v_env       =  "";
    String  v_owner     =  "";  //�������ڵ�
    String  v_ownerman  =  "";  //ũ�����ڸ�
    String  v_ownertel  =  "";  //����� ��ȭ��ȣ
    String  v_isessential = ""; // ��������
    String  v_purl        = "";
    String  v_introducefilenamereal = "";
    String  v_introducefilenamenew  = "";
    String  v_introducefilenamenew_view  = "";
    String  v_contenttype  = "";
    String  v_aescontentid = "";

    int     v_studentlimit =0;
    int     v_biyong    =  0;
    int     v_wstep     =  0;
    int     v_wmtest    =  0;
    int     v_wftest    =  0;
    int     v_wreport   =  0;
    int     v_wact      =  0;
    int     v_wetc1     =  0;
    int     v_wetc2     =  0;
    int     v_Twetc     =  0;
    int     v_stepcnt   =  0;
    int     v_testcnt   =  0;
    int     v_reportcnt =  0;
    int     v_actcnt    =  0;
    int     v_gradscore =  0;
    int     v_gradstep  =  0;
    int     v_edudays   =  0;
    int     v_edutimes  =  0;
    int     v_ratewbt   =  0;
    int     v_ratevod   =  0;
    int     v_score     =  0;   // ��������
    String  v_isessential_view = "";
    String  v_lesson    =  "";
    String  v_lecture   =  "";
    String  v_lecturedate= "";
    String  v_biyong_view = "";
    String  v_studentlimit_view  = "";
    String  v_isoutsourcing  ="";
    String  v_conturl        = "";
    int     i           =  0;

    v_preurl        =  EduEtc1Bean.make_previewURL(v_subj);
    String v_hasPreviewObj = EduEtc1Bean.hasPreviewObj(v_subj);


    Hashtable outputData = new Hashtable();
    DataBox dbox = (DataBox)request.getAttribute("subjectPreview");

    v_edumans        = dbox.getString("d_edumans");
    v_subj           = dbox.getString("d_subj");
    v_subjtarget     = dbox.getString("d_subjtarget");
    v_intro          = dbox.getString("d_intro");
    v_explain        = dbox.getString("d_explain");
    v_owner          = dbox.getString("d_owner");
    v_ownerman       = dbox.getString("d_ownerman");
    v_ownertel       = dbox.getString("d_ownertel");
    v_muserid        = dbox.getString("d_muserid");
    v_preurl         = dbox.getString("d_preurl");
    v_mastertel      = dbox.getString("d_musertel");
    v_isoutsourcing  = dbox.getString("d_isoutsourcing");
    v_conturl        = dbox.getString("d_conturl");
    v_contenttype    = dbox.getString("d_contenttype");
    v_aescontentid   = dbox.getString("d_aescontentid");
    if (v_contenttype.equals("Y")) {
        v_preurl = yeslearn_url + "/anytime/contents/"+v_aescontentid+"/guest/default.htm";
    }

    v_isonoff_value  = (v_isonoff.equals("ON"))?"���̹�":"����";
    v_intro          =  StringManager.replace(v_intro,"\r\n","<br>");
    v_explain        =  StringManager.replace(v_explain,"\r\n","<br>");
    v_mastertel      =  StringManager.replace(v_mastertel,"\r\n","<br>");

    v_isgoyong        = dbox.getString("d_isgoyong");
    if (v_isgoyong.equals("Y")) v_isgoyong_value = "����";
    else                        v_isgoyong_value = "������";
    v_introducefilenamereal = dbox.getString("d_introducefilenamereal");
    v_introducefilenamenew  = dbox.getString("d_introducefilenamenew");
    if (v_introducefilenamenew.equals("")) v_introducefilenamenew_view = "/images/user/apply/le_img.jpg";
    else                                   v_introducefilenamenew_view = upload_url + "/bulletin/" + v_introducefilenamenew;
    //v_owner = getCodenm.get_owner(v_subj);

    if (v_owner.equals("credu")) {                 //ũ����
       v_masteruser        = v_ownerman;
    } else {
       outputData = probean.getMeberInfo(v_muserid);
       v_masteruser = (String)outputData.get("name");
       v_mastermail = (String)outputData.get("email");
       //v_masteruser        = memberBean.getUserInfo(v_muserid);
    }

	String site   = "outclass/"+box.getSession("site");   // �̹���, CSS ���
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link href="/images/user/<%=site%>/user_style1.css" rel="stylesheet" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--


//������ �򰡺���
function ContentResearchInfo(){
  //zu_ContentRearch_L.jsp
//  document.form1.target = "_self";
/*
  document.form1.target = opener;
  document.form1.p_process.value = "ContentResearch";
  document.form1.action="/servlet/controller.outclass.OutClassServlet";
  document.form1.submit();
*/
  opener.location = "/servlet/controller.outclass.OutClassServlet?p_process=ContentResearch&p_subj=<%=v_subj%>";
  self.close();
}


//���Ǹ�������
function whenLectureList(isoutsourcing, conturl){
   window.self.name = "LectureList";
   if(isoutsourcing == "N"){
     var url = "/servlet/controller.outclass.OutClassServlet";
     var new_Open = window.open(url,"LectureList1",'scrollbars=yes,width=746,height=550,resizable=no');
     document.form1.target="LectureList1";
     document.form1.p_process.value="LectureList";
     //document.form1.action="/servlet/controller.outclass.OutClassServlet";
     document.form1.submit();
   }else{
     url = conturl;
     var new_Open = window.open(url,"LectureList1",'scrollbars=yes,width=800,height=600,resizable=no');
   }
}

// ������
function whenPreShow(url,subj) {
    // �α�
    prelog_url = "/servlet/controller.propose.ProposeCourseServlet?p_process=insertPreviewLog&p_subj="+subj;
    open_window("openShow",prelog_url,"0","0","10","10","","","",true,true);

    open_window("openShow",url,"100","100","800","717","","","",true,true);
}

// ������
function studyOpen(url,subj) {
    // �α�
    prelog_url = "/servlet/controller.propose.ProposeCourseServlet?p_process=insertPreviewLog&p_subj="+subj;
    open_window("openShow",prelog_url,"0","0","10","10","","","",true,true);

    open_window('openApp',url,0,0,0,0,false,false,true,true,true);
}
//-->
</SCRIPT>
</head>

<body leftmargin="0" topmargin="0" bottommargin="0" marginwidth="0" marginheight="0" >
<form name="form1" method="post" action="">
    <input type='hidden' name='p_process' value="<%=v_process%>" >
    <input type='hidden' name='p_select' value="<%=v_select%>">
    <input type='hidden' name='p_gubun' value="<%=v_gubun%>">

    <input type='hidden' name='p_subj' value="<%=v_subj%>">
    <input type='hidden' name='p_year'>
    <input type='hidden' name='p_subjseq'>
    <input type='hidden' name='p_subjnm' value="<%=v_subjnm%>">
    <input type='hidden' name='p_rprocess' value="<%=v_rprocess%>">
    <input type='hidden' name='p_actionurl' value="<%=v_actionurl%>">
    <input type='hidden' name='p_purl' value="<%=v_purl%>">
    <input type='hidden' name='p_course' value="000000">
    <input type='hidden' name='p_isonoff' value="<%=v_isonoff%>">
    <input type='hidden' name='p_upperclass' value="<%=v_upperclass%>">
    <input type='hidden' name='p_upperclassnm' value="<%=v_upperclassnm%>">
    <input type='hidden' name='p_lsearchsubject' value="<%=v_lsearchsubject%>">

    <input type='hidden' name='p_returnurl' value="/servlet/controller.outclass.OutClassServlet">


  <table cellpadding="0" cellspacing="10" bgcolor="#EEEEEE" width="730" height="100%">
    <tr>
        <td>
            <table cellpadding="0" cellspacing="1" bgcolor="#bebebe" class="table2" height="100%">
                <tr>
                    <td align="center" valign="top" bgcolor="#FFFFFF" class="body_color">
                    <br>
<!-- �����Ұ� table  -->                     
            <table width="675" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
              <tr> 
                <td width="128" valign="top"><img src="/images/user/<%=site%>/st_lecinfo.gif" ></td>
                <td width="547" align="right" valign="top"> 
<%
	if (!box.getSession("userid").equals("")) {
%>
                 <table width="400" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="167">&nbsp;</td>
                      <td width="54"><% if (v_hasPreviewObj.equals("Y")) { %><a href="javascript:studyOpen('/servlet/controller.contents.EduStart?p_subj=<%=v_subj%>&p_year=2000&p_subjseq=0001&p_ispreview=Y', '<%=v_subj%>')" onfocus=this.blur()><img src="/images/user/<%=site%>/btn_c_preview.gif" border="0"></a><% } else { %><% if(!v_preurl.equals("")){ %><a href="javascript:whenPreShow('<%=v_preurl%>', '<%=v_subj%>')" onfocus=this.blur()><img src="/images/user/<%=site%>/btn_c_preview.gif" border="0"></a><%}%><% } %></td>
                      <td width="95"><a href="javascript:ContentResearchInfo()" onfocus="this.blur()"><img src="/images/user/<%=site%>/btn_c_conview.gif" border="0"></a></td>
                      <%if(v_isoutsourcing.equals("N")){%>
                            <%   if (v_contenttype.equals("Y")) {  %>
                            <td width="84"><a href="javascript:whenLectureList('Y','<%=(yeslearn_url + "/contentscontainer/contents_book.asp?contentid="+v_aescontentid)%>')" onfocus="this.blur()"><img src="/images/user/<%=site%>/btn_c_leclist.gif" border="0"></a></td>
                              <% } else {                          %>
                      <td width="84"><a href="javascript:whenLectureList('N', '')" onfocus="this.blur()"><img src="/images/user/<%=site%>/btn_c_leclist.gif" border="0"></a></td>
                            <%   }  //������Ÿ�Ա��� %>
                      <%}else{%>
                      <td width="84"><a href="javascript:whenLectureList('Y','<%=v_conturl%>')" onfocus="this.blur()"><img src="/images/user/<%=site%>/btn_c_leclist.gif" border="0"></a></td>
                      <%}%>
                    </tr>
                  </table>
<%
	}
%>
                </td>
              </tr>
              <tr> 
                <td height="5" colspan="2"></td>
              </tr>
              <tr valign="top"> 
                <td height="20" colspan="2"> 
                  <!-- �����Ұ� table -->
                  <table width="675" border="2" cellspacing="0" 
                         cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed"  frame="hsides">
                    <tr  class="lcolor"> 
                      <td height="3" colspan="2" class="lcolor"></td>
                    </tr>
                    <tr> 
                      <td width="135" class="tbl_gtit2">������</td>
                      <td height="76" >
                        <table width="439" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="439" class="tblfont_titleft">
                              <table width="130" height="100" border="2" cellspacing="0" cellpadding="3"   style="border-collapse:collapse;" bordercolor="#ededed" >
                                <tr>
                                  <td align="center"><img src="<%=v_introducefilenamenew_view%>" width="128" height="92"></td>
                                </tr>
                              </table>
                            </td>
                          </tr>
                          <tr>
                            <td class="tblfont_titleft"><%=v_subjnm%></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
<!--
                    <tr>
                      <td class="tbl_gtit2">��������</td>
                      <td class="tblfont_gleft"><%=v_isonoff_value%></td>
                    </tr>
-->
                    <tr>
                      <td class="tbl_gtit2">��뺸�迩��</td>
                      <td class="tblfont_gleft"><%=v_isgoyong_value%></td>
                    </tr>
                    <tr>
                      <td height="26" class="tbl_gtit2">�������</td>
                      <td class="tblfont_gleft"><%=v_edumans%></td>
                    </tr>
                    <tr>
                      <td class="tbl_gtit2">������ǥ</td>
                      <td class="tblfont_gleft"><%=v_intro%></td>
                    </tr>
                    <tr>
                      <td class="tbl_gtit2">��������</td>
                      <td class="tblfont_gleft"><%=v_explain%></td>
                    </tr>
                    <tr>
                      <td class="tbl_gtit2">���������</td>
                      <td class="tblfont_gleft"><%=v_mastertel%><!--a href='mailto:<%=v_mastermail%>'><%=v_masteruser%></a>  (�� : <%=v_mastertel%>)--></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td height="5" colspan="2"></td>
              </tr>
              <tr align="right">
                <td height="20" colspan="2"><a href="javascript:self.close()"><img src="/images/user/<%=site%>/btn_close.gif" border="0"></a></td>
              </tr>
              <tr> 
                <td height="20" colspan="2"></td>
              </tr>
            </table>
        <!-- �����Ұ� table �� -->
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</form>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>