<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.course.*" %>
<%@ page import = "com.credu.library.DataBox" %>
<%@ page import = "java.util.ArrayList" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    int row= Integer.parseInt(conf.getProperty("page.bulletin.row"));
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    //����¡����

    String v_process = box.getString("p_process");

    // �˻�
    String v_searchtext = box.getString("p_searchtext");
    String v_search = box.getString("p_search");

    int v_pageno = box.getInt("p_pageno");
    int v_dispnum = 0;           // �ѰԽù���
    int v_totalpage = 0;           // �Խù�����������
    int v_rowcount = 0;
    String  v_position  = "";

    String v_gubun_1 = box.getStringDefault("p_gubun_1","A");
    String v_gubun_2 = box.getStringDefault("p_gubun_2","A");
    String v_gubun_3 = box.getStringDefault("p_gubun_3","A");
    String p_action = box.get("p_action");

    String v_gubunnm_1 = "";

    if(v_gubun_1.equals("B0")){v_gubunnm_1="��ۿ���";}
    else if(v_gubun_1.equals("G0")){v_gubunnm_1="����";}
    else if(v_gubun_1.equals("K0")){v_gubunnm_1="��ȭ�ִ�ĳ����";}
    else if(v_gubun_1.equals("M0")){v_gubunnm_1="���ǰ���";}
    else{                           v_gubunnm_1="��ü";}

    ArrayList subjList = (ArrayList)request.getAttribute("SubjectList");  // ���� ����Ʈ
    ArrayList gubun_1 = (ArrayList)request.getAttribute("Subjhomegubun_1");  //���� ���� 1
    ArrayList gubun_2 = (ArrayList)request.getAttribute("Subjhomegubun_2");  //���� ���� 2
    ArrayList gubun_3 = (ArrayList)request.getAttribute("Subjhomegubun_3");  //���� ���� 2

    box.put("title_str", "�оߺ� - �¶��α���");
    
    //�н�â ���°��� ����
    int ieduurl = 0;
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!-- ��ũ��Ʈ���� -->
<script type="text/JavaScript">

    var gSubjId = null;

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
                gSubjId = id;
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
        var targetObj = $("#" + gSubjId);
        targetObj.parent().parent().parent().find("a").eq(0).focus();
    
        $(".mvLayer").hide();
    }

    // �����˻� ����ó��
    function search_enter(e)  {
        if (e.keyCode =='13'){  subjSearch("<%=v_gubun_1 %>","<%=v_gubun_2 %>","<%=v_gubun_3 %>");  }
    }

    // �����˻�
    function subjSearch(p_gubun_1, p_gubun_2, p_gubun_3) {
        document.form1.p_pageno.value = "1";
        document.form1.p_gubun_1.value = p_gubun_1;
        document.form1.p_gubun_2.value = p_gubun_2;
        document.form1.p_gubun_3.value = p_gubun_3;
        document.form1.p_process.value = "SubjectList";
        document.form1.submit();
    }

    function subjSearch2(change_gubun, p_gubun_1, p_gubun_2, p_gubun_3) {
        if(change_gubun == "1"){
            p_gubun_2 = "A";
            p_gubun_3 = "A";
            subjSearch(p_gubun_1, p_gubun_2, p_gubun_3);
        }
        if(change_gubun == "2"){
            p_gubun_3 = "A";
            subjSearch(p_gubun_1, p_gubun_2, p_gubun_3);
        }
    }

    /**
     * ���� �� ���� ȭ������ �̵��Ѵ�.
     */
    function fnViewSubjectInfo(subj,subjnm,courseyn,upperclass,upperclassnm, year, subjseq){
        var url = "/servlet/controller.propose.ProposeCourseServlet";
        var param = "?p_process=SubjectPreviewPage&p_rprocess=SubjectList&p_subj=" + subj + "&p_year=" + year + "&p_subjseq=" + subjseq;

        location.href = url + param;
    /* //20141008
        document.form1.p_subj.value = subj;
        document.form1.p_subjnm.value = subjnm;
        document.form1.p_iscourseYn.value = courseyn;
        //document.form1.p_upperclass.value = upperclass;
        document.form1.p_upperclassnm.value = upperclassnm;
        document.form1.p_year.value = year;
        document.form1.p_subjseq.value = subjseq;
        document.form1.p_process.value = "SubjectPreviewPage";
        document.form1.p_rprocess.value = "SubjectList";
        document.form1.method = "get";
        document.form1.action = "/servlet/controller.propose.ProposeCourseServlet";
        document.form1.target = "_self";
        document.form1.submit();
    */
    }

    //������
    function whenPreShow(url, subj, d_preheight, d_prewidth) {
        // �α�
        prelog_url = "/servlet/controller.propose.ProposeCourseServlet?p_process=insertPreviewLog&p_subj="+subj;
        open_window("openShow",url,"100","100",d_preheight,d_prewidth,"","","",true,true);
    }

    //������û
    function whenSubjPropose(subj,year,subjseq, subjnm, billYn) {

        if(<%= box.getSession("userid").length()==0 %>) {
            var frmURL = location.href;
            frmURL = frmURL.replace("http://", "");
            var idx = frmURL.indexOf("/");

            frmURL = frmURL.substr(idx, frmURL.length);

            alert("�α��� ��  �̿����ּ���.");
            location.href = "/learn/user/2013/portal/homepage/zu_MainLogin.jsp?p_frmURL=" + encodeURIComponent( frmURL );
            return;
        }

        var confirmMsg = subjnm + " ������ �н� �Ͻðڽ��ϱ�?"

        if ( subj == "CK15002" ) {
            confirmMsg = "�� �� ������ [�ѱ��缺���������] �������� �����޾� ��Ǵ� �������� �������� �߱޵��� �ʽ��ϴ�.\n\n �����ð����� �����Ǵ� ������ ���ϴ� ��쿡�� [�ѱ��缺���������(egenedu.kigepe.or.kr/)]���� ��û�Ͻñ� �ٶ��ϴ�.\n\n" + confirmMsg;
        }

        if(!confirm(confirmMsg)){
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
        document.form1.p_gubun_1.value = "<%=v_gubun_1%>";
        document.form1.p_gubun_2.value = "<%=v_gubun_2%>";
        document.form1.p_gubun_3.value = "<%=v_gubun_3%>";
        document.form1.p_pageno.value = index;
        document.form1.target  =   "_self";
        document.form1.action = "/servlet/controller.propose.ProposeCourseServlet";
        document.form1.p_process.value = "SubjectList";
        document.form1.submit();
    }

    //������ ����
    function goPage(pageNum) {
        document.form1.p_gubun_1.value = "<%=v_gubun_1%>";
        document.form1.p_gubun_2.value = "<%=v_gubun_2%>";
        document.form1.p_gubun_3.value = "<%=v_gubun_3%>";
        document.form1.p_pageno.value = pageNum;
        document.form1.target  =   "_self";
        document.form1.action = "/servlet/controller.propose.ProposeCourseServlet";
        document.form1.p_process.value = "SubjectList";
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
<form name="form1" action="/servlet/controller.propose.ProposeCourseServlet" method="post">
    <input type="hidden" name="p_process"   value="<%=box.get("p_process")%>">
    <input type="hidden" name="p_year"  value="">
    <input type="hidden" name="p_subj"  value="">
    <input type="hidden" name="p_subjseq"   value="">
    <input type="hidden" name="p_subjnm"    value="">
    <input type="hidden" name="p_iscourseYn"    value="">
    <input type="hidden" name="p_upperclassnm"  value="">
    <input type="hidden" name="p_action"    value="<%=p_action%>">
    <input type="hidden" name="p_pageno"    value="<%=v_pageno%>">
    <input type="hidden" name="p_rprocess"  value="">
    <input type="hidden" name="p_upperclassnm"  value="">
    <input type="hidden" name="p_topuserid" value="">
    <input type="hidden" name="p_toppwd"    value="">
    <input type="hidden" name="p_gubun_1"       value="<%=v_gubun_1%>"/>
    <input type="hidden" name="p_gubun_2"       value="<%=v_gubun_2%>"/>
    <input type="hidden" name="p_gubun_3"       value="<%=v_gubun_3%>"/>
    <input type="hidden" name="lessonReurl" value="" />
    <input type="hidden" name="lessonReiurl" value="" />
    <div id="mainMenu">
        <!-- �¶��� ���� -->
        <ul class="location">
            <li>Ȩ</li>
            <li>�¶��� ����</li>
            <li>
                �оߺ� <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul>
                    <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList" class="active">�оߺ�</a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectListJikup" >������</a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=EduSystem" >����ü�赵</a></li>
<%
        if ( currDate < 20160401 ) {
%>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=LiteratureSubjectList" >�޳��ι���</a></li>
<%
        }
%>

<!--
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">���� ���ǽ�</a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=EduSystem" class="active">�����ȳ�</a></li>
                    <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage">Ŀ�´�Ƽ</a></li>
-->
                </ul>
            </li>
        </ul>

        <!--  ������ �� �˻� -->
        <div class="search">
            <fieldset>
                <legend>���� �˻�</legend>
                <select name="p_search" title="�˻� �з�">
                    <option value="NAME" <%=v_search.equals("NAME")?"selected":"" %>>������</option>
<!--                    <option value="CONT" <%=v_search.equals("CONT")?"selected":"" %>>��������</option>-->
                </select>
                <input type="text" name="p_searchtext" value="<%=v_searchtext %>" title="�˻���" class="keyword" onkeypress="search_enter(event);" />
                <input type="image" src="/images/2013/btn/btn_src2.gif" alt="�˻�" class="btn" onclick="javascript:subjSearch('<%=v_gubun_1 %>','<%=v_gubun_2 %>','<%=v_gubun_3 %>');" />
            </fieldset>
        </div>

        <!-- ������ο� -->
<!--2015-01-07 �������
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
        <h2 class="subTit">�оߺ�<!--<img src="/images/2013/online_edu/course_guide_title.gif" alt="�оߺ�" />//--></h2>
            <div id="subCont">
<!--
                <ul class="tabCus">
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList"><img src="/images/2013/online_edu/tabcurs4_on.jpg" alt="������ �Ұ�" /></a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectListJikup"><img src="/images/2013/online_edu/tabcurs3_off.jpg" alt="�۾��� �з�" /></a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectListJikmu"><img src="/images/2013/online_edu/tabcurs2_off.jpg" alt="������ �з�" /></a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=EduSystem"><img src="/images/2013/online_edu/tabcurs1_off.jpg" alt="����ü�赵" /></a></li>
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
                    �¶��� ��ü������ ���γ����� Ȯ�� �Ͻ� �� �ֽ��ϴ�.<br/>
                    ������ ������ <img src="/images/2013/online_edu/detail_mbile.png" alt="�����" style="vertical-align: middle;"/> ǥ�ð� �ִ� ������ <strong>����� ��</strong>�� �̿��Ͽ� �н� �Ͻ� �� �ֽ��ϴ�.
                    <p style="padding-top:8px;"><a href="/servlet/controller.library.DownloadServlet?p_savefile=/upload/subject/kocca_2015_subject_list.xlsx&p_realfile=�ѱ���������ī����_2015��_���԰���_����Ʈ.xlsx" target="_blank"><img src="/images/2013/online_edu/kocca_subject_list_download.jpg" alt="�ѱ���������ī���� 2014�� ���԰��� ����Ʈ �����ޱ�" /></a></p>
                </div>


                <div class="selectBox">
                    <div class="mtstepWrap">
                        <p class="steptit"><img src="/images/2013/online_edu/tit_step1.gif" alt="�о߸� ������ �ּ���" /></p>
                        <div class="scroll">
                            <ul>
                                <%
                                    if(gubun_1.size() != 0){
                                        for (int i=0; i<gubun_1.size(); i++) {
                                            DataBox dbox_1 = (DataBox)gubun_1.get(i);
                                            String code_1 = dbox_1.getString("d_code");
                                            String codenm_1 = dbox_1.getString("d_codenm");

                                %>
                                            <li><a href="javascript:subjSearch2('1','<%=code_1 %>','<%=v_gubun_2 %>','<%=v_gubun_3 %>');" <%=v_gubun_1.equals(code_1)?"class='active'":"" %>><%=codenm_1 %></a></li>
                                <%      }
                                    }
                                %>
                            </ul>
                        </div>
                    </div>

                    <div class="mtstepWrap">
                        <p class="steptit"><img src="/images/2013/online_edu/tit_step2_br.gif" alt="�з��� ������ �ּ���" /></p>
                        <div class="scroll" tabindex="0">
                            <ul>
                                <%
                                    if(gubun_2.size() != 0){
                                %>
                                        <li><a href="javascript:subjSearch('<%=v_gubun_1 %>','A','A');" <%=v_gubun_2.equals("A")?"class='active'":"" %>>��ü</a></li>
                                <%
                                        for (int i=0; i<gubun_2.size(); i++) {
                                            DataBox dbox_2 = (DataBox)gubun_2.get(i);
                                            String code_2 = dbox_2.getString("d_code");
                                            String codenm_2 = dbox_2.getString("d_codenm");

                                %>
                                            <li><a href="javascript:subjSearch2('2','<%=v_gubun_1 %>','<%=code_2 %>','<%=v_gubun_3 %>');" <%=v_gubun_2.equals(code_2)?"class='active'":"" %>><%=codenm_2 %></a></li>
                                <%      }
                                    }else{
                                %>
                                        <li>&nbsp;</li>
                                        <li>&nbsp;</li>
                                        <li>&nbsp;</li>
                                        <li style="text-align: center;"><a><strong>�о�</strong>�� ������ �ּ���.</a></li>
                                <%
                                    }
                                %>
                            </ul>
                        </div>
                    </div>

                    <div class="mtstepWrap">
                        <p class="steptit"><img src="/images/2013/online_edu/tit_step3.gif" alt="������ ������ �ּ���" /></p>
                        <div class="scroll" tabindex="0">
                            <ul>
                                <%
                                    if(gubun_3.size() != 0){
                                %>
                                        <li><a href="javascript:subjSearch('<%=v_gubun_1 %>','<%=v_gubun_2 %>','A');" <%=v_gubun_3.equals("A")?"class='active'":"" %>>��ü</a></li>
                                <%
                                        for (int i=0; i<gubun_3.size(); i++) {
                                            DataBox dbox_3 = (DataBox)gubun_3.get(i);
                                            String code_3 = dbox_3.getString("d_code");
                                            String codenm_3 = dbox_3.getString("d_codenm");

                                %>
                                            <li><a href="javascript:subjSearch('<%=v_gubun_1 %>','<%=v_gubun_2 %>','<%=code_3 %>');" <%=v_gubun_3.equals(code_3)?"class='active'":"" %>><%=codenm_3 %></a></li>
                                <%      }
                                    }else{
                                %>
                                        <li>&nbsp;</li>
                                        <li>&nbsp;</li>
                                        <li>&nbsp;</li>
                                        <li style="text-align: center;"><a><strong>�з�</strong>�� ������ �ּ���.</a></li>
                                <%
                                    }
                                %>
                            </ul>
                        </div>
                    </div>
                </div>

                <p class="search_title"><strong><%= v_gubunnm_1 %></strong>�� ���� �� <em><%= box.get("d_totalcount") %></em>���� �˻������ �ֽ��ϴ�.</p>
                <div class="movList2">
                    <%
                        if(subjList.size() != 0){
                            for (int i=0; i<subjList.size(); i++) {
                                DataBox dbox = (DataBox)subjList.get(i);
                                String propyn = dbox.getString("d_propyn");
                                String imgurl = dbox.getString("d_introducefilenamenew");
                                String mobileUseYn = dbox.getString("d_mobile_use_yn");
								String isnewYn = dbox.getString("d_isnew");
								String ishitYn = dbox.getString("d_ishit");
								imgurl = imgurl.replaceAll("\\\\", "/");

                                if (imgurl.equals("")) {
                                    imgurl = "/images/2012/common/not_image.gif";
                                }

                                v_dispnum        = dbox.getInt("d_dispnum");
                                v_totalpage      = dbox.getInt("d_totalpage");
                                v_rowcount       = dbox.getInt("d_rowcount");
                                v_position       = dbox.getString("d_position");
                                
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
                            <img src="<%=imgurl%>" width="126" height="80" alt="<%=dbox.get("d_subjnm")%>" />
<!--                            <span class="btn_threeWrap">-->
<!--                                <span class="btn_three1"><a href="#"> ���� ������ : <%=dbox.get("d_sul_avg") %></a></span>-->
<!--                            </span>-->
                        </dt>
                        <dd class="title"><a href="javascript:fnViewSubjectInfo('<%=dbox.get("d_subj")%>',
                                                                    '<%=dbox.get("d_subjnm")%>',
                                                                    '<%=dbox.get("d_isonoff")%>',
                                                                    '<%=dbox.get("d_scupperclass")%>',
                                                                    '<%=dbox.get("d_uclassnm")%>',
                                                                    '<%=dbox.get("d_scyear")%>',
                                                                    '<%=dbox.get("d_subjseq")%>')"><%=dbox.get("d_subjnm")%></a>
                                            <span class="img_mobile" style="float:right; margin-top:-6px;">
<%
                                if(mobileUseYn.equals("Y")) {
%>
                                            <img src="/images/2013/online_edu/detail_mbile.png" style="float:right; margin-right:5px; margin-top:2px;"  alt="�����"/>
<%
                                }
%>
<%
                                if(ishitYn.equals("Y")) {
%>
                                            <img src="/images/2013/online_edu/detail_popular.png" style="float:right; margin-right:5px; margin-top:2px;" alt="�α�" />
<%
                                }
%>
<%
                                if(isnewYn.equals("Y")) {
%>
                                            <img src="/images/2013/online_edu/detail_new.png" style="float:right; margin-right:5px; margin-top:2px;" alt="�ű�" />
<%
                                }
%>
											</span>

                        </dd>
                        <dd class="txt"><%=StringManager.formatTitle(dbox.get("d_intro"),180) %></dd>

                        <dd class="btns">
                            <ul>
                                <li><a href="#" class="chart1">���ú���</a></li>
                                <li>
                                    <!-- ���̾� -->
                                    <div class="mvLayer" id="<%=dbox.get("d_subj")%>" tabindex="0">
                                    </div>
                                    <!--// ���̾� -->
                                </li>

                                <li>
<%
                                if(dbox.getBoolean("d_existpropose")) {
%>
                                        <a href="javascript:studyOpen( '<%= eduUrl %>', '<%= ieduurl %>');" title="�� ������ ���� �н��� ���� �մϴ�.">�н���</a>
<%
                                } else {
                                    if( propyn.equals("Y") ) {
%>
                                            <a href="javascript:whenSubjPropose('<%=dbox.get("d_subj")%>','<%=dbox.get("d_scyear")%>','<%=dbox.get("d_subjseq")%>','<%=dbox.get("d_subjnm")%>');" class="chart3">�н��ϱ�</a></li>
<%
                                    }
                                }
%>
                            </ul>
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
                    <%=PageUtil.re2013_printPageListDiv(v_totalpage, v_pageno, 0, 10, v_rowcount) %>
                </div>
                <!-- //paging -->

            </div>
            <!-- //#subCont -->
    </div>
</form>

</div>
<!--  //container-new �� //-->

<%@ include file="/learn/user/2013/portal/include/footer.html"%>