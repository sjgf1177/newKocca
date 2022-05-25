<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import="java.util.*" %>
<%@ page import="com.credu.library.*" %>
<%@ page import="com.credu.course.*" %>
<%@ page import="com.credu.library.DataBox" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id="conf" class="com.credu.library.ConfigSet"  scope="page" />

<%
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    //����¡����

    String v_process = box.getString("p_process");

    // �˻�
    String v_searchtext = box.getString("p_searchtext");
    String v_search = box.getString("p_search");

    int pageNo = box.getInt("p_pageno");
    int pageSize = box.getInt("p_pagesize");
    int totalPage = 0;
    int totalRowCount = 0;

    int dispNum = 0;

    pageNo = pageNo == 0 ? 1 : pageNo;
    pageSize = pageSize == 0 ? 10 : pageSize;

    ArrayList literatureSubjectList = (ArrayList)request.getAttribute("literatureSubjectList");  // �ι��� ���� ����Ʈ
    DataBox dbox = null;

    dbox = (DataBox)literatureSubjectList.get(0);

    box.put("title_str", "�޳� �ι��� - �¶��α���");
    
  	//�н�â ���°��� ����
    int ieduurl = 0;
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!-- ��ũ��Ʈ���� -->
<script type="text/javascript">

    $(function(){
        var len = $(".movList2 .btns").length;
        var lyrAll = $(".mvLayer");
        $(".movList2 .btns").each(function(i){
            var that = $(this);
            //ie7 zindex ����
            $(this).css("zIndex",len-i);

            //���ú��� ���̾�
            $(this).find(".chart1").click(function(e){
                e.preventDefault();
                e.stopPropagation();
                var lyr = that.find(".mvLayer");
                var id = that.find(".mvLayer").attr('id');
                if(lyr.is(":hidden")){
                    $.post("/servlet/controller.common.TagServlet",{sqlNum:"subjchasi", type:10, p_subj:id}
                    , function(data) {
                        $("#"+id).empty();
                        $("#"+id).append(data);
                    });
                    lyrAll.hide();
                    lyr.show();
                }else{
                    lyrAll.hide();
                    lyr.hide();
                }
            });
        });
        $(document).click(function(){
            lyrAll.hide();
        });
        $(lyrAll).click(function(e){
            e.stopPropagation();
        });
    });

    function lyr_close(){
        $(".mvLayer").hide();
    }

    // �����˻� ����ó��
    function search_enter(e) {
        if (e.keyCode == "13") {
            subjSearch("", "", "");
        }
    }

    // �����˻�
    function subjSearch(arg1, arg2, arg3) {
        document.form1.p_pageno.value = "1";
        document.form1.p_process.value = "LiteratureSubjectList";
        document.form1.submit();
    }

    /**
     * ���� �� ���� ȭ������ �̵��Ѵ�.
     */
    function fnViewSubjectInfo(subj, subjnm, courseyn, upperclass, upperclassnm, year, subjseq){
        var url = "/servlet/controller.propose.ProposeCourseServlet";
        var param = "?p_process=SubjectPreviewPage&p_rprocess=LiteratureSubjectList&p_subj=" + subj + "&p_year=" + year + "&p_subjseq=" + subjseq;

        location.href = url + param;
    }

    //������
    function whenPreShow(url, subj, d_preheight, d_prewidth) {
        // �α�
        prelog_url = "/servlet/controller.propose.ProposeCourseServlet?p_process=insertPreviewLog&p_subj="+subj;
        open_window("openShow",url,"100","100",d_preheight,d_prewidth,"","","",true,true);
    }

    /**
     * ������û
     */
    function fnApplySubjPropose(subj, year, subjseq, subjnm) {

    	if(<%= box.getSession("userid").length()==0 %>) {
            var frmURL = location.href;
            frmURL = frmURL.replace("http://", "");
            var idx = frmURL.indexOf("/");

            frmURL = frmURL.substr(idx, frmURL.length);

            alert("�α��� ��  �̿����ּ���.");
            location.href = "/learn/user/2013/portal/homepage/zu_MainLogin.jsp?p_frmURL=" + encodeURIComponent( frmURL );
            return;
        }
        
        if(!confirm(subjnm+"������ �н� �Ͻðڽ��ϱ�?")){
         return;
        } else {
        	var new_Open = window.open("", "proposeWindow", "scrollbars=yes,width=10,height=10,resizable=no");
            document.form1.p_process.value = "SubjectEduPropose";
            document.form1.target = "proposeWindow";
            document.form1.p_subj.value = subj;
            document.form1.p_year.value = year;
            document.form1.p_subjseq.value = subjseq;
            document.form1.action = "/servlet/controller.propose.ProposeCourseServlet";
            document.form1.submit();
            document.form1.target = "_self";
        }
    }

    function go(index) {
        document.form1.p_pageno.value = index;
        document.form1.target = "_self";
        document.form1.action = "/servlet/controller.propose.ProposeCourseServlet";
        document.form1.p_process.value = "LiteratureSubjectList";
        document.form1.submit();
    }

    //������ ����
    function goPage(pageNum) {
        document.form1.p_pageno.value = pageNum;
        document.form1.target = "_self";
        document.form1.action = "/servlet/controller.propose.ProposeCourseServlet";
        document.form1.p_process.value = "LiteratureSubjectList";
        document.form1.submit();
    }

 	// �н�â OPEN
    function studyOpen(url, iurl) {
        
        var f = document.form1;

        f.lessonReurl.value = url;
        f.lessonReiurl.value = iurl;
        var s_url = url+"&p_iurl="+iurl;
        
        if (url == '') {
            alert("������ �����ϴ�");
        } else {
            if (iurl == 0){
                open_window('openApp',s_url,0,0,0,0,false,false,false,true,true);
            }else{
                open_window('openApp',s_url,0,0,1024,768,false,false,false,'yes','yes');
            }
        }
 	}
</script>
<!-- ��ũ��Ʈ�������� -->

<!-- container-new ���� //-->
<div id="container-new">

<!-- form ���� -->
<form name="form1" action="/servlet/controller.propose.ProposeCourseServlet" method="get">
    <input type="hidden" id="oProcess" name="p_process" value="" />
    <input type="hidden" id="oPageNo" name="p_pageno" value="<%= pageNo %>" />
    <input type="hidden" id="oPageSize" name="p_pagesize" value="<%= pageSize %>" />
    <input type="hidden" id="oYear" name="p_year" value="" />
    <input type="hidden" id="oSubj" name="p_subj" value="" />
    <input type="hidden" id="oSubjseq" name="p_subjseq" value="" />
    <input type="hidden" id="oSubjnm" name="p_subjnm" value="" />
    <input type="hidden" id="oUpperclass" name="p_upperclass" value="" />
    <input type="hidden" id="oRprocess" name="p_rprocess" value="" />
    <input type="hidden" id="oUpperclassnm" name="p_upperclassnm" value="" />
    <div id="mainMenu">
        <!-- �¶��� ���� -->
        <ul class="location">
            <li>Ȩ</li>
            <li>�¶��� ����</li>
<%
        if ( currDate < 20150304 ) {
%>

            <li>
                �޳��ι��� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul>
                    <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList" >�оߺ�</a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectListJikup" >������</a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=EduSystem" >����ü�赵</a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=LiteratureSubjectList" class="active">�޳��ι���</a></li>

                    <!-- 2015-01-08 ���� ����
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">���� ���ǽ�</a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=EduSystem" class="active">�����ȳ�</a></li>
                    <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage">Ŀ�´�Ƽ</a></li>
                    -->
                </ul>
            </li>
<%
        }
%>
        </ul>
        <!--  ������ �� �˻� -->
        <div class="search">
            <fieldset>
                <legend>���� �˻�</legend>
                <select name="p_search" title="�˻� �з�">
                    <option value="NAME" <%= v_search.equals("NAME") ? "selected" : "" %>>������</option>
<!--                    <option value="CONT" <%=v_search.equals("CONT")?"selected":"" %>>��������</option>-->
                </select>
                <input type="text" name="p_searchtext" value="<%= v_searchtext %>" title="�˻���" class="keyword" onkeypress="search_enter(event);" />
                <input type="image" src="/images/2013/btn/btn_src2.gif" alt="�˻�" class="btn" onclick="javascript:subjSearch('', '', '');" />
            </fieldset>
        </div>

        <!-- ������ο� -->
        <!-- 2015-01-08 ���� ����
        <div class="introCategory">
            <ul>
                <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">���� ���ǽ�</a></li>
                <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=EduSystem"><strong><u>�����ȳ�</u></strong></a></li>
                <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage">Ŀ�´�Ƽ</a></li>
            </ul>
        </div>
        -->
        <!-- //������ο� -->
    </div>

    <!-- ������ ���� ���� -->
    <div id="contents">
        <h2 class="subTit">�޳��ι���<!-- <img src="/images/2013/field_edu/courseguide_title.gif" alt="�޳��ι���" /> //--></h2>
            <div id="subCont">
                <!-- 2015-01-19 2015-01-19 ���� ����
                <ul class="tabCus">
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList"><img src="/images/2013/online_edu/tabcurs4_off.jpg" alt="������ �Ұ�" /></a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectListJikup"><img src="/images/2013/online_edu/tabcurs3_off.jpg" alt="�۾��� �з�" /></a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectListJikmu"><img src="/images/2013/online_edu/tabcurs2_off.jpg" alt="������ �з�" /></a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=EduSystem"><img src="/images/2013/online_edu/tabcurs1_off.jpg" alt="����ü�赵" /></a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=LiteratureSubjectList"><img src="/images/2013/online_edu/tabcurs5_on.jpg" alt="�޳��ι���" /></a></li>
                </ul>
                //-->

                <div class="noticBox">
                    â������缺�� ���弭�� �ѱ�������������� Ư���� �ι��� ������ ���� �����غ�����!
                </div>

                <p class="search_title">�� <em><%= dbox.getInt("d_totalRowCount") %></em>���� �˻������ �ֽ��ϴ�.</p>
                <div class="movList2">
<%
        if(literatureSubjectList.size() != 0){
            for (int i = 0; i < literatureSubjectList.size(); i++) {
                dbox = (DataBox)literatureSubjectList.get(i);
                String propyn = dbox.getString("d_propyn");
                String introducefilenamenew = dbox.getString("d_introducefilenamenew");
                String mobileUseYn = dbox.getString("d_mobile_use_yn");
				String isnewYn = dbox.getString("d_isnew");
				String ishitYn = dbox.getString("d_ishit");

                introducefilenamenew = introducefilenamenew.replaceAll("\\\\", "/");

                if (introducefilenamenew.equals("")) {
                    introducefilenamenew = "/images/2012/common/not_image.gif";
                }

                dispNum = dbox.getInt("d_dispNum");
                totalPage = dbox.getInt("d_totalPage");
                totalRowCount = dbox.getInt("d_totalRowCount");
                
                String eduUrl = dbox.getString("d_eduurl");
                String isoutsourcing = dbox.getString("d_ISOUTSOURCING");
                String cpsubj = dbox.getString("d_CPSUBJ");
                String cpsubjseq = dbox.getString("d_CPSUBJSEQ");
                String contenttype = dbox.getString("d_CPSUBJSEQ");
                String year = dbox.getString("d_scyear");
                String company = dbox.getString("d_company");
                String subj = dbox.getString("d_subj");
                String subjSeq = dbox.getString("d_subjseq");
                
             	// �н�url=������ ���..
                if(eduUrl.equals("")) { ieduurl = 0; }else{ ieduurl = 1; }
             	
                if (isoutsourcing.equals("Y")) {                 //��Ź�����϶�

                	eduUrl = "/servlet/controller.contents.EduStart";
                	eduUrl += "?FIELD1=" + box.getSession("userid") + "&FIELD2=" + year + "&FIELD3=" + cpsubj + "&FIELD4=" + cpsubjseq + "&FIELD99=" + company+"&FIELD100=N"+ "&contenttype=" + contenttype+ "&p_subj=" + subj +"&p_year="+ year +"&p_subjseq="+subjSeq;
                } else {//�ܺΰ����� �ƴѰ��
                     //���� ���� ���.. eduUrl = EduEtc1Bean.make_eduURL(v_subj,v_year,v_subjseq);
                    if (eduUrl.equals("")){
                    	eduUrl = "/servlet/controller.contents.EduStart?p_subj="+subj;
                    }

                    if (!year.equals(""))
                    	eduUrl = eduUrl+"&p_year="+year+"&p_subjseq=";
                    else
                    	eduUrl = eduUrl+"&p_year=2000&p_subjseq=";

                    if(!subjSeq.equals(""))
                    	eduUrl = eduUrl+subjSeq;
                    else eduUrl = eduUrl+"0001";
                    eduUrl +=  "&contenttype=" + contenttype;
                }
%>
                    <dl>
                        <dt>
                            <img src="<%=introducefilenamenew%>" width="126" height="80" alt="<%= dbox.get("d_subjnm")%>" />
                        </dt>
                        <dd class="title">
                            <a href="javascript:fnViewSubjectInfo('<%= dbox.get("d_subj") %>', '<%= dbox.get("d_subjnm") %>', '<%= dbox.get("d_isonoff") %>', '<%= dbox.get("d_upperclass") %>', '<%= dbox.get("d_upperclassnm") %>', '<%= dbox.get("d_year") %>', '<%= dbox.get("d_subjseq") %>')"><%= dbox.get("d_subjnm") %></a>
                            <span class="img_mobile" style="float:right; margin-top:-6px;">
<%
                                if(mobileUseYn.equals("Y")) {
%>
											<img src="/images/2013/online_edu/detail_mbile.png" style="float:right; margin-right:5px;" alt="�����"/>
<%
                                }
%>
<%
                                if(ishitYn.equals("Y")) {
%>
											<img src="/images/2013/online_edu/detail_popular.png" style="float:right; margin-right:5px;" alt="�α�" />
<%
                                }
%>
<%
                                if(isnewYn.equals("Y")) {
%>
											<img src="/images/2013/online_edu/detail_new.png" style="float:right; margin-right:5px;" alt="�ű�" />
<%
                                }
%>
											</span>

                        </dd>
                        <dd class="txt"><%= StringManager.formatTitle(dbox.get("d_intro"),180) %></dd>
                        <dd class="period">��û�Ⱓ <%= dbox.getString("d_propstart") %> ~ <%= dbox.getString("d_propend") %> �����Ⱓ <%= dbox.getString("d_edustart") %> ~ <%= dbox.getString("d_eduend") %></dd>
                        <dd class="btns">
                            <ul>
                                <li><a href="#" class="chart1">���ú���</a></li>

                                <li>
<%
                                if(dbox.getString("d_exist_prop").equals("Y")) {
%>
                                        <a href="javascript:studyOpen( '<%= eduUrl %>', '<%= ieduurl %>');" title="�� ������ ���� �н��� ���� �մϴ�.">�н���</a>
<%
                                } else {
                                    if( propyn.equals("Y") ) {
%>
                                            <a href="javascript:fnApplySubjPropose('<%= dbox.get("d_subj")%>','<%= dbox.get("d_year")%>','<%= dbox.get("d_subjseq")%>','<%= dbox.get("d_subjnm")%>');" class="chart3">�н��ϱ�</a></li>
<%
                                    }
                                }
%>
                            </ul>
                            <!-- ���̾� -->
                            <div class="mvLayer" id="<%= dbox.get("d_subj")%>">
                            </div>
                            <!--// ���̾� -->
                        </dd>
                    </dl>
<%                          }
                        }else{
%>
                    <dl><dd>�˻��� ������ �����ϴ�.</dd></dl>
<%
                        } 
%>
                </div>
                <!--// movList2 -->

                <!-- //board2 -->

                <div class="paging">
                    <%= PageUtil.re2013_printPageListDiv(totalPage, pageNo, 0, pageSize, totalRowCount) %>
                    <%-- PageUtil.printPageSizeList(totalPage, pageNo, 0, pageSize, totalRowCount) --%>
                </div>
                <!-- //paging -->

            </div>
            <!-- //#subCont -->
    </div>
</form>

</div>
<!--  //container-new �� //-->
<%@ include file="/learn/user/2013/portal/include/footer.html"%>
