<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.dunet.common.util.*" %>

<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<%
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    String v_subTit = "";

    String lectureCls = box.getStringDefault("p_lecture_cls","ALL");
    String lectureClsNm = "";

    if(lectureCls.equals("ALL")){
        lectureClsNm = "��ü";
        v_subTit = lectureClsNm;
        
    } else if (lectureCls.equals("OT01")) {
        lectureClsNm = "���Ư��";
        v_subTit = lectureClsNm;

    } else if (lectureCls.equals("OT02")) {
        lectureClsNm = "Ʈ����";
        v_subTit = lectureClsNm;

    } else if (lectureCls.equals("OT03")) {
        lectureClsNm = "��ų���Ͽ�";
        v_subTit = lectureClsNm;

    } else if(lectureCls.equals("OT04")) {
        lectureClsNm = "â������";
        v_subTit = lectureClsNm;

    } else if(lectureCls.equals("OT05")) {
        lectureClsNm = "����Ž��";
        v_subTit = lectureClsNm;

    } else if(lectureCls.equals("OT06")) {
        lectureClsNm = "������Ŭ����";
        v_subTit = lectureClsNm;

    } else if(lectureCls.equals("OT07")) {
        lectureClsNm = "�������λ���Ʈ";
        v_subTit = lectureClsNm;

    } else if(lectureCls.equals("OT08")) {
        lectureClsNm = "�濵/����";
        v_subTit = lectureClsNm;
    
    } else if(lectureCls.equals("OT09")) {
        lectureClsNm = "������";
        v_subTit = lectureClsNm;
    
    } else if(lectureCls.equals("OT10")) {
        lectureClsNm = "�����Ͻ� ��ų";
        v_subTit = lectureClsNm;
    }

    int i = 0;
    int j = 0;

    int totalPage = 0;
    int totalRowCount = 0;
    int pageNo = box.getInt("pageNo");
    int pageSize = box.getInt("pageSize");

 	// �������� �׸��� ���
    ArrayList openClassThemeList = (ArrayList)request.getAttribute("openClassThemeList");
    DataBox openClassThemeCnt = (DataBox)request.getAttribute("openClassThemeCnt");

    String s_grcode = box.getStringDefault("tem_grcode", box.getSession("tem_grcode"));

    String s_userid = box.getSession("userid");

    box.put("title_str", lectureClsNm + ", ��������");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!-- Common �������� -->

<style type="text/css">
    .lecname a{ width:597px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis; }
</style>

<!-- ��ũ��Ʈ�������� -->
<script type="text/javascript">

    /*
    $(function() {
        //���� ������ ���̾�
        var teacher = $(".movList2 .btn_teacher");
        teacher.each(function(){
            var btn = $(this)
            ,lyr = btn.attr("href")
            layerUI({
                btns       : btn //���̾� ���� ��ư
                ,layer     : lyr //���̾�
                ,closeBtn  : ".btn_layerClose" //���̾� ���� �ݱ� ��ư
                ,outCloseBtn  : ".lyrClose" //���̾� �ٱ��� �ݱ� ��ư
                ,evt       : "click" //�̺�Ʈ
                ,autoPosition  : false //�ڵ����� �߾� ��ġ ���� true || false
                ,evtPosition  : false //���콺 ��ġ�� ���� true || false
                ,winResize : false //������ ũ�� �ٲ�� ��ġ �缳�� true || false
                ,blurClose : false //��÷ ������ ������ true || false
                ,toggle : false //��ư�� Ŭ���ϸ� �����ٲ����ٷ� true || false
                ,fn        : function(){
                    $(".movLayer:visible").hide();
                    $(".currentview").removeClass("currentview")
                    btn.addClass("currentview")
                } //�̺�Ʈ �߻��� ����� �Լ�
                ,fn_close    : function(){
                    $(".currentview").removeClass("currentview")
                    .find("img").attr("src",function(){
                        return $(this).attr("src").replace("_on","_off");
                    });
                } //������ ����� �Լ�
            });

        });

    });
    */

    // ��ȭ�� �������� �̵�
    function fnViewContent(seq) {
        var url = "/servlet/controller.infomation.GoldClassHomePageServlet";
        var lectureCls = $("#oLectureCls").val();
        var param = "?p_process=selectView&p_seq=" + seq + "&p_lecture_cls=" + lectureCls;

        location.href = url + param;
    }

    /**
     * ������ �̵�
     */
    function goPage(pageNum) {
        var formObj = document.openClassForm;
        formObj.method = "get";
        formObj.pageNo.value = pageNum;
        formObj.target="_self";
        formObj.action = "/servlet/controller.infomation.GoldClassHomePageServlet";
        formObj.p_process.value = "themeMainPage";
        formObj.submit();
    }

//-->
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- container-new ���� //-->
<div id="container-new">

<!-- Form ���� ���� -->
<form name="openClassForm" method="post" action="">
    <input type="hidden" name="p_process" value="" />
    <input type="hidden" name="pageNo" value="<%= pageNo %>">
    <input type="hidden" id="oLectureCls" name="p_lecture_cls" value="<%= lectureCls %>" />

	<div id="mainMenu">
	<!-- ��ī���� �Ұ� -->
        <ul class="location">
            <li>Ȩ</li>
            <li>���� ����</li>
            <li>
                <%= lectureClsNm %> <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul style="z-index: 1;">
                    <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                    <li><a href="javascript:fnOpenClassThemeList('ALL');" <%= lectureCls.equals("ALL") ? "class=\"active\"" : "" %> >��ü</a></li>
                    <li><a href="javascript:fnOpenClassThemeList('OT01');" <%= lectureCls.equals("OT01") ? "class=\"active\"" : "" %>>���Ư��</a></li>
                    <li><a href="javascript:fnOpenClassThemeList('OT02');" <%= lectureCls.equals("OT02") ? "class=\"active\"" : "" %>>Ʈ����</a></li>
                    <li><a href="javascript:fnOpenClassThemeList('OT03');" <%= lectureCls.equals("OT03") ? "class=\"active\"" : "" %>>��ų���Ͽ�</a></li>
                    <li><a href="javascript:fnOpenClassThemeList('OT04');" <%= lectureCls.equals("OT04") ? "class=\"active\"" : "" %>>â������</a></li>
                    <li><a href="javascript:fnOpenClassThemeList('OT05');" <%= lectureCls.equals("OT05") ? "class=\"active\"" : "" %>>����Ž��</a></li>
                    <li><a href="javascript:fnOpenClassThemeList('OT06');" <%= lectureCls.equals("OT06") ? "class=\"active\"" : "" %>>������Ŭ����</a></li>
                    <li><a href="javascript:fnOpenClassThemeList('OT07');" <%= lectureCls.equals("OT07") ? "class=\"active\"" : "" %>>�������λ���Ʈ</a></li>
                    <li><a href="javascript:fnOpenClassThemeList('OT08');" <%= lectureCls.equals("OT08") ? "class=\"active\"" : "" %>>�濵/����</a></li>
                    <li><a href="javascript:fnOpenClassThemeList('OT09');" <%= lectureCls.equals("OT09") ? "class=\"active\"" : "" %>>������</a></li>
                    <li><a href="javascript:fnOpenClassThemeList('OT10');" <%= lectureCls.equals("OT10") ? "class=\"active\"" : "" %>>�����Ͻ� ��ų</a></li>
                </ul>
            </li>
        </ul>

        <!-- ������ο� -->
        <div class="introCategory">
            <ul>
                <li><a href="javascript:fnOpenClassThemeList('ALL');"><%= lectureCls.equals("ALL") ? "<strong><u>��ü</u></strong>" : "��ü" %> (<%= openClassThemeCnt.getString("d_all_cnt") %>)</a></li>
                <li><a href="javascript:fnOpenClassThemeList('OT01');"><%= lectureCls.equals("OT01") ? "<strong><u>���Ư��</u></strong>" : "���Ư��" %> (<%= openClassThemeCnt.getString("d_ot01_cnt") %>)</a></li>
                <li><a href="javascript:fnOpenClassThemeList('OT02');"><%= lectureCls.equals("OT02") ? "<strong><u>Ʈ����</u></strong>" : "Ʈ����" %></a> (<%= openClassThemeCnt.getString("d_ot02_cnt") %>)</li>
                <li><a href="javascript:fnOpenClassThemeList('OT03');"><%= lectureCls.equals("OT03") ? "<strong><u>��ų���Ͽ�</u></strong>" : "��ų���Ͽ�" %> (<%= openClassThemeCnt.getString("d_ot03_cnt") %>)</a></li>
                <li><a href="javascript:fnOpenClassThemeList('OT04');"><%= lectureCls.equals("OT04") ? "<strong><u>Ī������</u></strong>" : "â������" %> (<%= openClassThemeCnt.getString("d_ot04_cnt") %>)</a></li>
                <li><a href="javascript:fnOpenClassThemeList('OT05');"><%= lectureCls.equals("OT05") ? "<strong><u>����Ž��</u></strong>" : "����Ž��" %> (<%= openClassThemeCnt.getString("d_ot05_cnt") %>)</a></li>
                <li><a href="javascript:fnOpenClassThemeList('OT06');"><%= lectureCls.equals("OT06") ? "<strong><u>������Ŭ����</u></strong>" : "������Ŭ����" %> (<%= openClassThemeCnt.getString("d_ot06_cnt") %>)</a></li>
                <li><a href="javascript:fnOpenClassThemeList('OT07');"><%= lectureCls.equals("OT07") ? "<strong><u>�������λ���Ʈ</u></strong>" : "�������λ���Ʈ" %> (<%= openClassThemeCnt.getString("d_ot07_cnt") %>)</a></li>
                <li><a href="javascript:fnOpenClassThemeList('OT08');"><%= lectureCls.equals("OT08") ? "<strong><u>�濵/����</u></strong>" : "�濵/����" %> (<%= openClassThemeCnt.getString("d_ot08_cnt") %>)</a></li>
                <li><a href="javascript:fnOpenClassThemeList('OT09');"><%= lectureCls.equals("OT09") ? "<strong><u>������</u></strong>" : "������" %> (<%= openClassThemeCnt.getString("d_ot09_cnt") %>)</a></li>
                <li><a href="javascript:fnOpenClassThemeList('OT10');"><%= lectureCls.equals("OT10") ? "<strong><u>�����Ͻ� ��ų</u></strong>" : "�����Ͻ� ��ų" %> (<%= openClassThemeCnt.getString("d_ot10_cnt") %>)</a></li>
            </ul>
        </div>
        
        <!-- //������ο� -->
    </div>

    <!-- ������ ���� ���� -->
    <div id="contents">

        <h2 class="subTit"><%= v_subTit %></h2>
<%
        if ( lectureCls.equals("GC06") || lectureCls.equals("GC07")) {
%>
        <!--
        <div class="noticBox nbox1">
            �������λ���Ʈ / ������Ŭ���� �ȳ������Դϴ�.
        </div>
        //-->
<%
        }
%>
        <div id="subCont">
            <div class="movList2">
<%
        if(openClassThemeList.size() != 0) {

            for(i = 0; i < openClassThemeList.size(); i++) {
                DataBox dbox = (DataBox)openClassThemeList.get(i);

                int bWidth= 597;

                totalPage = dbox.getInt("d_totalPage");
                totalRowCount = dbox.getInt("d_totalRowCount");
                if ( dbox.getString("d_new_yn").equals("Y") ) { bWidth -= 35;}
                if ( dbox.getString("d_recom_yn").equals("Y") ) { bWidth -= 35;}
                if ( dbox.getString("d_hit_yn").equals("Y") ) { bWidth -= 35;}

%>
                        <!-- ����Ʈ ���� ���� -->
        		        <dl style="height:80px">
		                    <dt>
                		        <a href="javascript:fnViewContent('<%= dbox.getString("d_seq") %>');"><img src="<%=StringManager.replace(dbox.getString("d_vodimg"),"\\","/") %>" width="126" height="80" alt="<%=  dbox.getString("d_lecnm") %>" /></a>
        		            </dt>
		                    <dd class="title">
                		        <div class="lecname">
        		                    <a href="javascript:fnViewContent('<%= dbox.getString("d_seq") %>');" style="padding-bottom:8px; width:<%= bWidth %>px;" title="���������� �� ȭ������ �̵��մϴ�."><%=  dbox.getString("d_lecnm") %></a>
		                        </div>

                                <span style="float:right; margin-top:-6px;">
                                    <!--<img src="/images/2013/online_edu/detail_mbile.png" style="float:right; margin-right:5px;" alt="�����" />-->
<%
                if( dbox.getString("d_hit_yn").equals("Y") ) {
%>
                                    <img src="/images/2013/online_edu/detail_popular.png" style="float:right; margin-right:5px;" alt="�α�" />
<%
                }
                if( dbox.getString("d_recom_yn").equals("Y") ) {
%>
                                    <img src="/images/2013/online_edu/detail_recommend.png" style="float:right; margin-right:5px;" alt="��õ" />
<%
                }
                if( dbox.getString("d_new_yn").equals("Y") ) {
%>
                                    <img src="/images/2013/online_edu/detail_new.png" style="float:right; margin-right:5px;" alt="�ű�" />
<%
                }
%>
                        		</span>
		                    </dd>
        		            <dd style="margin-top:10px;"><%=dbox.getString("d_tutornm")%></dd>
                		    <dd class="txt" style="white-space:auto; overflow:hidden; text-overflow:ellipsis;">- <%=dbox.getString("d_intro") %></br>
		                    </dd>

                		</dl>
                        <!-- ����Ʈ ���� �� -->

<%
            }
%>


<%
        } else {
%>
                <dl><dd>��ȸ�� ���°� �����ϴ�.</dd></dl>

<%
        }
%>
            </div>
            <div class="paging">
                <%= PageUtil.re2013_printPageListDiv(totalPage, pageNo, 0, pageSize, totalRowCount) %>
            </div>
        </div>
        <!-- //#subCont -->


    </div>
    <!-- //#contents -->
    <!-- ������ ���� �� -->

</form>

</div>
<!--  //container-new �� //-->
<%@ include file="/learn/user/2013/portal/include/footer.html"%>
