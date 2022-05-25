<%@ page language="java" contentType="text/html;charset=euc-kr" %>

<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.credu.library.DBConnectionManager" %>
<%@ page import="com.credu.library.ErrorManager" %>
<%@ page import="com.credu.library.ListSet" %>
<%@ page import="com.credu.library.Log" %>
<%@ page import="NiceID.Check.CPClient" %>

<%
    CPClient niceCheck = new  CPClient();

    String sEncodeData = requestReplace(request.getParameter("EncodeData"), "encodeData");
    // ���� ȭ���� ȣ���� ���а��� ������ �ִ�.
    // regForm: ȸ������ / findPwd: ��й�ȣ ã��
    String sReserved1 = requestReplace(request.getParameter("param_r1"), "");
    String sReserved2 = requestReplace(request.getParameter("param_r2"), "");
    String sReserved3 = requestReplace(request.getParameter("param_r3"), "");

    String resultPage = "";
    if (sReserved1.equals("regMember") ) {
        // resultPage = "/learn/user/2013/portal/member/zu_MemberInfo_I_new.jsp";
        resultPage = "/servlet/controller.member.MemberJoinRegServlet";
    } else if (sReserved1.equals("findPwd") ) {
        resultPage = "/servlet/controller.homepage.MainMemberJoinServlet?p_process=FindIdPwd";
    }

    String sSiteCode = "G7889";             // NICE�κ��� �ο����� ����Ʈ �ڵ�
    String sSitePassword = "KCQJDMUIH9ZI";  // NICE�κ��� �ο����� ����Ʈ �н�����

    String sCipherTime = "";        // ��ȣȭ�� �ð�
    String sRequestNumber = "";     // ��û ��ȣ
    String sResponseNumber = "";    // ���� ������ȣ
    String sAuthType = "";          // ���� ����
    String sName = "";              // ����
    String sDupInfo = "";           // �ߺ����� Ȯ�ΰ� (DI_64 byte)
    String sConnInfo = "";          // �������� Ȯ�ΰ� (CI_88 byte)
    String sBirthDate = "";         // ����
    String sGender = "";            // ����
    String sNationalInfo = "";      // ��/�ܱ������� (���߰��̵� ����)
    String sMessage = "";
    String sPlainData = "";

    String sMobileNo = "";
    // String sCarrier = "";

    boolean isSessionDifferent = false;

    System.out.println("�������� ��� ���� ������ ����<br/>");

    int iReturn = niceCheck.fnDecode(sSiteCode, sSitePassword, sEncodeData);
    System.out.println("iReturn : " + iReturn + "<br/>");

    if( iReturn == 0 ) {
        sPlainData = niceCheck.getPlainData();
        sCipherTime = niceCheck.getCipherDateTime();

        // ����Ÿ�� �����մϴ�.
        HashMap mapresult = niceCheck.fnParse(sPlainData);

        mapresult.put("CIPHER_TIME", sCipherTime);

        sRequestNumber = (String)mapresult.get("REQ_SEQ");
        sResponseNumber = (String)mapresult.get("RES_SEQ");
        sAuthType = (String)mapresult.get("AUTH_TYPE");
        sName = (String)mapresult.get("NAME");
        sBirthDate = (String)mapresult.get("BIRTHDATE");
        sGender = (String)mapresult.get("GENDER");
        sNationalInfo = (String)mapresult.get("NATIONALINFO");
        sDupInfo = (String)mapresult.get("DI");
        sConnInfo = (String)mapresult.get("CI");
        sMobileNo = (String)mapresult.get("MOBILE_NO");
        // sCarrier = (String)mapresult.get("MOBILE_CO");

        String session_sRequestNumber = (String)session.getAttribute("REQ_SEQ");

        if(!sRequestNumber.equals(session_sRequestNumber)) {
            sMessage = "���ǰ��� �ٸ��ϴ�. �ùٸ� ��η� �����Ͻñ� �ٶ��ϴ�.";
            sResponseNumber = "";
            sAuthType = "";
            isSessionDifferent = true;
        } else {
            // ���� �α� ���
            this.insertMobileCertiHistory( mapresult );
        }

    } else if( iReturn == -1) {
        sMessage = "��ȣȭ �ý��� �����Դϴ�.";

    } else if( iReturn == -4) {
        sMessage = "��ȣȭ ó�������Դϴ�.";

    } else if( iReturn == -5) {
        sMessage = "��ȣȭ �ؽ� �����Դϴ�.";

    } else if( iReturn == -6) {
        sMessage = "��ȣȭ ������ �����Դϴ�.";

    } else if( iReturn == -9) {
        sMessage = "�Է� ������ �����Դϴ�.";

    } else if( iReturn == -12) {
        sMessage = "����Ʈ �н����� �����Դϴ�.";

    } else {
        sMessage = "�˼� ���� ���� �Դϴ�.";
    }

%>
<%!
    /**
     * ���� ��� ����
     */
    public static String requestReplace (String paramValue, String gubun) {
        String result = "";

        if (paramValue != null) {

            paramValue = paramValue.replaceAll("<", "&lt;").replaceAll(">", "&gt;");

            paramValue = paramValue.replaceAll("\\*", "");
            paramValue = paramValue.replaceAll("\\?", "");
            paramValue = paramValue.replaceAll("\\[", "");
            paramValue = paramValue.replaceAll("\\{", "");
            paramValue = paramValue.replaceAll("\\(", "");
            paramValue = paramValue.replaceAll("\\)", "");
            paramValue = paramValue.replaceAll("\\^", "");
            paramValue = paramValue.replaceAll("\\$", "");
            paramValue = paramValue.replaceAll("'", "");
            paramValue = paramValue.replaceAll("@", "");
            paramValue = paramValue.replaceAll("%", "");
            paramValue = paramValue.replaceAll(";", "");
            paramValue = paramValue.replaceAll(":", "");
            paramValue = paramValue.replaceAll("-", "");
            paramValue = paramValue.replaceAll("#", "");
            paramValue = paramValue.replaceAll("--", "");
            paramValue = paramValue.replaceAll("-", "");
            paramValue = paramValue.replaceAll(",", "");

            if(gubun != "encodeData"){
                paramValue = paramValue.replaceAll("\\+", "");
                paramValue = paramValue.replaceAll("/", "");
            paramValue = paramValue.replaceAll("=", "");
            }

            result = paramValue;

        }
        return result;
    }

    /**
     * ���� ��� ����
     */
    private void insertMobileCertiHistory( HashMap certiMap ) throws Exception {
        DBConnectionManager connMgr = null;
        PreparedStatement pstmt = null;
        ListSet ls = null;
        StringBuffer sql = new StringBuffer();
        int maxSeq = 0;
        int resultCount = 0;
        int index = 1;

        try {
            connMgr = new DBConnectionManager();
            connMgr.setAutoCommit(false);
            sql.append("SELECT NVL( MAX ( SEQ ), 0 ) + 1 AS MAX_SEQ FROM TZ_MOBILE_CERTI_HISTORY ");

            ls = connMgr.executeQuery(sql.toString());
            if ( ls.next() ) {
                maxSeq = ls.getInt("MAX_SEQ");
            }

            sql.setLength(0);
            sql.append("/* �޴���ȭ ���� ��� ���� (����) */\n");
            sql.append("INSERT  INTO    TZ_MOBILE_CERTI_HISTORY (   \n");
            sql.append("        SEQ                                 \n");
            sql.append("    ,   DEC_DT                              \n");
            sql.append("    ,   REQ_NO                              \n");
            sql.append("    ,   RES_NO                              \n");
            sql.append("    ,   MOBILE_NO                           \n");
            sql.append("    ,   RESULT_CD                           \n");
            sql.append("    ,   CERTI_SATUS                         \n");
            sql.append("    ,   NAME                                \n");
            sql.append("    ,   RESULT_MSG                          \n");
            sql.append("    ,   CERTI_DT                            \n");
            sql.append(") VALUES (                                  \n");
            sql.append("        ?                                   \n");
            sql.append("    ,   TO_DATE(?, 'YYMMDDHH24MISS')        \n");
            sql.append("    ,   ?                                   \n");
            sql.append("    ,   ?                                   \n");
            sql.append("    ,   CRYPTO.ENC('normal', ?)             \n");
            sql.append("    ,   ?                                   \n");
            sql.append("    ,   'S'                                 \n");
            sql.append("    ,   CRYPTO.ENC('normal', ?)             \n");
            sql.append("    ,   ?                                   \n");
            sql.append("    ,   SYSDATE                             \n");
            sql.append(")                                           \n");

            pstmt = connMgr.prepareStatement(sql.toString());
            pstmt.setInt( index++, maxSeq );
            pstmt.setString( index++, (String)certiMap.get("CIPHER_TIME") );
            pstmt.setString( index++, (String)certiMap.get("REQ_SEQ") );
            pstmt.setString( index++, (String)certiMap.get("RES_SEQ") );
            pstmt.setString( index++, (String)certiMap.get("MOBILE_NO") );
            pstmt.setString( index++, "0000" );
            pstmt.setString( index++, (String)certiMap.get("NAME") );
            pstmt.setString( index++, "���� ����");

            resultCount = pstmt.executeUpdate();

            if ( resultCount > 0 ) {
                connMgr.commit();
            } else {
                connMgr.rollback();
            }

        } catch (Exception e) {
            Log.err.println(e.getMessage());
            ErrorManager.getErrorStackTrace(e);
            throw new Exception("insertEmailCertiHistory()\r\n" + e.getMessage());
        } finally {
            if ( ls != null ) {
                ls.close();
                ls = null;
            }
            if ( pstmt != null ) {
                pstmt.close();
                pstmt = null;
            }

            if ( connMgr != null ) {
                connMgr.freeConnection();
            }
        }

    }
%>
<!doctype html>
<html>
<head>
<title>�Ƚɺ������� ��� ������ | �ѱ���������ī����</title>
<script src="/js/jquery/1.8.3/jquery.js"></script>
<script type="text/javascript">
    $(function() {
        // var isSessionDifferent = <%= isSessionDifferent %>;
        var iReturn = <%= iReturn %>;
        var resultMessage = "<%= sMessage %>";

        if ( iReturn != 0 && resultMessage != "" ) {
            alert(resultMessage);
            self.close();

        } else {
            if ( parent.opener.name == "Parent_window" ) {
                $("#oCertiResultForm").attr("target", parent.opener.name)
                $("#oCertiResultForm").submit();

            } else {
                alert("�θ� â�� ����Ǿ� ȸ�� ������ ������ �� �����ϴ�.");
            }
            self.close();
        }

    });
</script>

</head>
<body>
<!-- <form id="oCertiResultForm" name="certiResultForm" action="/servlet/controller.homepage.MainMemberJoinServlet" method="post"> //-->
<form id="oCertiResultForm" name="certiResultForm" action="<%= resultPage %>" method="post">
    <input type="hidden" id="oCertiType" name="certiType" value="MOBILE" />
    <input type="hidden" id="oUserName" name="userName" value="<%= sName %>" />
    <input type="hidden" id="oMobileNo" name="mobileNo" value="<%= sMobileNo %>" />
    <input type="hidden" id="oDupInfo" name="dupInfo" value="<%= sDupInfo %>" />
    <input type="hidden" id="oBirthDate" name="birthDate" value="<%= sBirthDate %>" />
    <input type="hidden" id="oGender" name="gender" value="<%= sGender %>" />
    <input type="hidden" id="oNationalInfo" name="nationalInfo" value="<%= sNationalInfo %>" />
</form>

</body>
</html>