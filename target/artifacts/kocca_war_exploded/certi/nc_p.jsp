<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page language="java" import="common.NameCheck"%>
<jsp:useBean id="NC" class="common.NameCheck" scope="request"/>
<%
String SITECODE = "K674"; //�ѽ��򿡼� �߱޹��� ���̵�� @���� �������ּ���
String SITEPW = "26023508"; //�ѽ��򿡼� �߱޹��� �н������ @���� �������ּ���

//nc.jsp ���� ������ ���ǰ��� Ȯ���Ѵ�. 
HttpSession s = request.getSession(true);
if(!s.getValue("NmChkSec").equals("98u9iuhuyg87")){
	// ������ �ȵǴ� ��� �ʿ��Ͻ� �������� ó�����ּ���.
   out.println("<script>alert('�ſ��� ���� �����Դϴ�. �����ڴ� �ſ������������� Ȯ�����ּ���!'); history.go(-1);</script>");
}

//s.invalidate();

//nc.jsp ���� �Ķ���ͷ� ���� ���޹޴´�.
String sJumin1 = request.getParameter("p_resno1")==null ? "":request.getParameter("p_resno1");
String sJumin2 = request.getParameter("p_resno2")==null ? "":request.getParameter("p_resno2");
String sJumin = sJumin1 + sJumin2;
String sName = request.getParameter("p_username")==null ? "":request.getParameter("p_username");
String checkflag = request.getParameter("checkflag");   //�ֹι�ȣ ���� üũ����

//14���̸��� ��� �θ�� ������ �޴´�
String pJumin1 = request.getParameter("presno1")==null ? "":request.getParameter("presno1");
String pJumin2 = request.getParameter("presno2")==null ? "":request.getParameter("presno2");
String pJumin = pJumin1+pJumin2;
String pName = request.getParameter("pname")==null ? "":request.getParameter("pname");
String pEmail1 = request.getParameter("pemail1")==null ? "":request.getParameter("pemail1");
String pEmail2 = request.getParameter("pemail2")==null ? "":request.getParameter("pemail2");


//�ѱ� ���ڵ� �����Ͽ� �Ѱ��ֽô� �̸��� ������� �Ʒ��� �����ؼ� euc-kr �� �̸��� �Ѱ��ּ���
//String sName = new String(request.getParameter("name").getBytes("8859_1"), "KSC5601");

//�ֹι�ȣ�� �̸� ����Ʈ���̵� �н������� ���� �ѽ��� �Ѱ��ְ� Rtn �� ���ϰ��� �޴´�.
//14�� �̸��ϰ��..
if((!pJumin.equals("")) && (!pName.equals(""))){
	
	String Rtn = "";
	NC.setChkName(sName);				// 
	Rtn = NC.setJumin(sJumin+SITEPW);
	
	//����ó���� ���
	if(Rtn.equals("0")) 
	{
		NC.setSiteCode(SITECODE);
		NC.setTimeOut(30000);
		Rtn = NC.getRtn().trim();
	}
	
	String pRtn = "";
	NC.setChkName(pName);				// 
	pRtn = NC.setJumin(pJumin+SITEPW);
	
	//����ó���� ���
	if(pRtn.equals("0")) 
	{
		NC.setSiteCode(SITECODE);
		NC.setTimeOut(30000);
		pRtn = NC.getRtn().trim(); 
	}				
	
	
				//Rtn �������� ���� �Ʒ� �����ϼż� ó�����ּ���.(������� �ڼ��� ������ �����ڵ�.txt ������ ������ �ּ���~)
								//Rtn :	1 �̸� --> �Ǹ����� ���� : XXX.jsp �� ������ �̵�. 
								//			2 �̸� --> �Ǹ����� ���� : �ֹΰ� �̸��� ��ġ���� ����. ����ڰ� ���� www.namecheck.co.kr �� �����Ͽ� ��� or 1600-1522 �ݼ��ͷ� ������û.
								//									�Ʒ��� ���� �ѽ��򿡼� ������ �ڹٽ�ũ��Ʈ �̿��ϼŵ� �˴ϴ�.		
								//									���������� ��ϵ� ������ӿ��� ������ ������ �ѱ۱����� Ȯ���� �ּ���. 
								//									�ѱ��� euc-kr�� �Ѱ��ּž� �մϴ�.
								//			3 �̸� --> �ѽ��� �ش��ڷ� ���� : ����ڰ� ���� www.namecheck.co.kr �� �����Ͽ� ��� or 1600-1522 �ݼ��ͷ� ������û.
								//									�Ʒ��� ���� �ѽ��򿡼� ������ �ڹٽ�ũ��Ʈ �̿��ϼŵ� �˴ϴ�.
								//			5 �̸� --> üũ�����(�ֹι�ȣ������Ģ�� ��߳� ���: ���Ƿ� ������ ���Դϴ�.)
								//			50�̸� --> ũ������ũ�� ���ǵ������� ���� �������� : ���� ���ǵ������� ���� �� �Ǹ����� ��õ�.
								//								�Ʒ��� ���� �ѽ��򿡼� ������ �ڹٽ�ũ��Ʈ �̿��ϼŵ� �˴ϴ�.
								//			�׹ۿ� --> 30����, 60���� : ��ſ��� ip: 203.234.219.72 port: 81~85(5��) ��ȭ�� ���� ���µ�����ش�. 
								//								(������� �ڼ��� ������ �����ڵ�.txt ������ ������ �ּ���~) 
        if (Rtn.equals("1") && pRtn.equals("1")){
        //out.println(Rtn);
%>
			<script language='javascript'>     
                //alert("��������!! ^^");
                function goSubjmit() {
                    if ( document.form1.checkflag.value == "true") {
                        document.form1.checkflag.value = "";

                        document.form1.action="/servlet/controller.homepage.MainMemberJoinServlet";
                        document.form1.p_resno1.value   = "<%=sJumin1%>";
                        document.form1.p_resno2.value   = "<%=sJumin2%>";
                        document.form1.p_username.value   = "<%=sName%>";
                        document.form1.pp_email1.value   = "<%=pEmail1%>";
                        document.form1.pp_email2.value   = "<%=pEmail2%>";
                        document.form1.pp_username.value   = "<%=pName%>";
                        document.form1.p_process.value = "CheckResno";
                        document.form1.submit();
                    } else {
                        document.form1.checkflag.value = "false";
                         history.go(-1);
                    }
                }
            </script>

			
<%@page import="utils.system"%><html>
				<head>
				</head>
				<body onload="goSubjmit();">
                <!--<body onLoad="document.form1.submit()">-->
					<form name="form1" action="" method="post">
                        <input type="hidden" name="p_resno1" value="" />
						<input type="hidden" name="p_resno2" value="" />
						<input type="hidden" name="p_username" value="" />
                        <input type="hidden" name="pp_email1" value="" />
						<input type="hidden" name="pp_email2" value="" />
						<input type="hidden" name="pp_username" value="" />
                        <input type="hidden" name="p_process" value="" />
                        <input type="hidden" name="checkflag" value="<%=checkflag%>" />
                        <input type="hidden" name="checkradio" value="14" />
					</form>
				</body>
			</html>

<%
		}else if (Rtn.equals("2") || pRtn.equals("2")){
		//���ϰ� 2�� ������� ���, www.namecheck.co.kr �� �Ǹ���Ȯ�� �Ǵ� 02-1600-1522 �ݼ��ͷ� �����ֽñ� �ٶ��ϴ�.		
%>
            <script language="javascript">
               history.go(-1); 
               var URL ="http://www.creditbank.co.kr/its/its.cb?m=namecheckMismatch"; 
               var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no, width= 640, height= 480, top=0,left=20"; 
               window.open(URL,"",status); 
            </script> 
<%
		}else if (Rtn.equals("3") || pRtn.equals("3")){
		//���ϰ� 3�� ������� ���, www.namecheck.co.kr �� �Ǹ���Ȯ�� �Ǵ� 02-1600-1522 �ݼ��ͷ� �����ֽñ� �ٶ��ϴ�.   			
%>
            <script language="javascript">
               history.go(-1); 
               var URL ="http://www.creditbank.co.kr/its/its.cb?m=namecheckMismatch"; 
               var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no, width= 640, height= 480, top=0,left=20"; 
               window.open(URL,"",status); 
            </script> 
<%
		}else if (Rtn.equals("50") || pRtn.equals("50")){
		//���ϰ� 50 ���ǵ������� ���� �������� ���, www.creditbank.co.kr ���� ���ǵ����������� �� ��õ� ���ֽø� �˴ϴ�. 
		// �Ǵ� 02-1600-1533 �ݼ��ͷι����ּ���.  	
			
%>	
            <script language="javascript">
               history.go(-1); 
               var URL ="http://www.creditbank.co.kr/its/itsProtect.cb?m=namecheckProtected"; 
               var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no, width= 640, height= 480, top=0,left=20"; 
               window.open(URL,"",status); 
            </script> 

<%
		}else{
		//������ ������ ���� �����ڵ�.txt �� �����Ͽ� ���ϰ��� Ȯ���� �ּ���~	
%>
			<script language='javascript'>
				alert("������ ���� �Ͽ����ϴ�.�����ڵ�:[<%=Rtn%>]");
				history.go(-1);
			</script>			
<%
		}

}else if((!sJumin.equals("")) && (!sName.equals(""))) //14�� �̻��ϰ��..
{
	String Rtn = "";
	NC.setChkName(sName);				// 
	Rtn = NC.setJumin(sJumin+SITEPW);
	//����ó���� ���
	if(Rtn.equals("0")) 
	{
		NC.setSiteCode(SITECODE);
		NC.setTimeOut(30000);
		Rtn = NC.getRtn().trim(); 
	}
	
				
				//Rtn �������� ���� �Ʒ� �����ϼż� ó�����ּ���.(������� �ڼ��� ������ �����ڵ�.txt ������ ������ �ּ���~)
								//Rtn :	1 �̸� --> �Ǹ����� ���� : XXX.jsp �� ������ �̵�. 
								//			2 �̸� --> �Ǹ����� ���� : �ֹΰ� �̸��� ��ġ���� ����. ����ڰ� ���� www.namecheck.co.kr �� �����Ͽ� ��� or 1600-1522 �ݼ��ͷ� ������û.
								//									�Ʒ��� ���� �ѽ��򿡼� ������ �ڹٽ�ũ��Ʈ �̿��ϼŵ� �˴ϴ�.		
								//									���������� ��ϵ� ������ӿ��� ������ ������ �ѱ۱����� Ȯ���� �ּ���. 
								//									�ѱ��� euc-kr�� �Ѱ��ּž� �մϴ�.
								//			3 �̸� --> �ѽ��� �ش��ڷ� ���� : ����ڰ� ���� www.namecheck.co.kr �� �����Ͽ� ��� or 1600-1522 �ݼ��ͷ� ������û.
								//									�Ʒ��� ���� �ѽ��򿡼� ������ �ڹٽ�ũ��Ʈ �̿��ϼŵ� �˴ϴ�.
								//			5 �̸� --> üũ�����(�ֹι�ȣ������Ģ�� ��߳� ���: ���Ƿ� ������ ���Դϴ�.)
								//			50�̸� --> ũ������ũ�� ���ǵ������� ���� �������� : ���� ���ǵ������� ���� �� �Ǹ����� ��õ�.
								//								�Ʒ��� ���� �ѽ��򿡼� ������ �ڹٽ�ũ��Ʈ �̿��ϼŵ� �˴ϴ�.
								//			�׹ۿ� --> 30����, 60���� : ��ſ��� ip: 203.234.219.72 port: 81~85(5��) ��ȭ�� ���� ���µ�����ش�. 
								//								(������� �ڼ��� ������ �����ڵ�.txt ������ ������ �ּ���~) 

		
        if (Rtn.equals("1")){
        //out.println(Rtn);
%>
			<script language='javascript'>     
                //alert("��������!! ^^");
                function goSubjmit() {
                    if ( document.form1.checkflag.value == "true") {
                        document.form1.checkflag.value = "";

                        document.form1.action="/servlet/controller.homepage.MainMemberJoinServlet";
                        document.form1.p_resno1.value   = "<%=sJumin1%>";
                        document.form1.p_resno2.value   = "<%=sJumin2%>";
                        document.form1.p_username.value   = "<%=sName%>";
                        document.form1.p_process.value = "CheckResno";
                        document.form1.submit();
                    } else {
                        document.form1.checkflag.value = "false";
                         history.go(-1);
                    }
                }
            </script>

			<html>
				<head>
				</head>
				<body onload="goSubjmit();">
                <!--<body onLoad="document.form1.submit()">-->
					<form name="form1" action="" method="post">
                        <input type="hidden" name="p_resno1" value="" />
						<input type="hidden" name="p_resno2" value="" />
						<input type="hidden" name="p_username" value="" />
                        <input type="hidden" name="p_process" value="" />
                        <input type="hidden" name="checkflag" value="<%=checkflag%>" />
					</form>
				</body>
			</html>

<%
		}else if (Rtn.equals("2")){
		//���ϰ� 2�� ������� ���, www.namecheck.co.kr �� �Ǹ���Ȯ�� �Ǵ� 02-1600-1522 �ݼ��ͷ� �����ֽñ� �ٶ��ϴ�.		
%>
            <script language="javascript">
               history.go(-1); 
               var URL ="http://www.creditbank.co.kr/its/its.cb?m=namecheckMismatch"; 
               var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no, width= 640, height= 480, top=0,left=20"; 
               window.open(URL,"",status); 
            </script> 
<%
		}else if (Rtn.equals("3")){
		//���ϰ� 3�� ������� ���, www.namecheck.co.kr �� �Ǹ���Ȯ�� �Ǵ� 02-1600-1522 �ݼ��ͷ� �����ֽñ� �ٶ��ϴ�.   			
%>
            <script language="javascript">
               history.go(-1); 
               var URL ="http://www.creditbank.co.kr/its/its.cb?m=namecheckMismatch"; 
               var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no, width= 640, height= 480, top=0,left=20"; 
               window.open(URL,"",status); 
            </script> 
<%
		}else if (Rtn.equals("50")){
		//���ϰ� 50 ���ǵ������� ���� �������� ���, www.creditbank.co.kr ���� ���ǵ����������� �� ��õ� ���ֽø� �˴ϴ�. 
		// �Ǵ� 02-1600-1533 �ݼ��ͷι����ּ���.  	
			
%>	
            <script language="javascript">
               history.go(-1); 
               var URL ="http://www.creditbank.co.kr/its/itsProtect.cb?m=namecheckProtected"; 
               var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no, width= 640, height= 480, top=0,left=20"; 
               window.open(URL,"",status); 
            </script> 

<%
		}else{
		//������ ������ ���� �����ڵ�.txt �� �����Ͽ� ���ϰ��� Ȯ���� �ּ���~	
%>
			<script language='javascript'>
				alert("������ ���� �Ͽ����ϴ�.�����ڵ�:[<%=Rtn%>]");
				history.go(-1);
			</script>			
<%
		}
}else{
	out.println("�����̳� �ֹι�ȣ�� Ȯ���ϼ���.");
}
%>
