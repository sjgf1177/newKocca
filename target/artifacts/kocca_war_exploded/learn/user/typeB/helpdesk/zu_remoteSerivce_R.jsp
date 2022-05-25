<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<jsp:include page="/learn/user/typeB/include/topMainAsp.jsp" />

<section>
    <div class="wrapper">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <jsp:include page="/learn/user/typeB/include_left/left_4.jsp">
                    	<jsp:param value="${param.menuid }" name="left_active"/>
                    </jsp:include>
                    <div class="subContainer">
                        <div class="sub_section">
                            <div class="sub_contents_header">
                                <span>������������</span>
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
                                            <a href="#"><span>�н���������</span></a>
                                        </li>
                                        <li>
                                            <a href="#"><span>������������</span></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sub_contents_body">
                                <div class="sub_boarder_body">
                                    <img src="/common/image/500090_01.gif" alt="�������� �ȳ� Ÿ��Ʋ">
                                    <img src="/common/image/500090_02.gif" alt="�������� �ȳ� �̹��� 1">
                                    <a href="http://helpu.kr/edukocca" target="_blank"><img src="/common/image/500090_03.gif" alt="�������� �ȳ� �̹���2"></a>
                                    <img src="/common/image/500090_04.gif" alt="�������� �ȳ� �̹���3">
                                    <img src="/common/image/500090_05.gif" alt="�������� �ȳ� �̹���4">
                                </div>
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