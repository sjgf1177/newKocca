<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
//**********************************************************
//  1. ��      ��: SUBJ OPINION UPDATE
//  2. ���α׷���: zu_SubjOpinion_U.jsp
//  3. ��      ��: ���� �н��� �ǰߺ���  ������Ʈ
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2011.02.28
//  7. ��      ��:
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.contents.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String  v_process  = box.getString("p_process");
    String  v_gadminYn = box.getString("p_gadminYn");    //�����ڿ���
    String  v_subj     = box.getString("p_subj");        //�����ڵ�
    String  v_year     = box.getString("p_year");        //�⵵
    String  v_subjseq  = box.getString("p_subjseq");     //���� ����
    String  v_lesson   = box.getString("p_lesson");
    String  v_lessonnm = box.getString("p_lessonnm");
    String  v_pageno = box.getString("p_pageno");
    String  v_opinseq = box.getString("p_opinseq");
    String  v_question  = box.getString("p_question");

    String  v_userid=box.getString("p_userid");
    String  v_grcode= box.getSession("tem_grcode");

    String  v_usernm="",  v_contents="", v_indate="";

    box.put("needNoDetailRead", "true");

    DataBox data1 = (DataBox)request.getAttribute("SubjOpinionDetail2");

    v_contents    = data1.getString("d_contents");
    v_usernm  = data1.getString("d_name");
    v_indate    = FormatDate.getFormatDate(data1.getString("d_indate"),"yyyy.MM.dd");
    
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
<title>�н��� �ǰߺ���</title>
<link rel="stylesheet" type="text/css" href="/css/portal/base.css" />
<script type="text/javascript" src="/script/portal/common.js"></script>
<script type="text/javascript" src="/namo_cross/js/namo_scripteditor.js"></script> 
<script type='text/javascript' src='/script/jquery-1.3.2.min.js'></script>
<script type="text/javascript" src="/script/cresys_lib.js"></script>
<script type='text/javascript' src='/script/user_patch.js'></script>
<script type="VBScript" src="/script/cresys_lib.vbs"></script>  
<script language="JavaScript">
<!--
  // ����ϱ�
  function insert_opinion() {

    	if(!CrossEditor.IsDirty()){ // ũ�ν������� ���� ������ �Է� Ȯ�� 
            alert("������ �Է��� �ּ��� !!"); 
            CrossEditor.SetFocusEditor();// ũ�ν������� Focus �̵� 
            return; 
        } 
        
        /*if (blankCheck(document.form1.p_contents.value)) {
            alert("������ �Է��ϼ���!");
            document.form1.p_contents.focus();
            return;
        }*/   	

		/*
    	if(document.all.use_editor[0].checked) {        
            document.form1.p_contents.value = ObjEditor.document.all.tags("html")[0].outerHTML;
    	}else {
		    document.form1.p_contents.value = document.all.txtDetail.value;
	    }
	    */

        document.getElementById("p_contents").value = CrossEditor.GetBodyValue();
        document.form1.target = "_self";
        document.form1.action = "/servlet/controller.study.SubjOpinionServlet";
      	document.form1.p_process.value = "SubjOpinionUpdate";
        document.form1.submit();
    }

    function list_opinion() {
        document.form1.target = "_self";
        document.form1.action = "/servlet/controller.study.SubjOpinionServlet";
        document.form1.p_process.value = "SubjOpinionList";
        document.form1.submit();
    }

//-->

</script>
</head>
<body id="pop_study"><!-- popup size : 890* -->
<form name="form1" method="post" action="/servlet/controller.study.SubjOpinionServlet" enctype = "multipart/form-data">
		<input type="hidden" name="p_process"  value="SubjOpinionDetail"/>
		<input type="hidden" name="p_subj"     value="<%=v_subj%>"/>
		<input type="hidden" name="p_year"     value="<%=v_year%>"/>
		<input type="hidden" name="p_subjseq"  value="<%=v_subjseq%>"/>
		<input type="hidden" name="p_lesson"   value="<%=v_lesson%>"/>
		<input type="hidden" name="p_lessonnm" value="<%=v_lessonnm%>"/>
		<input type="hidden" name="p_grcode"   value="<%=v_grcode%>"/>
        <input type="hidden" name="p_userid"   value="<%=v_userid%>"/>
        <input type="hidden" name="p_pageno"   value="<%=v_pageno%>"/>
        <input type="hidden" name="p_opinseq"  value="<%=v_opinseq%>"/>
        <input type="hidden" name="p_question" value="<%=v_question%>"/>
		<input type="hidden" name="p_gadminYn" value="<%=v_gadminYn%>"/>
    
	<div id="pop_header">
        <h1><img src="/images/portal/myclass/study/pop_h1_tit14.gif" alt="�н��� �ǰߺ���" /></h1>
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
                        <dd>&nbsp;&nbsp;&nbsp;&nbsp;</dd>
                        <dt><span>����</span></dt>
                        <dd class="class_day"><%= v_lesson %>  <%= v_lessonnm%></dd>
					</dl>
				</div></div></div>
<%	} %>
                <div class="content">
					<table width="90%" border="0" cellspacing="0" cellpadding="0" class="mg_t18">
					    <tr><td	 width="30px"><img src="/images/portal/ico/ico_qna_q.gif" alt="����" /></td>
                            <td	><%=v_question %></td>
                        </tr>
                    </table>
                </div>

				<div class="content">
					<div class="h3_wrap">
						<h3><img src="/images/portal/myclass/study/pop_stit18.gif"  alt="���� �ǰ�" /></h3>
					</div>
					
					<table class="study_write">
					<colgroup><col width="70px" /><col width="300px" /><col width="70px" /><col width="" /></colgroup>
					<tr>
						<th class="th">�ۼ���</th>
						<td class="td txt"><%= v_usernm %></td>
						<th class="th">�ۼ���</th>
						<td class="td stxt ff_t"><%= v_indate %></td>
					</tr>
					<tr>
						<td colspan="4" class="td con">
		                    <textarea id="p_contents" name="p_contents" style="display:none;"><%=StringManager.replace(v_contents, "&", "&amp") %></textarea>
							<script type="text/javascript">
							    var CrossEditor = new NamoSE("contents");
							    var contentValue = document.getElementById("p_contents").value; // Hidden �� ����
							    CrossEditor.editorStart();
							    //CrossEditor.SetUISize("500","600");
							    CrossEditor.SetBodyValue(contentValue); // ������ ���� ������ ����
							</script>
						</td>
					</tr>
					</table>

					<p class="list_btn"><a href="javascript:insert_opinion()" class="btn_gr"><span>����</span></a><a href="javascript:list_opinion()" class="btn_gr"><span>���</span></a></p>

				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>