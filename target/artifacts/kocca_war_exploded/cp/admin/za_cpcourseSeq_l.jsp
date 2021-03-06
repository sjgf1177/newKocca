<%
//**********************************************************
//  1. 제      목: 교육과정 차수 등록관리
//  2. 프로그램명: za_cpcourseSeq_l.jsp
//  3. 개      요: 교육과정 차수 등록관리 리스트화면
//  4. 환      경: JDK 1.3
//  5. 버      젼: 1.0
//  6. 작      성: 이창훈 2005.7.18
//  7. 수      정:
//***********************************************************
%>

<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.cp.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
RequestBox box = (RequestBox)request.getAttribute("requestbox");

if (box == null) {
        box = RequestManager.getBox(request);
}

int i = 0, v_dispnum = 0, v_totalpage = 0, v_rowcount = 0;
String v_subj = "", v_subjnm = "", v_cpnm = "", v_cpsubjseq = "", v_year = "", v_grcodenm="", v_grcode="";
String v_subjseq = "", v_subjseqgr = "", v_propstart = "", v_propend = "", v_edustart = "", v_eduend = "";
  
String v_searchtext = box.getString("p_searchtext");
int v_pageno = box.getInt("p_pageno"); 

String  ss_grcode    = box.getString("s_grcode");           //교육그룹
String  ss_gyear     = box.getString("s_gyear");            //년도
String  ss_grseq     = box.getString("s_grseq");            //교육차수

//String s_userid = box.getSession("userid");
//String s_usernm = box.getSession("username");


%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="STYLESHEET" type="text/css" href="/css/admin_style.css">
<script language = "javascript" src = "/script/cresys_lib.js"></script>
<script language="javascript">
<!--//
function whenSelection(ss_action){
    document.form1.p_action.value = ss_action;
    
	if (ss_action=="go") {
		if (document.form1.s_grcode.value == 'ALL' || document.form1.s_grcode.value == '----') {
		    alert("교육그룹을 선택하세요.");
		    return ;
		}
		top.ftop.setPam();
	}
    
	document.form1.action = "/servlet/controller.cp.CPCourseSeqServlet";
	document.form1.p_process.value = "";
	document.form1.p_pageno.value = "1";
	document.form1.target = "_self";
	document.form1.submit();
}

function go(index) {
     document.form1.p_pageno.value = index;
     document.form1.p_action.value = "go";     
     document.form1.action = "/servlet/controller.cp.CPCourseSeqServlet";
     document.form1.p_process.value = "";     
     document.form1.target = "_self";
     document.form1.submit();
}  

function goPage(pageNum) {
	document.form1.p_pageno.value = pageNum;
	document.form1.p_action.value = "go";
	document.form1.action = "/servlet/controller.cp.CPCourseSeqServlet";
	document.form1.p_process.value = "";     
	document.form1.target = "_self";
	document.form1.submit();
}  

function selectList() {
	document.form1.action = "/servlet/controller.cp.CPCourseSeqServlet";
	document.form1.p_process.value = "";   
	document.form1.p_pageno.value = "1";
	document.form1.target = "_self";
	document.form1.submit();
}  

function eduinfo(year,subj,subjseq,subjseqgr) {
	document.form1.action = "/servlet/controller.cp.CPCourseSeqServlet";
	document.form1.p_year.value = year;
	document.form1.p_subj.value = subj;
	document.form1.p_subjseq.value = subjseq;
	document.form1.p_subjseqgr.value = subjseqgr;
	document.form1.p_process.value = "insertPage";
	document.form1.target = "_self";
	document.form1.submit();
}  


function whenGrcompList(grcode){
    //alert(grcode);
    window.self.name = "GrcompList";
    //alert(toolbar='+toolbar_str+',menubar='+menubar_str+',status='+statusbar_str+',scrollbars='+scrollbar_str+',resizable='+resizable_str);
    
    open_window("openGrcompList","","100","100","640","550","no","no","no","yes","no");  
    document.form1.target = "openGrcompList";
    document.form1.action = "/servlet/controller.cp.CPCourseSeqServlet";
	document.form1.p_grcode.value = grcode;
	document.form1.p_process.value = "grcomplist";
	//alert("11111111111111111111111111111111111111111111111111111");
	
	document.form1.submit();
}


function enter(e) {
        if (e.keyCode =='13'){
            whenSelection('go');
        }
}

//-->
</script>
</head>

<body topmargin=0 leftmargin=0>
<form name="form1" action="" method="post">
<input type="hidden" name="p_process" value="">
<input type="hidden" name="p_grcode" value="">
<input type="hidden" name="p_action" value="">
<input type="hidden" name="p_year" value="">
<input type="hidden" name="p_subj" value="">
<input type="hidden" name="p_subjseq" value="">
<input type="hidden" name="p_subjseqgr" value="">
<input type="hidden" name="p_pageno" value="<%=v_pageno%>">
<table width="1000" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center">
	
	<table width="970" border="0" cellspacing="0" cellpadding="0" class=page_title>
        <tr> 
          <td><img src="/images/admin/cp/cp_tit_cha.gif" ></td>
          <td align="right"><img src="/images/admin/common/sub_title_tail.gif" ></td>
        </tr>
      </table>
	   
      <br>
      <table width="970" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td width="1%"><img src="/images/admin/common/icon.gif" ></td>
          <td class=sub_title>교육과정 차수등록 관리</td>
        </tr>
        <tr> 
          <td height=6></td>
          <td height=6></td>
        </tr>
      </table>  
	  <table width="970" cellpadding="1" cellspacing="0" class="form_table_out">
        <tr> 
          <td align="center"><table width="970" cellpadding="0" cellspacing="0" class="form_table_bg">
              <tr> 
                <td height="7"></td>
              </tr>
             
              <tr> 
                <td align="left"> 
                  <table  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="20"></td>
	  				  <td width="230"><font color="red">★</font><%=SelectEduBean.getGrcode(box, true, false)%><!-- getGrcode(RequestBox, isChange, isALL)   교육그룹  --></td>
	  				  <td width="100"><font color="red">★</font><%= SelectEduBean.getGyear(box, true)%><!-- getGyear(RequestBox, isChange)   교육년도  --></td>
					  <td width="250"><%=SelectEduBean.getGrseq(box, true, true)%><!-- getGrseq(RequestBox, isChange, isALL)   교육차수  --></td>
					  <td width="160">교육업체<%= CPCommonBean.getCP(box, true, true)%><!-- getCompany(RequestBox, isChange, isALL)    교육기관  --></td>
					  <td width="170">과정명<input name="p_searchtext" type="text" class="input" style="width:120" value="<%=v_searchtext %>" onKeyPress=javascript:enter(event)></td>
					  <td align="right"><a href="javascript:whenSelection('go');"><img src="/images/admin/button/b_go.gif"  border="0"></a></td>
					  <td width="20"></td>
					</tr>
                  </table></td>
              </tr>
              <tr> 
                <td height="7"></td>
              </tr>
            </table></td>
        </tr>
      </table>
	  <br>
      <table width="970"  border="0"  cellpadding="0" cellspacing="1" class="table_out">
	          <tr> 
          <td colspan="7" class="table_top_line"></td>
        </tr>

        <tr> 
          <td class="table_title" width="6%">번호</td>
          <td class="table_title"  width="14%">교육그룹</td>
          <td class="table_title"  width="20%">과정명</td>
          <td class="table_title"  width="10%">차수/업체차수</td>
          <td class="table_title"  width="14%">업체명</td>
          <td class="table_title"  width="18%">신청기간</td>
          <td class="table_title"  width="18%">학습기간</td>
        </tr>

<%        
if (box.getString("p_action").equals("go")) {
	ArrayList list = (ArrayList)request.getAttribute("selectCourseSeqList");                                                                                                                                        
	
	for(i = 0; i < list.size(); i++) {
        DataBox dbox = (DataBox)list.get(i); 
        
        v_dispnum = dbox.getInt("d_dispnum");
        v_subj   = dbox.getString("d_subj");
        v_subjnm   = dbox.getString("d_subjnm");
		v_subjseq    = dbox.getString("d_subjseq");
        v_subjseqgr    = dbox.getString("d_subjseqgr");
        v_cpsubjseq    = dbox.getString("d_cpsubjseq");
        v_propstart    = dbox.getString("d_propstart");
        v_propend    = dbox.getString("d_propend");
        v_edustart    = dbox.getString("d_edustart");
        v_eduend    = dbox.getString("d_eduend");
        v_cpnm = dbox.getString("d_cpnm");
        v_totalpage = dbox.getInt("d_totalpage");
        v_rowcount = dbox.getInt("d_rowcount");
        v_year = dbox.getString("d_year");
        v_grcodenm = dbox.getString("d_grcodenm");
        v_grcode   = dbox.getString("d_grcode");

        if (!v_searchtext.equals("")) {
            v_subjnm = StringManager.replace(v_subjnm, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
            // 제목검색어가 있었다면 해당 부분을 해당색으로 부각시킨다.
        }
        
        if(v_cpsubjseq.equals("")){
        	v_cpsubjseq = "<a href=\"javascript:eduinfo('" + v_year + "','" + v_subj + "','" + v_subjseq + "','" + v_subjseqgr + "')\"><span class=text_color04>미등록</span></a>";
        }
        
        v_subjnm = "<a href=\"javascript:eduinfo('" + v_year + "','" + v_subj + "','" + v_subjseq + "','" + v_subjseqgr + "')\">" + v_subjnm + "</a>";
%>
        <tr> 
          <td class="table_02_1"><%=v_dispnum%></td>
          <td class="table_02_1"><a href="javascript:whenGrcompList('<%=v_grcode%>')"><%=v_grcodenm%></a></td>
          <td class="table_02_2"><%=v_subjnm%></td>
          <td class="table_02_1"><%=StringManager.toInt(v_subjseqgr)%> / <%=v_cpsubjseq%></td>
          <td class="table_02_1"><%=v_cpnm%></td>
          <td class="table_02_1"><%=FormatDate.getFormatDate(v_propstart,"yyyy/MM/dd")%> - <%=FormatDate.getFormatDate(v_propend,"yyyy/MM/dd")%></td>
          <td class="table_02_1"><%=FormatDate.getFormatDate(v_edustart,"yyyy/MM/dd")%> - <%=FormatDate.getFormatDate(v_eduend,"yyyy/MM/dd")%></td>
        </tr>
<%
	}
	if(list.size() <= 0){
%>
        <tr> 
          <td class="table_02_1" colspan="8" height="28" bgcolor="#ffffff">조회된 데이터가 없습니다.</td>
        </tr>
<%
	}
}
%>
      </table>
      
    </td>
  </tr>
</table>
<br>
<table width="1000" border="0" cellpadding="5" cellspacing="1">
  <tr>
    <td><%= PageUtil.printPageList(v_totalpage, v_pageno, v_rowcount) %></td>
  </tr>
    <tr height="100">
    <td>
      <%@ include file = "/learn/library/getJspName.jsp" %> 
    </td>
  </tr>    
</table>
<br>
</form>
</body>
</html>
