<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
//**********************************************************
//  1. ��      ��: �н�â ��������
//  2. ���α׷���: zu_SubjGong_L.jsp
//  3. ��      ��: �������� ���
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2009.12.03
//  7. ��      ��:
//**********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.contents.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    String v_subj   = box.getString("p_subj");
    String v_year	= box.getString("p_year");
    String v_subjseq= box.getString("p_subjseq");

    int v_seq = 0;
    int v_levels = 0;
    int v_cnt = 0;
    int i     = 0;

    String v_userid = "";
    String v_name   = "";
    String v_indate = "";
    String v_title  = "";
    String v_typesnm   = "";
    String v_addate    = "";

    int v_dispnum   = 0;
    int v_totalpage = 0;
    int v_rowcount  = 0;
    int v_upfilecnt = 0;

    int v_pageno    = box.getInt("p_pageno");
	if (v_pageno == 0) v_pageno = 1;
    
    String v_searchtext = box.getString("p_searchtext");
    String v_search     = box.getString("p_search");

    String s_userid   = box.getSession("userid");
    String s_username = box.getSession("name");

    String v_class1     = "";
    String v_class2     = "";
    
    ArrayList listall   = (ArrayList)request.getAttribute("selectListAll");    // ��ü��������Ʈ
    ArrayList list      = (ArrayList)request.getAttribute("selectList");       // ��������Ʈ
    
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
	//��ȸ
    function go(index) {
         document.form1.p_pageno.value = index;
         document.form1.action = "/servlet/controller.study.SubjGongStudyServlet";
         document.form1.p_process.value = "";
         document.form1.p_pageno.value = "1";
         document.form1.submit();
    }
    //������ �̵�
    function goPage(pageNum) {
         document.form1.p_pageno.value = pageNum;
         document.form1.action = "/servlet/controller.study.SubjGongStudyServlet";
         document.form1.p_process.value = "gongList";
         document.form1.submit();
    }
    // ����Ʈ
    function selectList() {
        document.form1.action = "/servlet/controller.study.SubjGongStudyServlet";
        document.form1.p_process.value = "gongList";
        document.form1.p_pageno.value = "1";
        document.form1.submit();
    }

	// ���
    function insertPage() {
        document.form1.action = "/servlet/controller.study.SubjGongStudyServlet";
        document.form1.p_process.value = "insertPage";
        document.form1.submit();
    }

	// �󼼺���
    function select(seq, upfilecnt, userid) {
        document.form1.action = "/servlet/controller.study.SubjGongStudyServlet";
        document.form1.p_process.value = "selectView";
        document.form1.p_seq.value = seq;
        document.form1.p_upfilecnt.value = upfilecnt;
        document.form1.submit();
    }
    
//-->
</script>
</head>
<body id="pop_study"><!-- popup size : 890* -->
<form name="form1" method="post">
    <input type = "hidden" name = "p_process"   value = "gongList"/>
    <input type = "hidden" name = "p_pageno"    value = "<%=v_pageno %>"/>
    <input type = "hidden" name = "p_seq"       value = ""/>
    <input type = "hidden" name = "p_upfilecnt" value = ""/>
    <input type = "hidden" name = "p_subj"      value = "<%= v_subj %>"/>
    <input type = "hidden" name = "p_year"      value = "<%= v_year %>"/>
    <input type = "hidden" name = "p_subjseq"   value = "<%= v_subjseq %>"/>

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
						<p>
	                        <select name='p_search'>
	                            <option value='title' <% if (v_search.equals("title")) out.print("selected"); %>>����</option>
	                            <option value='name' <% if (v_search.equals("name")) out.print("selected"); %>>�ۼ���</option>
	                            <option value='content' <% if (v_search.equals("content")) out.print("selected"); %>>����</option>
	                        </select>
							<input type="text" name="p_searchtext" class="input" style="width:135px;" value='<%=v_searchtext %>' onKeyPress="fnKeyPressEnter(event,'selectList');"/>
							<a href = "javascript:selectList();"><img src="/images/portal/btn/btn_serbox_search.gif" alt="�˻�" /></a>
						</p>
					</div>
					
					<table class="board_list">
					<colgroup><col width="10%" /><col width="50%" /><col width="10%" /><col width="13%" /><col width="7%" /><col width="10%" /></colgroup>
					<thead>
					<tr class="gray">
						<th><p>��ȣ </p></th>
						<th><p>����</p></th>
						<th><p>�ۼ���</p></th>
						<th><p>�ۼ�����</p></th>
						<th><p>÷��</p></th>
						<th class="end"><p>��ȸ��</p></th>
					</tr>
					</thead>
					<tbody>
<%
	// ��ü
	for(i = 0; i < listall.size(); i++) {
	    SubjGongData data= (SubjGongData)listall.get(i);
	    v_seq       = data.getSeq();
	    v_typesnm   = data.getTypesnm();
	    v_title     = data.getTitle();
	    v_addate    = data.getAddate();
	    v_upfilecnt = data.getUpfilecnt();
	    v_name		= data.getName();
	    v_cnt		= data.getCnt();
%>
					<tr onmouseover="className='over'" onmouseout="className=' '">
						<td class="num">��ü</td>
						<td class="ta_l"><a href="javascript:select('<%=v_seq%>','<%=v_upfilecnt%>','<%=v_userid%>')"><%= v_title%></a></td>
						<td><%= v_name %></td>
						<td class="num"><%= FormatDate.getFormatDate(v_addate,"yyyy.MM.dd") %></td>
						<td>
<%		if( v_upfilecnt>0){ %>
							<img src="/images/portal/ico/ico_file.gif" alt="file" />
<%		} %>
						</td>
						<td class="num end"><%= v_cnt %></td>
					</tr>
<%
	}

	for(i = 0; i < list.size(); i++) {
		DataBox dbox = (DataBox)list.get(i);
		v_userid    = dbox.getString("d_userid");
		v_name      = dbox.getString("d_name");
		v_title     = dbox.getString("d_title");
		v_seq       = dbox.getInt("d_seq");
		v_cnt       = dbox.getInt("d_cnt");
		v_levels    = dbox.getInt("d_levels");
		v_upfilecnt = dbox.getInt("d_upfilecnt");
		v_addate	= dbox.getString("d_addate");
		v_dispnum   = dbox.getInt("d_dispnum");
		v_totalpage = dbox.getInt("d_totalpage");
		v_rowcount  = dbox.getInt("d_rowcount");


		// �˻�� �־��ٸ� �ش� �κ��� �ش������ �ΰ���Ų��.
		if (!v_searchtext.equals("")) {
			if (v_search.equals("name")) {
				v_name = StringManager.replace(v_name, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
			} else if (v_search.equals("title")) {
				v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>"); 
			}
		}
%>
					<tr onmouseover="className='over'" onmouseout="className=' '">
						<td class="num"><%= v_dispnum %></td>
						<td class="ta_l">
<%		if (v_levels > 1) {%>
							<img src="/images/portal/ico/ico_re.gif"/> 
<%		} %>
							<a href="javascript:select('<%=v_seq%>','<%=v_upfilecnt%>','<%=v_userid%>')"><%= v_title %></a>
						</td>
						<td><%= v_name %></td>
						<td class="num"><%= FormatDate.getFormatDate(v_addate, "yyyy.MM.dd") %></td>
						<td>
<%		if( v_upfilecnt>0){ %>
							<img src="/images/portal/ico/ico_file.gif" alt="file" />
<%		}%>
						</td>
						<td class="num end"><%= v_cnt %></td>
					</tr>
<%	} 
	
	if(i == 0){   %>    
		            <tr> 
		            	<td colspan="6">��ϵ� ������ �����ϴ�.</td>
		            </tr>    
<%	} %>
					</tbody>
					</table>
					
         <%= PageUtil.printPageSizeListDivNoPagesize(v_totalpage, v_pageno, 0, 10, v_rowcount) %>

				</div>
			</div>
		</div>
	</div>
</form>
</body>
</html>