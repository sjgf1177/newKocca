<%@ page contentType="application/json;charset=euc-kr" %>
<%@ page import="com.credu.library.DataBox" %>
<%@ page import="org.json.simple.JSONObject" %>

<%
    // ajax ó���� ArrayList�� ��� ���� �޴� ��ɿ��� �������� ����ϰ��� ��.
    // �� �������� ����ϱ� ���ؼ��� ArrayList�� �Ѱ��� �� �ݵ�� �̸��� "resultList"�� �ؾ��ϸ�
    // ��� �ڷḦ �޴� ���������� ����ϰ��� �ϴ� �̸��� ���� ��쿡�� ArrayList�� �Ѱ��ֱ� ����
    // request.setAttribute("returnName", "listName");ó�� ���ϴ� �̸��� �������־�� �Ѵ�.

    JSONObject jsonObj = new JSONObject();

    ArrayList<DataBox> resultList = (ArrayList<DataBox>)request.getAttribute("resultList");
    String returnName = (String) request.getAttribute("returnName");

    returnName = ( returnName == null || returnName.equals("") ) ? "resultList" : returnName;

    try {
        if (resultList == null || resultList.size() == 0 ) {
            jsonObj.put(returnName, "null");
        } else {
            jsonObj.put(returnName, resultList);
        }

        // System.out.println(jsonObj.toJSONString().replace("\\\\", "/"));
    } catch (Exception e) {
        System.out.println("!!!!!!!!!!!" + e);
    }

    out.println( jsonObj.toJSONString().replace("\\\\", "/") );
%>
