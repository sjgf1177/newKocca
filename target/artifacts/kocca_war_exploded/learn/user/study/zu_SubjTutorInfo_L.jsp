<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
//**********************************************************
//  1. ��      ��: ��������������Ʈ
//  2. ���α׷��� : za_Permission_L.jsp
//  3. ��      ��: ���������� ����Ʈ
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��: 1.0
//  6. ��      ��: ������ 2004. 12. 20
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.contents.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String  v_process   = box.getString("p_process");
    String  v_usernm    = box.getString("p_usernm");
    String  v_subj      = box.getString("p_subj");
    String  v_subjseq   = box.getString("p_subjseq");
    String  v_year      = box.getString("p_year");

    String v_name="", v_academic="", v_major="", v_professional="", v_career="", v_majorbook="", v_intro="";
    String v_compnm="", v_comp="";

    ArrayList list = (ArrayList)request.getAttribute("select");
    
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
<title>����Ұ�</title>
<link rel="stylesheet" type="text/css" href="/css/portal/base.css" />
<script type="text/javascript" src="/script/portal/common.js"></script>
</head>
<body id="pop_study"><!-- popup size : 890* -->
	<div id="pop_header">
		<h1><img src="/images/portal/myclass/study/pop_h1_tit13.gif" alt="����Ұ�" /></h1>
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
<%                    
                for(int i = 0; i < list.size(); i++) {
                    DataBox dbox = (DataBox)list.get(i);
                    v_name          = dbox.getString("d_name");
                    v_academic      = dbox.getString("d_academic");
                    v_major         = dbox.getString("d_major");
                    v_professional  = dbox.getString("d_professional");
                    v_career        = dbox.getString("d_career");
                    v_majorbook     = dbox.getString("d_majorbook");
                    v_intro         = dbox.getString("d_intro");
                    v_compnm        = dbox.getString("d_compnm");
                    v_comp          = dbox.getString("d_comp");

                    if(!v_compnm.equals("")){
                    	v_comp	= v_compnm;
                    }

%>
					<table class="view<%=i>0?" mg_t30":""%>">
					<colgroup><col width="18%" /><col width="82%" /></colgroup>
					<tr>
						<th>����</th>
						<td class="end"><%= v_name %></td>
					</tr>
					<tr>
						<th>�Ҽ�/����</th>
						<td class="end"><%= v_comp %></td>
					</tr>
					<tr>
						<th>�з�</th>
						<td class="end"><%= v_academic %>&nbsp;<%= v_major %></td>
					</tr>
					<tr>
						<th>�����о�</th>
						<td class="end"><%= v_professional %></td>
					</tr>
					<tr>
						<th>���</th>
						<td class="end"><%= v_career %></td>
					</tr>
					<tr>
						<th>�ֿ����� �� ����</th>
						<td class="end"><%= v_majorbook %></td>
					</tr>
					<tr>
						<th>�λ縻</th>
						<td class="end"><%= v_intro %></td>
					</tr>
					</table>
<%
                }
%>
				</div>
			</div>
		</div>
	</div>
</body>
</html>