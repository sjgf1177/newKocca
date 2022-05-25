<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.research.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.dunet.common.util.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box = null;
    box = (RequestBox)request.getAttribute("requestbox");

    String v_process = box.getString("p_process");
    int v_pageno = box.getInt("p_pageno");
    if (v_pageno == 0) v_pageno = 1;
    int v_dispnum = 0, v_totalpage = 0, v_rowcount = 1, v_upfilecnt = 0;
    int v_pagesize = box.getInt("p_pagesize");
    int v_totalrowcount = 0;
    int row = Integer.parseInt(conf.getProperty("page.bulletin.row"));
    String v_searchtext = box.getString("p_searchtext");
    String v_search = box.getString("p_search");
    String v_category = box.getString("p_area");

    String v_tgubun = "";
    String v_tabseq = "";
    String v_seq = "";
    String v_types = "";
    String v_title = "";
    String v_indate = "";
    String v_inuserid = "";
    String v_cnt = "";
    String v_name = "";
    String v_subj = "";
    String v_subjseq = "";
    String v_year = "";
    String v_lesson = "";
    String v_subjnm = "";
    String v_area = "";
    String v_upperclass = "";
    String v_middleclass = "";
    String v_lowerclass = "";
    String v_answercnt = "";
    int v_commentcnt = 0;
    String ss_tgubun = box.getString("ss_tgubun");

    ArrayList list = (ArrayList)request.getAttribute("selectLastList");

    String full_toggle = "off";
    String sub1_toggle = "off";
    String sub2_toggle = "off";
    String sub3_toggle = "off";
    String sub4_toggle = "off";
    String sub5_toggle = "off";

    String sub_navi = "";
    String categoryName = "";

    if (v_category.equals("C0")){
        sub1_toggle = "on";
        sub_navi = "����";
        categoryName = "����";
    }else if (v_category.equals("B0")){
        sub2_toggle = "on";
        sub_navi = "��ۿ���";
        categoryName = "��ۿ���";
    } else if (v_category.equals("G0")){
        sub3_toggle = "on";
        sub_navi = "���Ӱ���";
        categoryName = "���Ӱ���";
    } else if (v_category.equals("K0")){
        sub4_toggle = "on";
        sub_navi = "��ȭ������";
        categoryName = "����ĳ/����&middot;����";
    }else if (v_category.equals("MINE")){
        sub5_toggle = "on";
        sub_navi = "�����ۼ��ѱ�";
        categoryName = "���� �ۼ��ѱ�";
    } else {
        full_toggle = "on";
        sub_navi = "����";
        categoryName = "��ü";
    }

    // box.put("title_str", categoryName + " - Ŀ�´�Ƽ - �¶��α���");
    box.put("title_str", categoryName + " - ���θ޴�");
%>
<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<script language="JavaScript" type="text/JavaScript">
//�Է��������� �̵�
function insertPage() {
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value="InsertPage";
    //document.form1.p_pageno.value="<%= v_pageno %>";
    document.form1.submit();
}

//��ȭ�� �������� �̵�
function select(tgubun, tabseq, seq, subj, subjseq, year, lesson, types) {

    document.form1.method = "get";
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value  = "selectView";
    document.form1.p_tgubun.value   = tgubun;
    document.form1.p_tabseq.value   = tabseq;
    document.form1.p_seq.value      = seq;
    document.form1.p_types.value    = types;
    document.form1.p_subj.value     = subj;
    document.form1.p_year.value     = year;
    document.form1.p_subjseq.value  = subjseq;
    document.form1.p_lesson.value   = lesson;

    document.form1.submit();
}
function search_enter(e)  {
    if (e.keyCode =='13'){  selectList();  }
}

//�˻����뿡 �´� ����Ʈ �������� �̵�
function selectList() {
    /*
    if (form1.p_searchtext.value == ""){
        alert("�˻� �� ������ �Է��� �ּ���");
        return false;
    } else {
        document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
        document.form1.p_process.value="ListPage";
        document.form1.p_pageno.value="1";
        document.form1.submit();
    }
    */

    var searchWord = $("input:text[name=p_searchtext]").val();

    searchWord = fnCheckInvalidChar(searchWord);

    $("input:text[name=p_searchtext]").val(searchWord);

    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value = "ListPage";
    document.form1.p_pageno.value = "1";
    document.form1.submit();

}

function sstgubun_listpage(){
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value="ListPage";
    document.form1.submit();
}
//������ �̵�
function goPage(pageNum) {

    document.form1.p_pageno.value = pageNum;
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value="ListPage";
    document.form1.submit();
}

// Tab ���ý� ����
function showTab(clickTab)
{
   //alert(clickTab);
    g_showTab(clickTab, 2);
}

function g_showTab(tabNo, count)
{

    var clickTabNo = new Number(tabNo);
    var tabCount   = new Number(count);

    if( clickTabNo == 0 || tabCount == 0 ) return;

    for(i=1; i<=tabCount; i++)
    {
        div = document.all["tab_"+i];

        if(!div) return;

        if( clickTabNo == i ) {
            // Ȱ��ȭ�� tab Ŭ���� return
            if(div.style.display == "") return;
            div.style.display = ""
        }
        else {
            // ���õ��� �ʴ� �ǵ��� ������ ����.
            if(div.style.display != "none") {
                div.style.display = "none";
            }
        }
    }
}
</script>
<!-- container-new ���� //-->
<div id="container-new">

    <form name="form1" method="post" action="" onsubmit="return selectList();">
        <input type="hidden" name="p_process" value="<%=v_process%>" />
        <input type="hidden" name="p_pageno" value="<%=v_pageno%>" />
        <input type="hidden" name="p_tgubun" value="" />
        <input type="hidden" name="p_tabseq" value="" />
        <input type="hidden" name="p_seq" value="" />
        <input type="hidden" name="p_types" value="" />
        <input type="hidden" name="p_area" value="<%=v_category%>" />
        <input type="hidden" name="p_subj" value="" />
        <input type="hidden" name="p_year" value="" />
        <input type="hidden" name="p_subjseq" value="" />
        <input type="hidden" name="p_lesson" value="" />

        <div id="mainMenu">
            <!-- �¶��� ���� -->
            <ul class="location">
                <li>���θ޴�</li>
                <li>���� �ۼ��� �� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul>
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">�¶��� ���ǽ�</a></li>
                        <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingOffSubjectPage">���屳��</a></li>
                        <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=MINE" class="active">�����ۼ��� ��</a></li>
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
                if(v_category.equals("MINE")){
    %>
                    ���� �ۼ��ѱ�<!--<img src="/images/2013/online_edu/myCommunity_title.gif" alt="���� �ۼ��ѱ�" />//--></h2>
    <%
                }else {
    %>
                    Ŀ�´�Ƽ<!--<img src="/images/2013/online_edu/community_title.gif" alt="Ŀ�´�Ƽ" />//--></h2>
    <%
                }
    %>
                <div id="subCont">
                <!--  ������ �� �˻� -->
                <div class="search">
                    <fieldset>
                        <legend>���� �˻�</legend>
                        <select name="p_search" title="�˻� �з�">
                            <option value="TITL" <%=v_search.equals("TITL")?"selected":"" %>>����</option>
                            <option value="SUBJ" <%=v_search.equals("SUBJ")?"selected":"" %>>����</option>
                        </select>
                        <input type="text" name="p_searchtext" value="<%=v_searchtext %>" title="�˻���" class="keyword" />
                        <input type="image" src="/images/2013/btn/btn_src2.gif" alt="�˻�" class="btn" />
                    </fieldset>
                </div>
                <!-- 2015-01-09 ���� ����
                    <ul class="tabCus">
                        <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage"><img src="/images/2013/online_edu/community_tab_1_<%=full_toggle %>.gif" alt="��ü" /></a></li>
                        <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=B0"><img src="/images/2013/online_edu/community_tab_2_<%=sub2_toggle %>.gif" alt="��ۿ���" /></a></li>
                        <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=G0"><img src="/images/2013/online_edu/community_tab_3_<%=sub3_toggle %>.gif" alt="���Ӱ���" /></a></li>
                        <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=K0"><img src="/images/2013/online_edu/community_tab_4_<%=sub4_toggle %>.gif" alt="����ĳ/���ǰ���" /></a></li>
                        <li><a href="/servlet/controller.homepage.CMUBoardServlet?p_process=list"><img src="/images/2013/online_edu/community_tab_6_off.gif" alt="cmu ��������" /></a></li>
    <%
            if ( !topWarp_userid.equals("") ) {
    %>
                        <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=MINE"><img src="/images/2013/online_edu/community_tab_5_<%=sub5_toggle %>.gif" alt="���� �ۼ��� ��" /></a></li>
    <%
            }
    %>
                    </ul>

                //-->

                    <h3 class="blind">��ü ������ġ</h3>

                    <ul class="bbsType">
    <!--                    <li><a href="community_list_webzine.html"><img src="/images/2013/common/ico_webzine.gif" alt="" /> ������</a></li>-->
    <!--                    <li class="on"><a href="javascript:void(0);"><img src="/images/2013/common/ico_bbs.gif" alt="" /> �Խ�����</a></li>-->
                    </ul>

                    <div class="board2">
                        <table summary="�۹�ȣ, �з�, ����, ����, �ۼ���, ����� ��ȸ�� �����Ǿ��ֽ��ϴ�.">
                            <colgroup>
                                <col width="5%"/>
                                <col width="*"/>
                                <col width="22%"/>
                                <col width="8%"/>
                                <col width="9%"/>
                                <col width="4%"/>
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col"></th>
                                <th scope="col">
                                    <div class="divide">
                                        <select class="category" title="�з�" name="ss_tgubun" onchange="javascript:sstgubun_listpage();">
                                            <option value="ALL">��ü</option>
                                            <option value="D" <%if(ss_tgubun.equals("D")) out.println("selected"); %>>�ڷ�</option>
                                            <option value="I" <%if(ss_tgubun.equals("I")) out.println("selected"); %>>����</option>
                                            <option value="Q" <%if(ss_tgubun.equals("Q")) out.println("selected"); %>>����</option>
                                            <option value="T" <%if(ss_tgubun.equals("T")) out.println("selected"); %>>���</option>
                                        </select>
                                        ����
                                    </div>
                                </th>
                                <th scope="col">����</th>
                                <th scope="col">�ۼ���</th>
                                <th scope="col">�����</th>
                                <th scope="col">��ȸ</th>
                            </tr>
                            </thead>
                            <tbody>
                            <!-- ������
                            <img src="/images/2013/common/ico_pds.gif" alt="�ڷ�" />
                            <img src="/images/2013/common/ico_info.gif" alt="����" />
                            <img src="/images/2013/common/ico_question.gif" alt="����" />
                            <img src="/images/2013/common/ico_discussion.gif" alt="���" />
                            -->
                            <%
                            if(list.size() > 0 ){
                                for(int i = 0; i < list.size(); i++) {
                                    DataBox dbox = (DataBox)list.get(i);

                                    v_tgubun        = dbox.getString("d_tgubun");
                                    v_tabseq        = dbox.getString("d_tabseq");
                                    v_seq           = dbox.getString("d_seq");
                                    v_types         = dbox.getString("d_types");
                                    v_title         = dbox.getString("d_title");
                                    v_inuserid      = dbox.getString("d_inuserid");
                                    v_cnt           = dbox.getString("d_cnt");
                                    v_name          = dbox.getString("d_name");
                                    v_indate        = dbox.getString("d_indate");
                                    v_subj          = dbox.getString("d_subj");
                                    v_subjseq       = dbox.getString("d_subjseq");
                                    v_year          = dbox.getString("d_year");
                                    v_lesson        = dbox.getString("d_lesson");
                                    v_subjnm        = dbox.getString("d_subjnm");
                                    v_area          = dbox.getString("d_area");
                                    v_upperclass    = dbox.getString("d_upperclass");
                                    v_middleclass   = dbox.getString("d_middleclass");
                                    v_lowerclass    = dbox.getString("d_loserclass");
                                    v_answercnt     = dbox.getString("d_answercnt");
                                    v_commentcnt    = dbox.getInt("d_commentcnt");


                                    v_dispnum   = dbox.getInt("d_dispnum");
                                    v_totalpage = dbox.getInt("d_totalpage");
                                    v_totalrowcount = dbox.getInt("d_totalrowcount");

                                    String t_addate = v_indate.substring(0,8);
                                    String t_agodate = dbox.getString("d_agodate").substring(0,8);
                                    int c_addate = Integer.parseInt(t_addate);
                                    int c_agodate = Integer.parseInt(t_agodate);
                                    boolean new_che = false;
                                    String new_tag = "";
                                    if(c_addate-c_agodate > 0){
                                        new_che = true;
                                        new_tag = "<img src=\"/images/2013/common/ico_new3.gif\" alt=\"new\">";
                                    }

                                    String v_tgubunnm = "";
                                    if(v_tgubun.equals("T")){v_tgubunnm = "<img src=\"/images/2013/common/ico_discussion.gif\" alt=\"���\" />";}
                                    else if(v_tgubun.equals("Q")){v_tgubunnm = "<img src=\"/images/2013/common/ico_question.gif\" alt=\"����\" />";}
                                    else if(v_tgubun.equals("C")){v_tgubunnm = "<img src=\"/images/factory/icon_tutorcom_c.gif\" alt=\"����\" />";}
                                    else if(v_tgubun.equals("D")){v_tgubunnm = "<img src=\"/images/2013/common/ico_pds.gif\" alt=\"�ڷ�\" />";}
                                    else if(v_tgubun.equals("I")){v_tgubunnm = "<img src=\"/images/2013/common/ico_info.gif\" alt=\"����\" />";}
                                    else if(v_tgubun.equals("R")){v_tgubunnm = "<img src=\"/images/factory/icon_tutorcom_r.gif\" alt=\"����\" />";}
                                    else if(v_tgubun.equals("N")){v_tgubunnm = "<img src=\"/images/factory/icon_tutorcom_n.gif\" alt=\"����\" />";}

                                    // �˻�� �־��ٸ� �ش� �κ��� �ش������ �ΰ���Ų��.
                                    //if (!v_searchtext.equals("")) {
                                    //  v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">"+v_searchtext+"</font>");
                                    //}
                            %>
                            <tr>
                                <td class="first"><%=v_dispnum%></td>
                                <td class="left bldnone">
                                    <%=v_tgubunnm %>
                                    <a href="javascript:select('<%=v_tgubun%>','<%=v_tabseq%>','<%=v_seq%>','<%=v_subj%>','<%=v_subjseq%>','<%=v_year%>','<%=v_lesson%>','<%=v_types%>')"><%=StringManager.formatTitle(v_title,32)%></a>
                                    <%if(new_che)%> <%=new_tag %>
                                    <%if(v_commentcnt > 0)out.print("<span class=\"repl\"> [<em>"+v_commentcnt+"</em>]</span>"); %><%if(!v_answercnt.equals("0") && (v_tgubun.equals("Q")||v_tgubun.equals("R")))out.print("<span class=\"repl\"> �亯 <em>"+v_answercnt+"</em></span>"); %>
                                </td>
                                <td class="left"><%=v_subjnm %></td>
                                <td><%=v_name %></td>
                                <td><%=FormatDate.getFormatDate(v_indate, "yyyy.MM.dd")%></td>
                                <td><%=v_cnt%></td>
                            </tr>
                            <%} }else{ %>
                            <tr>
                                <td colspan="6" class="first">��ϵ� �Խù��� �����ϴ�.</td>
                            </tr>
                            <%}%>
                            </tbody>
                        </table>
    <%
            if ( !topWarp_userid.equals("") ) {
    %>
                        <!--
                        <div class="btnArea right">
                            <a href="javascript:insertPage();"><img src="/images/2013/btn/bnt_write.gif" alt="���ۼ�" /></a>
                        </div>
                        //-->
    <%
            }
    %>

                    </div>
                    <!-- //tableWrap2 -->


                    <div class="paging pgSpace">
                        <%= PageUtil.re2013_printPageListDiv(v_totalpage, v_pageno, 0, 15, v_rowcount) %>
                    </div>
                    <!-- //paging -->

                </div>
                <!-- //#subCont -->
        </div>
    </form>

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>
