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
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
	if (box == null) box = RequestManager.getBox(request);
	
    ArrayList list2     = null;
    list2 = (ArrayList)request.getAttribute("SulmunCommon");			//�Ϲݼ���

    box.put("title_str", "���� - �¶��� ���ǽ� - ���θ޴�");
%>

<%@ include file="/learn/user/2013/portal/include/header.jsp"%>
<!-- Common �������� -->

<!-- ��ũ��Ʈ�������� -->
<script language="JavaScript" type="text/JavaScript">
<!--


// �Ϲ� ��������
function commonWright(p_subj, p_grcode, p_sulpapernum){
        document.form1.p_subj.value = p_subj;
        document.form1.p_grcode.value = p_grcode;
        document.form1.p_sulpapernum.value = p_sulpapernum;
     
        window.self.name = "winSelectView";
        farwindow = window.open("", "openSubjChange", "toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=no, width = 680, height = 538, top=0, left=0");
        document.form1.target = "openSubjChange";
        document.form1.action = "/servlet/controller.research.SulmunCommonUserServlet";
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
                    
                    <!-- 2015-01-09 ������
                    <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage" class="active">���� ���ǽ�</a></li>
					<li><a href="/servlet/controller.propose.ProposeCourseServlet?p_process=SubjectList">�����ȳ�</a></li>
					<li><a href="#">Ŀ�´�Ƽ</a></li>
                    //-->                    
				</ul>
			</li>
		</ul>
		
		<!-- ������ο� -->
		<div class="introCategory">
			<ul>
                <li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage" >���� ���ǽ�</a></li>
                <li><a href="/servlet/controller.study.FavorOpenClassServlet?p_process=favorOpenClassList" >����</a></li>
                <li><a href="/servlet/controller.research.SulmunSubjUserServlet?p_process=SulmunNew" class="active"><strong>����</strong></a></li>
                <li><a href="/servlet/controller.study.ProposeReviewServlet?p_process=selectReviewList" >�����ı�</a></li>
                <!-- 2015-01-09 �������
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
		<h2 class="subTit">����<!--<img src="/images/2013/online_edu/sulmun_title.gif" alt="���� ���ǽ�" />//--></h2>
		
		<div id="subCont" class="myClass3">

            <!-- 2015-01-09 �������
            <ul class="tabCus">
				<li><a href="/servlet/controller.study.MyClassServlet?p_process=EducationStudyingSubjectPage"><img src="/images/2013/online_edu/myclass_tab_1_off.gif" alt="���� ���ǽ�" /></a></li>
				<li><a href="/servlet/controller.study.MyQnaServlet?p_process=MyQnaCounselListPage"><img src="/images/2013/online_edu/myclass_tab_2_off.gif" alt="��㳻��" /></a></li>
				<li><a href="/servlet/controller.research.SulmunSubjUserServlet?p_process=SulmunNew"><img src="/images/2013/online_edu/myclass_tab_3_on.gif" alt="����" /></a></li>
			</ul>

            //-->
            <h3 class="blind">���� ������ġ</h3>
			
			<div class="board2">
				<table summary="�۹�ȣ, �з�, ����, ����, �ۼ���, ����� ��ȸ�� �����Ǿ��ֽ��ϴ�.">
					<colgroup>
						<col width="5%"/>
						<col width="8%"/>
						<col width="*"/>
						<col width="20%"/>
						<col width="8%"/>
						<col width="10%"/>
					</colgroup>
					<thead>
					<tr>
						<th scope="col"></th>
						<th scope="col">
							<select title="�з�" onchange="change_sul(this.value);">
								<option value='1'>����</option>
								<option selected value='2'>�Ϲ�</option>
							</select>
						</th>
						<th scope="col">��������</th>
						<th scope="col">�����Ⱓ</th>
						<th scope="col">������</th>
						<th scope="col">���ÿ���</th>
					</tr>
					</thead>
					<tbody>
					<%
		       		for(int i = 0; i < list2.size(); i++) {
			    		DataBox dbox2 = (DataBox)list2.get(i);
			    		int v_sulpapernum      =  dbox2.getInt("d_sulpapernum");
			    		String v_sulpapernm    =  dbox2.getString("d_sulpapernm");
			    		String v_sulstart      =  dbox2.getString("d_sulstart");
			    		String v_sulend        =  dbox2.getString("d_sulend");
			    		int v_totcnt           =  dbox2.getInt("d_totcnt");
			    		v_sulstart      = FormatDate.getFormatDate(v_sulstart,"yyyy.MM.dd");
			    		v_sulend        = FormatDate.getFormatDate(v_sulend,"yyyy.MM.dd");
			    		int v_sulresult = dbox2.getInt("d_sulresult");       // �����������
			    		String v_issul  = dbox2.getString("d_issul");        // �������ɿ���      
					%>    
					<tr>
						<td class="first fs"><%= i+ 1 %></td>
						<td class="fs">�Ϲ�</td>
						<td class="left"><%= v_sulpapernm %></td>
						<td><%= v_sulstart %> ~ <%= v_sulend %></td>
						<td><%= v_totcnt %></td>
						<td>
							<%if (v_issul.equals("0")) {%>
								<a href="javascript:commonWright('COMMON', '<%=dbox2.getString("d_grcode")%>', '<%=v_sulpapernum%>')" onfocus="txtlink('b',<%=i+1%>)" onblur="txtlink('b',<%=i+1%>)" tabindex="<%=i+200%>">���ð���</a>
							<%} else { %>
								�Ϸ�
							<% } %>
						</td>
					</tr>
					<%} %>
					<%	if(list2.size() == 0 ){%>
			    	<tr>
			    		<td colspan="6" class="first">�ش��ϴ� �������� �����ϴ�.</td>
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