<%@ page contentType = "text/html;charset=euc-kr" %>
<%@ page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "com.credu.library.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page isELIgnored="false" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:include page="/learn/user/typeB/include/topMainAsp.jsp" />


<section>
    <div class="wrapper">
        <div class="container">
            <div class="row">
                <div class="col-12">
                	<jsp:include page="/learn/user/typeB/include_left/left_9.jsp">
                    	<jsp:param value="${param.menuid }" name="left_active"/>
                    </jsp:include>
                    <div class="subContainer">
                        <div class="sub_section">
                            <div class="sub_contents_header">
                                <span>������û�ȳ�</span>
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
                                            <a href="#"><span>������û</span></a>
                                        </li>
                                        <li>
                                            <a href="#"><span>������û�ȳ�</span></a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sub_contents_body">
                                <div class="courseRagistrationGuid">
                                    <span>1.</span><p>�α�����, ������û �޴��� �̵� �մϴ�. �������� Ŭ���ϸ� �����ȳ� �������� �̵��� �˴ϴ�.</p>
                                    <img src="/common/image/online/guide/guide_01.png" alt="" style="border: 1px solid;">
                                    <span>2.</span><p>������ ���� �� �ȳ� ������ �Դϴ�. [������û] ��ư�� Ŭ���Ͽ� ������û�� �մϴ�.</p>
                                    <img src="/common/image/online/guide/guide_02.png" alt="" style="border: 1px solid;">
                                    <span>3.</span><p>������û ȭ�� �Դϴ�. �޴���ȭ �� �̸��� �ּҸ� Ȯ����,[������û] ��ư�� Ŭ���ϸ� ������û�� �Ϸ� �˴ϴ�.</p>
                                    <img src="/common/image/online/guide/guide_03.png" alt="" style="border: 1px solid;">
                                    <span>4.</span><p>������ûȮ��/��� ȭ�� �Դϴ�. ���� ������û ���� ������ Ȯ���� �� ������, ��û�Ⱓ �� ������Ҹ� �� �� �ֽ��ϴ�.</p>
                                    <img src="/common/image/online/guide/guide_04.png" alt="" style="border: 1px solid;">
                                    <span>5.</span><p>�н��Ⱓ�� ���۵Ǹ� [���� ���ǽ�] > [�������ΰ���]���� ������û �Ͻ� ������ �� �� �ֽ��ϴ�. [�н��ϱ�]�� Ŭ���Ͽ� �н��� �����Ͻ� �� �ֽ��ϴ�.(��, �н��� �н������� ���Ŀ��� �����մϴ�.)</p>
                                    <img src="/common/image/online/guide/guide_05.png" alt="" style="border: 1px solid;">
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