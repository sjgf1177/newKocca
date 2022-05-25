<%@ page contentType="application/json;charset=euc-kr" %>
<%@ page import="com.credu.library.DataBox" %>
<%@ page import="org.json.simple.JSONObject" %>

<%
    // ajax ó���� �ܼ� ��� ���� �޴� ��ɿ��� �������� ����ϰ��� ��. ��� ���� �ַ� String ���.
    // �� �������� ����ϱ� ���ؼ��� ��� ���� �Ѱ��� �� �ݵ�� �̸��� "result"�� �ؾ��ϸ�
    // ��� �ڷḦ �޴� ���������� ����ϰ��� �ϴ� �̸��� ���� ��쿡��
    // request.setAttribute("returnName", "dataName");ó�� ���ϴ� �������־�� �Ѵ�.

    JSONObject jsonObj = new JSONObject();

    Object result = (Object)request.getAttribute("result");
    String returnName = (String)request.getAttribute("returnName");

    returnName = ( returnName == null || returnName.equals("") ) ? "result" : returnName;

    try {
        jsonObj.put(returnName, result);

        // System.out.println(jsonObj.toJSONString().replace("\\\\", "/"));
    } catch (Exception e) {
        System.out.println("!!!!!!!!!!!" + e);
    }

    out.println( jsonObj.toJSONString().replace("\\\\", "/") );
%>
