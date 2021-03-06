<%
/**
 * file name : za_DamunSubjMail_L.jsp
 * date      : 2003/09/03
 * programmer:
 * function  : 다면평가 발송  조회
 */
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.io.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.multiestimate.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    String  v_subjnm    = box.getString("p_subjnm");

    String  ss_upperclass  = box.getStringDefault("s_upperclass","ALL");
    String  ss_middleclass = box.getStringDefault("s_middleclass","ALL");
    String  ss_lowerclass  = box.getStringDefault("s_lowerclass","ALL");
    String  ss_subjcourse  = box.getStringDefault("s_subjcourse","ALL");

	String  ss_grcode       = box.getString("s_grcode");
	String  ss_gyear       = box.getString("s_gyear");
	String  ss_grseq       = box.getString("s_grseq");
	int  ss_damunpapernum       = box.getInt("s_damunpapernum");
	String  ss_subjseq    = box.getString("s_subjseq");

	String  ss_mailgubun       = box.getString("s_mailgubun");

    ArrayList list = (ArrayList)request.getAttribute("DamunMailList");
    DataBox dbox0 = (DataBox)request.getAttribute("DamunPaperData");

    String  v_action    = box.getString("p_action");

           String v_ing = "";
		   int v_update = 0;
		   int v_gubun = 0;

		   String v_sulstart1 = "";
           String v_sulend1 = "";
           v_sulstart1 = FormatDate.getFormatDate(dbox0.getString("d_fdamunstart"),"yyyy-MM-dd");
	       v_sulend1 = FormatDate.getFormatDate(dbox0.getString("d_fdamunend"),"yyyy-MM-dd");

		   String v_sulstart2 = "";
           String v_sulend2 = "";
           v_sulstart2 = FormatDate.getFormatDate(dbox0.getString("d_sdamunstart"),"yyyy-MM-dd");
	       v_sulend2 = FormatDate.getFormatDate(dbox0.getString("d_sdamunend"),"yyyy-MM-dd");

		   if(dbox0.getInt("d_damunpapernum") > 0){
          
		   long v_fstart = Long.parseLong(dbox0.getString("d_fdamunstart"));
           long v_fend = Long.parseLong(dbox0.getString("d_fdamunend"));
              
            if (dbox0.getString("d_d_gubun").equals("1")){
                  v_gubun = 1; 

                 java.util.Date d_now = new java.util.Date();
                 String d_year = String.valueOf(d_now.getYear()+1900);
				 String d_month = String.valueOf(d_now.getMonth()+1);
				 String d_day = String.valueOf(d_now.getDate());

                 if(d_month.length() == 1){
				        d_month = "0" + d_month; 
				 }
				 if (d_day.length() == 1){
				        d_day = "0" + d_day; 				 
				 }
		         long v_now = Long.parseLong(d_year+d_month+d_day); 

		         if (v_fstart > v_now){
		            v_ing = "<font color='red'>다면평가 진행 전입니다.</font>"; 
					v_update = 1;
		         } else if (v_now > v_fend){
		            v_ing = "다면평가 진행이 완료되었습니다.";
					v_update = 3;
		         } else if (v_fstart <= v_now && v_now < v_fend){
		            v_ing = "다면평가가 진행 중입니다"; 
					v_update = 2;
		         }
	         } else if (dbox0.getString("d_d_gubun").equals("2")){
			     v_gubun = 2;
			     long v_sstart = Long.parseLong(dbox0.getString("d_sdamunstart"));
                 long v_send = Long.parseLong(dbox0.getString("d_sdamunend"));		 

                 java.util.Date d_now = new java.util.Date();
                 String d_year = String.valueOf(d_now.getYear()+1900);
				 String d_month = String.valueOf(d_now.getMonth()+1);
				 String d_day = String.valueOf(d_now.getDate());

                 if(d_month.length() == 1){
				        d_month = "0" + d_month; 
				 }
				 if (d_day.length() == 1){
				        d_day = "0" + d_day; 				 
				 }
		         long v_now = Long.parseLong(d_year+d_month+d_day); 

		         if (v_fstart > v_now){
		            v_ing = "<font color='red'>다면평가 진행 전입니다.</font>"; 
					v_update = 1;
		         } else if (v_now > v_send){
		            v_ing = "사후 다면평가 진행이 완료되었습니다.";
					v_update = 5;
		         } else if (v_fstart <= v_now && v_now < v_fend){
		            v_ing = "사전 다면평가가 진행 중입니다"; 
					v_update = 2;
		         } else if (v_fend <= v_now || v_now < v_sstart){
		            v_ing = "사후 다면평가 진행 전입니다"; 
					v_update = 3;
		         } else if (v_sstart <= v_now || v_now < v_send){
		            v_ing = "사후 다면평가가 진행 중입니다"; 
					v_update = 4;
		         }
			 }			 
		   }


    String  v_ggubun        = box.getStringDefault("p_gubun",  DamunSubjBean.DEFAULT_SUBJ);

    String v_title_img = ""; 
    if (v_ggubun.equals("COMMON"))     v_title_img = "3";
    else if (v_ggubun.equals("SUBJ"))  v_title_img = "4";
    else if (v_ggubun.equals("WHOLE")) v_title_img = "5";

    String v_tab_color1 = "blue";
    String v_tab_color2 = "black";
    String v_tab_color3 = "black";
	String v_tab_color4 = "black";
%>
<html>
<head>
<title>다면평가 발송 리스트</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language = "VBScript" src = "/script/cresys_lib.vbs"></script>
<SCRIPT LANGUAGE="JavaScript">
<!--
function changeTabpage(p_gubun) {

    if (p_gubun == "COMMON") {
      document.form1.action = "/servlet/controller.multiestimate.DamunCommonMailServlet";
	
	} 
	document.form1.p_action.value = 'change';
	document.form1.p_gubun.value = p_gubun;
    document.form1.s_grcode.value = "";
	document.form1.p_process.value = 'DamunMailListPage';
	document.form1.submit();
}
function ObserverList ( ) {
  document.form1.p_process.value = 'DamunOBMailListPage';
  document.form1.p_action.value = "go";
  document.form1.action = "/servlet/controller.multiestimate.DamunSubjMailServlet";
  document.form1.submit();
}
function MailEncoSend(v_mailgubun) {
	if (document.form1.s_grcode.value == '----') {
			alert("교육그룹을 선택하세요.");
			return ;
	}
    if (document.form1.s_subjcourse.value=="ALL"){
            alert("과정을 선택하세요");
            return;
    }
	if (document.form1.s_subjseq.value == '----') {
			alert("차수를 선택하세요.");
			return ;
	}
	if (document.form1.s_damunpapernum.value == '0') {
			alert("다면평가지를 선택하세요.");
			return ;
	}
  if (chkSelected() < 1) {
    alert('메일을 보낼 대상자를 선택하세요');
    return;
  }
      window.self.name = "winInsertPage";     //      opener 객체에 name 을 지정한다
    farwindow = window.open("", "openWinInsert", "toolbar=no,location=no,directories=no,status=yes,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no, width = 667, height = 700, top=0, left=0");
    document.form1.target = "openWinInsert"
    document.form1.p_process.value = 'DamunMailEncoSendPage';
    document.form1.p_damunpapernum.value = document.form1.s_damunpapernum.options[document.form1.s_damunpapernum.selectedIndex].value;
    document.form1.p_grcode.value = document.form1.s_grcode.options[document.form1.s_grcode.selectedIndex].value;
    document.form1.p_subj.value = document.form1.s_subjcourse.options[document.form1.s_subjcourse.selectedIndex].value;
    document.form1.p_gyear.value = document.form1.s_gyear.options[document.form1.s_gyear.selectedIndex].value;
    document.form1.p_action.value = "go";
    document.form1.p_mailgubun.value = v_mailgubun;
	document.form1.action = "/servlet/controller.multiestimate.DamunSubjMailServlet";
    document.form1.submit();
    farwindow.window.focus();
    document.form1.target = window.self.name;
}
function chkSelected() {
  var selectedcnt = 0;
  if(document.form1.all['p_checks'] == '[object]') {
    if (document.form1.p_checks.length > 0) {
      for (i=0; i<document.form1.p_checks.length; i++) {
        if (document.form1.p_checks[i].checked == true) {
          selectedcnt++;
        }
      }
    } else {
      if (document.form1.p_checks.checked == true) {
        selectedcnt++;
      }
    }
  }
  return selectedcnt;
}
function whenSelection(p_action) {
	
  document.form1.p_process.value = 'DamunMailListPage';
  document.form1.p_action.value  = p_action;
  if (p_action == "go"){
	  if (document.form1.s_grcode.value == '----') {
			alert("교육그룹을 선택하세요.");
			return ;
	}
    if (document.form1.s_subjcourse.value=="ALL"){
            alert("과정을 선택하세요");
            return;
    }
	if (document.form1.s_subjseq.value == '----') {
			alert("차수를 선택하세요.");
			return ;
	}
	if (document.form1.s_damunpapernum.value == '0') {
			alert("다면평가지를 선택하세요.");
			return ;
	}
  document.form1.p_damunpapernum.value = document.form1.s_damunpapernum.options[document.form1.s_damunpapernum.selectedIndex].value;
   top.ftop.setPam();
  }
  document.form1.submit();
}
function whenAllSelect() {
  if(document.form1.all['p_checks'] == '[object]') {
    if (document.form1.p_checks.length > 0) {
      for (i=0; i<document.form1.p_checks.length; i++) {
        document.form1.p_checks[i].checked = true;
      }
    } else {
      document.form1.p_checks.checked = true;
    }
  } 
}
function whenAllSelectCancel() {
  if(document.form1.all['p_checks'] == '[object]') {
    if (document.form1.p_checks.length > 0) {
      for (i=0; i<document.form1.p_checks.length; i++) {
        document.form1.p_checks[i].checked = false;
      }
    } else {
      document.form1.p_checks.checked = false;
    }
  } 
}

function chkeckall(){
    if(document.form1.p_chkeckall.checked){
      whenAllSelect();
    }
    else{
      whenAllSelectCancel();
    }
}
//-->
</script>
</head>
<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">
<form name="form1" method="post" action="/servlet/controller.multiestimate.DamunSubjMailServlet">

<table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
  <tr>
    <td align="center" valign="top">
      <!----------------- title 시작 ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/multiestimate/m_title04.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
      <!----------------- title 끝 ----------------->
      <!----------------- form 시작 ----------------->
	  <br>
      <table cellspacing="0" cellpadding="0" class="table1">
        <tr>
          <td width="85" height="23" align="center" valign="middle">
            <table cellspacing="0" cellpadding="0" class="s_table">
              <tr>
                <td rowspan="3" class="<%=v_tab_color1%>_butt_left"></td>
                <td class="<%=v_tab_color1%>_butt_top"></td>
                <td rowspan="3" class="<%=v_tab_color1%>_butt_right"></td>
              </tr>
              <tr>
                <td class="<%=v_tab_color1%>_butt_middle">과정평가</td>
              </tr>
              <tr>
                <td class="<%=v_tab_color1%>_butt_bottom"></td>
              </tr>
            </table>
          </td>
          <td width="2"></td>
          <td width="85" height="23" align="center" valign="middle">
            <table cellspacing="0" cellpadding="0" class="s_table">
              <tr>
                <td rowspan="3" class="<%=v_tab_color3%>_butt_left"></td>
                <td class="<%=v_tab_color3%>_butt_top"></td>
                <td rowspan="3" class="<%=v_tab_color3%>_butt_right"></td>
              </tr>
              <tr>
                <td class="<%=v_tab_color3%>_butt_middle"><a href="javascript:changeTabpage('COMMON')" class="c">일반평가</a></td>
              </tr>
              <tr>
                <td class="<%=v_tab_color3%>_butt_bottom"></td>
              </tr>
            </table>
          </td>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table class="form_table_out" cellspacing="0" cellpadding="1">
        <tr>
          <td align="center">
            <table class="form_table_bg" cellspacing="0" cellpadding="0">
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td align="center">
                              <table cellspacing="0" cellpadding="0" width="99%" class="form_table">
								<tr>
								  <td width="27%" colspan="2" align="left" valign="middle">
									<!------------------- 조건검색 시작 ------------------------->
									<%= SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   교육그룹  -->
								  </td>
								  <td width="73%" colspan="2">
									<%= SelectEduBean.getGyear(box, true)%><!-- getGyear(RequestBox, isChange)   교육년도  -->
									<%= SelectEduBean.getGrseq(box, true, true)%><!-- getGrseq(RequestBox, isChange, isALL)   교육차수  -->
									<!--input type= "hidden" name="s_grseq" value="0001"-->
									<%= SelectSubjBean.getUpperClass(box, true, true, true)%><!-- getUpperclass(RequestBox, isChange, isALL, isStatisticalPage)    과정대분류  -->
									<%= SelectSubjBean.getMiddleClass(box, true, true, true)%><!-- getMiddleclass(RequestBox, isChange, isALL, isStatisticalPage)    과정중분류  -->
									<%= SelectSubjBean.getLowerClass(box, true, true, true)%><!-- getLowerclass(RequestBox, isChange, isALL, isStatisticalPage)    과정소분류  -->
								  </td>
								</tr>
								<tr>
									<td height="5"></td>
								</tr>
								<tr>
								  <td align="left" colspan="3">
									<%= SelectSubjBean.getSubj(box, true, true)%><!-- getSubj(RequestBox, isChange, isALL)    과정  -->
									<%= SelectSubjBean.getSubjseq(box, true, true)%><!-- getSubjseq(RequestBox, isChange, isALL)    과정차수  -->
                                   다면평가지<%= DamunSubjMemberBean.getDamunpaperSelect (ss_grcode, ss_gyear, ss_subjcourse, "s_damunpapernum", ss_damunpapernum, "", ss_subjseq)%>
								  </td>
								  <td width="10%" align="right"><%@ include file="/learn/admin/include/za_GoButton.jsp" %></td><!-- whenSelection('go') -->
                                  </td>
                                </tr>
                              </table>
				</td>
              </tr>
              <tr>
                <td height="7"></td>
              </tr>
              <tr>
                <td height="3"></td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <!----------------- form 끝 ----------------->
      <br>
      <!----------------- 대상자추가, 대상자삭제 버튼 시작 ----------------->
      <table cellpadding="0" cellspacing="0" class="table1">


<%if(v_update > 0){
          if(v_gubun == 1){
%>
        <tr align="right">
		  <td align="left">
           <!-- <a href="javascript:('')"><img src="/images/admin/button/btn_nameprint.gif" border="0"></a>		 -->	    
			<%if(v_update ==1 || v_update == 2){%><a href="javascript:MailEncoSend('1')"><img src="/images/admin/button/btn_dogmailsend.gif" border="0"></a><%}%>
            <%if(v_update == 1){%>
		  </td>
          <td>
			<%}else if(v_update == 2){%>
		  </td>
          <td>
            <%=v_ing%>&nbsp;
            기간 : &nbsp;<input name="p_sulstart_view" type="text" class="input" value="<%=v_sulstart1%>" size="10" readonly>-<input name="p_sulend_view" type="text" class="input" value="<%=v_sulend1%>" size="10" readonly>
			<%}else if(v_update == 3){%>
		  </td>
          <td>
		   <%=v_ing%>
			<%}%>
		  </td>
        </tr>
<%
		  } else if (v_gubun == 2){
%>
        <tr align="right">
		  <td align="left">
           <!-- <a href="javascript:('')"><img src="/images/admin/button/btn_nameprint.gif" border="0"></a>		 -->		    
<%if(v_update ==1 || v_update == 2){%>
            <a href="javascript:MailEncoSend('2')"><img src="/images/admin/button/btn_dogmailsend.gif" border="0"></a>
<%}else if(v_update ==3 || v_update == 4){%>
            <a href="javascript:MailEncoSend('3')"><img src="/images/admin/button/btn_dogmailsend.gif" border="0"></a>
<%}%>
            <%if(v_update == 1){%>
		  </td>
          <td>
			<%}else if(v_update == 2){%>
		  </td>
          <td>
            <%=v_ing%>&nbsp;
            기간 : &nbsp;<input name="p_sulstart_view" type="text" class="input" value="<%=v_sulstart1%>" size="10" readonly>-<input name="p_sulend_view" type="text" class="input" value="<%=v_sulend1%>" size="10" readonly>
			<%}else if(v_update == 3){%>
		  </td>
          <td>
		   <%=v_ing%>
			<%}else if(v_update == 4){%>
		  </td>
          <td>
            <%=v_ing%>&nbsp;
            기간 : &nbsp;<input name="p_sulstart_view" type="text" class="input" value="<%=v_sulstart2%>" size="10" readonly>-<input name="p_sulend_view" type="text" class="input" value="<%=v_sulend2%>" size="10" readonly>
			<%}else if(v_update == 5){%>
		  </td>
          <td>
		   <%=v_ing%>
			<%}%>
		  </td>
        </tr>
<%
		  } 	  
%>
<%}else{%>
        <tr align="right">
		  <td align="left">
           <!-- <a href="javascript:('')"><img src="/images/admin/button/btn_nameprint.gif" border="0"></a>		 -->   
		  </td>
          <td><%=v_ing%></td>
        </tr>
<%}%>


        <tr>
          <td height="3"></td>
        </tr>
      </table>
      <!----------------- 대상자추가, 대상자삭제 버튼 끝 ----------------->
      <table cellspacing="1" cellpadding="5" class="table_out">
        <input type="hidden" name="p_process"    value="">
        <input type="hidden" name="p_action"     value="">
		<input type="hidden" name="s_subj"       value="<%=ss_subjcourse%>">
        <input type="hidden" name="p_grcode"       value="<%=ss_grcode%>">
        <input type="hidden" name="p_subj"       value="<%=ss_subjcourse%>">
        <input type="hidden" name="p_gyear"       value="<%=ss_gyear%>">
		<input type="hidden" name="p_grseq"       value="<%=ss_grseq%>">
        <input type="hidden" name="p_subjseq"    value="<%=ss_subjseq%>">
        <input type="hidden" name="p_upperclass"       value="<%=ss_upperclass%>">
        <input type="hidden" name="p_damunpapernum"       value="<%=ss_damunpapernum%>">
        <input type="hidden" name="p_damunpapernm"       value="<%=dbox0.getString("d_damunpapernm")%>">
		<input type="hidden" name="p_subjuserid"     value="">
		<input type="hidden" name="p_mailgubun"     value="">
        <input type="hidden" name="p_asgnnm"     value="">
        <input type="hidden" name="p_jikupnm"     value="">
        <input type="hidden" name="p_cono"     value="">
        <input type="hidden" name="p_name"     value="">
		<input type="hidden" name="p_gubun"     value="">
		<input type="hidden" name="p_flag"     value="">


        <tr>
          <td colspan="13" class="table_top_line"></td>
        </tr>
        <tr>
          <td width="5%" class="table_title" rowspan="2">NO</td>
          <td class="table_title" colspan="2">대상자</td>
          <td class="table_title" rowspan="2">관계</td>
          <td class="table_title" colspan="4">사전평가(동시평가)</td>
          <td class="table_title" colspan="4">사후평가</td>
          <td class="table_title" rowspan="2"><input type="checkbox" name="p_chkeckall" onClick="javascript:chkeckall()"></td>
        </tr>
        <tr>
          <td class="table_title">성명</td>
          <td class="table_title">소속</td>
          <td class="table_title">직위</td><!-- 사전평가 -->
          <td class="table_title">성명</td>
          <td class="table_title">발송</td>
          <td class="table_title">참여</td>
          <!--td class="table_title">일자</td-->
          <td class="table_title">직위</td><!-- 사후평가 -->
          <td class="table_title">성명</td>
          <td class="table_title">발송</td>
          <td class="table_title">참여</td>
          <!--td class="table_title">일자</td-->
        </tr>
<%
        for (int i=0; i<list.size(); i++) {
            DataBox dbox2  = (DataBox)list.get(i);  
            
			String v_relation = "";
			if (dbox2.getString("d_relation").equals("0")){
			   v_relation = "본인";
			} else if (dbox2.getString("d_relation").equals("1")){
			   v_relation = "상사";
			} else if (dbox2.getString("d_relation").equals("2")){
			   v_relation = "동료";
			} else if (dbox2.getString("d_relation").equals("3")){
			   v_relation = "부하";
			}			
%>
        <tr>
          <td width="5%" class="table_01"><%=(i+1)%></td>
          <td class="table_02_1"><%=dbox2.getString("d_subjusernm")%></td>
          <td class="table_02_1"><%=dbox2.getString("d_subjasgmnm")%></td>
          <td class="table_02_1"><%=v_relation%></td>
          <td class="table_02_1"><%=dbox2.getString("d_jikwinm")%></td>
          <td class="table_02_1"><%=dbox2.getString("d_name")%></td>
          <td class="table_02_1"><%=dbox2.getString("d_fsending")%></td>
          <!--td class="table_02_1"><%=dbox2.getString("d_freturn")%></td-->
          <td class="table_02_1">
		  <%if(dbox2.getString("d_freturn").equals("Y")){%>
		  <%=FormatDate.getFormatDate(dbox2.getString("d_freturntime"),"yyyy-MM-dd HH:mm:ss")%>
		  <%}else{%>
		  <%=dbox2.getString("d_freturntime")%>
		  <%}%>
		  </td>
          <td class="table_02_1"><%=dbox2.getString("d_jikwinm")%></td>
          <td class="table_02_1"><%=dbox2.getString("d_name")%></td>
          <td class="table_02_1"><%=dbox2.getString("d_ssending")%></td>
          <!--td class="table_02_1"><%=dbox2.getString("d_sreturn")%></td-->
          <td class="table_02_1">
		  <%if(dbox2.getString("d_sreturn").equals("Y")){%>
		  <%=FormatDate.getFormatDate(dbox2.getString("d_sreturntime"),"yyyy-MM-dd HH:mm:ss")%>
		  <%}else{%>
		  <%=dbox2.getString("d_sreturntime")%>
		  <%}%>
		  </td>
          <td class="table_02_1">
            <input type="checkbox" name="p_checks" value="<%=Integer.parseInt(dbox2.getString("d_relation"))+1%>|<%=dbox2.getString("d_subjuserid")%>|<%=dbox2.getString("d_obuserid")%>|<%=dbox2.getString("d_name")%>">
          </td>
        </tr>
<%  
	 }
%>
        </table>
      <br>
    </td>
  </tr>
</table>

</form>
<%@ include file = "/learn/library/getJspName.jsp" %>
</body>
</html>
