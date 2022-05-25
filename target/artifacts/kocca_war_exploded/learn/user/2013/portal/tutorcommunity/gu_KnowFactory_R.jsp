<%@ page contentType="text/html;charset=euc-kr" %>
<%@page errorPage="/learn/library/error.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.credu.research.*" %>
<%@ page import="com.credu.library.*" %>
<%@ page import="com.credu.system.*" %>
<%@ page import="com.credu.common.*" %>
<%@ page import="com.credu.homepage.*" %>
<%@ page import="com.dunet.common.util.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    String v_title = "", v_contents = "", v_inuserid = "", v_indate = "" , v_types = "";
    Vector v_realfileVector = null;
    Vector v_savefileVector = null;

    int v_seq = box.getInt("p_seq");
    int v_upfilecnt = box.getInt("p_upfilecnt"); // ������ ������ִ� ���ϼ�
    int v_pageno = box.getInt("p_pageno");

    String v_searchtext = box.getString("p_searchtext"); // ������ ������ִ� ���ϼ�
    String v_select = box.getString("p_select");
    String v_tabseq = box.getString("p_tabseq");
    String v_tgubun = box.getString("p_tgubun");
    String v_subj = box.getString("p_subj");
    String v_subjseq = box.getString("p_subjseq");
    String v_year = box.getString("p_year");
    String v_lesson = box.getString("p_lesson");

    String v_name = "";
    String v_repstatus  = "";
    String v_subjnm = "";

    DataBox dbox = (DataBox)request.getAttribute("SelectView");

    int v_commentseq = 0;

    v_inuserid = dbox.getString("d_inuserid");
    v_name = dbox.getString("d_name");
    v_types = dbox.getString("d_types");
    v_indate = dbox.getString("d_indate");
    v_title = dbox.getString("d_title");
    v_subjnm = dbox.getString("d_subjnm");
    v_seq = dbox.getInt("d_seq");

    if (v_tgubun.equals("N")) {
        v_contents = dbox.getString("d_contents");
    } else {
        v_contents = dbox.getString("d_contents").replace("\r", "<BR>");  // �����ִ� �κ� ����
    }
    v_realfileVector = (Vector)dbox.getObject("d_realfile");
    v_savefileVector = (Vector)dbox.getObject("d_savefile");
    String v_categorynm = dbox.getString("d_categorynm");
    int v_recommend = dbox.getInt("d_recommend");
    int v_cnt = dbox.getInt("d_cnt");
    v_repstatus = dbox.getString("d_okyn1");

    String v_categorycd= box.getString("p_area");
    String s_userid = box.getSession("userid");
    String s_gender = box.getSession("gender");

    int v_filecount = v_realfileVector.size();

    String p_categorycd = box.getString("p_categorycd"); // request ī�װ�

    String v_process= box.getString("p_process");

    String full_toggle = "off";
    String sub1_toggle = "off";
    String sub2_toggle = "off";
    String sub3_toggle = "off";
    String sub4_toggle = "off";
    String sub5_toggle = "off";

    String sub_navi = "";
    String categoryName = "";

    if (v_categorycd.equals("C0")){
        sub1_toggle = "on";
        categoryName = "����";
    }else if (v_categorycd.equals("B0")){
        sub2_toggle = "on";
        categoryName = "��ۿ���";
    } else if (v_categorycd.equals("G0")){
        sub3_toggle = "on";
        categoryName = "���Ӱ���";
    } else if (v_categorycd.equals("K0")){
        sub4_toggle = "on";
        categoryName = "����ĳ/����&middot;����";
    }else if (v_categorycd.equals("MINE")){
        sub5_toggle = "on";
        categoryName = "���� �ۼ��� ��";
    } else {
        full_toggle = "on";
        categoryName = "��ü";
    }

    String sFileExt ="";
    String imgExt ="";



    String v_tgubunnm = "";
    if(v_tgubun.equals("T")){v_tgubunnm = "<img src=\"/images/2013/common/ico_discussion.gif\" alt=\"���\" />";}
    else if(v_tgubun.equals("Q")){v_tgubunnm = "<img src=\"/images/2013/common/ico_question.gif\" alt=\"����\" />";}
    else if(v_tgubun.equals("C")){v_tgubunnm = "<img src=\"/images/factory/icon_tutorcom_c.gif\" alt=\"����\" />";}
    else if(v_tgubun.equals("D")){v_tgubunnm = "<img src=\"/images/2013/common/ico_pds.gif\" alt=\"�ڷ�\" />";}
    else if(v_tgubun.equals("I")){v_tgubunnm = "<img src=\"/images/2013/common/ico_info.gif\" alt=\"����\" />";}
    else if(v_tgubun.equals("R")){v_tgubunnm = "<img src=\"/images/factory/icon_tutorcom_r.gif\" alt=\"����\" />";}
    else if(v_tgubun.equals("N")){v_tgubunnm = "<img src=\"/images/factory/icon_tutorcom_n.gif\" alt=\"����\" />";}

    // box.put("title_str", v_title + " - " + categoryName + " - Ŀ�´�Ƽ - �¶��α���");
    box.put("title_str", v_title + " - " + categoryName + " - ���θ޴�");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<script language="JavaScript" type="text/JavaScript">
//����Ʈ�������� �̵�
function selectList() {
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_area.value="<%=v_categorycd%>";
    document.form1.p_process.value="ListPage";
    document.form1.submit();
}

//��ȭ�� �������� �̵�
function select(seq, upfilecnt, userid, types) {
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value   = "selectView";
    document.form1.p_seq.value       = seq;
    document.form1.p_userid.value    = userid;
    document.form1.p_types.value     = types;
    document.form1.p_upfilecnt.value = upfilecnt;
    document.form1.submit();
}

//������������ �̵�
function updatePage() {
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value="updatePage";
    document.form1.submit();
}

//�亯 ��� �������� �̵�
function replyPage() {
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value="replyPage";
    document.form1.submit();
}

//������ ���
function insertcomment() {
    if(document.form2.commentqna.value==""){
        alert("�������� ����ϼ���");
        return;
    }
    var r=calculate_msglen($("#commentqna").val());
    if(r>200){
        alert("���� ����� = "+ r + "Byte �Դϴ�.\n��۵���� 200Byte ���Ϸ� �Է��� �ֽñ� �ٶ��ϴ�.");
        $("#commentqna").focus();
        return;
    }
    document.form2.p_categorycd.value = document.form1.p_categorycd.value; // ī�װ�
    document.form2.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form2.p_process.value="commentInsert";
    document.form2.submit();
}

//�� ȭ�� ����
function deleteAction() {
    if (confirm("������ �����Ͻðڽ��ϱ�?")) {
        document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
        document.form1.p_process.value="delete";
        document.form1.submit();
    }
    else {
        return;
    }
}

//������ ����
function deleteComment(v_commentseq) {
    if (confirm("������ �����Ͻðڽ��ϱ�?")) {
        document.form2.p_categorycd.value = document.form1.p_categorycd.value; // ī�װ�
        document.form2.p_commentseq.value = v_commentseq;
        document.form2.action = "/servlet/controller.homepage.KnowBoardUserServlet";
        document.form2.p_process.value="deleteComment";
        document.form2.submit();
    }
    else {
        return;
    }
}

//��� ���� ȭ�� ��ȯ
function updateComment(v_commentseq,v_commentqna,v_indate){
    var str = "";
        str += "<input id=\"p_commentqna\" style=\"width:98%;\" class=\"write\" value=\""+v_commentqna+"\">";
    $("#commentseq_"+v_commentseq).empty();
    $("#commentseq_"+v_commentseq).append(str);
    $("[id^='up_del_btn_']").hide();
    $("#up_can_btn_"+v_commentseq).show();
}

//��� ���� ȭ�� ���
function cancelComment(v_commentseq,v_commentqna,v_indate){
    var str = "";
        str += v_commentqna;
    $("#commentseq_"+v_commentseq).empty();
    $("#commentseq_"+v_commentseq).append(str);
    $("[id^='up_del_btn_']").show();
    $("#up_can_btn_"+v_commentseq).hide();
}

//��� ���� ����
function appupdateComment(v_commentseq){
    if (confirm("������ �����Ͻðڽ��ϱ�?")){
        document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
        document.form1.p_commentseq.value = v_commentseq;
        document.form1.p_commentqna.value = $("#p_commentqna").val();
        document.form1.p_process.value="updateComment";
        document.form1.submit();
    }else{
        return;
    }
}


// ��õ�ϱ�
function InsertRecommend(seq) {
//alert(document.form1.p_categorycd.value);
    if (confirm("��õ�Ͻðڽ��ϱ�?")) {
        document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
        document.form1.p_process.value="insertRecommend";
        document.form1.submit();
    }
    else {
        return;
    }
}

function textareaLength(hwnd,target){
    var h=$("[name='"+hwnd+"']").val();
    var r=calculate_msglen(h);
    $("#"+target).text(r);
    if(r>200)
        $("#"+target).css("color","#FF0000");
    else
        $("#"+target).css("color","#000000");
}

function calculate_msglen(msg){
    var nbytes = 0;

    for (i=0; i<msg.length; i++) {
        var ch = msg.charAt(i);
        if(escape(ch).length > 4) {
        nbytes += 2;
        } else if (ch == '\n') {
        if (msg.charAt(i-1) != '\r') {
        nbytes += 1;
        }
        } else if (ch == '<' || ch == '>') {
        nbytes += 4;
        } else {
        nbytes += 1;
        }
    }
 return nbytes;
}
</script>
<!-- container-new ���� //-->
<div id="container-new">

    <form name="form1" method = "post" action="">
            <input type="hidden" name="p_searchtext"  value="<%=v_searchtext %>">
            <input type="hidden" name="p_select"      value="<%=v_select %>">
            <input type="hidden" name="p_pageno"      value="<%=v_pageno %>">
            <input type="hidden" name="p_process"     value="">
            <input type="hidden" name="p_userid"      value="<%=v_inuserid %>">
            <input type="hidden" name="p_categorycd"  value="<%=p_categorycd%>">
            <input type="hidden" name="p_upfilecnt"   value="<%=v_upfilecnt %>">
            <input type="hidden" name="p_area"        value="<%=v_categorycd%>"/>
            <input type="hidden" name="p_commentseq"  value="" />
            <input type="hidden" name="p_commentqna"  value="" />

            <input type="hidden" name="p_tgubun"    value="<%=v_tgubun %>"/>
            <input type="hidden" name="p_tabseq"    value="<%=v_tabseq %>"/>
            <input type="hidden" name="p_seq"       value="<%=v_seq %>"/>
            <input type="hidden" name="p_types"     value="<%=v_types %>"/>
            <input type="hidden" name="p_subj"      value="<%=v_subj %>"/>
            <input type="hidden" name="p_subjseq"   value="<%=v_subjseq %>"/>
            <input type="hidden" name="p_year"      value="<%=v_year %>"/>
            <input type="hidden" name="p_lesson"    value="<%=v_lesson %>"/>
    </form>
    <div id="mainMenu">
        <!-- �¶��� ���� -->
        <ul class="location">
            <li>���θ޴�</li>
            <li>���� �ۼ��� �� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul>
                    <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">�¶��� ���ǽ�</a></li>
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingOffSubjectPage">���屳��</a></li>
                    <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=MINE" class="active">���� �ۼ��� ��</a></li>
                    <li><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage">��㳻��</a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberInfoUpdate">��������</a></li>
                </ul>
            </li>

            <!-- 2015-01-09 ���� ����
            <li>Ȩ</li>
            <li>�¶��� ����</li>
            <li>
                Ŀ�´�Ƽ <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul>
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">���� ���ǽ�</a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList" class="active">�����ȳ�</a></li>
                    <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage">Ŀ�´�Ƽ</a></li>
                </ul>
            </li>
            //-->
        </ul>

        <!-- ������ο� -->
        <!-- 2015-01-09 ���� ����
        <div class="introCategory">
            <ul>
                <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">���� ���ǽ�</a></li>
                <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList">�����ȳ�</a></li>
                <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage"><strong><u>Ŀ�´�Ƽ</u></strong></a></li>
            </ul>
        </div>
        //-->
        <!-- //������ο� -->
    </div>

    <!-- ������ ���� ���� -->
    <div id="contents">

        <h2 class="subTit">
        
<%
            if(v_categorycd.equals("MINE")){
%>
                ���� �ۼ��� ��<!--<img src="/images/2013/online_edu/myCommunity_title.gif" alt="���� �ۼ��ѱ�" />//--></h2>
<%
            }else {
%>            
                Ŀ�´�Ƽ<!--<img src="/images/2013/online_edu/community_title.gif" alt="Ŀ�´�Ƽ" />//--></h2>
<%
            }
%>
            <div id="subCont">
                <!-- 2015-01-19 �������
                <ul class="tabCus">
                    <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage"><img src="/images/2013/online_edu/community_tab_1_<%=full_toggle %>.gif" alt="��ü" /></a></li>
                    <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=B0"><img src="/images/2013/online_edu/community_tab_2_<%=sub2_toggle %>.gif" alt="��ۿ���" /></a></li>
                    <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=G0"><img src="/images/2013/online_edu/community_tab_3_<%=sub3_toggle %>.gif" alt="���Ӱ���" /></a></li>
                    <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=K0"><img src="/images/2013/online_edu/community_tab_4_<%=sub4_toggle %>.gif" alt="��ȭ������" /></a></li>
                    <li><a href="/servlet/controller.homepage.CMUBoardServlet?p_process=list"><img src="/images/2013/online_edu/community_tab_6_off.gif" alt="cmu ��������" /></a></li>
<%
        if ( !topWarp_userid.equals("") ) {
%>
                    <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=MINE"><img src="/images/2013/online_edu/community_tab_5_<%=sub5_toggle %>.gif" alt="���� �ۼ��� ��" /></a></li>
<%
        }
%>
                </ul>
                -->
                <h3 class="blind">��ü ������ġ</h3>

                <div class="article">
                    <div class="info">
                        <p class="title"><%=v_tgubunnm %> <%=v_title%></p>
                        <p class="date"><%= FormatDate.getFormatDate(v_indate, "yyyy.MM.dd") %></p>
                        <p class="curriculum"><%=v_subjnm%></p>
                    </div>
                    <div class="info2">
                        <p class="name"><%=v_name%></p>
<%
        if( v_realfileVector != null ) {
            for(int i = 0; i < v_realfileVector.size(); i++) {      //     ÷������ ������ ����

                String v_realfile = (String)v_realfileVector.elementAt(i);
                String v_savefile = (String)v_savefileVector.elementAt(i);

                if(v_realfile != null && !v_realfile.equals("")) {


                    if(v_realfile != null && !v_realfile.equals("")) {
                        sFileExt =  v_realfile.substring(v_realfile.lastIndexOf(".")+1);
                        if (sFileExt.equals("hwp")) {
                            imgExt = "<img src='/images/2012/common/icon/icon_hwp.gif' id='exticon' align='absmiddle' alt='�ѱ۹���'>";
                        } else if (sFileExt.equals("doc") || sFileExt.equals("docx")) {
                            imgExt = "<img src='/images/2012/common/icon/icon_doc.gif' id='exticon' align='absmiddle' alt='���幮��'>";
                        } else if (sFileExt.equals("ppt")||sFileExt.equals("pptx")) {
                            imgExt = "<img src='/images/2012/common/icon/icon_ppt.gif' id='exticon' align='absmiddle' alt='���������̼�'>";
                        } else if (sFileExt.equals("xls") ||sFileExt.equals("xlsx") ) {
                            imgExt = "<img src='/images/2012/common/icon/icon_xls.gif' id='exticon' align='absmiddle' alt='����'>";
                        } else if (sFileExt.equals("pdf")) {
                            imgExt = "<img src='/images/2012/common/icon/icon_pdf.gif' id='exticon' align='absmiddle' alt='PDF'>";
                        } else {
                            imgExt = "<img src='/images/2012/common/icon/icon_idk.gif' id='exticon' align='absmiddle' alt='�� �� ���� ��������'>";
                        }
%>
                        <p class="file"><a href="/servlet/controller.library.DownloadServlet?p_savefile=<%= v_savefile%>&p_realfile=<%= v_realfile%>"><%= v_realfile%></a><input type="hidden" name="p_savefile"  value=<%=v_savefile%> /></p>
<% 
                    }
                }
            }
        }
%>
                    </div>

                    <div class="inner">
                        <%=StringManager.removeHTMLHead(v_contents)%>
                    </div>

                    <div class="reply1">
<% 
                        ArrayList list = (ArrayList)request.getAttribute("selectCommentList"); %>
                        <p class="total"><a href="#">���� <%=list.size() %>��</a> | ��ȸ�� <%=v_cnt %></p>
                        <ul>
                            <!-- ��� �ݺ� ���� ���� -->
                            <%
                            //if(list.size() != 0){
                            String s_gadmin = box.getSession("gadmin");
                            String commentInuserid = "";
                            for(int i = 0; i < list.size(); i++) {
                                dbox = (DataBox)list.get(i);
                                // v_inuserId      = dbox.getString("d_inuserid");
                                commentInuserid = dbox.getString("d_inuserid");
                                String c_name = dbox.getString("d_name");
                                v_indate = dbox.getString("d_cdate");
                                String v_commentqna = dbox.getString("d_commentqna");
                                v_commentseq = dbox.getInt("d_commentseq");
                            %>
                            <li>
                                <div class="replInfo">
                                    <p class="name"><%=c_name %></p>
                                    <p class="date"><%=FormatDate.getFormatDate(v_indate, "yyyy.MM.dd hh:mm") %></p>
<!--                                    <p class="replBtn"><a href="#">���</a></p>-->
                                </div>
                                <p class="con" id="commentseq_<%=v_commentseq%>">
                                    <%=v_commentqna%>
                                </p>
<%
        if(s_userid.equals(commentInuserid)) {
%>
                                <ul class="func" id="up_del_btn_<%=v_commentseq%>">
                                    <li><a href="javascript:updateComment(<%=v_commentseq%>,'<%=v_commentqna%>','<%=FormatDate.getFormatDate(v_indate, "yyyy-MM-dd")%>')">����</a></li>
                                    <li><a href="javascript:deleteComment(<%=v_commentseq%>)">����</a></li>
                                </ul>
                                <ul class="func" id="up_can_btn_<%=v_commentseq%>" style="display: none;">
                                    <li><a href="javascript:appupdateComment(<%=v_commentseq%>);">����</a></li>
                                    <li><a href="javascript:cancelComment(<%=v_commentseq%>,'<%=v_commentqna%>','<%=FormatDate.getFormatDate(v_indate, "yyyy-MM-dd")%>');">���</a></li>
                                </ul>
<%
        }
%>
                            </li>
<%
    }
%>
                            <!-- form -->
                            <li>
                            <div>
                                <form name="form2" method = "post" action="">
                                    <input type="hidden" name="p_tabseq" value="<%= v_tabseq %>">
                                    <input type="hidden" name="p_seq" value="<%= v_seq %>">
                                    <input type="hidden" name="p_searchtext" value="<%= v_searchtext %>">
                                    <input type="hidden" name="p_select" value="<%= v_select %>">
                                    <input type="hidden" name="p_pageno" value="<%= v_pageno %>">
                                    <input type="hidden" name="p_process" value="">
                                    <input type="hidden" name="p_userid" value="<%= commentInuserid %>">
                                    <input type="hidden" name="p_types" value="<%=v_types%>">
                                    <input type="hidden" name="p_commentseq" value ="">
                                    <input type="hidden" name="p_categorycd" value ="">
                                    <input type="hidden" name="p_gender" value="<%=s_gender %>">
                                    <input type="hidden" name="p_tgubun" value="<%=v_tgubun %>"/>

                                    <input type="hidden" name="p_types" value="<%=v_types %>"/>
                                    <input type="hidden" name="p_subj" value="<%=v_subj %>"/>
                                    <input type="hidden" name="p_subjseq" value="<%=v_subjseq %>"/>
                                    <input type="hidden" name="p_year" value="<%=v_year %>"/>
                                    <input type="hidden" name="p_lesson" value="<%=v_lesson %>"/>
                                <fieldset>
                                    <legend>�����Է�</legend>
                                    <textarea id="commentqna" name="commentqna" cols="102" rows="5" title="�ִ� 200Byte���� �ۼ� �����մϴ�."></textarea>
                                    <a href="javascript:insertcomment();"><img src="/images/2013/btn/btn_comment.gif" alt="�����Է�" /></a>
                                </fieldset>
                                </form>
                            </div>
                            </li>
                            <!-- //form -->
                        </ul>
                    </div>
                    <!-- //reply1 -->
                </div>
                <!-- //article -->



                <% ArrayList alist = (ArrayList)request.getAttribute("selectAns"); %>
                <p class="answer"><a style="font-size: 12px;">�亯 <%=alist.size() %>��</a></p>

                <div class="article">
<%
                    if(alist.size() > 0){
                        for(int i = 0; i < alist.size(); i++) {
                            DataBox Ansbox = (DataBox)alist.get(i);

                            String v_anstitle      = "";
                            String v_anscontents   = "";
                            String v_ansinuserid   = "";
                            String v_ansindate     = "";
                            String v_ansname       = "";
                            String v_anscategorynm = "";

                            v_ansinuserid = Ansbox.getString("d_inuserid");
                            v_ansname = Ansbox.getString("d_name");
                            v_ansindate = Ansbox.getString("d_indate");
                            v_anstitle = Ansbox.getString("d_title");
                            v_anscontents = Ansbox.getString("d_contents");
                            v_anscategorynm = Ansbox.getString("d_categorynm");
%>
                    <div class="info3">
                        <p class="name"><%=v_ansname %></p>
                        <p class="date"><%=FormatDate.getFormatDate(v_ansindate, "yyyy.MM.dd HH:mm")%></p>
                    </div>
                    <div class="inner2">
                        <%=StringManager.removeHTMLHead(v_anscontents)%>
                    </div>
<%
                        }
                    }
%>
                </div>
                <!-- //article -->


                <!--table class="bbsNavi">
                    <colgroup>
                        <col width="70">
                        <col>
                        <col width="70">
                        <col width="70">
                    </colgroup>
                    <tr>
                        <td class="pre">������</td>
                        <td><img src="/images/2013/common/ico_pds.gif" alt="�ڷ�" /> <a href="community_view.html">������, ����� �߽� Ȩ������ ������</a></td>
                        <td>�ۼ���</td>
                        <td>2013.06.18</td>
                    </tr>
                    <tr>
                        <td class="next">������</td>
                        <td><img src="/images/2013/common/ico_pds.gif" alt="�ڷ�" /> <a href="community_view.html">�Ȼ걳����, ������ִ� �����̾߱⡯ �ʵ��� �������� ��ȭ... ��ȣ����</a></td>
                        <td>ȫ�浿</td>
                        <td>2013.06.18</td>
                    </tr>
                </table-->

                <div class="btnArea right">
<%
    if(s_userid.equals(v_inuserid)) {
%>
                    <!--
                    <a href="javascript:updatePage()"><img src="/images/2013/btn/btn_retouch.gif" alt="����" /></a>
                    <a href="javascript:deleteAction()"><img src="/images/2013/btn/btn_delete.gif" alt="����" /></a>
                    //-->
<%
    }
%>

                    <a href="javascript:selectList();"><img src="/images/2013/btn/btn_list.gif" alt="���" /></a>
                </div>
            </div>
            <!-- //#subCont -->

    </div>

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>