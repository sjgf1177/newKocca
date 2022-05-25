<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
//**********************************************************
//  1. 제      목: TOPIC READ
//  2. 프로그램명: zu_Topic_R.jsp
//  3. 개      요: 토론방 주제 보기
//  4. 환      경: JDK 1.3
//  5. 버      젼: 1.0
//  6. 작      성: 박진희 2003. 9. 02
//  7. 수      정:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.contents.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%                                       
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_user_id   = box.getSession("userid");  
    String  v_process   = box.getString("p_process");    
    String  v_subj      = box.getString("p_subj");
    String  v_year      = box.getString("p_year");
    String  v_subjseq   = box.getString("p_subjseq");    
    String  v_tpcode    = box.getString("p_tpcode");    
    String  v_started   = "";
    String  v_ended     = "";
    String  v_title     = ""; 
    String  v_addate    = "";
    String  v_adcontent = "";
    String  v_aduserid  = "";
    String  v_name      = "";
    String  v_userid    = "";    
    int     v_seq       =  0;
    int     v_cnt       =  0;
    int     v_levels    =  0;
    int     i           =  0;
    String	v_replyTitle= "";
    boolean v_status    =  false;
    ToronData data      = null;
    ArrayList list      = null;
    //DEFINED class&variable END
        
	data = (ToronData)request.getAttribute("topicSelect");     
	v_started   = data.getStarted(); 
	v_ended     = data.getEnded();
	v_title     = data.getTitle();
	v_addate    = data.getAddate();
	v_adcontent = data.getAdcontent();
	v_userid    = data.getAduserid();
	v_name      = data.getName();
	v_cnt       = data.getCnt();
    if((Integer.parseInt(v_started) < Integer.parseInt(FormatDate.getDate("yyyyMMddHH")))&&
    (Integer.parseInt(FormatDate.getDate("yyyyMMddHH")) < Integer.parseInt(v_ended))){
        v_status = true;
    }else{
        v_status = false;
    }
    v_addate    = FormatDate.getFormatDate(v_addate,"yyyy.MM.dd"); 
    v_started   = FormatDate.getFormatDate(v_started,"yyyy.MM.dd HH");    
    v_ended     = FormatDate.getFormatDate(v_ended,"yyyy.MM.dd HH");
    list = (ArrayList)request.getAttribute("toronList");
    
	SubjectBean		subjbean = new SubjectBean();
	SubjectData		subjdata = new SubjectData();
					subjdata = subjbean.SelectSubjectData(box);
	
	EduStartBean	bean		= new EduStartBean();
	EduScoreData    scoredata	= new EduScoreData();
					scoredata	= bean.SelectEduScore(box);

%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>토론방</title>
<link rel="stylesheet" type="text/css" href="/css/portal/base.css" />
<script type="text/javascript" src="/script/portal/common.js"></script>
<script language="javascript">
<!--
    function whenTopicList(){
        document.form1.p_process.value = "";
        document.form1.action = "/servlet/controller.study.ToronServlet";
        document.form1.submit();                
    }
       
    function whenTopicUpdate(){
        document.form1.p_process.value = "TopicUpdatePage";
        document.form1.action = "/servlet/controller.study.ToronServlet";
        document.form1.submit();           
    }

    function whenTopicDelete(){
        document.form1.p_process.value = "TopicDelete";
        document.form1.action = "/servlet/controller.study.ToronServlet";
        document.form1.submit();           
    }    
    function whenToronInsert(){
        document.form1.p_process.value = "ToronInsertPage";
        document.form1.action = "/servlet/controller.study.ToronServlet";
        document.form1.submit(); 
    }            
    function whenToronView(seq){
        document.form1.p_process.value = "ToronSelect";
        document.form1.p_seq.value = seq;
        document.form1.action = "/servlet/controller.study.ToronServlet";
        document.form1.submit();
    }
-->
</script>
</head>
<body id="pop_study"><!-- popup size : 890* -->
<form name="form1" method="post">
	<input type="hidden" name="p_process"/>
	<input type="hidden" name="p_subj" value="<%=v_subj%>"/>
	<input type="hidden" name="p_year" value="<%=v_year%>"/>
	<input type="hidden" name="p_subjseq" value="<%=v_subjseq%>"/>
	<input type="hidden" name="p_tpcode" value="<%=v_tpcode%>"/>
	<input type="hidden" name="p_seq"/>

	<div id="pop_header">
		<h1><img src="/images/portal/myclass/study/pop_h1_tit11.gif" alt="토론방" /></h1>
	</div>
	<div id="pop_container">
		<div id="contentwrap">
			<div id="con_scoll">
			
<%	if (scoredata != null) { %>
				<div id="btn_close"><a href="javascript:top.window.close()"><img src="/images/portal/btn/btn_close.gif" alt="닫기" /></a></div>
				<div class="study_tltle study_tltle_sub"><div class="study_tltle_left"><div class="study_tltle_right">
					<dl class="class_info"> 
						<dt><span>과정명</span></dt>
						<dd><%= subjdata.getSubjnm() %></dd>
					</dl>
					<dl class="class_info">
						<dt><span>교육기간</span></dt>
						<dd class="class_day"><%= FormatDate.getFormatDate(scoredata.getEdustart(),"yyyy.MM.dd") %> ~<%= FormatDate.getFormatDate(scoredata.getEduend(),"yyyy.MM.dd") %></dd>
					</dl>
				</div></div></div>
<%	} %>
				
				<div class="content">
					<h3><img src="/images/portal/myclass/study/pop_stit13.gif" alt="토론주제" /></h3>
					<table class="board_view_bl2">
					<!--[if ie]><colgroup><col width="7%" /><col width="21%" /><col width="7%" /><col width="15%" /><col width="9%" /><col width="21%" /><col width="7%" /><col width="10%" /></colgroup><![endif]-->
					<colgroup><col width="8%" /><col width="21%" /><col width="8%" /><col width="15%" /><col width="9%" /><col width="21%" /><col width="8%" /><col width="10%" /></colgroup>
					<tr>
						<th>주제</th>
						<td colspan="7" class="end"><strong><%= v_title %></strong></td>
					</tr>
					<tr>
						<th>발의자</th>
						<td><%= v_name %></td>
						<th>발의일</th>
						<td class="num"><%= v_addate %></td>
						<th>토론기간</th>
						<td class="num"><%=v_started%>시~<%=v_ended%>시</td>
						<th>조회수</th>
						<td class="num end"><%= v_cnt %></td>
					</tr>
					<tr>
						<td colspan="8" class="con end"><%= v_adcontent %></td>
					</tr>
					</table>

<%	if(v_user_id.equals(v_userid)){ %>
					<p class="list_btn"><a href="javascript:whenTopicUpdate()" class="btn_gr"><span>발의내용 수정</span></a><a href="javascript:whenTopicDelete()" class="btn_gr"><span>삭제</span></a></p>
<%	} %>    

					<h3 class="mg_t30"><img src="/images/portal/myclass/study/pop_stit14.gif" alt="의견목록" /></h3>
					<table class="board_list">
					<colgroup><col width="10%" /><col width="68%" /><col width="12%" /><col width="10%" /></colgroup>
					<thead>
					<tr class="gray">
						<th><p>번호 </p></th>
						<th><p>의견</p></th>
						<th><p>게시일</p></th>
						<th class="end"><p>참여자</p></th>
					</tr>
					</thead>
					<tbody>
<% 
	for(i = 0; i < list.size(); i++) {        
	    ToronData data1  = (ToronData)list.get(i);  
	    v_seq       = data1.getSeq();      
	    v_title     = data1.getTitle();    
	    v_aduserid  = data1.getAduserid(); 
	    v_addate    = data1.getAddate();   
	    v_name      = data1.getName();    
	    v_levels    = data1.getLevels();
	    v_addate    = FormatDate.getFormatDate(v_addate,"yyyy.MM.dd");
	    v_replyTitle= "";
	    
        if(v_levels > 1){
	        for(int j=1;j < v_levels;j++){
	        	v_replyTitle +="&nbsp;&nbsp;";
	        }
	        v_replyTitle += "<img src=\"/images/portal/ico/ico_re.gif\" align=\"absbottom\">";
        }
%>        
					<tr onmouseover="className='over'" onmouseout="className=' '">
						<td class="num"><%= list.size() - i %></td>
						<td class="ta_l"><%= v_replyTitle %><a href="javascript:whenToronView('<%=v_seq%>')"><%= v_title %></a>
						</td>
						<td class="num"><%= v_addate %></td>
						<td><%= v_name %></td>
					</tr>
<%  }
	if(i == 0){ %>        
                    <tr> 
                    	<td colspan="4">등록된 내용이 없습니다</td>                  
                    </tr>
<%  } %>                                                                                                      
					</tbody>
					</table>

					<p class="list_btn"><% if(v_status){ %><a href="javascript:whenToronInsert()" class="btn_gr"><span>의견작성</span></a><%}%><a href="javascript:whenTopicList()" class="btn_gr"><span>토론목록</span></a></p>
				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>