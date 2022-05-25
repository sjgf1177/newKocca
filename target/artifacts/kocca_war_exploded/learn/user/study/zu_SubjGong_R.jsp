<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
//**********************************************************
//  1. ��      ��: �н�â ��������
//  2. ���α׷���: zu_SubjGong_R.jsp
//  3. ��      ��: �н�â ��������
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.12.03
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.contents.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
    RequestBox box     = (RequestBox)request.getAttribute("requestbox");
    String  v_process  = box.getString("p_process");
    int     v_pageno   = box.getInt("p_pageno");

    String  v_subj       = box.getString("p_subj");
    String  v_year       = box.getString("p_year");
    String  v_subjseq    = box.getString("p_subjseq");
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    int     v_seq        = box.getInt("p_seq");                  // �Խù� ID
    int     v_orgseq     = v_seq;
    int     v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�

    int v_levels = 0;
    int v_dispnum   = 0;
    int v_totalpage = 0;
    int v_rowcount  = 0;

    int    i         = 0;
    int    v_cnt     = 0;
    String v_userid  = "";
    String v_name    = "";
    String v_indate  = "";
    String v_title   = "";
    String v_content = "";
    String v_upfileview = "";

    Vector v_realfileVector = null;
    Vector v_savefileVector = null;


    DataBox dbox = (DataBox)request.getAttribute("selectGong");
    if (dbox != null ) {
        v_seq           = dbox.getInt("d_seq");
        v_userid        = dbox.getString("d_userid");
        v_name          = dbox.getString("d_name");
        v_title         = dbox.getString("d_title");
        v_content       = dbox.getString("d_adcontent");
        v_cnt           = dbox.getInt("d_cnt");
        v_indate        = dbox.getString("d_addate");
        v_realfileVector = (Vector)dbox.getObject("d_realfile");
        v_savefileVector = (Vector)dbox.getObject("d_savefile");

//        v_content = StringManager.replace(v_content,"\r\n","<br>");
//        v_content = BoardBean.convertBody(v_content);

        // �˻�� �־��ٸ� �ش� �κ��� �ش������ �ΰ���Ų��.
        if (!v_searchtext.equals("")) {
            if (v_search.equals("name")) {
                v_name = StringManager.replace(v_name, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
            } else if (v_search.equals("title")) {
                v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
            }  else if (v_search.equals("content")) {
                v_content = StringManager.replace(v_content, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
            }
        }
    }

    String s_userid    = box.getSession("userid");
    String s_username  = box.getSession("name");

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
<title>��������</title>
<link rel="stylesheet" type="text/css" href="/css/portal/base.css" />
<script type="text/javascript" src="/script/portal/common.js"></script>
<script language="JavaScript">
<!--
    function list_StudyBoard() {
        document.form1.action = "/servlet/controller.study.SubjGongStudyServlet";
        document.form1.p_process.value = "gongList";
        document.form1.submit();
    }

//-->
</script>

</head>
<body id="pop_study"><!-- popup size : 890* -->
<form name="form1" method="post" enctype = "multipart/form-data">
    <input type = "hidden" name = "p_process"    value = "<%=v_process %>"/>
    <input type = "hidden" name = "p_pageno"     value = "<%=v_pageno %>"/>
    <input type = "hidden" name = "p_search"     value = "<%=v_search %>"/>
    <input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>"/>
    <input type = "hidden" name = "p_seq"        value = "<%= v_seq %>"/>
    <input type = "hidden" name = "p_upfilecnt"  value = "<%= v_upfilecnt %>"/>
    <input type = "hidden" name = "p_subj"       value = "<%= v_subj %>"/>
    <input type = "hidden" name = "p_year"       value = "<%= v_year %>"/>
    <input type = "hidden" name = "p_subjseq"    value = "<%= v_subjseq %>"/>
</form>

	<div id="pop_header">
		<h1><img src="/images/portal/myclass/study/pop_h1_tit3.gif" alt="��������" /></h1>
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
					<div class="h3_wrap">
						<h3><img src="/images/portal/myclass/study/pop_stit1.gif" alt="��������" /></h3>
					</div>
					
					<table class="study_view">
					<!--[if ie]><colgroup><col width="50px" /><col width="345px" /><col width="50px" /><col width="80px" /><col width="25px" /><col width="80px" /></colgroup><![endif]-->
					<colgroup><col width="70px" /><col width="345px" /><col width="70px" /><col width="80px" /><col width="45px" /><col width="80px" /></colgroup>
					<tr>
						<th>����</th>
						<td colspan="5" class="tit"><%= v_title %></td>
					</tr>
					<tr>
						<th>�ۼ���</th>
						<td><%= v_name %></td>
						<th>�ۼ���</th>
						<td class="num"><%= FormatDate.getFormatDate(v_indate, "yyyy.MM.dd") %></td>
						<th>��ȸ</th>
						<td class="num"><%= v_cnt+1 %></td>
					</tr>
					<tr>
						<td colspan="6" class="con"><br><%= v_content %></br></td>
					</tr>
					</table>

            <!-- ����÷�� ���� -->
            <%
                Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
                Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
                String i_boardStyle        = "study_view";                                // ���� ��Ÿ��
            %>
            <%@ include file="/learn/user/include/zu_MultiAttach_R.jsp" %>
            <!-- ����÷�� ����-->

					<p class="board_btn"><a href="javascript:list_StudyBoard()" class="btn_gr"><span>���</span></a></p>
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>