<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="/tags/KoccaPageUtilTaglib" prefix="pu" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>�ѱ���������ī����</title>

    <!-- Bootstrap / Jquery UI -->
    <link href="/common/js/jquery-ui-1.12.1/jquery-ui.min.css" rel="stylesheet">
    <!--<link href="/common/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.css" rel="stylesheet">-->
    <link href="/common/js/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    
    <script src="/common/js/jquery-3.3.1.min.js"></script>
    <script src="/common/js/jquery-ui-1.12.1/jquery-ui.min.js"></script>
    <!--<script src="/common/js/jquery.mobile-1.4.5/jquery.mobile-1.4.5.min.js"></script>-->
    <script src="/common/js/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    
    
    <!-- Custom CSS -->
    <link href="/common/css/custom.css" rel="stylesheet">
    <link href="/common/css/header.css" rel="stylesheet">
    <link href="/common/css/footer.css" rel="stylesheet">
    
    <!-- Custom JS -->
    <script src="/common/js/custom.js"></script>
    <script type="text/javascript">
	    function go(index) {
	        document.nform1.p_pageno.value = index;
	        document.nform1.action = "/servlet/controller.infomation.GoldClassHomePageServlet";
	        document.nform1.p_process.value = "insertReplyPage";
	        document.nform1.target="_self";
	        document.nform1.submit();
	    }
	
	    //������ ����
	    function goPage(pageNum) {
	        document.nform1.p_pageno.value = pageNum;
	        document.nform1.action = "/servlet/controller.infomation.GoldClassHomePageServlet";
	        document.nform1.p_process.value = "insertReplyPage";
	        document.nform1.target="_self";
	        document.nform1.submit();
	    }
	
	    // �ǰ� ���
	    function insertReply(){
	
	        var bRtn = confirm("�ǰ��� ����Ͻðڽ��ϱ�?");
	
	        if(bRtn){
	            document.nform1.action = "/servlet/controller.infomation.GoldClassHomePageServlet";
	            document.nform1.p_process.value = "insertReply";
	            document.nform1.target="_self";
	            document.nform1.submit();
	        }
	    }
	
	    // �ǰ� ����
	    function deleteReply(num) {
	        var bRtn = confirm("�����Ͻðڽ��ϱ�?");
	
	        if(bRtn){
	            document.nform1.action = "/servlet/controller.infomation.GoldClassHomePageServlet";
	            document.nform1.p_num.value = num;
	            document.nform1.p_process.value = "deleteReply";
	            document.nform1.target="_self";
	            document.nform1.submit();
	        }
	    }
    </script>
</head>
<body>
    <section>
        <div class="wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="subContainer">
                            <div class="sub_section">
                            	<form name="nform1" method="post">
								    <input type="hidden" name="p_process">
								    <input type="hidden" name="p_pageno"  value="${param.p_pageno }" />
								    <input type="hidden" name="p_seq"     value="${param.p_seq }" />
								    <input type="hidden" name="p_num"     value="" />
	                                <div class="sub_contents_header">
	                                    <span>�ǰߴޱ� �� ��õ�ϱ�</span>
	                                </div>
	                                <div class="sub_contents_body">
	                                    <div class="command_box">
	                                        <span>
	                                            <input type="radio" name="p_point" id="ico_star5" value="5">
	                                            <label for="ico_star5"><img src="/common/image/ico_star5.png" alt="5��"></label>
	                                        </span>
	                                        <span>
	                                            <input type="radio" name="p_point" id="ico_star4" value="4">
	                                            <label for="ico_star4"><img src="/common/image/ico_star4.png" alt="4��"></label>
	                                        </span>
	                                        <span>
	                                            <input type="radio" name="p_point" id="ico_star3" value="3">
	                                            <label for="ico_star3"><img src="/common/image/ico_star3.png" alt="3��"></label>
	                                        </span>
	                                        <span>
	                                            <input type="radio" name="p_point" id="ico_star2" value="2">
	                                            <label for="ico_star2"><img src="/common/image/ico_star2.png" alt="2��"></label>
	                                        </span>
	                                        <span>
	                                            <input type="radio" name="p_point" id="ico_star1" value="1">
	                                            <label for="ico_star1"><img src="/common/image/ico_star1.png" alt="1��"></label>
	                                        </span>
	                                        <textarea class="command_textarea" id="p_comment" name="p_comment"></textarea>
	                                        <a href="javascript:insertReply();" class="btn_command">�ǰߵ��</a>
	                                    </div>
	                                </div>
	                                <div class="sub_boarder_body">
	                                    <table class="td_align_left2">
	                                        <colgroup>
	                                            <col width="15%">
	                                            <col width="auto">
	                                            <col width="15%">
	                                            <col width="20%">
	                                        </colgroup>
	                                        <thead>
	                                            <tr>
	                                                <th>�ۼ���</th>
	                                                <th>�ǰ�</th>
	                                                <th>��ȣ��</th>
	                                                <th>�����</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                        	<c:forEach items="${replyList }" var="list" varStatus="status">
	                                        		<tr>
		                                                <td>
		                                                	<c:out value="${list.d_name }" />
		                                                	<c:if test="${sessionScope.userid eq list.d_regid }">
			                                                	<a href="javascript:deleteReply('<c:out value="${list.d_num }" />');" class="command_delete">����</a>
		                                                	</c:if>
		                                                </td>
		                                                <td><c:out value="${list.d_cont }" /></td>
		                                                <td><img src="/common/image/ico_star<c:out value="${list.d_checkpoin }" />.png" alt="<c:out value="${list.d_checkpoin }" />��"></td>
		                                                <td class="gray">
		                                                	<fmt:parseDate value="${list.d_regdt }" var="regdt" pattern="yyyyMMddHHmmss" />
	                                           				<fmt:formatDate value="${regdt }" pattern="yyyy.MM.dd" />
		                                                </td>
		                                            </tr>
		                                            <c:set var="totalpage" value="${list.d_totalpage }" />
	                                        	</c:forEach>
	                                        	<c:if test="${fn:length(replyList) < 1 }">
		                                        	<tr>
		                                                <td colspan="4">��ϵ� ������ �����ϴ�.</td>
		                                            </tr>
		                                            <c:set var="totalpage" value="1" />
	                                        	</c:if>
	                                        </tbody>
	                                    </table>
	                                </div>
	                                <c:set var="pageno" value="${param.p_pageno eq null || param.p_pageno eq ''? 1 : param.p_pageno}" />
									<c:set var="pagesize" value="${param.p_pagesize eq null || param.p_pagesize eq ''? 10 : param.p_pagesize}" />
	                                ${pu:typeB_printPageListDiv(totalpage, pageno, pagesize) }
	                                <div class="popup_btnBox">
	                                    <a href="javascript:self.close();" class="btn_courseCancel">�ݱ�</a>
	                                </div>
	                            </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
