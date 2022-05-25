<%@ page contentType = "text/html; charset=euc-kr" %>

<%@ page import="java.io.*" %>
<%@ page import="java.util.*"%>
<%@ page import="java.net.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>

<%@ page import="com.tmax.sso.filter.*" %>
<%@ page import="com.tmax.jw.util.aes.*" %>

<%@ page import="com.credu.library.*"%>
<%@ page import="com.credu.homepage.*"%>
<%@ page import="com.credu.common.*"%>
<%@ page import="com.credu.system.*"%>

<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />

<%!

/* ����� PW�� üũ���� ����. �ƹ� ���̳� �Ѿ�͵� ��.*/
private String doLogin(RequestBox box, String userid, String userpw, String userip){


	//MultipartRequest multi = null;
	//RequestBox box = RequestManager.getBox(request, response);
	//RequestBox box = (RequestBox)request.getBox(request, response);
	String v_process = box.getStringDefault("p_process","login");
	int fileupstatus = 0;

	String returnMsg = "";
	int isOk1 = 0;

	try {
            AlertManager alert = new AlertManager();
            String v_msg = "";
            String v_url = "";
            System.out.println("#12#:userid="+userid+" tem_grcode="+box.getSession("tem_grcode"));

            String tem_grcode      = box.getStringDefault("tem_grcode", box.getSession("tem_grcode"));
            v_url  = "/servlet/controller.homepage.MainServlet";
            box.put("p_process", "");
            //v_url  = "/index" + v_grcode + ".jsp";        // ���ø� ������ �ּ� ����

            //String v_userip = request.getRemoteAddr();
            //box.put("p_userip", v_userip);

            LoginBean bean = new LoginBean();

			isOk1 = bean.loginSSO(box, userid, userpw, userip);
            System.out.println("#13#:isOk1="+isOk1);
            if(isOk1 == 1) {

                    String v_code   = "00000000000000000005";                  // �α��� ���ϸ����ڵ�
                    String s_userid = box.getSession("userid");

					box.setSession("cmu_grtype","KGDI");
					returnMsg  = "OK";

	        }else{
	                if (isOk1 == -1) {  //ID �Ǵ� ��й�ȣ ����
	                    returnMsg = "\\'" + userid + "\\'�� ��ϵ� ���̵� �ƴմϴ�.(edu.kocc.or.kr:7)";
	                } else if (isOk1 == -2) {
	                    returnMsg = "\\'" + userid + "\\'����ڴ� ���񽺸� ����� �� �����ϴ�.(edu.kocc.or.kr:7)";        //�˼��մϴ�
	                } else if (isOk1 == -3) {
	                    returnMsg = "��й�ȣ�� ���� �ʽ��ϴ�(edu.kocc.or.kr:7)";       //��й�ȣ�� ���� �ʽ��ϴ�
	                } else {
	                    returnMsg = "";
	                }

            }
            System.out.println("#15#:returnMsg="+returnMsg);

	}catch (Exception ex) {
            //ErrorManager.getErrorStackTrace(ex, out);
			ex.printStackTrace();
			returnMsg = "#14#:doLogin() Exception!!";
    }

	if(isOk1 == 1) return "1#OK";
	else return "0#" + returnMsg;
}

/* HTTP Connection �� �̿��Ͽ� ����� ������ ���� �� */
public String getUserInfo(String MEM_ID, String SERVICE_CODE, String GETINFO_URL, String progLang, boolean isDebug){

		HttpURLConnection conn;
		OutputStream out;
		InputStream in;
		BufferedReader br;

		String data = "";
		String recvBuf = null;

		String server_url = GETINFO_URL + "?val1=" + MEM_ID + "&val2=" + SERVICE_CODE + "&val3=" + progLang;
		if(isDebug) System.out.println("[GetUserInfo] server_url : " + server_url);

		try {
			URL url = new URL(server_url);

			conn = (HttpURLConnection) url.openConnection();

			// request
			conn.setDoOutput(true);	// ��½�Ʈ���� ���ؼ� enable (input�� default�� true)
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

			out = (OutputStream) conn.getOutputStream();
			out.write(data.getBytes());
			out.flush();
			out.close();

			// Response
			in = conn.getInputStream();
			InputStreamReader isr = new InputStreamReader(in);
			br = new BufferedReader(isr);

			while (true) {
				String line = br.readLine().trim();

				if(line.length()!=0 && !line.equals(" ")){
					recvBuf = line.toString().trim();
					if(isDebug) System.out.println("[GetUserInfo] recvBuf='" + recvBuf + "'");
					break;
				}
			}

			if(isDebug) System.out.println("[GetUserInfo] recv : " + recvBuf);
			br.close();

		} catch(Exception e) {
			recvBuf = "FALSE##04";
			e.printStackTrace();
		}

		return recvBuf;

}

%>

<%

//System.out.println("\n\n\n\n\n\n\n\n--------------------------------------------------");
RequestBox box = (RequestBox)request.getAttribute("requestbox");
if (box == null) box = RequestManager.getBox(request);

int logLevel = 1;
String serviceName = "�ѱ���������ī����";

String SERVICE_CODE = "KA";
String GETINFO_URL = "http://sso.kocca.or.kr/getInfo.jsp";
String progLang = "java";
String MEM_ID = null;

response.setContentType("text/html;charset=utf-8");

/* STEP1 - SSO ��ū�� nextURL �� �޾� ��. ��Ż�α��� URL�� ���� ��. */
String tokenStr = (String)request.getParameter(Util.tokenKeyName);
String nextPage = (String)request.getParameter(Util.nextURLKeyName);
//String loginURL = (String)application.getInitParameter("loginURL");
String loginURL =  "http://www.wecon.or.kr/sub/mb/MBLogin.srt?tmaxsso_rtrn=edu.kocca.or.kr/sso/runSSO.jsp";

if (logLevel<1) 	System.out.println("[SKSSO-tmaxssologin.jsp]  "  + serviceName+ " : nextPage = '"+ nextPage +"'");

/* NEXT ������ ó�� */
if(nextPage != null && nextPage.length() != 0) {

	int i = nextPage.indexOf("nextUrl=");

	if(i!=-1) {
		nextPage = nextPage.substring(i+8);
		nextPage = java.net.URLDecoder.decode(nextPage,"utf-8");
	}
	else nextPage = "/";

	if (logLevel<2) 	System.out.println("[SKSSO-tmaxssologin.jsp]  "  + serviceName+ " : DestPage = '"+ nextPage +"'");

}
else{
	if (logLevel<2) 	System.out.println("[SKSSO-tmaxssologin.jsp]  "  + serviceName+ " : naxtPage is nulll!!");
	nextPage = "/";
}


/* STEP2 - SSO ��ū�� ���� ��� ������������ ����. */
if(tokenStr==null || tokenStr.length()==0){
	//response.sendRedirect(SSOConf.selfloginurl);
	response.sendRedirect(loginURL);
	return;
}

/* STEP3 - SSO ��ū���� ����� ���� ȹ��.*/
TmaxSSOToken token = new TmaxSSOToken(tokenStr);
String userid=token.getUserid();
String passwd=token.getPassword();

if (logLevel<2) 	System.out.println("[SKSSO-tmaxssologin.jsp]  "  + serviceName+ " : userid = '"+ userid +"'");
if (logLevel<2) 	System.out.println("[SKSSO-tmaxssologin.jsp]  "  + serviceName+ " : passwd = '"+ passwd +"'");
if (logLevel<1) 	out.println("[SKSSO-tmaxssologin.jsp]  "  + serviceName+ " : userid = '"+ userid +"'<br>");
if (logLevel<1) 	out.println("[SKSSO-tmaxssologin.jsp]  "  + serviceName+ " : passwd = '"+ passwd +"'<br>");


String tokenInfo = "";
String strUserId = "";
String strUserPw= "";

/* token.getPassword() ���� 2�� �� �κи� �߶� ��.*/
String parse1[] = passwd.split("##");

if (parse1.length == 2) {
	MEM_ID = parse1[1].toString().trim();
	/* ����� ������ ���� ��.
	TRUE##XXXXXXXXXX - ����.
	FALSE##01 - ���� IP�� �ƴ�.
	FALSE##02 - �Ķ���� �̻�.
	FALSE##03 - DB�� �ش� ����� ���� ����.
	FALSE##04 - ����Ŀ�ؼ� ����.
	*/

//	out.println("MEM_ID : " + MEM_ID);

	tokenInfo = getUserInfo(MEM_ID, SERVICE_CODE, GETINFO_URL, progLang, true);

//	out.println("tokenInfo : " + tokenInfo);
}
else{
	if (logLevel<1) 	System.out.println("[SKSSO-tmaxssologin.jsp]  "  + serviceName+ " : SSO Token Error!!! passwd = " + passwd);
	out.println("<html><script>alert('TOKEN ERR');document.location.href='" + nextPage + "';</script></html>");
	return;
}

/* ����� ������ �̿��Ͽ� ID/PW ȹ�� */
String arrTokenInfo[] = tokenInfo.split("##");
if(arrTokenInfo[0].toString().equals("TRUE")){

	/******************** AES ��ȣȭ ********************/
	AesCipher ac = new AesCipher();
	String strResult = ac.runAesDecode(arrTokenInfo[1].toString(),true);

	String result[] = strResult.split("//");

	if (result.length == 2) {
		strUserId = result[0].toString().trim();
		strUserPw = result[1].toString().trim();
		if (logLevel<1) 	System.out.println("[SKSSO-tmaxssologin.jsp]  "  + serviceName+ " : getUserInfo() Success!! strUserId='" + strUserId + "'/strUserPw='" + strUserPw + "'");
	}
	else{
		if (logLevel<1) 	System.out.println("[SKSSO-tmaxssologin.jsp]  "  + serviceName+ " : getUserInfo() ERR (" + strResult + ")");
		out.println("<html><script>alert('GetUserInfo Fail.');document.location.href='" + nextPage + "';</script></html>");
		return;
	}

//	out.println("userid : " + strUserId);
//	out.println("passwd : " + strUserPw);

}
else{

	if (logLevel<1) 	System.out.println("[SKSSO-tmaxssologin.jsp]  "  + serviceName+ " : getUserInfo() ERR (" + tokenInfo + ")");
	out.println("<html><script>alert('GetUserInfo Fail. [" + arrTokenInfo[1].toString()  + "]');document.location.href='" + nextPage + "';</script></html>");
	return;
}

//if(true)return;


/* STEP4 - ������ API �� ����Ͽ� �α��� ó��. */
boolean loginCheck = false;

String strUserIp = (String)request.getRemoteAddr();
String loginReturn = "";

if(!strUserId.equals("") && !strUserPw.equals("")){

	/*TEST*/
	//strUserId = "pcu022";
	//strUserId = "user123";

	/************************ APP Login  API S ************************/
	loginReturn = doLogin(box, strUserId, strUserPw, strUserIp);
	/************************ APP Login  API E ************************/

	if (logLevel<2) 	System.out.println("[SKSSO-tmaxssologin.jsp]  "  + serviceName+ " : loginReturn = " + loginReturn);

	String loginResult[] = loginReturn.split("#");

	String isLoginTrue = loginResult[0].toString();
	String errMsg = loginResult[1].toString();

	if(isLoginTrue.equals("1")) loginCheck = true;


	/* STEP5 - �α��� ����ó�� ���ο� ���� ó������ */

	if(loginCheck) {

		/* ������Ű ���� */
		Cookie tmaxsso_cookie = new Cookie(Util.authenticatedCookieName, "yes");
		tmaxsso_cookie.setMaxAge(Integer.parseInt(SSOConf.timeout)*60);
		tmaxsso_cookie.setPath("/");
		response.addCookie(tmaxsso_cookie);

		Cookie tmaxssocookie2 = new Cookie(Util.closingCookieName, "yes");
		tmaxssocookie2.setPath("/");
		response.addCookie(tmaxssocookie2);


		/* �������� ���� */
		session.setAttribute("userid",strUserId);
		session.setAttribute("TMAXSSO","SUCCESS");

		// ���� ������������ ����.
		response.sendRedirect(nextPage);

	} else {
		out.println("<html><script>alert('" + errMsg + "');document.location.href='/';</script></html>");
	}

}
else {
	out.println("<html><script>alert('��ū�� ����� ID�� �������� �ʽ��ϴ�.');document.location.href='/';</script></html>");
}

//System.out.println("\n\n\n\n\n\n\n\n--------------------------------------------------");

%>
