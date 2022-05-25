<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
//**********************************************************
//  1. ��      ��: PROJECT HANDLING PAGE
//  2. ���α׷���: zu_Project_U.jsp
//  3. ��      ��: ����Ʈ ��� & ����
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2005. 8.
//  7. ��      ��: 2010.1.12
//***********************************************************
%>
<%@page contentType = "text/html;charset=euc-kr" %>
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
    String  v_process   = box.getString("p_process");
    String  v_subj      = box.getString("p_subj");
    String  v_year      = box.getString("p_year");
    String  v_subjseq   = box.getString("p_subjseq");
    String  v_lesson    = box.getString("p_lesson");
    String  v_reptype   = box.getString("p_reptype");
    String  v_projgrp   = box.getString("p_projgrp");
    String  v_status    = box.getStringDefault("p_status","Y");
    int     v_ordseq    = box.getInt("p_ordseq");
    int     v_projseq   = box.getInt("p_projseq");
    int     v_getcnt    = box.getInt("p_getcnt");
    String  v_title     = "";
    String  v_contents  = "";
    String  v_tucontents= "";
    String  v_title2    = "";
    String  v_contents2 = "";
    String  v_expiredate= "";
    String  v_deadlinesdate= "";
    String  v_deadlineedate= "";
    String  v_upfile    = "";
    String  v_upfile1   = "";
    String  v_upfile2   = "";
    String  v_ordrealfile1 = ""; //�������� ��������
    String  v_ordrealfile2 = ""; //������� ����

    String  v_realfile  = ""; //�л��� ������ ���� ����
    String 	v_upfilesize = "";
    String  v_upfile_value = "";
    String  v_upfile1_value= "";
    String  v_upfile2_value= "";
    String  v_isret     = "";
    String  v_retreason = "";
    String  v_issubmit = "";
    String  v_ansyn = "";
    String  v_eduend = "";
    String  v_nowdate = "";

    int     v_score     =  0;
    int     v_score_mas =  0;
    int     i           =  0;
    ProjectData  data1  =null;
    ProjectData  data2  =null;
    //DEFINED class&variable END
    // editor
    String content      = "";
    String width        = "600";
    String height       = "300";

    data1 = (ProjectData)request.getAttribute("selectProjectOrd");
    if(data1 != null){
        v_title     		= data1.getTitle();
        v_contents  		= data1.getContents();
        v_expiredate		= data1.getExpiredate();
        v_deadlinesdate		= data1.getDeadlinesdate();
        v_deadlineedate		= data1.getDeadlineedate();
        v_upfile    		= data1.getUpfile();
        v_upfile2   		= data1.getUpfile2();
		v_ordrealfile1 	= data1.getRealfile();
	 	v_ordrealfile2 	= data1.getRealfile2();
		v_ansyn        	= data1.getAnsyn();
		v_eduend       	= data1.getEduend();
        v_nowdate     	= data1.getTudate();

    //    if (v_deadlineedate.equals("")) {
    //        v_deadlineedate = v_expiredate;
    //    }

        if(v_title.length() == 0)  v_title = "";
        if(v_eduend.length() == 0){ v_eduend = "";
        }else{
          if(Integer.parseInt(v_eduend) < Integer.parseInt(FormatDate.getDate("yyyyMMddHH"))){ v_status="N";  }
        }
        if(v_upfile.length() == 0){    v_upfile   = "";         //÷������
        }else{
			//v_upfile_value =  v_upfile.substring(v_upfile.indexOf("_") + 1 );
			v_upfile_value =  v_ordrealfile1;
		}

        if(v_upfile2.length() == 0){    v_upfile2   = "";       //�������
        }else{
			//v_upfile2_value = v_upfile2.substring(v_upfile2.indexOf("_") + 1);
			v_upfile2_value = v_ordrealfile2;

		}
        if(v_contents.length() == 0){ v_contents = "";
        }else{  v_contents = StringManager.replace(v_contents,"\r\n","<br>");      }
    }

    data2 = (ProjectData)request.getAttribute("selectProjectRep");
    if(data2 != null){
        v_title2    = data2.getTitle();
        //content     = StringManager.replace(data2.getContents(),"\n;","<br>");
        v_contents2 = data2.getContents();
        v_score     = data2.getScore();
        v_upfile1   = data2.getUpfile();
		v_realfile  = data2.getRealfile();
		v_upfilesize= data2.getUpfilesize();
        v_tucontents= data2.getTucontents();
        v_score_mas = data2.getScore_mas();
		v_isret     = data2.getIsret();
		v_retreason = data2.getRetreason();

        if(v_title2.length() == 0)     v_title2    = "";
        if(v_tucontents.length() == 0) v_tucontents= "";

        if(v_upfile1.length() == 0){
            v_upfile1   = "";
        }else{
	    v_upfile1_value = v_realfile;
	}
        if(v_score_mas > 0){ v_status = "N";    }
    }

    ProjectBean pjbean = new ProjectBean();
    if(pjbean.selectProjectRepCount(box) >0){
      v_issubmit = "Y";
    }else{
      v_issubmit = "N";
    }


    //������ ��������
    EduStartBean 	bean = new EduStartBean();

    //EduScoreData   dataStep  =null;
    EduScoreData   dataStep = bean.SelectEduScore(box);

    Calendar cDate = Calendar.getInstance();
    Calendar sDate = Calendar.getInstance();
    Calendar eDate = Calendar.getInstance();

    SimpleDateFormat formatter = new SimpleDateFormat ("yyyyMMdd HH:mm:ss", Locale.KOREA);

	if(!v_deadlinesdate.equals("")) {
    	cDate.setTime(formatter.parse(v_nowdate+" 12:00:00"));
    	sDate.setTime(formatter.parse(v_deadlinesdate+" 00:00:00"));
    	eDate.setTime(formatter.parse(v_deadlineedate+" 23:59:59"));
    }

    String isDeadline = "1";
    if ((cDate.equals(sDate) || cDate.after(sDate)) && (cDate.equals(eDate) || cDate.before(eDate))) {
            isDeadline = "0";
    }
    
    SubjectBean		subjbean = new SubjectBean();
	SubjectData		subjdata = new SubjectData();
					subjdata = subjbean.SelectSubjectData(box);

    //EduStartBean	bean		= new EduStartBean();
    EduScoreData    scoredata	= new EduScoreData();
    				scoredata	= bean.SelectEduScore(box);
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<title>����Ʈ</title>
<link rel="stylesheet" type="text/css" href="/css/portal/base.css" />
<script type="text/javascript" src="/script/portal/common.js"></script>
<script type="text/javascript" src="/namo_cross/js/namo_scripteditor.js"></script> 
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type='text/javascript' src='/script/user_patch.js'></script>
<script type="VBScript" src="/script/cresys_lib.vbs"></script>  
<script type="text/javascript" src="/script/portal/FileButton.js"></script>
<script language="JavaScript">
<!--
    // �߰�����
    function halfregist() {
        if (blankCheck(document.form1.p_title.value)) {
            alert("������ �Է��ϼ���!");
            document.form1.p_title.focus();
            return;
        }
        if (realsize(document.form1.p_title.value) > 200) {
            alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_title.focus();
            return;
        }

    	if(!CrossEditor.IsDirty()){ // ũ�ν������� ���� ������ �Է� Ȯ�� 
            alert("������ �Է��� �ּ��� !!"); 
            CrossEditor.SetFocusEditor();// ũ�ν������� Focus �̵� 
            return; 
        } 


        // ���� ����
        //if(!limitFile()){
        //    alert("���ε� �������� ���� ������ �����մϴ�.");
        //    return;
        //}
        	
        document.getElementById("p_content").value = CrossEditor.GetBodyValue();
        document.form1.p_contentsbyte.value = realsize(document.form1.p_content.value);
        document.form1.action = "/servlet/controller.study.ProjectServlet?g_subj=<%=v_subj%>&g_year=<%=v_year%>";
        document.form1.p_process.value = "ProjectHalfSave";
        document.form1.submit();
    }

    // ������
    var isDeadline = "<%=isDeadline%>";
    function whenProjectRep() {
        if (isDeadline=="1") {
            alert('���� ���� �Ⱓ�� �ƴմϴ�. ');
            return;
        }

        if (blankCheck(document.form1.p_title.value)) {
            alert("������ �Է��ϼ���!");
            document.form1.p_title.focus();
            return;
        }
        if (realsize(document.form1.p_title.value) > 200) {
            alert("������ �ѱ۱��� 100�ڸ� �ʰ����� ���մϴ�.");
            document.form1.p_title.focus();
            return;
        }

        //���� ����
        //if(!limitFile()){
        //    alert("���ε� �������� ���� ������ �����մϴ�.");
        //    return;
        //}
        	
        document.getElementById("p_content").value = CrossEditor.GetBodyValue();
		document.form1.p_contentsbyte.value = realsize(document.form1.p_content.value);
		document.form1.action = "/servlet/controller.study.ProjectServlet?g_subj=<%=v_subj%>&g_year=<%=v_year%>";
		document.form1.p_process.value = "ProjectHandling";
		document.form1.submit();
    }

<%if(v_status.equals("Y")){ %>
    // ����ں��⼱��
    function SelectAnsyn(ansyn) {
		if( ansyn == "TEXT" ) {
			document.all["tabtext_1"].style.display = "";
			document.all["tabfile_2"].style.display = "none";
		}
		if( ansyn == "FILE" ){
		    document.all["tabtext_1"].style.display = "none";
			document.all["tabfile_2"].style.display = "";
		}
		if( ansyn == "ALL" ){
		    document.all["tabtext_1"].style.display = "";
			document.all["tabfile_2"].style.display = "";
		}
    }
<%}%>

//���� Ȯ���� ���͸�   ( <== ���� ����)
//function limitFile() {
//    var ss_codenmlist = ".doc,.ppt,.xls,.bmp,.jpg,.gif,.zip,.txt,.avi,.asf,.asx,.wma,.wmv,.xml,.mp3,.fla,.swf,.mpeg,.hwp,.gul";
//    var extArray = ss_codenmlist.split(",");
//    var allowSubmit = true;
// 
//    var file = document.getElementById("p_file1").value;
//    
//    if(file != "") {
//        var strAry = file.split(".");
//        var strAryLen = strAry.length;
//
//        var ext = "."+strAry[strAryLen-1].toLowerCase();
//                         
//        for(var i = 0 ; i < extArray.length ; i++) {          
//                               
//         if (extArray[i] != ext){ 
//             allowSubmit = false; 
//         } else {
//         	allowSubmit = true;
//         	break;
//         }
//        }
//        if(!allowSubmit) {
//        	return false;
//        }
//    }
// 
//    return true;
//    
//}

-->
</script>
</head>
<body id="pop_study"><!-- popup size : 890* -->
<form name="form1" method="post" enctype = "multipart/form-data">
<input type="hidden" name="p_process"/>
<input type="hidden" name="p_subj" value="<%=v_subj%>"/>
<input type="hidden" name="p_year" value="<%=v_year%>"/>
<input type="hidden" name="p_subjseq" value="<%=v_subjseq%>"/>
<input type="hidden" name="p_ordseq" value="<%=v_ordseq%>"/>
<input type="hidden" name="p_projseq" value="<%=v_projseq%>"/>
<input type="hidden" name="p_lesson" value="<%=v_lesson%>"/>
<input type="hidden" name="p_reptype" value="<%=v_reptype%>"/>
<input type="hidden" name="p_projgrp" value="<%=v_projgrp%>"/>
<input type="hidden" name="p_upfile1" value="<%=v_upfile1%>"/>
<input type="hidden" name="p_contentsbyte" value=""/>
<input type="hidden" name="p_getcnt"       value="<%=v_getcnt%>"/>

	<div id="pop_header">
		<h1><img src="/images/portal/myclass/study/pop_h1_tit8.gif" alt="����Ʈ" /></h1>
	</div>
	<div id="pop_container">
		<div id="contentwrap">
			<div id="con_scoll">
			
<%	if (scoredata != null) { %>
				<div id="btn_close"><a href="javascript:top.window.close()"><img src="/images/portal/btn/btn_close.gif" alt="�ݱ�" /></a></div>
				<div class="study_tltle study_tltle_sub"><div class="study_tltle_left"><div class="study_tltle_right">
					<dl class="class_info"> 
						<dt><span>������</span></dt>
						<dd><%= subjdata.getSubjnm() %></dd>
					</dl>
					<dl class="class_info">
						<dt><span>�����Ⱓ</span></dt>
						<dd class="class_day"><%= FormatDate.getFormatDate(scoredata.getEdustart(),"yyyy.MM.dd") %> ~<%= FormatDate.getFormatDate(scoredata.getEduend(),"yyyy.MM.dd") %></dd>
					</dl>
				</div></div></div>
<%	} %>
				
				<div class="content">
					<h3><img src="/images/portal/myclass/study/pop_stit11.gif" alt="������������" /></h3>
<%
	if(v_ansyn.equals("U")) {
%>
					<div class="info_box">
						<ul>
							<li>������ ����� ÷������ (����,���� ��)�� ������ ��쿡�� ÷������   ���� [ã�ƺ���]�� Ŭ�� �� ������ ������ ���� �� ��,<br/>
����� ������ �����ϰ� �Է� ��, �Ʒ��� ���� ��ư�� Ŭ���մϴ�.
							</li> 
							<li>÷������ ���� �������� ���� �ô� ����,���븸�� �Է� �� �����ư�� Ŭ���մϴ�.</li> 
							<li><strong>��, ������ 2,000�� �̸����� ���ѵǹǷ� ������  ���� ��� ÷�����Ϸ� ������ �ֽʽÿ�.</strong></li>
							<li>÷�����ϸ��� ������ �̸����� �ۼ� �����ϼ���.</li>
						</ul>
						<dl class="note">
							<dt>���ǻ���</dt>
							<dd>- Ÿ���� ������ ������ ���(�����)  "0"��(�̼���) ó���˴ϴ�.</dd>
						</dl>
					</div>
<%
	} else if(v_ansyn.equals("T")) {
%>
					<div class="info_box">
						<ul>
							<li>�Ʒ��� �������� ������������� �ۼ��Ͻñ� �ٶ��ϴ�.</li> 
							<li><strong>������ ������ ä���Ϸᰡ �Ǳ��������� ������ �����մϴ�.</strong></li>
						</ul>
						<dl class="note">
							<dt>���ǻ���</dt>
							<dd>- ������ �ۼ��� �ʹ� �������� ��ǻ�͸� �ѳ����� �ۼ��� ������ ������ ���� ���� ���� �ֽ��ϴ�.<br />
&nbsp;&nbsp;&nbsp;���Ϸ� �ۼ��ϼż� �ű�ðų� �߰��� ������ �ѹ��� �Ͻñ� �ٶ��ϴ�.<br />
&nbsp;&nbsp;&nbsp;��������  A4��з����� �������ֽñ� �ٶ��ϴ�.<br />
- �� ��� �ۼ��� �ݵ�� ������ ���� �ۼ� �ϼž߸� �Ǹ�,<br />
&nbsp;&nbsp;&nbsp;���� Ÿ�ο��� ��� �ۼ��� �Ƿ��ϴ� �� �������, ������ ������� ����� �����Ͻø� ������ �� �����ϴ�.<br />
- ������̰ų� 0���� ������ �̼��ᰡ �˴ϴ�. �����ϰ� �ۼ����ֽñ� �ٶ��ϴ�.</dd>
						</dl>
					</div>
<%
	} else if(v_ansyn.equals("F")) {
%>
					<div class="info_box">
						<ul>
							<li>�������� �ۼ��ϼż� ���Ϸ� �����Ͻñ� �ٶ��ϴ�.</li> 
							<li><strong>������ ������ ä���Ϸᰡ �Ǳ��������� ������ �����մϴ�.</strong></li>
						</ul>
						<dl class="note">
							<dt>���ǻ���</dt>
							<dd>- �� ��� �ۼ��� �ݵ�� ������ ���� �ۼ� �ϼž߸� �Ǹ�,<br />
&nbsp;&nbsp;&nbsp;���� Ÿ�ο��� ��� �ۼ��� �Ƿ��ϴ� �� �������, ������ ������� ����� �����Ͻø� ������ �� �����ϴ�.<br />
- ������̰ų� 0���� ������ �̼��ᰡ �˴ϴ�. �����ϰ� �ۼ����ֽñ� �ٶ��ϴ�.</dd>
						</dl>
					</div>
<%
	}
%>

					<h3 class="mg_t30"><img src="/images/portal/myclass/study/stit_report.gif" alt="�������" /></h3>
					<table class="study_view">
					<colgroup><col width="70px" /><col /></colgroup>
					<tr>
						<th>����</th>
						<td colspan="5" class="tit"><%= v_title %></td>
					</tr>
					<tr>
						<th>����Ⱓ</th>
						<td class="num"><%=FormatDate.getFormatDate(v_deadlinesdate,"yyyy.MM.dd")%> ~ <%=FormatDate.getFormatDate(v_deadlineedate,"yyyy.MM.dd")%></td>
					</tr>
					<tr>
						<td colspan="2" class="con"><%= v_contents %></td>
					</tr>
					<tr>
						<th>÷������</th>
						<td><%= "".equals(v_upfile_value) ? "" : "<img src=\"/images/portal/ico/ico_file.gif\" alt=\"file\" />" %><a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_upfile %>&p_realfile=<%= v_upfile%>'><span><%= v_upfile_value %></span></a></td>
					</tr>
<% if(v_status.equals("N")){        //������ ������ ������ ���
%>
                    <tr>
						<th>�������</th>
						<td><%= "".equals(v_upfile2_value) ? "" : "<img src=\"/images/portal/ico/ico_file.gif\" alt=\"file\" />" %><a href = '/servlet/controller.library.DownloadServlet?p_savefile=<%= v_upfile2 %>&p_realfile=<%= v_upfile2_value %>'><span><%= v_upfile2_value %></span></a></td>
                    </tr>
<% } %>
					</table>

<% if(v_status.equals("Y")){        //������ ������ ������ ���
%>
					<h3 class="mg_t30"><img src="/images/portal/myclass/study/stit_info.gif" alt="��������" /></h3>
					<table class="study_view">
					<colgroup><col width="70px" /><col /></colgroup>
					<tr>
						<th>������</th>
						<td colspan="5">
<%		if (v_ansyn.equals("U")){%><!--�������������-->
                        &nbsp;<input type=radio name='p_ansyn'  value='<%=v_ansyn%>' checked onclick="SelectAnsyn('ALL');"/>ALL
                        &nbsp; <input type=radio name='p_ansyn' value='<%=v_ansyn%>'  onclick="SelectAnsyn('TEXT');"/>TEXT�Է¹��
                        &nbsp; <input type=radio name='p_ansyn' value='<%=v_ansyn%>'  onclick="SelectAnsyn('FILE');"/>���Ͼ��ε�
<%		} else if (v_ansyn.equals("T")){%><!--TEXT�Է¹��-->
                        <!--&nbsp;<input type=radio name='p_ansyn'  value='<%=v_ansyn%>'  onclick="SelectAnsyn('ALL');"/>ALL -->
                        &nbsp; <input type=radio name='p_ansyn' value='<%=v_ansyn%>' checked onclick="SelectAnsyn('TEXT');"/>TEXT�Է¹��
                        <!--&nbsp; <input type=radio name='p_ansyn' value='<%=v_ansyn%>'  onclick="SelectAnsyn('FILE');"/>���Ͼ��ε�  -->
<%		} else if (v_ansyn.equals("F")){%> <!--���Ͼ��ε�-->
                        <!--&nbsp;<input type=radio name='p_ansyn'  value='<%=v_ansyn%>'  onclick="SelectAnsyn('ALL');"/>ALL -->
                        <!--&nbsp; <input type=radio name='p_ansyn' value='<%=v_ansyn%>'  onclick="SelectAnsyn('TEXT');"/>TEXT�Է¹��    -->
                        &nbsp; <input type=radio name='p_ansyn' value='<%=v_ansyn%>' checked onclick="SelectAnsyn('FILE');"/>���Ͼ��ε�
<%		}%>
						</td>
					</tr>
					</table>
					<table class="study_write bo_tn">
					<colgroup><col width="90px" /><col /></colgroup>
					<tr class="bgn">
						<th class="th">����</th>
						<td class="td pd_ln"><input type="text" name="p_title" class="inbox" style="width:590px;" value="<%= StringManager.convertHtmlchars(v_title2) %>" /></td>
					</tr>
					<tr id="tabtext_1" class="bgn">
						<th class="th">����</th>
						<td class="td pd_ln">
		                    <textarea id="p_content" name="p_content" style="display:none;"><%=StringManager.replace(v_contents2, "&", "&amp") %></textarea>
							<script type="text/javascript">
							    var CrossEditor = new NamoSE("contents");
							    var contentValue = document.getElementById("p_content").value; // Hidden �� ����
							    CrossEditor.editorStart();
							    //CrossEditor.SetUISize("500","600");
							    CrossEditor.SetBodyValue(contentValue); // ������ ���� ������ ����
							</script>
						</td>
					</tr>
					<tr class="bgn">
						<th class="th">����</th>
						<td class="td pd_ln"><%= v_score %></td>
					</tr>
					<tr class="bgn" id="tabfile_2">
						<th class="th">÷������</th>
						<td class="td pd_ln">
						<jsp:include page="/learn/user/portal/include/singleAttach_include.jsp">
                           <jsp:param name="i_imageFlag"           value="N" />                                    <!-- �̹��� �̸����� ����(Y/N) -->
                           <jsp:param name="i_targetImg"           value="" />                                     <!--  i_imageFlag �� 'Y' �϶��� img ������Ʈ id ���-->
                           <jsp:param name="i_realFileName"        value="<%= v_upfile1_value %>" />               <!-- ���� ���ϸ� ��� -->    
                           <jsp:param name="i_saveFileName"        value="<%= v_upfile1 %>" />                     <!-- ���� ���ϸ� ��� -->                        
                           <jsp:param name="i_fileSize"            value="<%= v_upfilesize %>" />                  <!-- ���� ������ -->
                           <jsp:param name="i_inputFileParamName"  value="p_file1" />                              <!-- Input File�� name �Ķ���� �� -->
                           <jsp:param name="i_formName"            value="form1" />                                <!-- Form �̸� -->
                           <jsp:param name="i_ServletName"         value="ProjectServlet" />                       <!-- ���� ���� �̸� -->
                           <jsp:param name="i_searchOnImagePath"   value="/images/portal/btn/file_search_on.gif" /><!-- ã�ƺ��� ��ư ���콺 ���� �̹��� ��� -->
                           <jsp:param name="i_searchOffImagePath"  value="/images/portal/btn/file_search.gif" />   <!-- ã�ƺ��� ��ư ���콺 �ƿ� �̹��� ���-->
                           <jsp:param name="i_style"               value="" />                                     <!-- ��Ÿ�� ���(��ư ��ġ ����) -->
                           <jsp:param name="i_year"                value="<%=v_year%>" />                          <!-- �����⵵ -->
                           <jsp:param name="i_subj"                value="<%=v_subj%>" />                          <!-- �����ڵ�-->
                        </jsp:include>       
							<!--div id="divFile" >
							<table border="0"><tr>
							<td >
								<input type="text" name="tempFileText1" id="tempFileText1" class="inbox fl_l mg_r6" style="width:300px;" readonly/>
							</td>
							<td>
								<input type="file" name="p_file1" id="p_file1" imageswap="true" imagesrc="/images/portal/btn/file_search.gif" onchange="document.getElementById('tempFileText1').value=this.value;" style="vertical-align:7px;width:0px;cursor:pointer;"/>
							</td>
							</tr>
							</table>
							</div-->
						</td>
					</tr>
<%//			if(v_upfile1.length() > 0){ %>
					<!--tr class="file_add">
						<th class="th"></th>
						<td class="td pd_ln">
						<p class="file_list"><img src="/images/portal/ico/ico_file.gif" alt="file" class="mg_r6" /><a href = '/servlet/controller.library.DownloadServlet?p_year=<%=v_year%>&p_subj=<%=v_subj%>&p_savefile=<%= v_upfile1 %>&p_realfile=<%= v_upfile1_value %>'><%=v_upfile1_value%></a> (<%=v_upfilesize%>Byte)
						<input type="checkbox" name="p_check" value="Y"/>�������� ����</p>
						</td>
					</tr-->
<%//			} %>
					</table>

					<p class="list_btn">
<%			if(v_issubmit.equals("N")){%>
						<a href="javascript:halfregist()" class="btn_gr"><span>�߰�����</span></a>
<%			}%>
<%
			if (dataStep != null) {
				if (dataStep.getTstep()<0.00) {
%>
						<a href="javascript:alert('���� ������ <%=dataStep.getTstep()%>%�Դϴ�.\n80% �̻�� ����Ʈ ������ �����մϴ�.')" class="btn_gr"><span>���</span></a>
<%				} else {%>
						<a href="javascript:whenProjectRep()" class="btn_gr"><span>���</span></a>
<%
				}
			}
%>
						<a href="javascript:history.back()" class="btn_gr"><span>���</span></a>
					</p>
<%	} else if(v_status.equals("N")) { %>
					<h3 class="mg_t30"><img src="/images/portal/myclass/study/stit_info.gif" alt="��������" /></h3>
					<table class="study_view">
					<colgroup><col width="70px" /><col /></colgroup>
					<tr>
						<th class="th">����</th>
						<td class="td pd_ln"><%= v_title2 %></td>
					</tr>
					<tr>
						<th class="th">����</th>
						<td class="td con"><%= v_contents2 %></td>
					</tr>
					<tr>
						<th class="th">����</th>
						<td class="td pd_ln"><%= v_score %></td>
					</tr>
					<tr>
						<th>÷������</th>
						<td><%= "".equals(v_upfile1) ? "" : "<img src=\"/images/portal/ico/ico_file.gif\" alt=\"file\" />" %><a href = '/servlet/controller.library.DownloadServlet?p_year=<%=v_year%>&p_subj=<%=v_subj%>&p_savefile=<%= v_upfile1 %>&p_realfile=<%= v_upfile1_value %>'><span><%= v_upfile1_value %></span></a></td>
					</tr>
					</table>
					
					<p class="list_btn">
						<a href="javascript:history.back()" class="btn_gr"><span>���</span></a>
					</p>
<%	} %>
		<% System.out.println("isret="+v_isret); %>
					<h3 class="mg_t30"><img src="/images/portal/myclass/study/stit_return.gif" alt="���� �ݷ�����" /></h3>
					<p class="inan_study_message"><%= v_tucontents %></p>

<%	if (v_isret.equals("Y")) { %>
					<h3 class="mg_t30"><img src="/images/portal/myclass/study/stit_worker.gif" alt="������� �򰡺���" /></h3>
					<p class="inan_study_message"><%= v_retreason %></p>
<%	} %>
<%
    if(v_reptype.equals("C")){        //COP�� ��� ���������� ����Ʈ

        String v_couserid   = "";
        String v_coname     = "";
        String v_ldate      = "";
        int    v_score1     =  0;
        ArrayList list = (ArrayList)request.getAttribute("selectCoprepList");
%>
					<table class="board_list">
					<colgroup><col width="10%" /><col width="30%" /><col width="30%" /><col width="30%" /></colgroup>
					<thead>
					<tr class="gray">
						<th><p>��ȣ </p></th>
						<th><p>�ۼ���</p></th>
						<th><p>�ۼ���</p></th>
						<th class="end"><p>����</p></th>
					</tr>
					</thead>
					<tbody>
<%
		if (list!=null || list.size()>0) {
           	for(i = 0; i < list.size(); i++) {
	            ProjectData data  = (ProjectData)list.get(i);
	            v_couserid   = data.getCouserid();
	            v_coname     = data.getConame();
	            v_ldate      = data.getLdate();
	            v_score1     = data.getScore();
	            
	            if(v_ldate != null){ v_ldate    = FormatDate.getFormatDate(v_ldate,"yyyy.MM.dd"); }
%>
					<tr onmouseover="className='over'" onmouseout="className=' '">
						<td class="num"><%= list.size() - i %></td>
						<td class="ta_l"><%= v_coname %></td>
						<td class="num"><%= v_ldate %></td>
						<td class="num"><%= v_score1 %></td>
					</tr>
<%			}
		} %>
<%		if(i == 0){   %>    
                    <tr> 
                      <td class="board_text1" colspan="4">���� �򰡰� �����ϴ�.</td>
                    </tr>    
<%		} %>
					</tbody>
					</table>
<%	} %>
				</div>
			</div>
		</div>
	</div>
</form>
<%if(v_status.equals("Y")){ %>
<script language="JavaScript">
<!--
<%if(v_ansyn.equals("U")){%><!--�������������-->
		    document.all["tabtext_1"].style.display = "";
		    document.all["tabfile_2"].style.display = "";
<%}else if(v_ansyn.equals("T")){%><!--TEXT�Է¹��-->
			document.all["tabtext_1"].style.display = ""
			document.all["tabfile_2"].style.display = "none";
<%}else if(v_ansyn.equals("F")){%> <!--���Ͼ��ε�-->
		    document.all["tabtext_1"].style.display = "none";
			document.all["tabfile_2"].style.display = ""
<%}%>

////÷�ΰ��� ��ũ��Ʈ
//var myFileButton = new FileButton("imageswap", "imagesrc");
//
//window.onload = function () { 
//  myFileButton.run(); //�����ε� �� �Ѳ����� �ٲ� 
//} 

//-->
</script>
<%}%>
</body>
</html>