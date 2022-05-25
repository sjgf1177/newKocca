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
%>
<%@ include file="/learn/user/2013/portal/include/top_sub.jsp"%>
<script type="text/javascript">
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

    <div id="mainMenu">
        <!-- �¶��� ���� -->
        <ul class="location">
            <li>Ȩ</li>
            <li>�¶��� ����</li>
            <li>
                �����ȳ� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul>
                    <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">���� ���ǽ�</a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList" class="active">�����ȳ�</a></li>
                    <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage">Ŀ�´�Ƽ</a></li>
                </ul>
            </li>
        </ul>

        <!-- ������ο� -->
        <div class="introCategory">
            <ul>
                <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">���� ���ǽ�</a></li>
                <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList"><strong><u>�����ȳ�</u></strong></a></li>
                <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage">Ŀ�´�Ƽ</a></li>
            </ul>
        </div>
        <!-- //������ο� -->
    </div>

    <!-- ������ ���� ���� -->
    <div id="contents">


        <h2 class="subTit"><img src="/images/2013/field_edu/courseguide_title.gif" alt="�����ȳ�" /></h2>

        <div id="subCont">
            <ul class="tabCus">
                <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=EduSystem"><img src="/images/2013/online_edu/tabcurs1_on.jpg" alt="����ü�赵" /></a></li>
<!--                <li><a href="#"><img src="/images/2013/online_edu/tabcurs2_off.jpg" alt="������ �з�" /></a></li>-->
<!--                <li><a href="#"><img src="/images/2013/online_edu/tabcurs3_off.jpg" alt="�۾��� �з�" /></a></li>-->
                <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList"><img src="/images/2013/online_edu/tabcurs4_off.jpg" alt="������ �Ұ�" /></a></li>
            </ul>
            <h3 class="blind">����ü�赵 ������ġ</h3>

            <div class="tableWrap8 space2">
                <table class="dataTable8" summary="�� ǥ�� �¶��α��� �����ȳ� ǥ�� ��ۿ��� ���� ��ȭ�ִ�ĳ���� ���ǰ��� �������� ���� �Ǿ� �ֽ��ϴ�.">
                    <caption>�����ȳ� ����ü�赵 ǥ</caption>
                    <colgroup>
                        <col width="15%"/>
                        <col width="18%"/>
                        <col width="25%"/>
                        <col width="22%"/>
                        <col width="*"/>
                    </colgroup>
                    <thead>
                        <tr>
                            <th scope="col"></th>
                            <th scope="col">��ۿ���</th>
                            <th scope="col">����</th>
                            <th scope="col">��ȭĳ����</th>
                            <th scope="col">���ǰ���</th>
                        </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <th>��ȹ</th>
                        <td id="b1"><a href="javascript:show_content('b1');">��ۿ��� ��ȹ Track</a></td>
                        <td id="g1"><a href="javascript:show_content('g1');">���� ��ȹ Track</a></td>
                        <td id="a1"><a href="javascript:show_content('a1');">��ȭ�ִ�ĳ���� ��ȹ Track</a></td>
                        <td id="m1"><a href="javascript:show_content('m1');">���ǰ��� ��ȹ Track</a></td>
                    </tr>
                    <tr>
                        <th scope="row" rowspan="4"><a href="#">����</a></th>
                        <td id="b2"><a href="javascript:show_content('b2');">��ۿ��� ���� Track</a></td>
                        <td id="g2" rowspan="2"><a href="javascript:show_content('g2');">���� ����/�׷���/���� Track</a></td>
                        <td id="a2"><a href="javascript:show_content('a2');">��ȭ ���� Track</a></td>
                        <td id="m2" rowspan="4"><a href="javascript:show_content('m2');">���ǰ��� ���� Track</a></td>
                    </tr>
                    <tr>
                      <td id="b3" rowspan="2"><a href="javascript:show_content('b3');">��ۿ��� �Կ� Track</a></td>
                      <td id="a3" rowspan="2"><a href="javascript:show_content('a3');">�ִ� ���� Track</a></td>
                      </tr>
                    <tr>
                      <td id="g3" rowspan="2"><a href="javascript:show_content('g3');">���� ���α׷��� Track</a></td>
                      </tr>
                    <tr>
                        <td id="b4"><a href="javascript:show_content('b4');">��ۿ��� ���� Track</a></td>
                        <td id="a4"><a href="javascript:show_content('a4');">ĳ���� ���� Track</a></td>
                    </tr>
                    <tr>
                      <th scope="row">����</th>
                      <td id="b5"><a href="javascript:show_content('b5');">��ۿ��� ���� Track</a></td>
                      <td id="g4"><a href="javascript:show_content('g4');">���� ���� Track</a></td>
                      <td id="a5"><a href="javascript:show_content('a5');">��ȭ�ִ�ĳ���� ���� Track</a></td>
                      <td id="m3"><a href="javascript:show_content('m3');">���ǰ��� ���� Track</a></td>
                    </tr>
                    <tr>
                      <th scope="row">����</th>
                      <td id="b6"><a href="javascript:show_content('b6');">��ۿ��� ����</a></td>
                      <td id="g5"><a href="javascript:show_content('g5');">���ӱ���</a></td>
                      <td id="a6"><a href="javascript:show_content('a6');">��ȭ�ִ�ĳ���� ����</a></td>
                      <td id="m4"><a href="javascript:show_content('m4');">���ǰ��� ����</a></td>
                      </tr>
                    </tbody>
                </table>
            </div>
            <!-- //tableWrap8 -->

            <div class="broadWrap" id="view_b1" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/b1.jsp"%></div>
            <div class="broadWrap" id="view_b2" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/b2.jsp"%></div>
            <div class="broadWrap" id="view_b3" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/b3.jsp"%></div>
            <div class="broadWrap" id="view_b4" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/b4.jsp"%></div>
            <div class="broadWrap" id="view_b5" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/b5.jsp"%></div>
            <div class="broadWrap" id="view_b6" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/b6.jsp"%></div>
            <div class="broadWrap" id="view_g1" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/g1.jsp"%></div>
            <div class="broadWrap" id="view_g2" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/g2.jsp"%></div>
            <div class="broadWrap" id="view_g3" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/g3.jsp"%></div>
            <div class="broadWrap" id="view_g4" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/g4.jsp"%></div>
            <div class="broadWrap" id="view_g5" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/g5.jsp"%></div>
            <div class="broadWrap" id="view_a1" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/a1.jsp"%></div>
            <div class="broadWrap" id="view_a2" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/a2.jsp"%></div>
            <div class="broadWrap" id="view_a3" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/a3.jsp"%></div>
            <div class="broadWrap" id="view_a4" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/a4.jsp"%></div>
            <div class="broadWrap" id="view_a5" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/a5.jsp"%></div>
            <div class="broadWrap" id="view_a6" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/a6.jsp"%></div>
            <div class="broadWrap" id="view_m1" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/m1.jsp"%></div>
            <div class="broadWrap" id="view_m2" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/m2.jsp"%></div>
            <div class="broadWrap" id="view_m3" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/m3.jsp"%></div>
            <div class="broadWrap" id="view_m4" style="display: none;"><%@ include file="/learn/user/2013/portal/propose/onedusystem/m4.jsp"%></div>

            <!-- //broadWrap -->

        </div>
        <!-- //#subCont -->

    </div>
<%@ include file="/learn/user/2013/portal/include/footer.jsp"%>