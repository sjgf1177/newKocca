<%@ page contentType="text/html;charset=euc-kr" %>
<%@ page errorPage="/learn/library/error.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="com.credu.homepage.*" %>
<%@ page import="com.credu.library.*" %>
<%@ page import="com.credu.common.*" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) {
        box = RequestManager.getBox(request);
    }

    String v_process = box.getString("p_process");
    String v_searchtxt = box.getString("p_searchtxt");
    String v_faqcategory = "";
    v_faqcategory = box.getString("faqcategory");

    int v_fnum = 0, v_totalpage = 0, v_rowcount = 1;
    int v_pageno = box.getInt("p_pageno");
    String v_title = "";
    String v_contents = "";
    String v_indate = "";
    String v_searchtext = box.getString("p_searchtxt");
    ArrayList list = (ArrayList)request.getAttribute("selectList");
    String faqcategory ="";

    String full_toggle = "off";
    String sub1_toggle = "off";
    String sub2_toggle = "off";
    String sub3_toggle = "off";
    String sub4_toggle = "off";
    String sub5_toggle = "off";

    String categoryName = "";

    if ("0025".equals(v_faqcategory)) {
        sub1_toggle = "on";
        categoryName = "ȸ������ �� Ż��";
    } else if ("0034".equals(v_faqcategory)) {
        sub2_toggle = "on";
        categoryName = "������û";
    } else if ("0035".equals(v_faqcategory)) {
        sub3_toggle = "on";
        categoryName = "�н�����";
    } else if ("0036".equals(v_faqcategory)) {
        sub4_toggle = "on";
        categoryName = "��";
    } else if ("0072".equals(v_faqcategory)) {
        sub5_toggle = "on";
        categoryName = "�ý���";
    } else {
        full_toggle = "on";
        categoryName = "��ü";
    }


    box.put("title_str", categoryName + " - �����ϴ� ���� - �н����� - ������");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<script type="text/javascript">
//ī�װ��� �´� ����Ʈ �˻�
function changeCategory(aa) {
        document.form1.faqcategory.value = aa;
        $("#p_searchtxt").val("");
        document.form1.action = "/servlet/controller.homepage.HomePageFAQServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
}

function search_enter(e)  {
    if (e.keyCode =='13') {
        searchTxt();
    }
}

/**
 * �˻����뿡 �´� ����Ʈ �������� �̵�
 */
function searchTxt() {
    /*
    if(document.form1.p_searchtxt.value ==""){
        alert("������ �Է��ϼ���");
        return false;

    } else {
        document.form1.action = "/servlet/controller.homepage.HomePageFAQServlet";
        document.form1.p_process.value = "selectList";
        document.form1.submit();
    }
    */
    document.form1.action = "/servlet/controller.homepage.HomePageFAQServlet";
    document.form1.p_process.value = "selectList";
    document.form1.submit();

}

$(function(){
    var
    o = $(".FAQ")
    ,a = o.find("dt a")
    ,c = o.find("dd");
    a.each(function(i){
        $(this).click(function(e){
            e.preventDefault();
            var
            that = $(this);
            obj = c.eq(i);
            if(obj.is(":hidden")){
                obj.show();
                that.addClass("on");
            }else{
                obj.hide();
                that.removeClass("on");
            }
        });
    });
    o.find(".unfold").click(function(e){
        e.preventDefault();
        c.show();
        a.addClass("on");
    });
    o.find(".fold").click(function(e){
        e.preventDefault();
        a.removeClass("on");
        c.hide();
    });
});

</script>
<!-- container-new ���� //-->
<div id="container-new">

    <form name="form1" method="post" action="" onsubmit="return searchTxt">
        <input type="hidden" name="p_process" value="<%= v_process %>" />
        <input type="hidden" name="p_pageno" value="" />
        <input type="hidden" name="p_seq" value="" />
        <input type="hidden" name="p_userid" value="" />
        <input type="hidden" name="faqcategory" value="<%= v_faqcategory %>" />

        <div id="mainMenu">
        <!-- �н����� -->
            <ul class="location">
                <li>Ȩ</li>
                <li>������</li>
                <li> �����ϴ� ���� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                    <ul style="z-index: 1;">
                        <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=HelpHome">�н�����</a></li>
<!--
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">�������� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp">�н�ȯ�� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=mobileApp">����� ��</a></li>
-->
                        <li><a href="/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList" class="active">�����ϴ� ����</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList">��������</a></li>
<!--
                        <li><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=List">��������</a></li>
                        <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome">�̿�ȳ�</a></li>
-->
                    </ul>
                </li>
            </ul>

            <!-- //�н����� -->
<!--
            <div class="introCategory">
                <ul>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=RemoteService">�������� ����</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=selectHelp">�н�ȯ�� ����</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=mobileApp">����� ��</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageFAQServlet?p_process=selectList"><strong><u>FAQ</u></strong></a></li>
                    <li><a href="/servlet/controller.homepage.HomePageQNAServlet?p_process=selectList">��������</a></li>
                    <li><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=List">��������</a></li>
                    <li><a href="/servlet/controller.homepage.HomePageHelpServlet?p_process=SupportHome">�̿�ȳ�</a></li>
                </ul>
            </div>

-->            <!-- //������ο� -->
        </div>
        <!-- //#mainMenu -->

        <!-- ������ ���� ���� -->
        <div id="contents">
        <h2 class="subTit">�����ϴ� ����<!--<img src="/images/2013/support/faq02_title.gif" alt="�����ϴ�����" />//--></h2>

            <div id="subCont" class="FAQ">

                <ul class="tabCus">
                    <li><a href="javascript:changeCategory('ALL')"><img src="/images/2013/support/tabfaq1_<%=full_toggle%>.gif" alt="��ü" /></a></li>
                    <li><a href="javascript:changeCategory('0025')"><img src="/images/2013/support/tabfaq2_<%=sub1_toggle%>.gif" alt="ȸ������ �� Ż��" /></a></li>
                    <li><a href="javascript:changeCategory('0034')"><img src="/images/2013/support/tabfaq3_<%=sub2_toggle%>.gif" alt="������û" /></a></li>
                    <li><a href="javascript:changeCategory('0035')"><img src="/images/2013/support/tabfaq4_<%=sub3_toggle%>.gif" alt="�н�����" /></a></li>
                    <li><a href="javascript:changeCategory('0036')"><img src="/images/2013/support/tabfaq5_<%=sub4_toggle%>.gif" alt="��" /></a></li>
                    <li><a href="javascript:changeCategory('0072')"><img src="/images/2013/support/tabfaq6_<%=sub5_toggle%>.gif" alt="�ý���" /></a></li>
                </ul>
                <h3 class="blind">��ü - ������ġ</h3>
                <!--  ������ �� �˻� -->
                <div class="search">
                    <fieldset>
                        <legend>���� �˻�</legend>
                        <input type="text" name="p_searchtxt" value="<%=v_searchtext %>" title="�˻���" class="keyword" />
                        <input type="image" src="/images/2013/btn/btn_src2.gif" alt="�˻�" class="btn" onclick="javascript:searchTxt();" />
                    </fieldset>
                </div>
                <!--  //������ �� �˻� -->
                <p class="btnR">
                    <a href="#" class="unfold"><img src="/images/2013/btn/btn_all_unfold.gif" alt="��ü ��ġ��" /></a>
                    <a href="#" class="fold"><img src="/images/2013/btn/btn_all_fold.gif" alt="��ü �ݱ�" /></a>
                </p>

                <dl class="faqList">
<%
        if(list.size() != 0){

            int i =0;
            for( i = 0; i < list.size(); i++) {

                DataBox dbox = (DataBox)list.get(i);

                v_title = dbox.getString("d_title");
                v_contents = dbox.getString("d_contents");
                v_totalpage = dbox.getInt("d_totalpage");
                v_rowcount = dbox.getInt("d_rowcount");

                if (!v_searchtext.equals("")) {
                    v_title = StringManager.replace(v_title, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>");
                    v_contents = StringManager.replace(v_contents, v_searchtext, "<font color=\"red\">" + v_searchtext + "</font>");
                }
%>
                        <dt><a href="#"><%= v_title %></a></dt>
                        <dd><%= StringManager.removeHTMLHead(v_contents) %></dd>
<%
            }
        } else {
%>
                    <dt>��ϵ� ������ �����ϴ�.</dt>
<%
        }
%>
                </dl>
            </div>
            <!-- //#subCont -->

    </div>
    </form>
    <!-- ������ ���� �� -->

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>