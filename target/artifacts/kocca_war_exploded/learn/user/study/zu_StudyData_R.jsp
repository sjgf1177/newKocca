<!DOCTYPE html>
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
    int     v_tabseq   = box.getInt("p_tabseq");
    String  v_process  = box.getString("p_process");
    int     v_pageno   = box.getInt("p_pageno");

    String  v_searchtext = box.getString("p_searchtext");
    String  v_search     = box.getString("p_search");
    int     v_seq        = box.getInt("p_seq");                  // �Խù� ID
    int     v_orgseq     = v_seq;
    int     v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�
    String  v_subj       = box.getString("p_subj");
    String  v_year       = box.getString("p_year");
    String  v_subjseq    = box.getString("p_subjseq");
    
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

    String v_class1     = "";
    String v_class2     = "";

    Vector v_realfileVector = null;    //      �����ϸ� �迭
    Vector v_savefileVector = null;    //      ������ ������ִ� ���ϸ� �迭

    DataBox dbox = (DataBox)request.getAttribute("selectStudyData");
    if (dbox != null ) {
        v_seq           = dbox.getInt("d_seq");
        v_userid        = dbox.getString("d_userid");
        v_name          = dbox.getString("d_name");
        v_title         = dbox.getString("d_title");
        v_content       = dbox.getString("d_content");
        v_cnt           = dbox.getInt("d_cnt");
        v_indate        = dbox.getString("d_indate");
        v_realfileVector = (Vector)dbox.getObject("d_realfile");
        v_savefileVector = (Vector)dbox.getObject("d_savefile");

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

    // ����Ʈ
    ArrayList list = (ArrayList)request.getAttribute("selectStudyDataList");

    SubjectBean		subjbean = new SubjectBean();
	SubjectData		subjdata = new SubjectData();
					subjdata = subjbean.SelectSubjectData(box);

    EduStartBean	bean		= new EduStartBean();
    EduScoreData    scoredata	= new EduScoreData();
    				scoredata	= bean.SelectEduScore(box);
%>
<html>
<head>
    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>�ѱ���������ī����</title>

    <!-- Bootstrap / Jquery UI -->
    <link href="/common/js/jquery-ui-1.12.1/jquery-ui.min.css" rel="stylesheet">
    <!--<link href="/common/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" rel="stylesheet">-->
    <link href="/common/js/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    
    <script src="/common/js/jquery-3.3.1.min.js"></script>
    <script src="/common/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
    <!--<script src="/common/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>-->
    <script src="/common/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    
    
    <!-- Custom CSS -->
    <link href="/common/css/custom.css" rel="stylesheet">
    <link href="/common/css/header.css" rel="stylesheet">
    <link href="/common/css/footer.css" rel="stylesheet">
    
    <!-- Custom JS -->
    <script src="/common/js/custom.js"></script>
    
    <script type="text/javascript" src="/script/portal/common.js"></script>
	<script type="text/javascript">
	    function selectList() {
	        document.form1.action = "/servlet/controller.study.StudyDataServlet";
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
	    <input type = "hidden" name = "p_seq"        value = "<%= v_seq %>"/>
	    <input type = "hidden" name = "p_upfilecnt"  value = "<%= v_upfilecnt %>"/>
	    <input type = "hidden" name = "p_subj"       value = "<%= v_subj %>"/>
	    <input type = "hidden" name = "p_year"       value = "<%= v_year %>"/>
	    <input type = "hidden" name = "p_subjseq"    value = "<%= v_subjseq %>"/>
	</form>
    <section>
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="subContainer_pop">
                            <div class="sub_section">
                                <div class="sub_contents_header">
                                    <span>�ڷ��</span>
                                </div>
                                <div class="sub_contents_body">
<%	if (scoredata != null) { %>
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
<%	} %>
                                    <div class="sub_info_body">
                                        <table class="write_table th_align_left1">
                                            <colgroup>
                                                <col width="20%">
                                                <col width="auto">
                                                <col width="20%">
                                                <col width="auto">
                                            </colgroup>
                                            <tbody>
                                                <tr>
                                                    <th>�ۼ���</th>
                                                    <td><%= FormatDate.getFormatDate(v_indate, "yyyy.MM.dd") %></td>
                                                    <th>��ȸ��</th>
                                                    <td><%= v_cnt %></td>
                                                </tr>
                                                <tr>
                                                    <th>�ۼ���</th>
                                                    <td colspan="3"><%= v_name %></td>
                                                </tr>
                                                <tr>
                                                    <th>����</th>
                                                    <td colspan="3"><%= v_title %></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4"><%= v_content %></td>
                                                </tr>
												<!-- ����÷�� ���� -->
									            <%
									                String gubun = "6";
									                Vector i_realfileVector    = (Vector)dbox.getObject("d_realfile");        // ���� ���ϸ�
									                Vector i_savefileVector    = (Vector)dbox.getObject("d_savefile");        // ���� ���ϸ�
									                String i_boardStyle        = "study_view";                                // ���� ��Ÿ��
									            %>
									            <%@ include file="/learn/user/typeB/include/zu_MultiAttach_R.jsp" %>
									            <!-- ����÷�� ����-->
                                            </tbody>
                                        </table>
                                    </div>
                                    
                                </div>
                                <div class="popup_btnBox">
                                    <a href="javascript:selectList();" class="btn_courseCancel">���</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>