<%
//********************************************************************
//  1. 제      목: SCORM마스터폼 Lesson 수정화면
//  2. 프로그램명 : za_MasterFormLessonSCORM_U.jsp
//  3. 개      요: SCORM마스터폼 Lesson 수정화면
//  4. 환      경: JDK 1.4
//  5. 버      젼: 1.0
//  6. 작      성: 강성욱 2004. 12. 3
//  7. 수      정:
//********************************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.beta.*" %>
<%@ page import = "com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
    	box = RequestManager.getBox(request);
    }
    
    String  p_subj   		= box.getString("p_subj");
    String	c_gadmin		= box.getSession("s_gadmin");
    
    String	p_process		= box.getString("p_process");
    String  ss_contenttype  = box.getString("s_contenttype");   //마스터폼 리스트 ContentType
    String  ss_upperclass 	= box.getString("s_upperclass");	//마스터폼 리스트 화면 대분류
    String  ss_middleclass 	= box.getString("s_middleclass");	//마스터폼 리스트 화면 중분류
    String  ss_lowerclass  	= box.getString("s_lowerclass");	//마스터폼 리스트 화면 소분류
	int		p_cnt_lesson= box.getInt("p_cnt_lesson");
	
	boolean	canChangeSubj = GetCodenm.canChangeSubj(p_subj,"CA",null);	//CA정보 수정가능여부
    
	BetaMasterFormData	da	=(BetaMasterFormData)request.getAttribute("BetaMasterFormData");
	String	v_ismfbranch 	= da.getIsmfbranch();
	String 	v_subjnm		= da.getSubjnm();
	String	v_dir			= da.getDir();
	String	v_contenttypetxt= da.getContenttypetxt();
	String	v_unchangableMaxLesson = da.getUnchangableMaxLesson();
	int		v_cnt_lesson	= da.getCnt_lesson();
	
	if(p_cnt_lesson>v_cnt_lesson)	v_cnt_lesson = p_cnt_lesson;
	
	ArrayList		list1 = (ArrayList)request.getAttribute("BetaMfModuleData");
	ArrayList		list2 = (ArrayList)request.getAttribute("BetaMfLessonData");
	ArrayList		list3 = (ArrayList)request.getAttribute("MfBranch");
	
	BetaMfLessonData	data2 = null;
	MfBranchData	brdata = null;
	SelectParam param = new SelectParam("p_isbranch", "", false, 1, box.getHttpSession());
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/css/admin_style.css" type="text/css">
<script language="JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
</head>
<script language="javascript">
function checkChange(){
<%	if(canChangeSubj){	%>	
		return true;
<%	}else{				%>	
		alert("학습자가 존재하므로 과정구성정보를 수정할 수 없습니다");
		return false;
<%	}					%>
}
function whenLessonCnt(){
	if(!checkChange())	return;
	document.f2.p_process.value="updateLessonPage";
	document.f2.submit();
}
function whenSubmit(){
	if(!checkChange())	return;
	if(!checkOK())	return;
	document.f2.p_process.value="updateLesson";
	document.f2.submit();
}
function checkOK(){
	var isExist=false;

	for(var i=0;i<document.f2.length;i++){
//alert(document.f2.elements[i].name+"="+document.f2.elements[i].value);
//alert("length="+document.f2.elements[i].value.length);
//alert("value="+document.f2.elements[(i-1)].value);
		if(document.f2.elements[i].name=="p_sdesc" && document.f2.elements[i].value.length > 0){
			if(document.f2.elements[(i-1)].value == '<%=v_unchangableMaxLesson%>'){
				isExist = true;
				break;
			}
		}
	}
	
	if(!isExist){
		if ("<%=v_unchangableMaxLesson%>" == "000")
				alert("1개 이상을 등록하셔야 합니다");
		else	alert("<%=v_unchangableMaxLesson%> Lesson까지 입력하셔야 합니다.");
	}
	
	return isExist;
}
function whenDelete(lesson){
	if(!checkChange())	return;
	if(confirm("삭제한 Lesson의 모든 연관정보가 사라집니다.\n\n삭제하시겠습니까?")){
		var url=document.f2.action;
		url +="?p_process=DeleteOBCLesson&p_subj=<%=p_subj%>&p_lesson="+lesson;
		document.location=url;
	}
}


function whenChangeModule(){
	var maxIdx = <%=v_cnt_lesson%>;
	var curIdx = maxIdx;	
	var bakIdx = maxIdx;		

	for(var i=document.f2.p_module.length; i >0; i--){
		j = i-1;
		curIdx =document.f2.p_module[j].selectedIndex;
			
		if (curIdx != bakIdx){
			if (curIdx == maxIdx || curIdx > bakIdx){
				document.f2.p_module[j].options[bakIdx].selected = true;
			}else
				bakIdx = curIdx;
		}

	}
}
function whenBranch(lesson){
	var url=document.f2.action;
	url +="?p_process=updateLessonBranchPage&p_subj=<%=p_subj%>&p_lesson="+lesson;
	window.open(url,"branchWin","width=800,height=600");
}
function whenAssign(module,lesson){
	var url=document.f2.action;
	url +="?p_process=subjObjectFsetPage&p_subj=<%=p_subj%>&p_module="+module+"&p_lesson="+lesson;
	window.open(url,"assignWin","width=800,height=700");
}
function whenSavePreviewObj(){
	document.f2.p_process.value="previewObjectSave";
	document.f2.submit();	
}
function whenLessonBranchObject(lesson,branch){
	var url=document.f2.action;
	url +="?p_process=objectBranch&p_subj=<%=p_subj%>&p_lesson="+lesson+"&p_branch="+branch;
	window.open(url,"objBranchWin","width=600,height=500");
}
function whenLessonObject(lesson,oid){
	var url=document.f2.action;
	url +="?p_process=changeObjectPage&p_subj=<%=p_subj%>&p_lesson="+lesson+"&p_oid="+oid;
	window.open(url,"objWin","width=600,height=500");
}
</script>


<body bgcolor="#FFFFFF" text="#000000" topmargin="0" leftmargin="0">


  <table width="1000" border="0" cellspacing="0" cellpadding="0" height="663">
    <tr>
    <td align="center" valign="top"> 
      <!----------------- title 시작 ----------------->
      <table width="97%" border="0" cellspacing="0" cellpadding="0">
        <tr>
            <td background="/images/admin/beta/tit_masterform.gif"><img src="/images/admin/contents/contents_title4.gif" width="206" height="36" border="0"></td>
        </tr>
      </table>
        <!----------------- title 끝 ----------------->
        <br>
        <br>
	<%@ include file="/beta/admin/include_BetaMasterFormAdmin.jsp" %> 

        <table class="table_out" width="97%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td bgcolor="#636563"> 
              <table width="100%" border="0" cellspacing="1" cellpadding="0">
				<FORM name = "f2" method = "post" action="/servlet/controller.beta.BetaMasterFormServlet">
					<input type=hidden name=p_process  		value="">
					<input type=hidden name=p_action		value="">
					<input type=hidden name=p_subj			value="<%=p_subj%>">
					<input type=hidden name=p_contenttype	value="<%=da.getContenttype()%>">
					<input type=hidden name=s_upperclass 	value="<%=ss_upperclass%>">
                    <input type=hidden name=s_middleclass 	value="<%=ss_middleclass%>">
                    <input type=hidden name=s_lowerclass 	value="<%=ss_lowerclass%>">
                    <input type=hidden name=s_contenttype   value="<%=ss_contenttype%>">
                <tr> 
                  <td bgcolor="#FFFFFF" align="center" valign="top"> 
                  <br>
                    <!----------------- 구성할 차시수 시작 ----------------->
                    <table width="99%" border="0" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td valign="bottom" height="20" width="195">구성할 차시수 : 
                          <input name="p_cnt_lesson" type="text" class="input" size="2" value="<%=v_cnt_lesson%>">
                        </td>
                        <td><a href="javascript:whenLessonCnt()"><img src="/images/admin/contents/go1_butt.gif" width="33" height="20" border="0"><a></td>
                      </tr>
                      <tr> 
                        <td height="3"></td>
                      </tr>
                    </table>
                    <!----------------- 구성할 차시수 끝 ----------------->

                    <table class="table_out" width="99%" border="0" cellspacing="1" cellpadding="5">
                      <tr> 
                        <td colspan="6" class="table_top_line"></td>
                      </tr>
                      <tr> 
                        <td width="5%" height="25" class="table_title"><b>Lesson</b></td>
                        <td class="table_title"><b>차시(Lesson)명</b></td>
                        <td class="table_title"><b>Module</b></td>
                        <td class="table_title"><b>연결Object</b></td>
                        <td class="table_title"><b>비 고</b></td>
                      </tr>
<% 		for (int i=0; i<list2.size(); i++) {
        		data2  = (MfLessonData)list2.get(i); 
%>
                      <tr> 
                      	<input type=hidden name="p_owner" value="">
                      	<input type=hidden name="p_starting" value="">
                      	
                        <td align="center" bgcolor="#EEEEEE" height="25"><%=data2.getLesson()%></td>
                        <td class="table_02_1">
                          <input name="p_lesson" type="hidden" value="<%=data2.getLesson()%>">	 
                          <input name="p_sdesc" type="text" class="input" value="<%=data2.getSdesc()%>" size="30">
                        </td>
                        <td class="table_02_1"> 
                          <!--<select name="p_module1" onChange="whenChangeModule('<%=data2.getModule()%>')">-->
                          <select name="p_module">
                          <%=MasterFormBean.make_moduleSelect(list1,data2.getModule())%>
                          </select>
                        </td>
                        <td class="table_02_2">
<%
				Hashtable ht = data2.getObjList();
				for(int j=0;j<ht.size();j++){
					MfLessonDataSub ds = (MfLessonDataSub)ht.get(String.valueOf(j));
					%> <input type=checkbox name="p_previewobj" value="<%=ds.getOid()%>"
					<%	if (ds.getIsPreviewed().equals("Y")) { %>
						checked
					<%	}	%>
					> <a href="javascript:whenLessonObject('<%=data2.getLesson()%>','<%=ds.getOid()%>')"><%=ds.getOrdering()%>. <b><%=ds.getOid()%></b> - <%=ds.getSdesc()%></a><br> 
					<%
				}
%>
                        </td>
                        <td class="table_02_1">
                        	<a href="javascript:whenAssign('<%=data2.getModule()%>','<%=data2.getLesson()%>')"><img src="/images/admin/course/assign_object.gif" border=0></a>
				<%	if(Integer.parseInt(data2.getLesson()) > Integer.parseInt(v_unchangableMaxLesson)){	%>                        
                        	<a href="javascript:whenDelete('<%=data2.getLesson()%>')"><img src="/images/admin/button/btn_del.gif" border=0></a>
				<%	}	%>
                      	</td>
                      </tr>            		
<%  		}  
			
			int list_size = 1;
			if (list2 != null)	list_size = list2.size() + 1;
			String	v_lesson = "";
			for (int i=list_size;i<=v_cnt_lesson;i++){
				v_lesson = new DecimalFormat("000").format(i);
			%>
                      <tr> 
                      	<input type=hidden name="p_owner" value="">
                      	<input type=hidden name="p_starting" value="">
                        <td align="center" bgcolor="#EEEEEE" height="25"><%=v_lesson%></td>
                        <td class="table_02_1">
                          <input name="p_lesson" type="hidden" value="<%=v_lesson%>">	  
                          <input name="p_sdesc" type="text" class="input" value="" size="30">
                        </td>
                        <td class="table_02_1"> 
                          <!--<select name="p_module2" onChange="whenChangeModule('<%=v_lesson%>')">-->
                          <select name="p_module">
                          <%=MasterFormBean.make_moduleSelect(list1, "")%>
                          </select>
                        </td>
                        <td class="table_02_1"></td>
                        <td class="table_02_1">&nbsp;</td>
                      </tr>           					
<%
			}
%>

                    </table>
                    <!----------------- 차시정보수정 끝 ----------------->
                    <br>
                    <!----------------- 저장버튼 시작 ----------------->
                    <table width="50%" border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td align="center">
                        	<a href="javascript:whenSubmit()"><img src="/images/admin/contents/save1_butt.gif" width="37" height="18" border="0"></a>
                        	<a href="javascript:whenSavePreviewObj()"><img src="/images/admin/contents/preobj_butt.gif"  border="0"></a>
                        	<a href="javascript:whenList()"><img src="/images/admin/system/list1_butt.gif"  height="18" border="0"></a>
                        </td>
                      </tr>
                      <tr> 
                        <td height="8"></td>
                      </tr>
                    </table>
                    <!----------------- 저장버튼 끝 ----------------->
                  </td>
                </tr>
                </FORM>
              </table>
            </td>
          </tr>
        </table>
        <br>

      </td>
  </tr>
</table>
<%@ include file = "/learn/library/getJspName.jsp" %>


</body>
</html>
