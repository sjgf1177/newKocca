<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<jsp:include page="/learn/user/typeB/include/topMainAsp.jsp" />

<section>
    <div class="wrapper">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="lnb_wrap">
                        <span class="lnb_header">�̿�ȳ�</span>
                        <ul class="lnb_con">
                            <li <c:if test="${param.p_code eq 'FOOTER_PRIVACY_TYPEB' }"> class="on"</c:if>><a href="http://www.kocca.kr/cop/contents.do?menuNo=200931" target="_blank">��������ó����ħ</a></li>
                            <li <c:if test="${param.p_code eq 'FOOTER_EMAIL_TYPEB' }"> class="on"</c:if>><a href="javascript:menuMainForward('99', '/servlet/controller.homepage.HomePageHelpServlet?p_process=Footer&p_code=FOOTER_EMAIL_TYPEB');">�̸��� ���ܼ��� �ź�</a></li>
                        </ul>
                    </div>
                    <div class="subContainer">
                        <div class="sub_section">
                            <div class="sub_contents_header">
                                <span>��������ó����ħ</span>
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
                                            <a href="#"><span>�̿�ȳ�</span></a>
                                        </li>
                                        <li>
                                        	<c:if test="${param.p_code eq 'FOOTER_PRIVACY_TYPEB' }"><a href="#"><span>��������ó����ħ</span></a></c:if>
                                            <c:if test="${param.p_code eq 'FOOTER_EMAIL_TYPEB' }"><a href="#"><span>�̸��� ���ܼ��� �ź�</span></a></c:if>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sub_contents_body">
                            	${selectView.d_content }
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