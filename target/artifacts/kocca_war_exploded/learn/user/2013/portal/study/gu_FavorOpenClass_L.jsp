<%
//**********************************************************
//  1. ��      ��: ���� ���ǽ� > ���Ѱ���(��������) ��� ȭ��
//  2. ���α׷���: gu_FavorOpenClass_L.jsp
//  3. ��      ��: �������� ����
//  4. ȯ      ��: JDK 1.5
//  5. ��      ��: 1.0
//  6. ��      ��: 2014-10-21
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType="text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.credu.library.DataBox" %>
<%@ page import="com.credu.library.RequestBox" %>
<%@ page import="com.credu.library.RequestManager" %>
<jsp:useBean id="conf" class="com.credu.library.ConfigSet"  scope="page" />
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    
    ArrayList favorSubjectList = (ArrayList)request.getAttribute("favorSubjectList"); // ���� ���� ���

    ArrayList favorOpenClassList = (ArrayList)request.getAttribute("favorOpenClassList"); // ���� ���� ���

    // ����¡����
    int row = Integer.parseInt(conf.getProperty("page.bulletin.row"));
    int vv_pageno = box.getInt("p_pageno");

    String grcode = box.getSession("tem_grcode");

    box.put("title_str", "���� - �¶��α���");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script type="text/javascript">

    /**
     * ���� �¶��α��� ���
     */
    function fnCancelFavor(subj, idx) {

        var param = "p_process=manageFavorSubj&classType=01&subj=" + subj + "&jobType=cancel";
        var successMsg = "";

        if ( confirm("���� ���� ��Ͽ��� �����Ͻðڽ��ϱ�?") ) {
            $.ajax({
                    type : "get"
                ,   url : "/servlet/controller.study.MyClassServlet"
                ,   dataType : "json"
                ,   data : param
                ,   success : function (data) {

                        if ( data.isLogin == true ) {
                            if ( data.resultCnt > 0) {
                                $("#oFavorSubjList" + idx).remove();
                                alert("���� �������� �����Ǿ����ϴ�.");

                            } else {
                                alert("������ �߻��Ͽ����ϴ�.\n�����ڿ��� �����ϼ���.");
                                return;
                            }
                        } else {
                            alert("�α����� �ʿ��մϴ�.");
                            return;
                        }
                    }
                ,   complete : function(arg1, arg2) {
                        // alert("complete : " + arg1 + " :: " + arg2);
                    }
                ,   error :  function(arg1, arg2) {
                        // alert("error : " + arg1);
                    }

            });
        } else {
            return;
        }
    }
    /**
     * ���� ���� ���
     */
    function fnCancelFavorOpenclass(seq, idx) {

        var param = "p_process=manageFavorSubj&classType=02&subj=" + seq + "&jobType=cancel";
        var successMsg = "";

        if ( confirm("���� ���� ��Ͽ��� �����Ͻðڽ��ϱ�?") ) {
            $.ajax({
                    type : "get"
                ,   url : "/servlet/controller.study.MyClassServlet"
                ,   dataType : "json"
                ,   data : param
                ,   success : function (data) {

                        if ( data.isLogin == true ) {
                            if ( data.resultCnt > 0) {
                                $("#oFavorOpenClassList" + idx).remove();
                                alert("���� ���¿��� �����Ǿ����ϴ�.");

                            } else {
                                alert("������ �߻��Ͽ����ϴ�.\n�����ڿ��� �����ϼ���.");
                                return;
                            }
                        } else {
                            alert("�α����� �ʿ��մϴ�.");
                            return;
                        }
                    }
                ,   complete : function(arg1, arg2) {
                        // alert("complete : " + arg1 + " :: " + arg2);
                    }
                ,   error :  function(arg1, arg2) {
                        // alert("error : " + arg1);
                    }

            });
        } else {
            return;
        }
    }
    /**
     * �������� �� ȭ������ �̵�
     */
    function fnViewSubjInfo(subj) {

        var url = "/servlet/controller.propose.ProposeCourseServlet";
        var param = "?p_process=previewSubjDetailPage&p_subj=" + subj;

        location.href = url + param;
    }

    /**
     * �������� �� ȭ������ �̵�
     */
    function fnViewOpenClass(seq, lectureCls) {
        var url = "/servlet/controller.infomation.GoldClassHomePageServlet";
        var param ="?p_process=selectView&p_seq=" + seq + "&p_lecture_cls=" + lectureCls;

        location.href = url + param;
    }
 </script>
<!-- ��ũ��Ʈ�������� -->
<!-- container-new ���� //-->
<div id="container-new">

        <!-- �¶��� ���� -->
        <div id="mainMenu">
            <ul class="location">
                <li>���θ޴�</li>
                <li>�¶��� ���ǽ� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul>
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage" class="active">�¶��� ���ǽ�</a></li>
                        <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingOffSubjectPage">���屳�� ���ǽ�</a></li>
                        <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=MINE" >�����ۼ��� ��</a></li>
                        <li><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage">��㳻��</a></li>
                        <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberInfoUpdate">��������</a></li>
                    </ul>
                </li>
                <!-- 2015-01-12 ���� ����
                <li>�¶��� ����</li>
                <li>
                    ���� ���ǽ� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul>
                        <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage" class="active">���� ���ǽ�</a></li>
                        <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList">�����ȳ�</a></li>
                        <li><a href="#">Ŀ�´�Ƽ</a></li>
                    </ul>
                </li>

                //-->
            </ul>

            <!-- ������ο� -->
            <div class="introCategory">
                <ul>
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">���� ���ǽ�</a></li>
                    <li><a href="/servlet/controller.study.FavorOpenClassServlet?p_process=favorOpenClassList" ><strong><u>����</u></strong></a></li>
                    <li><a href="/servlet/controller.research.SulmunSubjUserServlet?p_process=SulmunNew" >����</a></li>
                    <li><a href="/servlet/controller.study.ProposeReviewServlet?p_process=selectReviewList" >�����ı�</a></li>

                    <!-- 2015-01-12 �������
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage"><strong><u>���� ���ǽ�</u></strong></a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList">�����ȳ�</a></li>
                    <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage">Ŀ�´�Ƽ</a></li>
                     //-->
                </ul>
            </div>
            <!-- //������ο� -->
            <!-- //�¶��� ���� -->
        </div>


        <!-- ������ ���� ���� -->
        <div id="contents">
            <h2 class="subTit">����<!--<img src="/images/2013/online_edu/favor_title.gif" alt="����" />//--></h2>

            <div id="subCont" class="myClass">

                <!-- 2015-01-12 �������
                <ul class="tabCus">
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage"><img src="/images/2013/online_edu/myclass_tab_1_off.gif" alt="���� ���ǽ�" /></a></li>
                    <li><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage"><img src="/images/2013/online_edu/myclass_tab_2_off.gif" alt="��㳻��" /></a></li>
                    <li><a href="/servlet/controller.research.SulmunSubjUserServlet?p_process=SulmunNew"><img src="/images/2013/online_edu/myclass_tab_3_off.gif" alt="����" /></a></li>
                    <li><a href="/servlet/controller.study.FavorOpenClassServlet?p_process=favorOpenClassList"><img src="/images/2013/online_edu/myclass_tab_4_on.gif" alt="���Ѱ���" /></a></li>
                </ul>

                //-->
                <div class="noticBox">
                    �������¿��� ���� ���Ѱ��� ����� Ȯ�� �� �� �ֽ��ϴ�.<br/>
                    ���Ѱ��´� �ִ� 30������ �����Ǹ� 30�� �ʰ��� ������ ������� �ڵ������˴ϴ�.
                </div>


                <!-- 2015-01-12 ���� ���� ���Ѱ��¿� ����  -->

                <h3 class="subTit_bl">> �¶��� ����</h3>
                <div class="tableWrap2 noclose">
                    <table class="layoutTable3 space3" summary="��ǥ�� ���� ���ǽ� ���� ����ǥ�� ī�װ�, ������, �����Ⱓ, ��û�Ⱓ, ����ϱ�� �����Ǿ��ֽ��ϴ�.">
                        <caption>���� ����</caption>
                        <colgroup>
                            <col width="80"/>
                            <col width="284"/>
                            <col width="140"/>
                            <col width="106"/>
                            <col width="106"/>
                            <col width="*"/>
                        </colgroup>
                        <thead>
                        <tr>
                            <th scope="col">ī�װ�</th>
                            <th scope="col">������</th>
                            <th scope="col">�����Ⱓ</th>
                            <th scope="col">��û�Ⱓ</th>
                            <th scope="col">����ϱ�</th>
                        </tr>
                        </thead>
                        <tbody>
<%
                        DataBox favorSuject = null;
                        if( favorSubjectList.size() != 0 ) {
                            for ( int i = 0; i < favorSubjectList.size(); i++) {
                                favorSuject = (DataBox)favorSubjectList.get(i);
%>
                        <tr id="oFavorSubjList<%= i %>">
                            <td class="first"><%= favorSuject.getString("d_classname") %></td>
                            <td><a href="javascript:fnViewSubjInfo('<%= favorSuject.getString("d_subj") %>');"><%= favorSuject.getString("d_subjnm") %></a></td>
                            <td><%= favorSuject.getString("d_edustart") %>~<%= favorSuject.getString("d_eduend") %></td>
                            <td><%= favorSuject.getString("d_propstart") %>~<%= favorSuject.getString("d_propend") %></td>
                            <td><span class="btnPink"><a href="javascript:fnCancelFavor('<%= favorSuject.getString("d_subj") %>', <%= i %>);">�����</a></span></td>
                        </tr>
<%
                            }
                        } else {
%>
                        <tr>
                            <td class="first" colspan="5">���Ѱ����� �����ϴ�.</td>
                        </tr>
<%
                        }
%>
                        </tbody>
                    </table>
                </div>
                <!-- //tableWrap2 -->

                <h3 class="subTit_bl">> ��������</h3>
                <div class="tableWrap2 noclose">
                    <table class="layoutTable3 space3" summary="��ǥ�� ���� ���ǽ� ���� ������ ���� ��� ǥ�� ī�װ���, ���¸�, ����ϱ� ��ư�� �����ϰ� �ֽ��ϴ�.">
                        <caption>��û���� ����</caption>
                        <colgroup>
                            <col width="70"/>
                            <col width="70"/>
                            <col width="284"/>
                            <col width="80"/>
                            <col width="*"/>
                        </colgroup>
                        <thead>
                        <tr>
                            <th scope="col">�з���</th>
                            <th scope="col">�׸���</th>
                            <th scope="col">������</th>
                            <th scope="col">����ϱ�</th>
                        </tr>
                        </thead>
                        <tbody>
<%
                        DataBox favorOpenclass = null;
                        if( favorOpenClassList.size() != 0 ) {
                            for ( int i = 0; i < favorOpenClassList.size(); i++) {
                                favorOpenclass = (DataBox)favorOpenClassList.get(i);
%>

                        <tr id="oFavorOpenClassList<%= i %>">
                            <td class="first"><%= favorOpenclass.getString("d_area_nm") %></td>
                            <td><%= favorOpenclass.getString("d_lecture_cls_nm") %></td>
                            <td style="text-align:left; padding:0px 8px 0px 8px;">
                                <a href="javascript:fnViewOpenClass(<%= favorOpenclass.getString("d_seq") %>, '<%= favorOpenclass.getString("d_lecture_cls") %>');"><%= favorOpenclass.getString("d_lecnm") %></a>
                            </td>

                            <td><span class="btnPink"><a href="javascript:fnCancelFavorOpenclass(<%= favorOpenclass.getString("d_seq") %>,'<%= i %>');">�����</a></span></td>
                        </tr>
<%
                            }
                        } else {
%>
                        <tr>
                            <td class="first" colspan="5">���� ���°� �����ϴ�.</td>
                        </tr>
<%
                        }
%>
                        </tbody>
                    </table>
                    </form>
                </div>
                <!-- //tableWrap2 -->


                <div class="paging">
                    <%-- PageUtil.re2013_printPageListDiv(vv_totalpage, vv_pageno, 0, 10, vv_rowcount) --%>
                </div>
                <!-- //paging -->
            </div>
            <!-- //#subCont -->
        </div>
        <!-- //#contents -->
        <!-- ������ ���� �� -->

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>