<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");

    box.put("title_str", "����ü�赵 - �¶��α���");
%>
<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<script type="text/javascript">
//���� ���뺸��
function SubjInfo(subj){
    document.form1.p_subj.value = subj;
    document.form1.p_process.value = "previewSubjDetailPage";
    document.form1.p_rprocess.value = "EduSystem";
    document.form1.action = "/servlet/controller.propose.ProposeCourseServlet";
    document.form1.submit();
}

$(function(){
    currGuideUI();
});
function show_content(tar){
    var b = 6;
    var g = 5;
    var a = 6;
    var m = 4;

    for(i=1; i<=b; i++){
        $("#b"+i).attr("class","");
        $("#view_b"+i).attr("style","display:none;");
    }

    for(i=1; i<=g; i++){
        $("#g"+i).attr("class","");
        $("#view_g"+i).attr("style","display:none;");
    }

    for(i=1; i<=a; i++){
        $("#a"+i).attr("class","");
        $("#view_a"+i).attr("style","display:none;");
    }

    for(i=1; i<=m; i++){
        $("#m"+i).attr("class","");
        $("#view_m"+i).attr("style","display:none;");
    }

    $("#"+tar).attr("class","active");
    $("#view_"+tar).attr("style","");
}
</script>
<!-- container-new ���� //-->
<div id="container-new">

    <div id="mainMenu">
        <!-- �¶��� ���� -->
        <ul class="location">
            <li>Ȩ</li>
            <li>�¶��� ����</li>
            <li>����ü�赵 <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul>
                    <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList" >�оߺ�</a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectListJikup" >������</a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=EduSystem" class="active">����ü�赵</a></li>
<%
        if ( currDate < 20160301 ) {
%>

                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=LiteratureSubjectList" >�޳��ι���</a></li>
<%
        }
%>
<!-- 2015-01-08 ���� ����
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">���� ���ǽ�</a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList" class="active">�����ȳ�</a></li>
                    <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage">Ŀ�´�Ƽ</a></li>
-->
                </ul>
            </li>
        </ul>

        <!-- ������ο� -->
<!-- 2015-01-08 ���� ����
        <div class="introCategory">
            <ul>
                <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">���� ���ǽ�</a></li>
                <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList"><strong><u>�����ȳ�</u></strong></a></li>
                <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage">Ŀ�´�Ƽ</a></li>
            </ul>
        </div>
-->
        <!-- //������ο� -->
    </div>

    <!-- ������ ���� ���� -->
    <div id="contents">
    <form name="form1" action="/servlet/controller.propose.ProposeCourseServlet" method="post">
        <input type="hidden" name="p_process"   value="<%=box.get("p_process")%>">
        <input type="hidden" name="p_rprocess"  value="">
        <input type="hidden" name="p_subj"  value="">
<!--        <h2 class="subTit"><img src="/images/2013/field_edu/courseguide_title.gif" alt="����ü�赵" /></h2>-->
        <h2 class="subTit">����ü�赵<!--<img src="/images/2013/field_edu/courseguide_title.gif" alt="����ü�赵" />//--></h2>
        <div id="subCont">
<!-- 2015-01-08 ���� ����
            <ul class="tabCus">
                <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList"><img src="/images/2013/online_edu/tabcurs4_off.jpg" alt="������ �Ұ�" /></a></li>
                <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectListJikup"><img src="/images/2013/online_edu/tabcurs3_off.jpg" alt="�۾��� �з�" /></a></li>
                <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectListJikmu"><img src="/images/2013/online_edu/tabcurs2_off.jpg" alt="������ �з�" /></a></li>
                <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=EduSystem"><img src="/images/2013/online_edu/tabcurs1_on.jpg" alt="����ü�赵" /></a></li>
<%
        if ( box.getSession("isLiteratureSubjYn").equals("Y") ) {
%>
                <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=LiteratureSubjectList"><img src="/images/2013/online_edu/tabcurs5_off.jpg" alt="�޳��ι���" /></a></li>
<%
        }
%>
            </ul>
-->

            <div class="noticBox">
                - �¶��ΰ����� ����ü�赵 �� ��õ Track�� Ȯ�� �Ͻ� �� �ֽ��ϴ�.<br/>
                - <strong>���ϴ� Track�� Ŭ��</strong>�Ͻø� ���γ����� Ȯ�� �Ͻ� �� �ֽ��ϴ�.
            </div>


            <h3 class="blind">����ü�赵 ������ġ</h3>

            <div class="guideWrap" style="border:1px solid #d1d1d1; padding:25px; background:#F7F7F7;">
                <ul class="step">
                    <li><img src="/images/2013/online_edu/cisys_tit_1.gif" alt="��ȹ" /></li>
                    <li class="s02"><img src="/images/2013/online_edu/cisys_tit_2.gif" alt="����" /></li>
                    <li><img src="/images/2013/online_edu/cisys_tit_3.gif" alt="����Ͻ�" /></li>
                    <li><img src="/images/2013/online_edu/cisys_tit_4.gif" alt="����" /></li>
                </ul>
                <div class="guideright">
                    <!-- ��ۿ��� -->
                    <div class="boxWrap">
                        <p class="tit"><img src="/images/2013/online_edu/tabcisys_tit_1.gif" alt="��ۿ���о� ������ȭ�� ���� ��õ Ʈ��" /></p>

                        <div class="box01 on">
                            <a href="javascript:show_content('b1');">
                                <span class="top"></span>
                                <span class="txt first">��ۿ��� ��ȹ Track</span>
                                <span class="btm"></span>
                            </a>
                        </div>
                        <!--// line1 -->

                        <div class="box01 type2">
                            <a href="javascript:show_content('b2');">
                                <span class="top"></span>
                                <span class="txt first">��ۿ��� ���� Track</span>
                            </a>
                            <a href="javascript:show_content('b3');"><span class="txt">��ۿ��� �Կ� Track</span></a>
                            <a href="javascript:show_content('b4');">
                                <span class="txt">��ۿ��� ���� Track</span>
                                <span class="btm"></span>
                            </a>
                        </div>
                        <!--//line2 -->


                        <div class="box01">
                            <a href="javascript:show_content('b5');">
                                <span class="top"></span>
                                <span class="txt first">��ۿ��� ���� Track</span>
                                <span class="btm"></span>
                            </a>
                        </div>
                        <!--//line3 -->

                        <div class="box01">
                            <a href="javascript:show_content('b6');">
                                <span class="top"></span>
                                <span class="txt first">��ۿ��� ����</span>
                                <span class="btm"></span>
                            </a>
                        </div>
                        <!--//line4 -->
                    </div>
                    <!--// ��ۿ��� -->

                    <!-- ���� -->
                    <div class="boxWrap">
                        <p class="tit"><img src="/images/2013/online_edu/tabcisys_tit_2.gif" alt="���Ӻо� ������ȭ�� ���� ��õ Ʈ��" /></p>

                        <div class="box02">
                            <a href="javascript:show_content('g1');">
                                <span class="top"></span>
                                <span class="txt first">���� ��ȹ Track</span>
                                <span class="btm"></span>
                            </a>
                        </div>
                        <!--//line1 -->

                        <div class="box02 type2">
                            <a href="javascript:show_content('g2');">
                                <span class="top"></span>
                                <div class="txt first hg2">���� ����/�׷���/����<br /> Track</div>
                            </a>
                            <a href="javascript:show_content('g3');">
                                <span class="txt hg2">���� ���α׷��� Track</span>
                                <span class="btm"></span>
                            </a>
                        </div>
                        <!--//line2 -->

                        <div class="box02">
                            <a href="javascript:show_content('g4');">
                                <span class="top"></span>
                                <span class="txt first">���� ���� Track</span>
                                <span class="btm"></span>
                            </a>
                        </div>
                        <!--//line3 -->

                        <div class="box02">
                            <a href="javascript:show_content('g5');">
                                <span class="top"></span>
                                <span class="txt first">���� ����</span>
                                <span class="btm"></span>
                            </a>
                        </div>
                        <!--//line4 -->
                    </div>
                    <!--// ���� -->

                    <!-- ����ĳ -->
                    <div class="boxWrap">
                        <p class="tit"><img src="/images/2013/online_edu/tabcisys_tit_3.gif" alt="��ȭ�ִ�ĳ���ͺо� ������ȭ�� ���� ��õ Ʈ��" /></p>

                        <div class="box03">
                            <a href="javascript:show_content('a1');">
                                <span class="top"></span>
                                <span class="txt first">��ȭ�ִ�ĳ���� ��ȹ Track</span>
                                <span class="btm"></span>
                            </a>
                        </div>
                        <!--//line1 -->

                        <div class="box03 type2">
                            <a href="javascript:show_content('a2');">
                                <span class="top"></span>
                                <span class="txt first">��ȭ ���� Track</span>
                            </a>
                            <a href="javascript:show_content('a3');"><span class="txt">�ִ� ���� Track</span></a>
                            <a href="javascript:show_content('a4');">
                                <span class="txt">ĳ���� ���� Track</span>
                                <span class="btm"></span>
                            </a>
                        </div>
                        <!--//line2 -->

                        <div class="box03">
                            <a href="javascript:show_content('a5');">
                                <span class="top"></span>
                                <span class="txt first">��ȭ�ִ�ĳ���� ���� Track</span>
                                <span class="btm"></span>
                            </a>
                        </div>
                        <!--//line3 -->

                        <div class="box03">
                            <a href="javascript:show_content('a6');">
                                <span class="top"></span>
                                <span class="txt first">��ȭ�ִ�ĳ���� ����</span>
                                <span class="btm"></span>
                            </a>
                        </div>
                        <!--//line4 -->
                    </div>
                    <!--// ����ĳ -->


                    <!-- ���ǰ��� -->
                    <div class="boxWrap">
                        <p class="tit"><img src="/images/2013/online_edu/tabcisys_tit_4.gif" alt="���ǰ����о� ������ȭ�� ���� ��õ Ʈ��" /></p>

                        <div class="box04">
                            <a href="javascript:show_content('m1');">
                                <span class="top"></span>
                                <span class="txt first">���ǰ��� ��ȹ Track</span>
                                <span class="btm"></span>
                            </a>
                        </div>
                        <!--//line1 -->

                        <div class="box04 type2">
                            <a href="javascript:show_content('m2');">
                                <span class="top"></span>
                                <span class="txt first hg3">���ǰ��� ���� Track</span>
                                <span class="btm"></span>
                            </a>
                        </div>
                        <!--//line2 -->

                        <div class="box04">
                            <a href="javascript:show_content('m3');">
                                <span class="top"></span>
                                <span class="txt first">���ǰ��� ���� Track</span>
                                <span class="btm"></span>
                            </a>
                        </div>
                        <!--//line3 -->

                        <div class="box04">
                            <a href="javascript:show_content('m4');">
                                <span class="top"></span>
                                <span class="txt first">���ǰ��� ����</span>
                                <span class="btm"></span>
                            </a>
                        </div>
                        <!--//line4 -->
                    </div>
                    <!--// ���ǰ��� -->
                </div>
                <!--// guideright  -->
            </div>
            <!--// guideWrap  -->

            <div id="view_b1" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/b1.jsp"%></div>
            <div id="view_b2" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/b2.jsp"%></div>
            <div id="view_b3" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/b3.jsp"%></div>
            <div id="view_b4" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/b4.jsp"%></div>
            <div id="view_b5" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/b5.jsp"%></div>
            <div id="view_b6" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/b6.jsp"%></div>
            <div id="view_g1" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/g1.jsp"%></div>
            <div id="view_g2" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/g2.jsp"%></div>
            <div id="view_g3" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/g3.jsp"%></div>
            <div id="view_g4" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/g4.jsp"%></div>
            <div id="view_g5" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/g5.jsp"%></div>
            <div id="view_a1" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/a1.jsp"%></div>
            <div id="view_a2" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/a2.jsp"%></div>
            <div id="view_a3" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/a3.jsp"%></div>
            <div id="view_a4" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/a4.jsp"%></div>
            <div id="view_a5" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/a5.jsp"%></div>
            <div id="view_a6" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/a6.jsp"%></div>
            <div id="view_m1" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/m1.jsp"%></div>
            <div id="view_m2" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/m2.jsp"%></div>
            <div id="view_m3" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/m3.jsp"%></div>
            <div id="view_m4" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/m4.jsp"%></div>

        </div>
        <!-- //#subCont -->
        </form>
    </div>
    <!-- ������ ���� �� -->

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>