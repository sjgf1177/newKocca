<%
//**********************************************************
//  1. ��	  ��: zu_Subject_Bill_Result.jsp
//  2. ���α׷���: zu_Subject_Bill_Result.jsp
//  3. ��	  ��: ������ȸ
//  4. ȯ	  ��: JDK 1.3
//  5. ��	  ��: 1.0
//  6. ��	  ��: 2004.01.14
//  7. ��	  ��:
//***********************************************************
%>
<%@ page contentType = "text/html;charset=MS949" %>
<%@page errorPage = "/learn/library/error.jsp" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>
<%@ page import = "com.credu.propose.*" %>
<%@ page import = "com.credu.common.*" %>
<%@ page import = "com.credu.library.*" %>
<%@ page import = "com.credu.system.*" %>
<%@ taglib uri="/tags/KoccaSelectTaglib" prefix="kocca_select" %>
<jsp:useBean id = "conf" class = "com.credu.library.ConfigSet"  scope = "page" />
<jsp:useBean id = "getCodenm" class = "com.credu.common.GetCodenm"  scope = "page" />
<%
ConfigSet cs = new ConfigSet();
com.inicis.inipay.INIpay50 inipay = new com.inicis.inipay.INIpay50();
inipay.SetField("inipayhome", cs.getProperty("inipay.inipayHome")); // INIpay Home (�����η� ������ ����) - C:/INIpay41_JAVA
inipay.SetField("admin", cs.getProperty("inipay.keyPw")); // Ű�н�����(�������̵� ���� ����) - 1111
inipay.SetField("keypw", cs.getProperty("inipay.keyPw")); // Ű�н�����(�������̵� ���� ����) - 1111
inipay.SetField("subpgip", cs.getProperty("inipay.subPgIp")); // ���� - 203.238.3.10
inipay.SetField("debug", cs.getProperty("inipay.debug")); // �α׸��("true"�� �����ϸ� ���� �αװ� ������)
inipay.SetField("url", cs.getProperty("inipay.url")); // ���� ���񽺵Ǵ� ���� SITE URL�� �����Ұ� -- ���� ����.. �߸��� ������ �������̿���.("http://www.your_domain.co.kr")
inipay.SetField("tid","INIjspISP_INIpayTest20100112210401619154"); // ����
inipay.SetField("type","cancel"); // ����
inipay.SetField("cancelMsg", "DB Success"); // ��һ���
inipay.startAction();

%>
