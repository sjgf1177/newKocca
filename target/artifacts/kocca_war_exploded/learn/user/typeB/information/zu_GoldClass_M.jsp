<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="/tags/KoccaPageUtilTaglib" prefix="pu" %>
<%@ page isELIgnored="false" %>
<jsp:include page="/learn/user/typeB/include/topMainAsp.jsp" />
<c:set var="pageno" value="${param.pageNo eq null || param.pageNo eq ''? 1 : param.pageNo}" />
<c:set var="pagesize" value="${param.p_pagesize eq null || param.p_pagesize eq ''? 10 : param.p_pagesize}" />

<script type="text/javascript">
function openGoldClass(seq,w,h) {
    if (w.length>0) {
        window.open("", "ViewVod", "top=0, left=0, width="+w+", height="+h+", status=no, resizable=no");

    } else {
        window.open("", "ViewVod", "top=0, left=0, width=1008, height=570, status=no, resizable=no");
    }
    document.form1.action="/servlet/controller.infomation.GoldClassHomePageServlet";
    document.form1.p_process.value = "popUpVod";
    document.form1.p_seq.value = seq;
    document.form1.target="ViewVod";
    document.form1.submit();
    document.form1.target="_self";
}

//��ȭ�� �������� �̵�
function viewContent(seq) {
    document.form1.p_prePage.value = "Main";
    document.form1.action = "/servlet/controller.infomation.GoldClassHomePageServlet";
    document.form1.target="_self";
    document.form1.p_process.value = "selectView";
    document.form1.p_seq.value = seq;
    document.form1.submit();
}


//������ �̵�
function goPage(pageNum) {
     document.form1.pageNo.value = pageNum;
     document.form1.target="_self";
     document.form1.action = "/servlet/controller.infomation.GoldClassHomePageServlet";
     document.form1.p_process.value = "mainPage";
     document.form1.submit();
}

function goReply(seq) {

    window.open("about:blank", "replyList", "top=0, left=0, width=637, height=530, status=no, resizable=no");

    document.form1.action="/servlet/controller.infomation.GoldClassHomePageServlet";
    document.form1.p_process.value = "insertReplyPage";
    document.form1.p_seq.value = seq;
    document.form1.target="replyList";
    document.form1.submit();

    document.form1.target="_self";
}

function fnSelect(){
	document.form1.action="/servlet/controller.infomation.GoldClassHomePageServlet";
    document.form1.p_process.value = "mainPage";
    document.form1.pageNo.value = "1";
    document.form1.submit();
}
</script>
<section>
	<div class="wrapper">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<jsp:include page="/learn/user/typeB/include_left/left_5.jsp">
                    	<jsp:param value="${param.menuid }" name="left_active"/>
                    </jsp:include>
					<div class="subContainer">
						<div class="sub_section">
							<div class="sub_contents_header">
								<span>��������</span>
                                <div class="linemap_wrap">
                                    <ul>
                                        <li>
                                            <a href="#">
                                                <span>
                                                    <img src="/common/image/home_icon.png" alt="����">
                                                </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#"><span>��������</span></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sub_contents_body">
                            	<div class="sub_board_header">
                                    <div class="list_title">
                                        <span><span>��</span>�������´� ����� �����Ǵ� �������·� ��̿� ���̰� �Բ� �����մϴ�.</span>
                                        <span><span>��</span>�Ǹ��� ����� ���¸� �������� �� ������, ������ ������ �� �ִ� ���� ���������Դϴ�.</span>
                                    </div>
	                                <div class="board_search_box">
		                                <form name="form1" method="post">
									    <input type="hidden" name="p_process"   value="" />
									    <input type="hidden" name="p_seq"       value="" />
									    <input type="hidden" name="p_prePage"   value="" />
									    <input type="hidden" name="pageNo"	value="<c:out value="${param.pageNo }" />"/>
										<input type="hidden" name="p_pagesize"  value="<c:out value="${param.p_pagesize }" />"/>
									    <input type="hidden" name="p_lecture_cls" value="<c:out value="${param.p_lecture_cls eq '' || param.p_lecture_cls eq null? 'ALL' : param.p_lecture_cls}" />" />
									    <input type="hidden" name="gubun" value="${param.gubun }" />
									    <input type="hidden" name="menuid" value="${param.menuid }" />
										<input type="text" name="p_searchtext" id="p_searchtext" class="board_search" value="<c:out value="${param.p_searchtext }" />" title="�˻�� �Է����ּ���" onkeypress="if(event.keyCode==13) {javascript:fnSelect()(); return false;}">
										<input type="button" class="btn_board_search" value="" onclick="javascript:fnSelect();">
										</form>
	                                </div>
                                </div>
                                <div class="sub_thumb_body">
                                	<c:forEach items="${openClassList }" var="list" varStatus="status">
                                		<div class="thumb_box">
	                                        <div class="thumb_imgBox">
	                                            <img src="<c:out value="${list.d_vodimg }" />" alt="<c:out value="${list.d_lecnm }" />">
	                                        </div>
	                                        <div class="thumb_con">
	                                            <a href="javascript:viewContent('<c:out value="${list.d_seq }" />');"><span class="thumb_title"><c:out value="${list.d_lecnm }" /></span></a>
	                                            <ul class="thumb_con_Info">
	                                                <li><span>�����</span> : <c:out value="${list.d_tutornm }" /></li>
	                                                <li><span>���� �ð�</span> : <c:out value="${list.d_lectime }" /></li>
	                                                <li><span>��ȸ��</span> : <c:out value="${list.d_viewcnt }" /></li>
	                                                <li><span>��</span> : 
	                                                	<c:forEach begin="1" end="${list.d_checkpoin }" step="1">
	                                                		<img src="/common/image/ico_star_on.png" alt="����">
	                                                	</c:forEach>
	                                                	<c:forEach begin="${list.d_checkpoin + 1 }" end="5" step="1">
		                                                    <img src="/common/image/ico_star_off.png" alt="����">
	                                                	</c:forEach>
	                                                </li>
	                                            </ul>
	                                            <div class="thumb_button">
	                                                <a href="javascript:openGoldClass('<c:out value="${list.d_seq }" />', '<c:out value="${list.d_d_width_s }" />','<c:out value="${list.d_height_s }" />');" class="apply_btn" style="margin-top:15px;">���º���</a>
	                                                <a href="javascript:goReply('<c:out value="${list.d_seq }" />');" class="command_btn" style="margin-top:15px;">�ǰߴޱ�</a>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <c:set var="totalpage" value="${list.d_totalpage }" />
                                	</c:forEach>
                                	<c:if test="${fn:length(openClassList) <= 0 }">
                                		<div class="thumb_box">
                                			��ϵ� �������� ������ �����ϴ�.
                                		</div>
                                		<c:set var="totalpage" value="0" />
                                	</c:if>
                                </div>
                                ${pu:typeB_printPageListDiv(totalpage, pageno, pagesize) }
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- footer -->
<jsp:include page="/learn/user/typeB/include/newFooterB.jsp" />
<!-- footer -->
</body>
</html>