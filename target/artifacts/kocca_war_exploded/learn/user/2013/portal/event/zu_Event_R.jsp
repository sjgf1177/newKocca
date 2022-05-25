<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "com.credu.homepage.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.library.FormatDate" %>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%
    RequestBox box =(RequestBox)request.getAttribute("requestbox");

	box.put("topmenu","5");
	box.put("submenu","7");

	String vv_email = null;
	String vv_handphone = null;
	
	//EncryptUtil encryptUtil = new EncryptUtil(Constants.APP_KEY, Constants.APP_IV);
	
	vv_email = box.getSession("email");
	vv_handphone = box.getSession("handphone");
	//if(!box.getSession("email").equals("")) vv_email = box.getSession("email");//encryptUtil.decrypt(box.getSession("email"));
    //if(!box.getSession("handphone").equals("")) vv_handphone = encryptUtil.decrypt(box.getSession("handphone"));
    
    String  v_process = box.getString("p_process");
    int     v_pageno = box.getInt("p_pageno");
    
    String s_userid = box.getSession("userid");
    String s_usernm = box.getSession("name");
    String s_email = box.getSession("email");
    String s_handphone = box.getSession("handphone");
    String s_gender  	= box.getSession("gender");
    
    String  v_searchtext = box.getString("p_searchtext");
    String  v_search = box.getString("p_search");
    
    int v_seq = box.getInt("p_seq");

    int    v_cnt = 0;            // ��ȸ��
    String v_gubun = "";           // ��ü����
    String v_startdate = "";           // �˾�����������
    
    String v_enddate = "";           // �˾�����������
    String v_title = "";           // ����
    String v_content = "";           // ����
    String v_date = "";           // �����
    String v_name = "";           // �����
    String v_userid = "";
    String v_isanswer = "";           // �亯�� ���� ����
    String v_apply_yn = "";
    String v_status = "";
    String v_periodyn = "";
    String v_periodtxt = "";

    DataBox dbox =(DataBox)request.getAttribute("selectView");

    if(dbox != null) {
    	
    	v_gubun = dbox.getString("d_gubun");            
        v_startdate = dbox.getString("d_strdate"); 
        v_enddate = dbox.getString("d_enddate");   
        v_title = dbox.getString("d_title");  
        v_content = dbox.getString("d_content");
        v_date = dbox.getString("d_indate");   
        v_name = dbox.getString("d_name");
        v_userid = dbox.getString("d_userid");   
        v_cnt = dbox.getInt("d_cnt");      
        v_isanswer = dbox.getString("d_isanswer");   
        v_apply_yn = dbox.getString("d_apply_yn");
        v_periodyn = dbox.getString("d_periodyn");

    }

    if (v_periodyn.equals("Y")){
        v_periodtxt = "������";
    } else {
        v_periodtxt = "����";
    }
    
    
    box.put("title_str", "�̺�Ʈ - ���ҽ�");

%>
<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<SCRIPT LANGUAGE="JavaScript">
    $(function() {
        $(document.body).css("font-family", "����,Dotum,AppleGothic,sans-serif").css("font-size", "12px");
    });

    function listnotice(){
        document.nform2.p_process.value = "selectList";
        document.nform2.action = "/servlet/controller.homepage.EventHomePageServlet";
        document.nform2.submit();
    }

    function applyEvent() {
        <% if(v_apply_yn.equals("Y")){ %>
             alert("�̹� ��û�ϼ̽��ϴ�.");
        <% } else { %>

        var bRtn = confirm("����Ͻðڽ��ϱ�?");

        if(bRtn) {
	        document.nform2.action="/servlet/controller.homepage.EventHomePageServlet";
	        document.nform2.p_process.value = "insertRequest";
	        document.nform2.submit();
        }
        <% } %>
    }
    

  //���� ����
  function deleteComment(v_commentseq,v_indate) {
  	if(confirm("������ �������  �����Ͻðڽ��ϱ�?")) {
  		document.nform2.p_commentseq.value = v_commentseq;
  		document.nform2.p_commentindate.value = v_indate;
  		document.nform2.action = "/servlet/controller.homepage.EventHomePageServlet";
  		document.nform2.p_process.value = "deleteComment";
  		document.nform2.submit();
  	}
  	else {
  		return;
  	}
  }
  
    //���� ����
    function updateComment(v_commentseq,v_indate) {
  	    if(confirm("������ ������� �����Ͻðڽ��ϱ�?")) {
            document.nform2.p_commentseq.value = v_commentseq;
            document.nform2.p_commentindate.value = v_indate;
            document.nform2.action = "/servlet/controller.homepage.EventHomePageServlet";
            document.nform2.p_process.value = "updateCommentPage";
            document.nform2.submit();
  	    } else {
  		    return;
  	    }
    }

</SCRIPT>
<!-- ��ũ��Ʈ�������� -->
<!-- container-new ���� //-->
<div id="container-new">

<!-- Form ���� ���� -->
<form name="nform2" method="post" action="">
    <input type = "hidden" name = "p_process" >
    <input type = "hidden" name = "p_seq" value="<%=v_seq%>">
    <input type = "hidden" name = "p_pageno" value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_commentseq" value = "">
    <input type = "hidden" name = "p_commentindate" value = "">
    <input type = "hidden" name = "p_pageno" value = "<%=v_pageno %>">
    <input type = "hidden" name = "p_searchtext" value = "<%=v_searchtext %>">
    <input type = "hidden" name = "p_search" value = "<%=v_search %>">
    <input type = "hidden" name = "p_gender" value = "<%=s_gender %>">

    <div id="mainMenu">
        <!-- �¶��� ���� -->
        <ul class="location">
            <li>Ȩ</li>
            <li>���ҽ�</li>
            <li>�̺�Ʈ <a href="#" class="unfold"><img src="/images/2013/btn/btn_menuview.gif" alt="�޴� ����" /></a>
                <ul>
                    <!-- Ȱ��ȭ�� �޴���  class="active" ���� -->
                    <li><a href="/servlet/controller.homepage.HomeNoticeServlet?p_process=List" >��������</a></li>
                    <li><a href="/servlet/controller.homepage.EventHomePageServlet?p_process=selectList" class="active">�̺�Ʈ</a></li>
                    <li><a href="/servlet/controller.homepage.TongBoardServlet?p_process=list" >��ī���� �̾߱�</a></li>
                    <li><a href="/servlet/controller.homepage.CMUBoardServlet?p_process=list" >CMU ���丮</a></li>
                    <!-- 2015-01-09 �������
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage">���� ���ǽ�</a></li>
                    <li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList" class="active">�����ȳ�</a></li>
                    <li><a href="/servlet/controller.homepage.KnowBoardUserServlet?p_process=ListPage">Ŀ�´�Ƽ</a></li>
                    -->
                </ul>
            </li>
        </ul>

        <!-- ������ο� -->
<!-- 2015-01-07 �������
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

    <div class="content">
        <h2 class="subTit">�̺�Ʈ </h2>

        <div id="subCont">
            <h3 class="blind">��ü ������ġ</h3>
            <div class="noticBox">
                ��������ī���̿��� ����Ǵ� �پ��� �̺�Ʈ �ҽ��� ���ص帳�ϴ�.
            </div>
            <div class="article">
                <div class="info">
                    <div style="font-size: 13px;font-weight: bold;"><span><img src="/images/2013/common/<%= v_periodyn.equals("Y")? "event_01.png" : "event_02.png"%>" style="margin-bottom: -3px;"></span>
                    <%= v_title %></div>
                    <div style="padding-top:8px; color : #878787;"><%=FormatDate.getFormatDate(v_startdate, "yyyy.MM.dd")%> ~ <%=FormatDate.getFormatDate(v_enddate, "yyyy.MM.dd")%></div>
                    <!-- <p class="curriculum"></p> //-->
                </div>
                <div class="info2">
<%
/*        if( !fileNm.equals("") ) {
%>
                    
                    <p class="file">
                    <!-- ÷������ ��ġ
                    <a href="/servlet/controller.library.DownloadServlet?p_savefile=<%= saveFileNm %>&p_realfile=<%= fileNm %>"><%= fileNm %></a><input type="hidden" name="p_savefile" value="<%= saveFileNm %>" />
                    //-->
                    </p>
<%
        }
*/
%>
                </div>

                <div class="inner">
                    <%= v_content %>
                </div>

            </div>
            <!-- //article -->

            <div class="btnArea right">
                <a href="javascript:listnotice()();"><img src="/images/2013/btn/btn_list.gif" alt="���" /></a>

            </div>
        <!---------------------------------------------------------------------------------------------------------------------------------------------------//-->
        
       
        </div>
	</div>
</form>

</div>
<!--  //container-new �� //-->
<%@ include file="/learn/user/2013/portal/include/footer.html"%>
