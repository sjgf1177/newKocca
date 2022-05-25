<%
//**********************************************************
//  1. ��      ��: ���İ��� �ֱ�����
//  2. ���α׷��� : gu_KnowBoard_I.jsp
//  3. ��      ��: ���İ��� �ֱ����� ���
//  4. ȯ      ��: JDK 1.4
//  5. ��      ��:
//  6. ��      ��: �̳��� 06.01.03
//***********************************************************
%>
<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.dunet.common.util.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />


<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    box.put("topmenu","99");

    String v_process= box.getString("p_process");
    int    v_pageno     = box.getInt("p_pageno");

    String v_categorycd = box.getString("p_area");            // request ī�װ�
    int v_seq = box.getInt("p_seq");
    String v_searchtext = box.getString("p_searchtext");
    int    v_upfilecnt  = box.getInt("p_upfilecnt");            //  ������ ������ִ� ���ϼ�

    String content      = "";
    String width        = "650";
    String height       = "200";

    String s_userid     = box.getSession("userid");
    String s_name       = box.getSession("name");

    String full_toggle = "off";
    String sub1_toggle = "off";
    String sub2_toggle = "off";
    String sub3_toggle = "off";
    String sub4_toggle = "off";
    String sub5_toggle = "off";

    String sub_navi = "";

    if (v_categorycd.equals("C0")){
        sub1_toggle = "on";
        sub_navi = "����";
    }else if (v_categorycd.equals("B0")){
        sub2_toggle = "on";
        sub_navi = "��ۿ���";
    } else if (v_categorycd.equals("G0")){
        sub3_toggle = "on";
        sub_navi = "���Ӱ���";
    } else if (v_categorycd.equals("K0")){
        sub4_toggle = "on";
        sub_navi = "��ȭ������";
    }else if (v_categorycd.equals("MINE")){
        sub5_toggle = "on";
        sub_navi = "�����ۼ��ѱ�";
    } else {
        full_toggle = "on";
        sub_navi = "����";
    }

    //    box.put("title_str", "���ۼ� - Ŀ�´�Ƽ - �¶��α���");
    box.put("title_str", "���ۼ� - "+sub_navi+" - ���θ޴�");
%>
<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<script language="JavaScript" type="text/JavaScript">
<!--
 //����Ʈȭ������ �̵�
function selectList() {
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value = "ListPage";
    document.form1.submit();
}

/* 2015-01-09 ����
*  ���� �ۼ��� �� ����Ʈȭ������ �̵�
*/
function fnselectMyList() {
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value = "ListPage";
    document.form1.p_area.value = "MINE";
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

//���� ��ȸ
function whenSelection(p_action) {

    //var v_grcode, v_subj, v_upperclass, v_middleclass, v_lowerclass;
    //v_grcode      = document.form1.s_grcode.options[document.form1.s_grcode.selectedIndex].value;
    //v_subj        = document.form1.s_subjcourse.value;
    document.form1.p_catecd.value  = document.form1.s_subjcourse.value;
 }

// ī�װ� ����
function openCategory(){
    window.self.name = "winSelectList";
    open_window("openwinSelectList","","100","100","390","400","","","","yes","");
    document.form1.target = "openwinSelectList";
    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value = "OpenCategoryPage";
    document.form1.submit();
    document.form1.target = window.self.name;

}

 //�����͸� �Է��Ѵ�.
function insert() {
    var frm = document.form1;

    if (frm.p_tgubun.value == "SEL"){
        alert("���Ӹ��� �����ϼ���.");
        frm.p_tgubun.focus();
        return;
    }else if(frm.p_tgubun.value == "C"){
        if(frm.p_category.value == "SEL"){
            alert("�о߸� �����ϼ���.");
            frm.p_category.focus();
            return;
        }
    }

    if (blankCheck(frm.p_title.value)) {
        alert("������ �Է��ϼ���!");
        frm.p_title.focus();
        return;
    }

    if (realsize(frm.p_title.value) > 100) {
        alert("������ �ѱ۱��� 50�ڸ� �ʰ����� ���մϴ�.");
        frmp_title.focus();
        return;
    }

    //document.getElementById("txtfield4").value = CrossEditor.GetBodyValue();

    frm.p_searchtext.value    = "";
    frm.p_pageno.value        =  1;

    var subjinfo = frm.p_subjinfo.value;

    frm.p_subj.value = subjinfo.substr(0,7);
    frm.p_subjseq.value = subjinfo.substr(7,4);
    frm.p_year.value = subjinfo.substr(11,4);
    frm.p_lesson.value = "000";

    document.form1.action = "/servlet/controller.homepage.KnowBoardUserServlet";
    document.form1.p_process.value = "insert";
    document.form1.p_area.value = "MINE";
    document.form1.submit();
}

//�Է� ������ ������ üũ
function blankCheck( msg ) {
    var mleng = msg.length;
    chk=0;

    for (i=0; i<mleng; i++) {
        if ( msg.substring(i,i+1)!=' ' && msg.substring(i,i+1)!='\n' && msg.substring(i,i+1)!='\r') chk++;
    }
    if ( chk == 0 ) return (true);

    return (false);
}

//���ڼ��� üũ
function realsize( value ) {
    var len = 0;
    if ( value == null ) return 0;
    for(var i=0;i<value.length;i++){
        var c = escape(value.charAt(i));
        if ( c.length == 1 ) len ++;
        else if ( c.indexOf("%u") != -1 ) len += 2;
        else if ( c.indexOf("%") != -1 ) len += c.length/3;
    }
    return len;
}

//����÷�ο� ���� ����
function File_CancelKeyInput()
{
    if(event.keyCode == 9){ // Tab key�� ���
        return true;
    }else{
        alert('[ã�ƺ���] ��ư�� �̿��� ÷���Ͻ� ������ �����ϼ���.\n\n��θ� �������� �߸� �Է��Ͻ� ��� ���ε尡 ����� �̷������ �ʽ��ϴ�.');
        return false;
    }
}
function display_showhide(el_id, showhide){
    if(showhide == "S"){
        $("#"+el_id).show();
    }else{
        $("#"+el_id).hide();
    }
}
function change_tgubun(val){
    if(val == "R"){
        display_showhide("tr_category","S");
        display_showhide("tr_course","H");
    }else{
        display_showhide("tr_course","S");
        display_showhide("tr_category","H");
    }
}
//-->
</script>
<!-- container-new ���� //-->
<div id="container-new">

    <div id="mainMenu">
        <!-- �¶��� ���� -->
        <ul class="location">
            <li>���θ޴�</li>
            <li>�����ۼ��� �� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul>
                    <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">�¶��� ���ǽ�</a></li>
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingOffSubjectPage">���屳��</a></li>
                    <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=MINE" class="active">�����ۼ��� ��</a></li>
                    <li><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage">��㳻��</a></li>
                    <li><a href="/servlet/controller.homepage.MainMemberJoinServlet?p_process=MemberInfoUpdate">��������</a></li>
                </ul>
            </li>
            
            <!-- 2015-01-09 �������
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
        -->
        <!-- //������ο� -->
    </div>

    <!-- ������ ���� ���� -->
    <div id="contents">
    <form name="form1" enctype = "multipart/form-data" method = "post" action="">
        <input type="hidden" name="p_seq"           value="<%=v_seq %>">
        <input type="hidden" name="p_searchtext"    value="<%=v_searchtext %>">
        <input type="hidden" name="p_pageno"        value="<%=v_pageno %>">
        <input type="hidden" name="p_process"       value="">
        <input type="hidden" name="p_subj"          value="">
        <input type="hidden" name="p_subjseq"       value="">
        <input type="hidden" name="p_year"          value="">
        <input type="hidden" name="p_lesson"        value="">
        <input type="hidden" name="p_area"        value="">

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

                <!-- 2015-01-09 �������
                <ul class="tabCus">
                    <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage"><img src="/images/2013/online_edu/community_tab_1_<%=full_toggle %>.gif" alt="��ü" /></a></li>
                    <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=B0"><img src="/images/2013/online_edu/community_tab_2_<%=sub2_toggle %>.gif" alt="��ۿ���" /></a></li>
                    <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=G0"><img src="/images/2013/online_edu/community_tab_3_<%=sub3_toggle %>.gif" alt="���Ӱ���" /></a></li>
                    <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage&p_area=K0"><img src="/images/2013/online_edu/community_tab_4_<%=sub4_toggle %>.gif" alt="��ȭ������" /></a></li>
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

                <div class="write1">
                    <dl>
                        <dt><label for="wr_header">���Ӹ�</label></dt>
                        <dd>
                            <select name="p_tgubun" onchange="javacript:change_tgubun(this.value);" id="wr_header">
                                <option value="SEL">����</option>
                                <option value="Q">����</option>
                                <option value="I">����</option>
                                <option value="T">���</option>
                                <!--option value="R">����</option>
                                <option value="C">����</option>
                                <option value="D">�ڷ�</option-->
                            </select>
                        </dd>
                        <dt><label for="wr_curric">������</label></dt>
                        <dd>
                            <%= SelectSubjBean.getSubjInfo(box,v_categorycd)%>
                        </dd>
                        <dt><label for="wr_subject">����</label></dt>
                        <dd><input type="text" name="p_title" id="wr_subject" style="width:635px;" /></dd>
                        <dt class="blind"><label for="wr_cont">����</label></dt>
                        <dd class="cont"><textarea name="content" cols="120" rows="15"></textarea></dd>
<!--                        ÷������ ���� ����-->
                        <!--dt><label for="wr_file">����÷��</label></dt>
                        <dd><input type="file" name="" id="wr_file" style="width:455px;" /></dd>
                        <dt><label for="wr_thumb">����ϵ��</label></dt>
                        <dd>
                            <input type="file" name="" id="wr_thumb" style="width:455px;" />
                            <span class="memo">300kbyte ���� (����200, ����130 pixel)</span>
                        </dd-->
                    </dl>
                </div>
                <!-- //write1 -->
                <!--
                <div class="btnArea">
                    <a href="javascript:insert();"><img src="/images/2013/btn/btn_regist.gif" alt="���" /></a>
                    <a href="javascript:fnselectMyList();"><img src="/images/2013/btn/btn_cancel.gif" alt="���" /></a>
                </div>
                //-->

            </div>
            <!-- //#subCont -->

    </form>
    </div>

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>