<%
//**********************************************************
//  1. ��      ��: EDUCATION SUBJECT PAGE
//  2. ���α׷���: gu_SulmunNew_L.jsp
//  3. ��      ��: ����
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: lyh
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.research.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    ArrayList list1     = null;

    list1 = (ArrayList)request.getAttribute("EducationSubjectList1");  //��������

    box.put("title_str", "���� - �¶��� ���ǽ� - ���θ޴�");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--

// ���� ��������
function contentsWright1(p_subjnm, p_subj, p_grcode, p_gyear, p_subjseq, p_sulpapernum, p_sulpapernm, p_sulstart, p_sulend, p_sulnums){
        document.form1.p_subj.value = "ALL";
        document.form1.s_subj.value = p_subj;   // tz_suleach �� �����ڵ�
        document.form1.p_subjnm.value = p_subjnm;
        document.form1.p_grcode.value = "ALL";
        document.form1.s_grcode.value = p_grcode;    // tz_suleach �� �����׷��ڵ�
        document.form1.p_gyear.value = p_gyear;
        document.form1.p_subjseq.value = p_subjseq;
        document.form1.p_sulpapernum.value = p_sulpapernum;
        document.form1.p_sulpapernm.value = p_sulpapernm;
        document.form1.p_sulstart.value = p_sulstart;
        document.form1.p_sulend.value = p_sulend;
        document.form1.p_sulnums.value = p_sulnums;    // ������ȣ
        document.form1.p_listok.value = '0';

        window.self.name = "winSelectView";
        farwindow = window.open("", "openSubjChange", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=no, width = 680, height = 538, top=0, left=0");
        document.form1.target = "openSubjChange";
        document.form1.action = "/servlet/controller.research.SulmunSubjUserServlet";
        document.form1.p_process.value = "SulmunUserPaperListPage";
        document.form1.submit();

        farwindow.window.focus();
        document.form1.target = window.self.name;
}

function ReloadPage(p_action, tab) {
  document.form1.p_process.value = 'SulmunNew';
  document.form1.p_action.value  = p_action;
  document.form1.action = "/servlet/controller.research.SulmunSubjUserServlet";
  document.form1.submit();
}

function change_sul(val){
    if(val == '1'){
        document.form1.p_process.value = 'SulmunNew';
    }else{
        document.form1.p_process.value = 'SulmunGen';
    }

    document.form1.action = '/servlet/controller.research.SulmunSubjUserServlet';
    document.form1.submit();
}
//-->
</script>
<!-- ��ũ��Ʈ�������� -->
<!-- container-new ���� //-->
<div id="container-new">

    <!-- Form ���� ���� -->
    <form name="form1" method="post" action="/servlet/controller.research.SulmunCommonUserServlet">
    <input type="hidden" name="p_process"      value="">
    <input type="hidden" name="p_action"       value="">
    <input type="hidden" name="p_subj"         value="">
    <input type="hidden" name="p_subjnm"       value="">
    <input type="hidden" name="s_subj"         value="">
    <input type="hidden" name="p_grcode"       value="">
    <input type="hidden" name="s_grcode"       value="">
    <input type="hidden" name="p_gyear"        value="">
    <input type="hidden" name="p_subjseq"      value="">
    <input type="hidden" name="p_sulpapernum"  value="">
    <input type="hidden" name="p_sulpapernm"   value="">
    <input type="hidden" name="p_sulstart"     value="">
    <input type="hidden" name="p_sulend"       value="">
    <input type="hidden" name="p_sulnums"      value="">
    <input type="hidden" name="p_listok"       value="">

    <div id="mainMenu">
        <ul class="location">
            <li>���θ޴�</li>
            <li>
                �¶��� ���ǽ� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul>
                    <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage" class="active">�¶��� ���ǽ�</a></li>
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingOffSubjectPage" >���屳�� ���ǽ�</a></li>
                    <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=MINE" >�����ۼ��� ��</a></li>
                    <li><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage">��㳻��</a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberInfoUpdate">��������</a></li>
                    
                    <!-- 2015-01-12 ���� ����
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage" >���� ���ǽ�</a></li>
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage" >����</a></li>
                    <li><a href="/servlet/controller.research.SulmunSubjUserServlet?p_process=SulmunNew" class="active">����</a></li>
                    <li><a href="#" >�����ı�</a></li>
                    //-->
                </ul>
            </li>
        </ul>

        <!-- ������ο� -->
        <div class="introCategory">
            <ul>
                <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage" >���� ���ǽ�</a></li>
                <li><a href="/servlet/controller.study.FavorOpenClassServlet?p_process=favorOpenClassList" >����</a></li>
                <li><a href="/servlet/controller.research.SulmunSubjUserServlet?p_process=SulmunNew" ><strong>����</strong></a></li>
                <li><a href="/servlet/controller.study.ProposeReviewServlet?p_process=selectReviewList" >�����ı�</a></li>
            </ul>
        </div>
        <!-- //������ο� -->
        <!-- //�¶��� ���� -->
    </div>


    <!-- ������ ���� ���� -->
    <div id="contents">
        <h2 class="subTit">����<!--<img src="/images/2013/online_edu/sulmun_title.gif" alt="����" />//--></h2>

        <div id="subCont" class="myClass3">
            <!--2015-01-09 �������
            <ul class="tabCus">
                <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage"><img src="/images/2013/online_edu/myclass_tab_1_off.gif" alt="���� ���ǽ�" /></a></li>
                <li><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage"><img src="/images/2013/online_edu/myclass_tab_2_off.gif" alt="��㳻��" /></a></li>
                <li><a href="/servlet/controller.research.SulmunSubjUserServlet?p_process=SulmunNew"><img src="/images/2013/online_edu/myclass_tab_3_on.gif" alt="����" /></a></li>
                <li><a href="/servlet/controller.study.FavorOpenClassServlet?p_process=favorOpenClassList"><img src="/images/2013/online_edu/myclass_tab_4_off.gif" alt="���Ѱ���" /></a></li>
            </ul>
            //-->
            <h3 class="blind">���� ������ġ</h3>

            <div class="board2">
                <table summary="�۹�ȣ, �з�, ����, ����, �ۼ���, ����� ��ȸ�� �����Ǿ��ֽ��ϴ�.">
                    <colgroup>
                        <col width="5%"/>
                        <col width="8%"/>
                        <col width="*"/>
                        <col width="19%"/>
                        <col width="28%"/>
                        <col width="6%"/>
                        <col width="8%"/>
                    </colgroup>
                    <thead>
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">
                            <select title="�з�" onchange="change_sul(this.value);">
                                <option selected value='1'>����</option>
                                <option value='2'>�Ϲ�</option>
                            </select>
                        </th>
                        <th scope="col">������</th>
                        <th scope="col">�����Ⱓ</th>
                        <th scope="col">��������</th>
                        <th scope="col">������</th>
                        <th scope="col">���</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        for(int i = 0; i < list1.size(); i++) {

                            DataBox dbox1 = (DataBox)list1.get(i);

                            String v_isonoff       =  dbox1.getString("d_isonoff");
                            String v_classname     =  dbox1.getString("d_classname");
                            String v_subjnm        =  dbox1.getString("d_subjnm");
                            String v_edustart      =  dbox1.getString("d_edustart");
                            String v_eduend        =  dbox1.getString("d_eduend");

                            String v_grcode        =  dbox1.getString("d_grcode");
                            String v_subj          =  dbox1.getString("d_subj");
                            String v_year          =  dbox1.getString("d_year");
                            String v_subjseq       =  dbox1.getString("d_subjseq");
                            String v_userid        =  dbox1.getString("d_userid");
                            int    v_tstep         =  dbox1.getInt("d_tstep");    // ������
                            String v_sulnums       =  dbox1.getString("d_sulnums");

                            int v_sulpapernum      =  dbox1.getInt("d_sulpapernum");
                            String v_sulpapernm    =  dbox1.getString("d_sulpapernm");
                            int v_progress         =  dbox1.getInt("d_progress"); // ������������������
                            int v_eachcnt          =  dbox1.getInt("d_eachcnt");  // ���ÿ���

                            v_edustart      = FormatDate.getFormatDate(v_edustart,"yyyy.MM.dd");
                            v_eduend        = FormatDate.getFormatDate(v_eduend,"yyyy.MM.dd");
                    %>
                    <tr>
                        <td class="first fs"><%= i+ 1 %></td>
                        <td class="fs">����</td>
                        <td class="left"><%= v_subjnm %></td>
                        <td><%= v_edustart %> ~<%= v_eduend %></td>
                        <td class="left"><%= v_sulpapernm %></td>
                        <td><%= v_tstep %>/<%= v_progress %></td>
                        <td>
                            <%
                            if (v_eachcnt>0) { %>
                                �Ϸ�
                            <% } else {
                                if(v_progress<=v_tstep) { %>
                                    <a href="javascript:contentsWright1('<%=v_subjnm%>', '<%=v_subj%>', '<%=v_grcode%>', '<%=v_year%>', '<%=v_subjseq%>', '<%=v_sulpapernum%>', '<%=v_sulpapernm%>', '', '','<%=v_sulnums%>')" tabindex="<%="2"+i+"1"%>">���ð���</a>
                                <% } else { %>
                                    <a href="javascript:alert('�������� �������������� �������� �����մϴ�.');"  tabindex="<%="2"+i+"1"%>">���ð���</a>
                            <%  }
                            }
                            %>
                        </td>
                    </tr>
                    <%} %>
                    <%  if(list1.size() == 0 ){%>
                    <tr>
                        <td colspan="7" class="first">���������� �����ϴ�.</td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
            <!-- //board2 -->
        </div>
        <!-- //#subCont -->
    </div>
    <!-- //#contents -->
    <!-- ������ ���� �� -->
    </form>
</div>
<!--  //container-new �� //-->

 <%@ include file="/learn/user/2013/portal/include/footer.html"%>