<%
//**********************************************************
//  1. ��      ��: SUBJECT PREVIEW PAGE
//  2. ���α׷���: gu_SubjectPreviewOn.jsp
//  3. ��      ��: �����ȳ�
//  4. ȯ      ��: JDK 1.3
//  5. ��      ��: 1.0
//  6. ��      ��: 2004. 01.12
//  7. ��      ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ page import = "com.credu.common.*" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />
<jsp:useBean id = "memberBean" class = "com.credu.system.MemberAdminBean"  scope = "page" />
<jsp:useBean id = "code" class = "com.credu.system.CodeConfigBean"  scope = "page" />
<%
    //DEFINED class&variable START
    RequestBox box = (RequestBox)request.getAttribute("requestbox");
    if (box == null) box = RequestManager.getBox(request);

    String  v_process      = box.getString("p_process");
    
    DataBox dbox = (ArrayList)request.getAttribute("MyBillInfo");
    ArrayList list = (ArrayList)request.getAttribute("MyBillList");
    
%>


	
	
	<!-- ��������Ȳ ����  -->

	�ŷ���ȣ : <br>
	������� : <br>
	�����ݾ� : <br>
	
	���ι�ȣ : <br>
	
	ȯ�ҿ��� : <br>
	ȯ������ : <br>
	
	
	[�ŷ�����]<br>
	
	
	
	<!-- ��������Ȳ �� -->
	
	<br>
	

	

<!---------- copyright start ------------------->
<%@ include file="/learn/user/game/include/bottom.jsp"%>
<!---------- copyright end  -------------------->