<!DOCTYPE html>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.study.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.contents.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    int     v_tabseq   = box.getInt("p_tabseq");
    String  v_process  = box.getString("p_process");
    int     v_pageno   = box.getInt("p_pageno");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    int     v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�
    String  v_subj       = box.getString("p_subj");        //�����ڵ�
    String  v_year       = box.getString("p_year");        //�⵵
    String  v_subjseq    = box.getString("p_subjseq");     //���� ����

    String s_userid    = box.getSession("userid");
    String s_username  = box.getSession("name");

    // editor
    String content      = "";
    String width        = "600";
    String height       = "300";

    SubjectBean     subjbean = new SubjectBean();
    SubjectData     subjdata = new SubjectData();
                    subjdata = subjbean.SelectSubjectData(box);

    EduStartBean    bean        = new EduStartBean();
    EduScoreData    scoredata   = new EduScoreData();
                    scoredata   = bean.SelectEduScore(box);

%>
<html>
<head>
    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>�ѱ���������ī����</title>

    <link href="/common/js/jquery-ui-1.12.1/jquery-ui.min.css" rel="stylesheet">
    <link href="/common/js/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    
    <script src="/common/js/jquery-3.3.1.min.js"></script>
    <script src="/common/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
    <script src="/common/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    
    
    <link href="/common/css/custom.css" rel="stylesheet">
    <link href="/common/css/header.css" rel="stylesheet">
    <link href="/common/css/footer.css" rel="stylesheet">
    
    <script src="/common/js/custom.js"></script>
    
    <script type="text/javascript" src="/script/portal/common.js"></script>
    
    <script type="text/javascript" src="/script/cresys_lib.js"></script>
	<script type='text/javascript' src='/script/user_patch.js'></script>
	<script type="VBScript" src="/script/cresys_lib.vbs"></script>
    
    
    <script type="text/javascript">
		var grCode = '<%= box.getSession("tem_grcode") %>';
	
	    /**����ϱ�*/
	    function insert() {
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
	
	        if ( document.getElementById("p_content").value == "" ) {
	            alert("������ �Է��� �ּ���.");
	            document.getElementById("p_content").focus();
	            return;
	        }
	
	        document.form1.target = "_self";
	        document.form1.action = "/servlet/controller.study.StudyBoardServlet";
	        document.form1.p_search.value     = "";
	        document.form1.p_searchtext.value = "";
	        document.form1.p_process.value = "insert";
	        document.form1.submit();
	    }
	
		// ��������̵�
		function list() {
		    document.form1.target = "_self";
		    document.form1.action = "/servlet/controller.study.StudyBoardServlet";
		    document.form1.p_process.value = "";
		    document.form1.submit();
		}
	</script>
</head>
<body id="pop_study">
<form name="form1" method="post" enctype = "multipart/form-data">
    <input type = "hidden" name = "p_tabseq"    value = "<%=v_tabseq %>"/>
    <input type = "hidden" name = "p_process"    value = "<%=v_process %>"/>
    <input type = "hidden" name = "p_pageno"     value = "<%=v_pageno %>"/>
    <input type = "hidden" name = "p_search"     value = "<%=v_search %>"/>
    <input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>"/>
    <input type = "hidden" name = "p_upfilecnt"  value = "<%= v_upfilecnt %>"/>
    <input type = "hidden" name = "p_isedu"      value = "1"/><!--�н�â��-->
    <input type = "hidden" name = "p_subj"       value = "<%= v_subj %>"/>
    <input type = "hidden" name = "p_year"       value = "<%= v_year %>"/>
    <input type = "hidden" name = "p_subjseq"    value = "<%= v_subjseq %>"/>
    
    <section>
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="subContainer_pop">
                            <div class="sub_section">
                                <div class="sub_contents_header">
                                    <span>�Խ���</span>
                                </div>
<%  if (scoredata != null) { %>
                                <div class="sub_contents_body">
                                    <div class="sub_info_body">
                                        <div class="sub_course_alert_box">
                                            <p><%= subjdata.getSubjnm() %></p>
                                        </div>
                                        <div class="sub_course_view_wrap" style="margin-bottom:50px;">
                                            <ul class="myCourseDetail" style="width:100%;">
                                                <li><span>�����Ⱓ</span> : <%= FormatDate.getFormatDate(scoredata.getEdustart(),"yyyy.MM.dd") %> ~ <%= FormatDate.getFormatDate(scoredata.getEduend(),"yyyy.MM.dd") %></li>
                                            </ul>
                                        </div>
                                    </div>
<%  } %>
                                    <div class="sub_info_body">
                                        <table class="write_table th_align_left1">
                                            <colgroup>
                                                <col width="25%">
                                                <col width="auto">
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th><span>*</span>�ۼ���</th>
                                                    <td><%= s_username %></td>
                                                </tr>
                                                
                                                <tr>
                                                    <th><span>*</span>����</th>
                                                    <td><input type="text" name="p_title" style="width:100%"></td>
                                                </tr>
                                                <tr>
                                                    <th><span>*</span>����</th>
                                                    <td><textarea id="p_content" name="p_content"></textarea></td>
                                                </tr>
                                                <tr>
                                                    <th>÷������</th>
                                                    <td>
	                                                    <%
                                                    	int i_fileLimit = HomePageQnaBean.getFILE_LIMIT();             // ���� ÷�� ���ϼ�\
    	                                                %>
                                                    	<%@ include file="/learn/user/typeB/include/za_MultiAttach_I.jsp" %>
													</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="popup_btnBox">
                                    <a href="javascript:insert();" class="btn_write">���</a>
                                    <a href="javascript:list();" class="btn_courseCancel">���</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</form>
</body>
</html>